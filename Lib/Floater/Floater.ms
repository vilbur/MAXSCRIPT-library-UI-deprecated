/** Globals
 */
struct Globals_v
(
	Floater
)
--format " __GLOBAL__v	= % \n" __GLOBAL__v
if( __GLOBAL__v==undefined ) then
	global __GLOBAL__v = Globals_v()
	
/** Dialog floater
  *
  * Rollout with subroullouts is used as "Floater" instead of using regular [RolloutFloater](https://help.autodesk.com/view/3DSMAX/2018/ENU/?guid=__files_GUID_A72112A6_BDFB_47A6_88FB_8D49C4CBD049_htm)
  *
  *
  */
struct Floater_v
(
	/* dependency */
	Rollouts	= List_v(),
	Menu	= Menu_v(),
	Ini	= Ini_v(),
	
	/* required properties */
	title,
	__construct = #(#title),

	/* config */	
	id,
	--height,
	
	/* options */	
	_ini,
	
	/* store */
	Floater,
	size_init, -- size of dialog after creation
		
	/** Create Floater
	  * Same parameters as __[ Rollout.create() ](../Rollouts/Rollout)__
	 */
	function create width: height: pos: =
	(
		print "------------\nFloater.create()"
		--format " id	= % \n" id
		--this.destroy()
		roll_main	= Rollout_v title:title id:id
		roll_main.subrollouts.list	= Rollouts.values
		--format " pos	= % \n" pos
		roll_main.create height:height width:width pos:pos
		
		Floater = roll_main.roll.def
		
		--size_init = [(GetDialogSize Floater)[1]+8, (GetDialogSize Floater)[2]]
		--size_init = #(512, 512)
		
		--this._openCloseRollouts()
		
		--this.register()
		
		--format " _isDocked()	= % \n" (this._isDocked())
		
		--format "Floater created: % \n" roll_main.id
		this --return
	),

	/** Set rollout in Floater
	  * @param	string	title	Title of rollout
	  * @param	string	id	Id of roullout, if empty then sanitized title is used
	  * @return	[Rollout](../Rollouts/Rollout)
	  *
	  * @example roll "Roll Title" "rollout_id" 	// set rollout
	  * @example roll "Roll Title" "" 	// set rollout, id will be sanitized title "roll_title"
	  */
	function roll title id:  =
	(
		_rollout	= Rollout_v ini:(Ini.path #get) title:title id:id
		--id	= _rollout.id
		Rollouts.setVal (_rollout.id) ( _rollout )
		
		Rollouts.getVal  (_rollout.id)  --return 
	),
	/** Dock\Undock sidebar to window
	  * @param	string	side	"left|top|right|bottom" or #left|#top|#right|#bottom, otherwise undock
	  * @return	self
	  *
	  * @example dock "right"	// dock dialog right
	  * @example dock #left	// dock dialog left
	  * @example dock ""	// undock dialog
	 */
	function dock side =
	(
		this.register()

		if( findItem #( #left, #right, #top, #bottom ) (side as name) > 0 ) then 
			_dock = ("cui_dock_" + side as string) as name
		else
			_dock = #cui_floatable
		
		cui.DockDialogBar Floater _dock

		this --return
	),
	/** Undock dialog
	  * @return	self
	 */
	function undock =
	(
		print "------------\nFloater.undock()"
		--format " _isRegistered()	= % \n" (this._isRegistered())
		--format " _isDocked()	= % \n" (this._isDocked())
		if ( this._isRegistered() and this._isDocked() ) then 
		this.dock "undock" --return
		--format " cui.getDockState Floater	= % \n" (cui.getDockState Floater)
		
		--this.unregister()
	),
	/** Close
	 */
	function destroy =
	(
		print "------------\nFloater.destroy()"
		this.unregister()

		try(DestroyDialog Floater)catch()
	),
	/** Set position of dialog relative 3Ds Max window
	  * @return	self
	 */
	function position x y =
	(
		this.undock()
		
		--Floater.pos = [ x, y ]
		if not( this._isRegistered() ) then 
			SetDialogPos Floater ( getMAXWindowPos() + [ x, y ] )
		else
			Floater.pos = [ x, y ]
		this --return
	),
	/** Set size of dialog
	  * @return	self
	 */
	function size width height =
	(
		this.undock()
		
		Floater.size = [ width, height ]

		this --return
	),
	/** Register dialog bar
	 */
	function register =
	(
		if not( this._isRegistered() ) then 
			cui.RegisterDialogBar	Floater style:#(#cui_dock_left,#cui_dock_right,#cui_floatable,#cui_handles) minSize:size_init maxSize:size_init
	),
	
	/** Unregister dialog bar
	 */
	function unregister =
	(
		try(cui.UnRegisterDialogBar Floater)catch() --try to unregister if already registered
	),
	
	/** _is registered
	 */
	function _isRegistered =
	(
		try(
			cui.getDockState Floater
			true --return 
		)catch(
			false --return 
		)
	),
	/** Is floatable
	 */
	function _isFloatable =
	(
		if ( this._isRegistered() and cui.getDockState Floater == #cui_floatable ) then true else false --return
	),
	/** _is docked
	 */
	function _isDocked =
	(
		if ( matchPattern ((cui.getDockState Floater) as string ) pattern:@"_dock_" ) then true else false --return
	),
    
	/*--------------------------------------------------------------------------------*/
		private
	/*--------------------------------------------------------------------------------*/

	/** _add rollouts
	 */
	function _addRollouts =
	(
		for _rollout in Rollouts.values do
			addRollout (_rollout.create dialog:false) Floater
	),
	/** Set id of rollout as global variable
	  *	Id is sanitized title to id "Foo Bar" >>> "foo_bar"
	  */
	function _setFloaterGlobal =
	(
		id	= ( dotNetObject "System.Text.RegularExpressions.Regex" @"\s+" ).Replace ( toLower title ) "_";
		id	= ( dotNetObject "System.Text.RegularExpressions.Regex" @"[^a-zA-Z0-9-_]" ).Replace id ""
		
		__GLOBAL__v.Floater = this
	),
	/** _open close rollouts
	 */
	function _openCloseRollouts =
	(
		for _rollout_id in Rollouts.keys do
		(
			_Rollout	= Rollouts.getVal _rollout_id
			_Rollout.open ( Ini.load _Rollout.id #open default:true )
		)
	),
	
	/** Set default path to ini file
	  *
	  * Default dir:	"#temp\ini-files\"
	  * Default file:	"%floater_id%.ini"
	 */
	function _setIniDefaults =
	(
		if( Ini.dir #get == undefined ) then
			Ini.dir (( pathConfig.GetDir #temp ) + "\ini-files")
			--Ini.dir (( pathConfig.GetDir #temp ) )
		
		if( Ini.file #get == undefined ) then
			Ini.file ( (getFilenameFile id) + ".ini" )
	), 

	/** Create Floater - UNUSED METHOD WILL BE DELETE
	  * Floater can`t has Menu
	  * Rollouts are added as rollouts
	 */
	function _createFloater =
	(
		Floater	= newRolloutFloater title 270 512 ((getMAXWindowPos()).x) ((getMAXWindowPos()).y)
		this._addRollouts()
	),
	/** Get\set value of property 
	  * @param	string|name key	Name  of property E.G.: "foo_key" OR #foo_key 
	  * @param	string|#get value	Value of property
	  *
	  * @return	string|self Value or self
	  *
	  * @example this._getSetProp "foo" "bar" -- SET "bar" to property "foo"
	  * @example this._getSetProp #foo  #get  -- GET value of property "foo"
	  */
	function _getSetProp key value =
	(
		if( value != #get ) then
		(
			if( value != undefined ) then
				setProperty this ( key as string ) value
			
			this --return
		) else
			getProperty this ( key as string ) --return
	),
	/** Check if required properties are defined
	  * Names of construct props are defined in __construct array
	 */
	function checkConstctructProperties =  
	(
		for prop in __construct where getProperty this prop == undefined do
			messageBox ("Undefined construct property !\n\n"+ ((filterString( classof this as string )"(:")[2]) +"."+ prop )
	),
	on create do
	(
		print "------------\nFloater.onCreate()"
		this.destroy()
		checkConstctructProperties()
		
		this._setFloaterGlobal()
		this._setIniDefaults()
		
	)
)

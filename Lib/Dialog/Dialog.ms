filein( getFilenamePath(getSourceFileName()) + "/../Rollouts/Rollout/Rollout.ms" )
filein( getFilenamePath(getSourceFileName()) + "/../Ini/Ini.ms" )
filein( getFilenamePath(getSourceFileName()) + "/DialogProperty/DialogProperty.ms" )

/** Globals
 */
struct Globals_v
(
	Dialog
)
--format " __GLOBAL__v	= % \n" __GLOBAL__v
if( __GLOBAL__v == undefined ) then
	global __GLOBAL__v = Globals_v()



/** Dialog dialog
  *
  * Rollout dialog with subroullouts is used as "Dialog" instead of using regular [RolloutDialog](https://help.autodesk.com/view/3DSMAX/2018/ENU/?guid=__files_GUID_A72112A6_BDFB_47A6_88FB_8D49C4CBD049_htm)
  *
  */
struct Dialog_v
(
	__construct = #(#title),

	/* required properties */
	title,

	/* dependency */
	_RolloutMain,
	Property,
	--Menu	= Menu_v(),
	Ini	= Ini_v(),
	
	/* config */	
	id,
	
	/* options */	
	_ini,
	
	/* store */
	Dialog,
	size_init, -- size of dialog after creation

	
	/** Create Dialog
	  * Same parameters as __[ Rollout.create() ](../Rollouts/Rollout)__
	 */
	function create width: height: pos: =
	(		
		--_RolloutMain.dialogCreate height:height width:width pos:pos
		_RolloutMain.dialogCreate()

		Dialog = _RolloutMain._rolloutCreator.def
	),

	/** Set rollout in Dialog
	  * UPDATE OF THIS BLOCK IS NEEDED
	  *
	  * @param	string	title	Title of rollout
	  * @param	string	id	Id of roullout, if empty then sanitized title is used
	  * @return	[Rollout](../Rollouts/Rollout)
	  *
	  * @example roll "Roll Title" "rollout_id" 	// set rollout
	  * @example roll "Roll Title" "" 	// set rollout, id will be sanitized title "roll_title"
	  */
	function roll title id:  =
	(
		--_rollout	= Rollout_v ini:(Ini.path #get) title:title id:id
		
		_RolloutMain.subrollout title id:id --return
	),
	
	/** Get Rollouts of main roll
	 */
	function rollouts =
	(
		_RolloutMain.Subrollouts.Rollouts --return
	),
	
	/** Dock\Undock sidebar to window
	  * @param	string	side	"left|top|right|bottom" or #left|#top|#right|#bottom, otherwise undock
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
		
		cui.DockDialogBar Dialog _dock
	),
	/** Undock dialog
	 */
	function undock =
	(
		print "------------\nDialog.undock()"

		if ( this._isRegistered() and this._isDocked() ) then 
			this.dock "" --return
		
		--format " cui.getDockState Dialog	= % \n" (cui.getDockState Dialog)
		
		this.unregister()
	),
	/** Close
	 */
	function destroy =
	(
		--print "------------\nDialog.destroy()"
		this.unregister()

		--try(DestroyDialog Dialog)catch()
		try(DestroyDialog Dialog )catch()
		
	),
	/** Set position of dialog relative 3Ds Max window
	 */
	function position x y =
	(
		this.undock()
		
		--Dialog.pos = [ x, y ]
		if not( this._isRegistered() ) then 
			SetDialogPos Dialog ( getMAXWindowPos() + [ x, y ] )
		else
			Dialog.pos = [ x, y ]
	),
	/** Set size of dialog
	 */
	function size width height =
	(
		this.undock()
		
		Dialog.size = [ width, height ]
	),
	/** Register dialog bar
	 */
	function register =
	(
		if not( this._isRegistered() ) then 
			cui.RegisterDialogBar	Dialog style:#(#cui_dock_left,#cui_dock_right,#cui_floatable,#cui_handles) minSize:size_init maxSize:size_init
	),
	
	/** Unregister dialog bar
	 */
	function unregister =
	(
		try(cui.UnRegisterDialogBar Dialog)catch() --try to unregister if already registered
		--try(cui.UnRegisterDialogBar __GLOBAL__v.Dialog)catch() --try to unregister if already registered
	),
	/** Close
	 */
	function unregisterOldDialog =
	(
		if not (classOf __GLOBAL__v.Dialog == UndefinedClass ) then
			__GLOBAL__v.Dialog.unregister()
	),
	
	/** _is registered
	 */
	function _isRegistered =
	(
		try(
			cui.getDockState Dialog
			true --return 
		)catch(
			false --return 
		)
	),
	/** Is floatable
	 */
	function _isFloatable =
	(
		if ( this._isRegistered() and cui.getDockState Dialog == #cui_floatable ) then true else false --return
	),
	/** _is docked
	 */
	function _isDocked =
	(
		if ( matchPattern ((cui.getDockState Dialog) as string ) pattern:@"_dock_" ) then true else false --return
	),
    
	private
	
	/** Set main rollout
	 */
	function _setMainRollout =
	(
		_RolloutMain	= Rollout_v title:title id:id
	),
	/** Set access shortcut to properties
	  *
	  * @example 
	  * 	Dialog.property.height	512	-- THIS METHOD ALLOW USE THIS
	  * 	Dialog._RolloutMain.property.height	512	-- INSTEAD OF THIS
	 */
	function _setProperty =
	(
		--Property	= _RolloutMain.Property
		Property	= DialogProperty_v id:_RolloutMain.id subrollouts_slot:_RolloutMain.subrollouts_slot
	),
	/** Set id of rollout as global variable
	  *	Id is sanitized title to id "Foo Bar" >>> "foo_bar"
	  */
	function _setDialogGlobal =
	(
		--id	= ( dotNetObject "System.Text.RegularExpressions.Regex" @"\s+" ).Replace ( toLower title ) "_";
		--id	= ( dotNetObject "System.Text.RegularExpressions.Regex" @"[^a-zA-Z0-9-_]" ).Replace id ""
		__GLOBAL__v.Dialog = this
	),
	--/** _open close rollouts
	-- */
	--function _openCloseRollouts =
	--(
	--	for _rollout_id in Rollouts.keys do
	--	(
	--		_RolloutMain	= Rollouts.getVal _rollout_id
			--_RolloutMain.open ( Ini.load _RolloutMain.id #open default:true )
	--	)
	--),
	
	/** Set default path to ini file
	  *
	  * Default dir:	"#temp\ini-files\"
	  * Default file:	"%dialog_id%.ini"
	 */
	function _setIniDefaults =
	(
		if( Ini.dir #get == undefined ) then
			Ini.dir (( pathConfig.GetDir #temp ) + "\ini-files")
			--Ini.dir (( pathConfig.GetDir #temp ) )
		
		if( Ini.file #get == undefined ) then
			Ini.file ( (getFilenameFile id) + ".ini" )
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
	  * Names of required props are defined in __construct array
	 */
	function _checkConstctructProperties =  
	(
		for prop in __construct where getProperty this prop == undefined do
			messageBox ("Undefined construct property !\n\n"+ ((filterString( classof this as string )"(:")[2]) +"."+ prop )
	),
	on create do
	(		
		this.unregisterOldDialog()
		
		this._setMainRollout()
		
		this._setProperty()
				
		this._setDialogGlobal()
		
		--this._setIniDefaults() -- DIABLED FOR DEBUGGING
	)
)

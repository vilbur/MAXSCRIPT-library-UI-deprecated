/** Globals
 */
struct Globals_v
(
	Floater
)

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
	self	= this,
	
	/* dependency */
	Rollouts	= List_v(),
	Menu	= Menu_v(),
	Ini	= Ini_v(),

	/* config */	
	title,
	id,
	_height,
	
	/* options */	
	_ini,
	
	/* store */
	Floater,
	size_init, -- size of dialog after creation
	
	/** New
	 */
	function new _title =
	(
		title = _title
		
		this._setIdGlobal()
		
		this._setIniDefaults()

		this --return
	),

	/** Create
	 */
	function create height:undefined =
	(
		_height	= height
		
		--this._setIniDefaults()

		this._setFloater()
		
		size_init = [(GetDialogSize Floater)[1]+8, (GetDialogSize Floater)[2]]
		
		this._openCloseRollouts()
		
		this.register()
		
		this --return
	),

	/** Get\Set rollout in Floater
	  * @param	string	title	Title of rollout
	  * @param	string	id	Id of roullout, if empty then sanitized title is used
	  * @return	[Rollout](../Rollouts/Rollout)
	  *
	  * @example roll "roll title" "roll_id" 	// set rollout 
	  * @example roll "" "roll_id"	// get rollout
	  */
	function roll title id  =
	(
		print ( "Ini = " + Ini as string )
		print ( "Floater.roll() Ini.path = " + (Ini.path #get) as string )

		_rollout	= (Rollout_v ini:(Ini.path #get) ).new title id:id
		--id	= _rollout.id
		Rollouts.setVal (_rollout.id) ( _rollout )
		
		Rollouts.getVal id --return 
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
		
		case of
		(
			(side == "left"	or side == #left):	_dock = #cui_dock_left
			(side == "right"	or side == #right):	_dock = #cui_dock_right
			(side == "top"	or side == #top):	_dock = #cui_dock_top
			(side == "bottom"	or side == #bottom):	_dock = #cui_dock_bottom
			default:	_dock = #cui_floatable
		)
		
		cui.DockDialogBar Floater _dock
		
		if( _dock == #cui_floatable ) then
			this.unregister()
		
		this --return
	),
	/** Undock dialog
	  * @return	self
	 */
	function undock =
	(
		this.unregister()

		this.dock "undock" --return
	),
	/** Close
	 */
	function close =
	(
		this.unregister()

		try(DestroyDialog Floater)catch()
	),
	/** Set position of dialog relative 3Ds Max window
	  * @return	self
	 */
	function position x y =
	(
		this.undock()
		
		Floater.pos = [ (getMAXWindowPos()).x + x, (getMAXWindowPos()).y + y ]

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
		this.unregister()

		cui.RegisterDialogBar	Floater style:#(#cui_dock_left,#cui_dock_right,#cui_floatable,#cui_handles) minSize:size_init maxSize:size_init
	),
	/** Unregister dialog bar
	 */
	function unregister =
	(
		print ( "Floater.name = " + Floater.name as string )
		
		try(cui.UnRegisterDialogBar Floater)catch() --try to unregister if already registered
	),
	

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
	function _setIdGlobal =
	(
		id = ( dotnetObject "System.Text.RegularExpressions.Regex" @"\s+" ).Replace ( toLower title ) "_";

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
	
	/** Assign main rollout as floater to property Floater
	 */
	function _setFloater =
	(
		roll_main	= (Rollout_v()).new title
		roll_main.subrollouts	= Rollouts.values
		
		roll_main.createRollDialog height:_height
		
		Floater = roll_main.roll.def
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

	function test =
	(
		messagebox "Floater.test()"
	)
	


)

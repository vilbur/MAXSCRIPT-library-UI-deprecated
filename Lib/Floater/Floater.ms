/** Globals
 */
struct Globals_v
(
	Floater
)

if( __GLOBAL__v==undefined ) then
	global __GLOBAL__v = Globals_v()
	
	
/** Floater
  *
  *
  *
  *
  */
struct Floater_v
(
	self	= this,
	
	/* dependency */
	Rollouts	= List_v(),
	Menu	= Menu_v(),
	_Ini	= Ini_v(),

	/* config */	
	title,
	id,
	_height,
	
	/* options */	
	ini,
	
	/* store */
	Floater,
	size_init, -- size of dialog after creation
	
	/** New
	 */
	function new _title =
	(
		this.title = _title
		
		this._setIdGlobal()
		
		this._setIni()

		this --return
	),
	/** Create
	 */
	function create height:undefined =
	(
		_height	= height
		
		roll_main	= (Rollout_v()).new title
		
		--try(cui.UnRegisterDialogBar test_floater)catch() --try to unregister if already registered
		--try(DestroyDialog test_floater)catch()	
		--this.unregister()
		
		roll_main.subrollouts = Rollouts.values
		
		roll_main.CreateRollDialog height:_height
		
		Floater = roll_main.roll.def
			
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
		if( title!="" ) then -- GET will be removed probably in future
		(
			_rollout	= (Rollout_v ini:ini ).new title id:id
			id	= _rollout.id
			Rollouts.setVal id ( _rollout )
		)
		
		return Rollouts.getVal id
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
		--this.unregister()
		
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

		--cui.RegisterDialogBar	Floater style:#(#cui_dock_left,#cui_dock_right,#cui_floatable,#cui_handles) 
		cui.RegisterDialogBar	Floater style:#(#cui_dock_left,#cui_dock_right,#cui_floatable,#cui_handles) minSize:size_init maxSize:size_init
	),
	/** Unregister dialog bar
	 */
	function unregister =
	(
		try(cui.UnRegisterDialogBar Floater)catch() --try to unregister if already registered
	),
	
	/** Create Floater
	  * Floater can`t has Menu
	  * Rollouts are added as rollouts
	 */
	function _createFloater =
	(
		Floater	= newRolloutFloater title 270 512 ((getMAXWindowPos()).x) ((getMAXWindowPos()).y)
		this._addRollouts()
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
			_Rollout.open ( _Ini.load _Rollout.id #open default:true )
		)
	),
	
	/** _set ini
	 */
	function _setIni =
	(
		if( ini==undefined and _Ini.ini==undefined ) then
			ini = getFilenamePath(getSourceFileName()) + "\\" + id + ".ini"
		
		--print ( "***Floater.ini=" + ini as string )
		_Ini.ini = ini
	), 
	
	function test =
	(
		messagebox "Floater.test()"
	)
	
)

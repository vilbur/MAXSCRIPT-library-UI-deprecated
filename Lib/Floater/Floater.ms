/** Floater
  *
  *
  *
  *
  */
struct Floater_v
(
	/* dependency */
	Rollouts	= List_v(),
	Menu	= Menu_v(),

	/* config */	
	title,
	id,
	_height,
	
	/* options */	
	ini,
	
	/* store */
	floater,
	size_init, -- size of dialog after creation
	
	/** New
	 */
	function new _title =
	(
		this.title = _title
		
		this._setId()
		
		this._setIni()

		execute ( "global "+id )

		this --return
	),
	/** Create
	 */
	function create height:undefined =
	(
		--title	= _title
		_height	= height

		this._createMainRollout()
		
		this --return
	),

	/** Get\Set rollout in floater
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
			--print ( "roll() ini=" + ini as string )
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

		cui.DockDialogBar floater _dock
		
		if( _dock == #cui_floatable ) then
			this.unregister()

		this --return
	),
	/** Undock dialog
	  * @return	self
	 */
	function undock =
	(
		this.dock "undock" --return
	),
	/** Set position of dialog relative 3Ds Max window
	  * @return	self
	 */
	function position x y =
	(
		this.undock()
		--this.unregister()
		
		floater.pos = [ (getMAXWindowPos()).x + x, (getMAXWindowPos()).y + y ]

		this --return
	),
	/** Set size of dialog
	  * @return	self
	 */
	function size width height =
	(
		this.undock()
		
		floater.size = [ width, height ]

		this --return
	),
	/** Register dialog bar
	 */
	function register =
	(
		this.unregister()

		--cui.RegisterDialogBar	floater style:#(#cui_dock_left,#cui_dock_right,#cui_floatable,#cui_handles) 
		cui.RegisterDialogBar	floater style:#(#cui_dock_left,#cui_dock_right,#cui_floatable,#cui_handles) minSize:size_init maxSize:size_init
	),
	/** Unregister dialog bar
	 */
	function unregister =
	(
		try(cui.UnRegisterDialogBar floater)catch() --try to unregister if already registered
	),
	
	/** Create floater
	  * Floater can`t has Menu
	  * Rollouts are added as rollouts
	 */
	function _createFloater =
	(
		floater	= newRolloutFloater title 270 512 ((getMAXWindowPos()).x) ((getMAXWindowPos()).y)
		this._addRollouts()
	),
	/** Create rollout
	  * Rollout can has Menu
	  * Rollouts are added as subrollouts
	 */
	function _createMainRollout =
	(
		this.unregister()

		--messagebox (_height as string )  beep:false;
		roll_main	= (Rollout_v()).new title
		
		roll_main.subrollouts = Rollouts.values
		
		roll_main.CreateRollDialog height:_height
		
		floater = roll_main.roll.def
				
		size_init = GetDialogSize floater
		size_init = [size_init[1]+8, size_init[2]]
		--messagebox (GetDialogSize floater as string )

		this.register()
	),

	/** _add rollouts
	 */
	function _addRollouts =
	(
		for _rollout in Rollouts.values do
			addRollout (_rollout.create dialog:false) floater
	),

	/** Sanitize title to id "Foo Bar" >>> "foo_bar"
	  */
	function _setId =
	(
		id = ( dotnetObject "System.Text.RegularExpressions.Regex" @"\s+" ).Replace ( toLower title ) "_";
	),
	/** _set ini
	 */
	function _setIni =
	(
		ini = getFilenamePath(getSourceFileName()) + "\\" + id + ".ini"
		--print ( "ini=" + ini as string )
	), 
	
	function test =
	(
		messagebox "Floater.test()"
	)
	
)

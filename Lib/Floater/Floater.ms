/** Floater
 */
struct Floater_v
(
	self	= this,
	title,
	
	floater,
	Rollouts	= List_v(),
	_Menu	= Menu_v name:"RolloutMenu",
	
	fn createMenu = 
	(
		print "Floater_v.createMenu()"
		/* DEFINE MENU */
		menu	= _Menu.menu "Menu"
		menu_2	= _Menu.menu "Menu 2"
		
		menu.item "Test Item 1" id:"test_item1"
		
	),
	
	/** Main rollout
	 */
	function mainRollout =
	(
		roll_main = rolloutCreator "mainR" title
		
		roll_main.begin()
		
		for _rollout in Rollouts.values do
			roll_main.addText ("subRollout " + _rollout.id + " \""+_rollout.title+"\" height:256 width:256 offset:[-14,-6]")
		
		return roll_main.end()
	),
	
	/** Create
	 */
	function create _title =
	(
		title	= _title
		--floater	= newRolloutFloater title 270 512 ((getMAXWindowPos()).x) ((getMAXWindowPos()).y)
		mainR = this.mainRollout()
	
	
		--createDialog mainR menu:(Menu.create())
		
		this.createMenu()
		--Menu.create()
		--createDialog mainR menu:RolloutMenu
		createDialog mainR menu:(_Menu.create())
		--createDialog mainR 

		this._addSubRollouts()
		--this._addRollouts()
		
		return this
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

		return this
	),
	/** Undock dialog
	  * @return	self
	 */
	function undock =
	(
		return this.dock "undock"
	),
	/** Set position of dialog relative 3Ds Max window
	  * @return	self
	 */
	function position x y =
	(
		this.undock()
		--this.unregister()
		
		floater.pos = [ (getMAXWindowPos()).x + x, (getMAXWindowPos()).y + y ]

		return this
	),
	/** Set size of dialog
	  * @return	self
	 */
	function size width height =
	(
		this.undock()
		--this.unregister()
		
		floater.size = [ width, height ]

		return this
	),
	/** Get\Set rollout in floater
	  *	
	  *
	  *
	  * @example roll "roll title" "roll_id" 	// set rollout 
	  * @example roll "" "roll_id"	// get rollout
	  *
	  * @return	[Rollout](../Rollouts/Rollout)
	 */
	function roll title id  =
	(
		if( title!="" ) then
		(
			_rollout = (Rollout_v()).new title id
			Rollouts.setVal id ( _rollout )
		)
		
		return Rollouts.getVal id
	),
	/** _add rollouts
	 */
	function _addRollouts =
	(
		
		for _rollout in Rollouts.values do
			addRollout (_rollout.create dialog:false) floater
			--addSubRollout floater.sub1 (_rollout.create dialog:false) 
	),
	/** _add rollouts
	 */
	function _addSubRollouts =
	(
		--subrollouts = "AddSubRollout mainR.sub1 sub1"
		subrollouts = ""
		
		for _rollout in Rollouts.values do
		(
			_rollout.create dialog:false
			subrollouts += "AddSubRollout mainR." +_rollout.id+ " " +_rollout.id
		)
			--addSubRollout floater.sub1 (_rollout.create dialog:false) 
		execute subrollouts
	),
	
	/** Register dialog bar
	 */
	function register =
	(
		this.unregister()

		cui.RegisterDialogBar	floater style:#(#cui_dock_left,#cui_dock_right,#cui_floatable,#cui_handles)				
		--return this
	),
	/** Unregister dialog bar
	 */
	function unregister =
	(
		try(cui.UnRegisterDialogBar floater)catch() --try to unregister if already registered
		--return this
	),
	
	function test =
	(
		messagebox "Floater.test()"
	)
)

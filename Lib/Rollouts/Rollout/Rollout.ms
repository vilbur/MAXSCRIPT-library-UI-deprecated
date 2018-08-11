/** Create Rollout
  * Rollout has generated global variable by id with prefix "rollout" E.G.: "foo_rollout" >>> "rollout_foo_rollout"
  *
  * @property	string	title	Title of rollout
  * @property	string	id	Id of rollout, if not defined then sanitized title is used E.G.: title="Foo Rollout" >>> id="foo_rollout"
  * @property	int	height	Height of rollout
  *
  *
  * @property	string	ini	Path to ini where state of UI is saved, if false then ini state is not saved
  *
  * @method	void	onOpen( @param	string	callback[, @param	string	tooltip] )	
  * @method	void	onClose( @param	string	callback[, @param	string	tooltip] )	
  *
  */
struct Rollout_v
(
	/* dependency */
	Layout	= Layout_v(),

	/* config */
	title,
	id,
	
	/* options */
	height,
	ini, -- inherit by Floater_v

	/* lists */
 	ControlBoxes	= #(),
	Subrollouts	= #(),
	RolloutEvent	= RolloutEvent_v parent_control:this,
	
	/* store rollout and parent rollout */
	roll,
	parent_roll,
	
	type	= #rollout, -- nack reference for this.RolloutEvent._bindDefaultEvent()
	
	/*------ EXTENDED METHODS ------*/
	onOpen	= RolloutEvent.onOpen,
	onClose	= RolloutEvent.onClose,
	
	/** Set new rollout
	  * @param	string	title	Title of rollout
	  * @param	string	[_id]	Id of rollout, if void then sanitized title is used E.G.: "Foo Rollout" >>> "foo_rollout"
	  * @return	self
	 */
	function new title id:"" height:0 =
	(
		this.title	= title

		this._setId id
		
		this._setRolloutGlobalVariable()
		
		this._setRoll()

		this.setDefaultEvents()

		return this
	),
	/** Subrollout
	 */
	function subrollout title id:"" =
	(
		_subrollout = (Rollout_v()).new title id:id
		
		append Subrollouts _subrollout
		
		return _subrollout
	),
	/** Create rollout dialog
	 * @return	RolloutClass
	 */
    function createRollDialog height:undefined =
	(
		this.height	= height
		
		this.tryDestroyDialog()
		
		this._createRollout()
		
		CreateDialog (roll.def) width:(Layout._getRollWidth()-6)
		
		this._addSubRollouts()
		
		roll --return
	),

	/** Open close rollout s
	 */
	function open state =
	(
		--print ( "Rollout."+id+".open()=" + state as string )
		execute ( id+".open = "+state as string )
	),
	/*---------------------------------------
		CONTROLS 
	-----------------------------------------*/
	/** Get Controls for rollout
	  * @param	string	[groupbox]	Title of group box
	  * @return [Controls](../../Controls)
	 */
	function controls groupbox:undefined =
	(
		Controls_new 	= Controls_v parent_roll:this groupbox:groupbox

		append this.ControlBoxes Controls_new

		return Controls_new
	),

	/*---------------------------------------
		ROLLOUT NEW
	-----------------------------------------*/
	/** Set id by title if not defined
	 */
	function _setId _id =
	(
		if( _id=="" ) then
			_id = ( dotNetObject "System.Text.RegularExpressions.Regex" @"[\s-]+" ).Replace ( toLower title ) "_";
		
		id = "rollout_"+_id
	),

	/** Set rollout global variable
	  * Global variable is id with prefix "rollout" E.G.: "foo_rollout" >>> "rollout_foo_rollout"
	  */
	function _setRolloutGlobalVariable =
	(
		execute ( "global "+ id )
	),
	/** Try destroy dialog by global variable before variable will be overwritten
	 */
	function tryDestroyDialog =
	(
		try(cui.UnRegisterDialogBar (execute id))catch()	
		try(DestroyDialog           (execute id))catch()	
	),
	/** Create new roll with rolloutCreator()
	 */
	function _setRoll =
	(
		roll = rolloutCreator id title
	),
	/** Add default events
	 */
	function setDefaultEvents =
	(
		if( ini != undefined ) then 
			this.RolloutEvent.setDefaultEvents()
	),
	/*---------------------------------------
		CREATE ROLLOUT
	-----------------------------------------*/
	/** Create rollout
	 */
	function _createRollout =
	(
		roll.begin()
		
		this._addControls()
		
		this._createSubRollouts()

		this._addEventHandlers()

		this._addSaveIniFunction()

		roll.end()
	),

	/**  Add controls on rollout creation
	*/
	function _addControls =
	(
		for Controls in ControlBoxes do
			Controls._addControls()
	),
	/** Create sub rollouts
	 */
	function _createSubRollouts =
	(
		if( height==undefined ) then
			height = (getMAXWindowSize()).y - 256 -- SIZE_OF_DIALOG
		
		--print ( "Subrollouts.count=" + Subrollouts.count as string )
		if( Subrollouts.count>0 ) then 
		(
			for _rollout in Subrollouts do
				_rollout._createRollout()
				
			roll.addText ( "\nsubRollout " + id + "Subrollouts " + "\"Subrollouts\" height:"+( height as string )+" width:"+(Subrollouts[1].Layout._getRollWidth() as string )+" offset:[-14,-6]" )
			--roll.addText ( "\nsubRollout " + id + "Subrollouts " + "\"Subrollouts\" width:"+(Subrollouts[1].Layout._getRollWidth() as string )+" offset:[-14,-6]" )
		)
	),

	/** Add sub rollouts
	 */
	function _addSubRollouts =
	(
		add_subrollouts = ""
		
		if( Subrollouts.count>0 ) then
		(
			for _rollout in Subrollouts do
				add_subrollouts += "\nAddSubRollout " + id + "." + id + "Subrollouts " +  " " + _rollout.id

			execute add_subrollouts
		)
	),
	/** Bind events to rollout 
	 */
	function _addEventHandlers =
	(
		this.RolloutEvent._addHandlers()
	),
	/** Add saveIni() function to rollout
	  * This function is called before user callback
	  *
	  */
	function _addSaveIniFunction =
	(
		print "\n"
		print ( "this = " + id as string )
		print ( "ini = " + ini as string )
		if( ini != undefined ) then
			roll.addText( "function saveIni _section _key _value = ( ((Ini_v()).path @"+ini+"@).save _section _key _value )" )
			--roll.addText( "function saveIni _section _key _value = ( (Ini_v _path:@"+ini+"@).save _section _key _value )" )

			
			----roll.addText( "function saveIni _section _key _value = ( print ( ((Ini_v()).path @"+ini+"@)  as String ) )" )
	),


	function test =
	(
		messagebox "Rollout_v.test()"
	)
	
)
/** Create Rollout
  * Rollout has generated global variable by id with prefix "rollout" E.G.: "foo_rollout" >>> "rollout_foo_rollout"
  *
  * @property	string	title	Title of rollout
  * @property	string	id	Id of rollout, if not defined then sanitized title is used E.G.: title="Foo Rollout" >>> id="foo_rollout"
  * @property	int	height	Height of tollout
  *
  * @property	string	ini	Path to ini where state of UI is saved, if false then ini state is not saved
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
	ini = false,

	/* lists */
 	ControlBoxes	= #(),
	Subrollouts	= #(),
	Events	= RolloutEvent_v parent_control:this,
	
	/* store rollout and parent rollout */
	roll,
	parent_roll,
	
	type	= #rollout, -- nack reference for this.Events._bindDefaultEvent()
	
	/*------ EXTENDED METHODS ------*/
	open	= Events.open,
	close	= Events.close,
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
		
		this.Events._bindDefaultEvents()

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
    function CreateRollDialog height:undefined =
	(
		this.height	= height

		--try(DestroyDialog id)catch() -- must be above rollout definition

		this._createRollout()

		CreateDialog (roll.def) width:(Layout._getRollWidth()-6)
		
		this._addSubRollouts()
		
		return roll
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
		PRIVATE
	-----------------------------------------*/
	/** Set rollout global variable
	  * Global variable is id with prefix "rollout" E.G.: "foo_rollout" >>> "rollout_foo_rollout"
	  */
	function _setRolloutGlobalVariable =
	(
		--if( id==undefined ) then
		print ("rollout global "+id)
		execute ( "global "+ id )
	),

	/** Create rollout
	 */
	function _createRollout =
	(
		roll.begin()
		
		this._addControls()
		
		this._createSubRollouts()

		--this._addHandlers()
		this.Events._addHandlers()

		this._addSaveIniFunction()

		roll.end()
	),
	/*---------------------------------------
		ROLLOUT DEFINITION
	-----------------------------------------*/
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
	--/** _add handlers
	-- */
	--function _addHandlers =
	--(
	--	this.Events._addHandlers()
	--),
	/** Add saveIni() function to rollout
	  * This function is called before user callback
	  * saveIni() function 
	  *
	  */
	function _addSaveIniFunction =
	(
		--print ( "title=" + title as string )
		--print ( "_addSaveIniFunction() ini=" + ini as string )
		if( ini != false ) then  
			roll.addText( "function saveIni _section _key _value = ( (Ini_v ini:@"+ini+"@).save _section _key _value )" )
	),

	/*---------------------------------------
		HELPERS
	-----------------------------------------*/
	/** Set id by title if not defined
	 */
	function _setId _id =
	(
		if( _id=="" ) then
			_id = ( dotnetObject "System.Text.RegularExpressions.Regex" @"[\s-]+" ).Replace ( toLower title ) "_";
		
		--_id = _id_	= ( dotnetObject "System.Text.RegularExpressions.Regex" @"_" ).Replace _id_ "replace"
		print ( "GLOBAL rollout=" + _id as string )

		--id = _id
		id = "rollout_"+_id

	),
	/** Create new roll with rolloutCreator()
	 */
	function _setRoll =
	(
		roll = rolloutCreator id title
	),
	function test =
	(
		messagebox "Rollout_v.test()"
	)
	
)
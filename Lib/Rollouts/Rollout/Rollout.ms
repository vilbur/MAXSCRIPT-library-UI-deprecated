/* Import sub substructs */

/** Rollout
 */
struct Rollout_v
(
	id,
	title,
	roll,
	--roll_def,
 	ControlBoxes	= #(),
	Layout	= Layout_v(),

	Subrollouts	= #(),
	parent_roll,
	
	/** Set new rollout
	  * @param	string	_title	Title of rollout
	  * @param	string	[_id]	Id of rollout, if void then sanitized title is used E.G.: "Foo Rollout" >>> "foo_rollout"
	  * @return	self
	 */
	function new _title _id:"" =
	(
		title	= _title
		
		this.setId _id
		
		this.roll = rolloutCreator id title
		
		return this
	),
	/** Subrollout
	 */
	function subrollout _title _id:"" =
	(
		_subrollout = (Rollout_v()).new _title id:_id
		
		append Subrollouts _subrollout
		
		return _subrollout
	),
	/** Create rollout 
	 * @param	boolean	dialog	If true the dialog is created, if void or false then return RolloutClass E.G.: for adding to floater
	 * @return	RolloutClass
	 */
    function CreateRollDialog =
	(
		try(DestroyDialog id)catch() -- must be above rollout definition

		this._createRollout()

		--CreateDialog (roll.def) width:(Layout._getRollWidth()) height:512
		CreateDialog (roll.def) width:320 height:512
		
		this._addSubRollouts()
		
		return roll
	),
	/** Create rollout
	 */
	function _createRollout =
	(
		roll.begin()
		
		this._addControls()
		
		this._createSubRollouts()

		roll.end()
		
		--roll_def = roll.def
		--print ( "roll_def=" + roll_def as string )
	),
	/** Create sub rollouts
	 */
	function _createSubRollouts =
	(
		all_subrollouts_height = 512
		--print ( "Subrollouts.count=" + (Subrollouts.count==0) as string )
		if( Subrollouts.count>0 ) then
		(
			for _rollout in Subrollouts do
				_rollout._createRollout()
				
			roll.addText ( "\nsubRollout " + id + "Subrollouts " + "\"Subrollouts\" height:"+( all_subrollouts_height as string )+" width:"+(Subrollouts[1].Layout._getRollWidth() as string )+" offset:[-11,0]" )
		)

	),
	--/** Create subrollout
	-- */
	--function _createSubrollout =
	--(
	--	this._createRollout()
	--	--_rollout.create dialog:false
	--	--return ("\nsubRollout " + id + " \""+title+"\" height:"+(Layout._getRollHeight() as string )+" width:"+(Layout._getRollWidth() as string )+" offset:[-11,0]")
	--	--return ("\nsubRollout " + id + " \""+title+"\" height:"+(Layout._getRollHeight() as string )+" width:"+(Layout._getRollWidth() as string )+" offset:[-11,0]")
	--	--return ("\nsubRollout " + id + " \""+title+"\" height:"+(Layout._getRollHeight() as string )+" width:"+(Layout._getRollWidth() as string )+" offset:[-14,-6]")
	--	--return ("\nsubRollout " + id + " \""+title+"\"  width:"+(Layout._getRollWidth() as string )+" offset:[-14,-6]")
	--),
	
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

	/**  Add controls on rollout creation
	*/
	function _addControls =
	(
		for Controls in ControlBoxes do
			Controls._addControls()
	),
	/*---------------------------------------
		HELPERS
	-----------------------------------------*/
	/** Set id by title if not defined
	 */
	function setId _id =
	(
		if( _id=="" ) then
			_id = ( dotnetObject "System.Text.RegularExpressions.Regex" @"\s+" ).Replace ( toLower title ) "_";
		
		id = _id
	),
	
	function test =
	(
		messagebox "Rollout_v.test()"
	)
	
)
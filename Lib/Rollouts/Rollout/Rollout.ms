/* Import sub substructs */

/** Rollout
 */
struct Rollout_v
(
	id,
	title,
	roll,
 	ControlBoxes	= #(),
	Layout	= Layout_v(),

	/** Set new rollout
	  * @param	string	_title	Title of rollout
	  * @param	string	[_id]	Id of rollout, if void then sanitized title is used E.G.: "Foo Rollout" >>> "foo_rollout"
	  * @return	self
	 */
	function new _title _id =
	(
		title	= _title
		id	= _id
		
		this.setId()
		
		this.roll = rolloutCreator id title
		
		return this
	),
	/** Create rollout 
	 * @param	boolean	dialog	If true the dialog is created, if void or false then return RolloutClass E.G.: for adding to floater
	 * @return	RolloutClass
	 */
    function CreateRollDialog =
	(
		try(DestroyDialog id)catch() -- must be above rollout definition


		this._createRollout()
		--if( dialog==true ) then
		CreateDialog roll width:(Layout._getRollWidth())
		
		return roll
	),
	/** Create rollout
	 */
	function _createRollout =
	(
		roll.begin()
		
		this._addControls()
		
		roll.end()
		
		roll = roll.def
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
	function setId =
	(
		if( id=="" ) then
			id = ( dotnetObject "System.Text.RegularExpressions.Regex" @"\s+" ).Replace ( toLower title ) "_";
	),
	
	function test =
	(
		messagebox "Rollout_v.test()"
	)
	
)
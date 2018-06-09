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

	/** Set roll property 
	 */
	function new id title =
	(
		this.id	= id
		this.title	= title
		
		this.roll = rolloutCreator this.id this.title
		
		return this
	),
	/** Create rollout 
	 * @param	boolean	dialog	If true the dialog is created, if void or false then return RolloutClass E.G.: for adding to floater
	 * @return	RolloutClass
	 */
    function create dialog:true =
	(
		--id = this.id
		try(DestroyDialog id)catch() -- must be above rollout definition

		roll.begin()
		
		this._addControls()
		
		roll.end()
		
		roll = roll.def
		
		if( dialog==true ) then
			CreateDialog (roll) width:(Layout._getRollWidth())
		
		return roll
	),
	
	/** Controls
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
		for Controls in this.ControlBoxes do
			Controls._addControls()
	),
	
	function test =
	(
		messagebox "Rollout_v.test()"
	)
	
)
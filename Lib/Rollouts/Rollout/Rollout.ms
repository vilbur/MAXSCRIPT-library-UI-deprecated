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
	 *	
	 */
    function create =
	(
		id = this.id
		try(DestroyDialog id)catch() -- must be above rollout definition

		this.roll.begin()
		
		this._addControls()
		
		CreateDialog (this.roll.end()) width:288
        
		this.roll = this.roll.def
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
		--print "Rollout_v._addControls()";
		for Controls in this.ControlBoxes do
			Controls._addControls()
			--this.Layout.controlsBoxPos( Controls._addControls this.Layout.pos ) Controls.groupbox
			
		--for i = 1 to this.ControlBoxes.count do
			--this.Layout.nextControlPos ( this.ControlBoxes[i]._addControls this.Layout.pos ) i
	),
	
	function test =
	(
		messagebox "Rollout_v.test()"
	)
	
)
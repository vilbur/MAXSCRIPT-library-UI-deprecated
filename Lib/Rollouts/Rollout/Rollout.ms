/* Import sub substructs */

/** Rollout
 */
struct Rollout_v
(
	self	= this,
	--test_prop	= "Test value",
	--_Control	= Control_v parent_roll:this,
	--control	= this._Control.control,
	id,
	title,
	roll,
 	_Controls	= #(),
	
	/** Set roll property 
	 */
	function new id title =
	(
		this.id	= id
		this.title	= title
		
		this.roll = rolloutCreator this.id this.title
		
		return self
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
		
		CreateDialog (this.roll.end())
        
		this.roll = this.roll.def
		
	),
	/** Controls
	 */
	function controls =
	(
		Controls_new 	= Controls_v parent_roll:this
		
		append this._Controls Controls_new
		
		return Controls_new
	),
	
	/**  Add controls on rollout creation
	 */
	function _addControls =
	(		
		for _Controls in this._Controls do
			_Controls._addControls()
	),

	function test =
	(
		messagebox "Rollout_v.test()"
	)
	
)
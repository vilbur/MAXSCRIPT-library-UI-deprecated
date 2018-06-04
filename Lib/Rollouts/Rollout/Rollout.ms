/* Import sub substructs */

/** Rollout
 */
struct Rollout_v
(
	self = this,
	id,
	title,
	roll,
 	Controls = #(),
	
	
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
	/**  Add control of any type
	 *  @param	string	type	Type of control
	 *  @param	string	caption	Caption of control
	 *  @return	[Control](../../Control)
	 */
	function control type caption id =
	(
		_Control = Control_v roll:this.roll type:type id:id caption:caption
		
		append this.Controls _Control
		
		return _Control
	),
	/** Add button control
	 *  @param	string	caption	Caption of control
	 *  @return	[Control](../../Control)
	 */
	function button caption id =
	(
		return this.control #button caption id
	),
	
	/**  Add controls on rollout creation
	 */
	function _addControls =
	(		
		for _Control in this.Controls do
			_Control._addControl()
	),

	function test =
	(
		messagebox "UI.test()"
	)
	
)

--method()


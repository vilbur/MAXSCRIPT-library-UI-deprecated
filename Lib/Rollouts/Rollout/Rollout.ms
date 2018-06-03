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
	/**  Add control
	 */
	function control type id title =
	(
		_Control = Control_v roll:this.roll type:type id:id title:title
		
		append this.Controls _Control
		
		return _Control
	),
	/**  
	 */
	function _addControls =
	(		
		--this.roll.addControl #button #myButton "My Button TEST"
		--this.roll.addHandler #myButton #pressed filter:on codeStr:"MessageBox @Isn't this cool@ title:@Wow@"
		for _Control in this.Controls do
			_Control._addControl()
	),

	function test =
	(
		messagebox "UI.test()"
	)
	
)

--method()


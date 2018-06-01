/* Import sub substructs */

/** Rollout
 */
struct Rollout_v
(
	self = this,
	id,
	title,
	roll,
	--Controls = List(),
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
		
		this.addControls()
		
		CreateDialog (this.roll.end())
		
--        rollout id this.title
--        (  
--			--controls = this.controls
--			--for _button in controls do
--			--(
--			--	 Button _button
--			--
--			--)
--			function testFn =
--			(
--				messagebox "testFn";
--			),
--			testFn()
--			
--        )
        
        --CreateDialog id;  
	),
	function addControls =
	(		
		--this.roll.addControl #button #myButton "My Button TEST"
		--this.roll.addHandler #myButton #pressed filter:on codeStr:"MessageBox @Isn't this cool@ title:@Wow@"
		for _Control in this.Controls do
			_Control.addControl()
	),
	/**  Add control
	 */
	function control type id title =
	(
		_Control = Control_v roll:this.roll type:type id:id title:title
		append this.Controls _Control
	),
	function test =
	(
		messagebox "UI.test()"
	)
	
)

--method()


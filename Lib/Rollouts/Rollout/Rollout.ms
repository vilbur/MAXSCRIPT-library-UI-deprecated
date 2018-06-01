/* Import sub substructs */

/** Rollout
 */
struct Rollout_v
(
	id,
	title,
	_rollout,
	controls = #("Button1", "Button2"),
	
	--function id =
	--(
	--	
	--),
	
    function create =
	(
		id = this.id
		try(DestroyDialog id)catch() -- must be above rollout definition

		this._rollout = rolloutCreator this.id this.title
		this._rollout.begin()
		
		this.addControls()
		
		CreateDialog (this._rollout.end())
		
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
		this._rollout.addControl #button #myButton "My Button TEST"
		this._rollout.addHandler #myButton #pressed filter:on codeStr:"MessageBox @Isn't this cool@ title:@Wow@"
		
	),
	/**  Add control
	 */
	function control type id title =
	(
		messagebox "Rollout.add()";
	),
	function test =
	(
		messagebox "UI.test()"
	)
	
)

--method()


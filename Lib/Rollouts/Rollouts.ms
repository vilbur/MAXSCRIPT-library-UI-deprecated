--/* Import sub substructs */
----filein ( (getThisScriptFilename()) + "/../RolloutClass/RolloutClass.ms" );
--
/** Rollout
 */
struct Rollouts_v
(
	rollouts = List(),

	function test =
	(
		messagebox "Rollouts_v.test()"
	),
	
    function new roll_id =
	(
		--messagebox "Rollouts_v.new()"
		_rollout = Rollout_v id:roll_id

        --this.rollouts.setVal roll_id "ROLLOUT"
        --Createdialog Ro  
	),
	/**  
	 *	
	 */
    function get roll_name =
	(
        return this.rollouts.getVal roll_name
	)
	
)

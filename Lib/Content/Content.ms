
/** Content
 */
struct Content_v
(
	content_dir	= getFilenamePath(getSourceFileName()) + "/../../Content",
	Rollouts	= #(),

	/** Auto load rollouts
	 */
	function autoLoadRollouts =
	(
		this._loadRolloutsFromFiles()
		
		this --return
	),
	/** Set controls to
	 */
	function setControlsToUI Floater =
	(
		print ( "-------------Rollouts=" + Rollouts as string )
		
		for r=1 to Rollouts.count do
			Rollouts[r].insertRollout ( Floater.roll (Rollouts[r].name) "" ) r
			
	),
	/** Load rollouts from files
	 */
	function _loadRolloutsFromFiles =
	(
		_rollout_dirs =  getDirectories( content_dir + "/*")

		for dir in _rollout_dirs do
			append Rollouts ( (Rollout_Content_v()).load dir )
			
		--this._insertRolloutsToUi()
	),


	function test =
	(
		messagebox "Content.test()"
	)
)















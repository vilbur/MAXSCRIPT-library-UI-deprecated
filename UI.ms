
--filein ( (getThisScriptFilename()) + "/../RolloutClass/RolloutClass.ms" );

--filein ( (getThisScriptFilename()) + "/../Lib/Rollouts/Rollouts.ms" );

filein ( getFilenamePath(getSourceFileName()) + "/includes.ms" );

/** Ui
 */
struct UI_v
(
	Rollouts = Rollouts_v(),

	function test =
	(
		messagebox "UI.test()"
	),
	/**  
	 */
	function roll name =
	(
		--this["test"] = "test"
		--messagebox name
		--rollouts[name] = "test"
	)
)
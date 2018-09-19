
--filein ( (getThisScriptFilename()) + "/../RolloutClass/RolloutClass.ms" );

--filein ( (getThisScriptFilename()) + "/../Lib/Rollouts/Rollouts.ms" );

filein ( getFilenamePath(getSourceFileName()) + "/includes.ms" )


/** Ui
 */
struct UI_v
(
	Floater	= (Floater_v()).new "Test Floater",
	Content	= Content_v(),
	
	/** Load content
	 */
	function loadContent =
	(
		Content.autoLoadRollouts()
		
		Content.setControlsToUI Floater
			
		Floater.create()

	),
	
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
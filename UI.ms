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
		--format " Content	= % \n" Content	
		Content.load()
		
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

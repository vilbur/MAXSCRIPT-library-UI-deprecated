filein ( getFilenamePath(getSourceFileName()) + "/includes.ms" )


/** Ui
 */
struct UI_v
(
	Dialog	= (Dialog_v()).new "Test Dialog",
	Content	= Content_v(),
	
	/** Load content
	 */
	function loadContent =
	(
		--format " Content	= % \n" Content	
		Content.load()
		
		Content.setControlsToUI Dialog
			
		Dialog.create()
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

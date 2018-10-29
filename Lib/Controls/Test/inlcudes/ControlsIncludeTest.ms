clearListener()

floater_name	= filenameFromPath(getSourceFileName())
filein ( getFilenamePath(getSourceFileName()) + "/../../../Rollouts/Rollout/Test/includes/RolloutIncludeTest.ms" )
print "------------\nInclude	ControlsIncludeTest.ms"

controls_1 = rollout_1.controls groupbox:"Test Groupbox"

/*
	For creating Floater use:
		controls_1.button "Button"
		Floater.create()
*/
		controls_1.button "Button"
		Floater.create()

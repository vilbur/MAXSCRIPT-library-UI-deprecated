

filein ( getFilenamePath(getSourceFileName()) + "/../../../Rollouts/Rollout/Test/includes/RolloutIncludeTest.ms" )
print "------------\nInclude	ControlsIncludeTest.ms"

controls_1 = rollout_1.controls groupbox:"Test Groupbox"

/*
	For creating Dialog use:
		controls_1.button "Button"
		Dialog.create()
*/

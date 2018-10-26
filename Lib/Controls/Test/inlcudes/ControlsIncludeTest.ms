filein ( getFilenamePath(getSourceFileName()) + "/../../../Rollouts/Rollout/Test/includes/RolloutIncludeTest.ms" )
print "------------\nInclude	ControlsIncludeTest.ms"

_controls_1 = _rollout_1.controls groupbox:"Test Groupbox"

/*
	For creating Floater use:
		_controls_1.button "Button"
		Floater.create()
*/

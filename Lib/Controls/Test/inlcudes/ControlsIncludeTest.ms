filein ( getFilenamePath(getSourceFileName()) + "/../../../Rollouts/Rollout/Test/includes/RolloutIncludeTest.ms" )
print "------------\nInclude	ControlsIncludeTest.ms"

_controls_1 = _rollout_1.controls groupbox:"Test Groupbox"

/*
	For crating UI use:
		_controls_1.button "Button"
		UI.create()
*/
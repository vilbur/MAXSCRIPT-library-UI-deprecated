
filein ( getFilenamePath(getSourceFileName()) + "/../Rollout.ms" );
clearListener();


_rollout = (Rollout_v()).new "test_rolllout" "Test Rollout"


_rollout.control #button #test_button "Test button"

_rollout.create()

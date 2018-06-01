
filein ( getFilenamePath(getSourceFileName()) + "/../Rollout.ms" );
clearListener();


_rollout = Rollout_v id:"test_rolllout" title:"Test Rollout"

--_rollout.create()

_rollout.control #button #test_button "Test button"


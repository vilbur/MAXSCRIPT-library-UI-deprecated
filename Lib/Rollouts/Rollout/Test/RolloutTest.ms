--filein ( getFilenamePath(getSourceFileName()) + "/../Rollout.ms" );
filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );
clearListener();

_rollout = (Rollout_v()).new "test_rollout" "Test Rollout"

Button1 = _rollout.control #button #button_1 "Button 1"
Button1.bind  #pressed "MessageBox @Button pressed@" "";

--Button1.text = "XXX"

_rollout.create()

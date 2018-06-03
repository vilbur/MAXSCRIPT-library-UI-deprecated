--filein ( getFilenamePath(getSourceFileName()) + "/../Rollout.ms" );
filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );
clearListener();

/* ROLLOUT DEFINITION */
_rollout = (Rollout_v()).new "test_rollout" "Test Rollout"

/* ADD CONTROLS */
Button1 = _rollout.control #button #button_1 "Button 1"
Button1.bind  #pressed "MessageBox @Button pressed@" "";

--Button1.text = "XXX"
/* CREATE ROLLOUT */
_rollout.create()

/* MODIFY CONTROLS */
--_rollout.roll.button_1.text = "XXX"
--_rollout.roll.button_1.enabled  = false
--_rollout.roll.button_1.width 128
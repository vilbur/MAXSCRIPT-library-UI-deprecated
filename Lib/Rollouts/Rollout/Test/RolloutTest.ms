--filein ( getFilenamePath(getSourceFileName()) + "/../Rollout.ms" );
filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );
clearListener();

/* ROLLOUT DEFINITION */
_rollout = (Rollout_v()).new "test_rollout" "Test Rollout"

/* ADD CONTROLS */


/* MODIFY CONTROLS */
--_rollout.roll.button_1.text = "XXX"
--_rollout.roll.butto n_1.enabled  = false
--_rollout.roll.button_1.width 128

--controls_A = _rollout.controls() -- get new container for controls
controls_A = _rollout.controls groupbox:"groupbox A" -- get new container for controls

/*------ Control to var ------*/
control_A1 = controls_A.control #button "Control A1" #control_A1
control_A1.Events.pressed "MessageBox @Control A1 pressed@" ""
/*------ Control in chain ------*/
--(controls_A.control #button "Control A2" #control_A2).Events.pressed "MessageBox @Control A2 pressed@" ""

--controls_B = _rollout.controls()-- get new groupbox for controls
controls_B = _rollout.controls groupbox:"groupbox B" -- get new groupbox for controls
controls_B.control #button "Control B1" #control_B1
controls_B.control #button "Control B2" #control_B2
controls_B.control #button "Control B3" #control_B3
controls_B.control #button "Control B4" #control_B4
--
----groupbox_1 = _rollout.controls groupbox:"Groupbox 1" -- get new container for controls
----groupbox_1.button "Button Group"

--controls_2 = _rollout.controls() -- get new container for controls
controls_2 = _rollout.controls groupbox:"groupbox C"-- get new container for controls
controls_2.control #button  "Control C1" #control_C1

--_rollout.testProp() 

--controls_1.test() 

/* CREATE ROLLOUT */
_rollout.create() 
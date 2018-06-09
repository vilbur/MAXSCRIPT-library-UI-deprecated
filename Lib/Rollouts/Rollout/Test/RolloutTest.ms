--filein ( getFilenamePath(getSourceFileName()) + "/../Rollout.ms" );
filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );
clearListener();

/* ROLLOUT DEFINITION */
_rollout = (Rollout_v()).new "test_rollout" "Test Rollout"

/* MODIFY CONTROLS */
--_rollout.roll.button_1.text = "XXX"
--_rollout.roll.butto n_1.enabled  = false
--_rollout.roll.button_1.width 128

/* ========= CONTROLS A ========= */

--controls_A = _rollout.controls() -- get new container for controls
controls_A = _rollout.controls groupbox:"groupbox A" -- get new container for controls
--
/*------ Control to var ------*/
control_A1 = controls_A.control #button "Control A1" #control_A1
control_A1.Events.pressed "MessageBox @Control A1 pressed@" ""
/*------ Control in chain ------*/
(controls_A.control #button "Control A2" #control_A2).Events.pressed "MessageBox @Control A2 pressed@" ""

/* ========= CONTROLS B ========= */
--controls_B = _rollout.controls()-- get new groupbox for controls
controls_B = _rollout.controls groupbox:"groupbox B" -- get new groupbox for controls
controls_B.button "Control B1" id:#control_b1	-- id is optionable
(controls_B.button "Disabled B2").params " enabled: false, border: false"
((controls_B.button "Control B3" ).col 2).Events.pressed "MessageBox @Control B3 pressed@" ""
(controls_B.button "Control B4" ).col 6


--controls_1.test() 

/* CREATE ROLLOUT */
_rollout.create() 
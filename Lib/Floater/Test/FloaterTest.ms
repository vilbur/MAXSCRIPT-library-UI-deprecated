filein ( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" );

Floater	= Floater_v();



--_rollout = Floater.roll "test_rollout" "Test Rollout"



--/*------ Rollout ------*/
--rollout_A	= _rollout.controls groupbox:"groupbox A" -- get new container for controls
--controls_A	= controls_A.control #button "Control A1" #control_A1
--rollout_A.Events.pressed "MessageBox @Control A1 pressed@" ""


Floater.create "Test floater"

Floater.dock #right
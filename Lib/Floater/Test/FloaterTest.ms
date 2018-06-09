filein ( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" );
clearListener();

Floater	= Floater_v();



_rollout = Floater.roll "test_rollout" "Test Rollout"



--/*------ Rollout ------*/
_rollout_controls	= _rollout.controls groupbox:"groupbox A" -- get new container for controls
_control	= _rollout_controls.control #button "Control A1" #control_A1
--rollout_A.Events.pressed "MessageBox @Control A1 pressed@" ""


Floater.create "Test floater"

--sleep 2
Floater.dock #right
--sleep 2
--Floater.dock ""


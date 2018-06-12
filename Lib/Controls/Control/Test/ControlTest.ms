filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );
clearListener();

/* ROLLOUT DEFINITION */
_rollout	= (Rollout_v()).new "Test Rollout" id:"optionable_id"
_controls	= _rollout.controls()


/* ADD CONTROLS */

/* button */
_Button	= _controls.control #button "Control A1" #control_A1
_Button.Events.pressed "MessageBox @_Button pressed@"

/* button */
_Checkbox	= _controls.control #checkbox "Checkbox A1" #checkbox_A1
_Checkbox.Events.changed "MessageBox (val as string)"


/* CREATE DIALOG */
_rollout.CreateRollDialog() 

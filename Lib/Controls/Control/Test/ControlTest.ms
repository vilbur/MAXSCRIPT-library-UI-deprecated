filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );
clearListener();

/* ROLLOUT DEFINITION */
_rollout	= (Rollout_v()).new "Test Rollout" id:"optionable_id"
_controls	= _rollout.controls()


/* ADD CONTROLS */

/*------ BUTTON ------*/

_Button_1 = _controls.control #button "Button 1" #control_1	-- add control via control method
_Button_1.Events.pressed "MessageBox @Button pressed@"	-- add event via Events class

_Button_2 = _controls.button "Button 2"	-- add control via direct method
_Button_2.pressed "MessageBox @Button pressed@"	-- add event via mathod in Control


/*------ CHECKBOX ------*/

_Checkbox_1	= _controls.control #checkbox "Checkbox 1" #checkbox_1
_Checkbox_1.Events.changed "MessageBox (val as string)"


_Checkbox_2	= _controls.checkbox "Checkbox 2"
_Checkbox_2.changed "MessageBox (val as string)"


/* CREATE DIALOG */
_rollout.CreateRollDialog() 

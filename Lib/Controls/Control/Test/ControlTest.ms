filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );
clearListener();


/*---------------------------------------
	ROLLOUT DEFINITION
-----------------------------------------*/
_rollout	= (Rollout_v()).new "Test Rollout"
--id:"optionable_id"
_rollout.ini = getFilenamePath(getSourceFileName()) + "ControlTest.ini"

_controls_1	= _rollout.controls()
--_controls_1	= _rollout.controls()


/*---------------------------------------
	ADD CONTROLS
-----------------------------------------*/

/*------ add control via control method ------*/
_Checkbox_A = _controls_1.control #checkbox "Checkbox A" #checkbox_a
_Checkbox_A.Events.changed "MessageBox (val as string)"

_Button_A = _controls_1.control #button "Button A" #button_a
_Button_A.Events.pressed "MessageBox @Button pressed@"


/*------ add control via concrete type of control method ------*/
_Checkbox_B	= _controls_1.checkbox "Checkbox B"
_Checkbox_B.changed "MessageBox (val as string)"

_Button_B	= _controls_1.button "Button B"
_Button_B.pressed "MessageBox (val as string)"


/*------ add control & event in chain ------*/
(_controls_1.checkbox	"Checkbox C").changed "MessageBox (val as string)"
(_controls_1.button	"Button C").pressed "MessageBox (val as string)"


/*------ define controls, disable adding with "add:false" ------
	It allows use data of Checkbox in pressed event of Button, even if Button is added before Checkbox 
*/
_Checkbox_D	= _controls_1.checkbox "Checkbox D"	add:false
_Button_D	= (_controls_1.button "Button D"	add:false).pressed (_Checkbox_D.path+".state  = not "+_Checkbox_D.path+".state")

_controls_1.add _Button_D
_controls_1.add _Checkbox_D


/*---------------------------------------
	 CREATE DIALOG 
-----------------------------------------*/
_rollout.CreateRollDialog() 

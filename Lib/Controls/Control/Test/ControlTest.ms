filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );
clearListener();


/*---------------------------------------
	ROLLOUT DEFINITION
-----------------------------------------*/
_rollout	= (Rollout_v()).new "Test Rollout"
--_rollout.ini	= getFilenamePath(getSourceFileName()) + "ControlTest.ini"

_controls_1	= _rollout.controls()
--_controls_1	= _rollout.controls()


/*---------------------------------------
	ADD CONTROLS
-----------------------------------------*/

/*------ add control via control method ------*/
--_Checkbox_A = _controls_1.control #checkbutton "Checkbox A" id:#checkbox_a
--_Checkbox_A.changed "MessageBox (val as string)"

_Button_A = _controls_1.control #button "Button A" id:#button_a
_Button_A.pressed "MessageBox @Button pressed@"


/*------ add control via exact type of control method ------*/
_Checkbox_B	= _controls_1.checkbox "Checkbox B" checked:true -- set checkbox checked, override ini setting
_Checkbox_B.changed "MessageBox (val as string)"

--_controls_1.checkbox.toggle()

_Button_B	= _controls_1.button "Button B"
_Button_B.pressed "(_Checkbox_B.toggle())"

  
--/*------ add control & event in chain ------*/
--(_controls_1.checkbox	"Checkbox C").changed "(MessageBox (val as string))"
--(_controls_1.button	"Button C").pressed "MessageBox (val as string)"
--
--
--/*------ define controls, disable adding with "add:false" ------
--	It allows use data of Checkbox in pressed event of Button, even if Button is added before Checkbox 
--*/
--_Checkbox_D	= _controls_1.checkbox "Checkbox D"	add:false
--_Button_D	= (_controls_1.button "Toggle checkbox"	add:false).pressed ( "(_Checkbox_D.toggle())" )
--
--_controls_1.add _Button_D
--_controls_1.add _Checkbox_D



/*------------------------------------------------------------------------------

	CONTROL TYPES
	
--------------------------------------------------------------------------------*/


--_Checkbox_D	= _controls_1.edit "Edit_Text" value:"Text placeholder"








/*---------------------------------------
	 CREATE DIALOG 
-----------------------------------------*/
_rollout.CreateRollDialog()
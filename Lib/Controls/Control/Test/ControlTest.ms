filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );
clearListener();


/*---------------------------------------
	ROLLOUT DEFINITION
-----------------------------------------*/
_rollout	= (Rollout_v()).new "Test Rollout"
--_rollout.ini	= getFilenamePath(getSourceFileName()) + "ControlTest.ini"

--_controls_1	= _rollout.controls()
global _controls_1	= _rollout.controls groupbox:"Test Groupbox"


/*---------------------------------------
	ADD CONTROLS
-----------------------------------------*/
 
/*------ add control via control method ------*/
--_Checkbox_A = _controls_1.control #checkbutton "Checkbox A" id:#checkbox_a
--_Checkbox_A.changed "MessageBox (val as string)"
--_Checkbox_A.param #width 164
--_Checkbox_A.param #height 48
--_Checkbox_A.col 6

--_Button_A = _controls_1.control #button "Button A" id:#button_a
--_Button_A.pressed "MessageBox @Button pressed@"

--_Button_A.col 8

--/*------ add control via exact type of control method ------*/
--_Checkbox_B	= _controls_1.checkbox "Checkbox B" checked:true -- set checkbox checked, override ini setting
--_Checkbox_B.changed "MessageBox (val as string)"


----_controls_1.checkbox.toggle()
--
--_Button_B	= _controls_1.button "Button B"
--_Button_B.pressed "(_Checkbox_B.toggle())"

  
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


--btn_prop	= (_controls_1.button "Param").param #width 64
--btn_params	= (_controls_1.button "Params").params "width:64"

/** Set control properties
 */
function cretateControlWithPropertiesTest =
(
	global btn_prop	= _controls_1.button "Props test"
	
	--btn_prop.col 6
	btn_prop.prop.add #width 144
	btn_prop.prop.add #height 48
	btn_prop.prop.add #border false
)
/** Add parameter to existing controls
 */
function addParameterToExistingControlsTest =
(
	btn_prop.prop.add #enabled false
)
/** Cretate control with parameters
 */
function cretateControlWithParameters =
(
	btn_param	= _controls_1.button "Param test"
	
	btn_param.params "width:144, height:48"
)

/*------------------------------------------------------------------------------

	CONTROL TYPES
	
--------------------------------------------------------------------------------*/


--_Checkbox_D	= _controls_1.edit "" value:"Text Placeholder"
--_Checkbox_D.param #width 256
----_Checkbox_D.col 6
--
--_Checkbox_D	= _controls_1.path button:"Edit_Text"
--
----_control_path	= _controls_1.edit "Edit_Text" 


/*---------------------------------------
	RUN TESTS
-----------------------------------------*/

cretateControlWithPropertiesTest()
cretateControlWithParameters()

/* CREATE DIALOG  */
_rollout.CreateRollDialog()

addParameterToExistingControlsTest()

--format "rollout_test_rollout.paramtest.text = % \n" rollout_test_rollout.paramtest.text





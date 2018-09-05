filein ( getFilenamePath(getSourceFileName()) + "/../../../../../includes.ms" )
clearListener();


/*---------------------------------------
	ROLLOUT DEFINITION
-----------------------------------------*/
_rollout	= (Rollout_v()).new "Events Test"
--_rollout.ini	= getFilenamePath(getSourceFileName()) + "ControlTest.ini"

--_controls_1	= _rollout.controls()
global _controls_1	= _rollout.controls groupbox:"Test Groupbox"


/*---------------------------------------
	ADD CONTROLS
-----------------------------------------*/

/** Set control properties
 */
function cretateControlWithPropertiesTest =
(
	global btn_prop	= _controls_1.button "Props test"
	
	--btn_prop.col 6
	btn_prop.pressed "messagebox \"Test\""
	
)
--/** Add parameter to existing controls
-- */
--function addParameterToExistingControlsTest =
--(
--	btn_prop.prop.add #enabled false
--)
--/** Cretate control with parameters
-- */
--function cretateControlWithParameters =
--(
--	btn_param	= _controls_1.button "Param test"
--	
--	btn_param.params "width:144, height:48"
--)

/*------------------------------------------------------------------------------

	CONTROL TYPES
	
--------------------------------------------------------------------------------*/

/** Edit control test
 */
function editControlTest =
(
	_edit	= _controls_1.edit ""
	_edit_2	= _controls_1.edit "Caption" value:"Text Placeholder"
	--_edit.param #width 256
	_edit.col 12
	
	_edit_2.valueAsTooltip true
	
	--_edit_2.changed "messagebox \"Test\""
	
	--_edit	= _controls_1.path button:"Edit_Text"
	--
	----_control_path	= _controls_1.edit "Edit_Text" 

)



/*---------------------------------------
	RUN TESTS
-----------------------------------------*/

cretateControlWithPropertiesTest()
--cretateControlWithParameters()
--editControlTest()



/* CREATE DIALOG  */
_rollout.CreateRollDialog()

--addParameterToExistingControlsTest()






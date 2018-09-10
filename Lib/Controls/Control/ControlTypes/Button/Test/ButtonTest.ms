
floater_name = (getFilenameFile(getSourceFileName()))
filein ( getFilenamePath(getSourceFileName()) + "/../../../../Test/inlcudes/ControlsIncludeTest.ms" )

UI.create()

--/*---------------------------------------
--	ROLLOUT DEFINITION
-------------------------------------------*/
--_rollout	= (Rollout_v()).new "Test Rollout"
--_rollout.ini	= getFilenamePath(getSourceFileName()) + "ControlTest.ini"
--
----_controls_1	= _rollout.controls()
--global _controls_1	= _rollout.controls groupbox:"Test Groupbox"
--
-- 
/*---------------------------------------
	ADD CONTROLS
-----------------------------------------*/

/** Set control properties
 */
function cretateControlWithPropertiesTest =
(
	global btn_prop	= _controls_1.button "Props test"
	--id:"Test_control"
	
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

/** Checkbox test
 */
function checkboxTest =
(
	_checkbox 	= _controls_1.checkbox "Checkbox test"
)
/** Edit control test
 */
function editControlTest =
(
	--_edit_1	= _controls_1.edit "" value:"Auto ids"

	--_edit.param #width 256
	
	--_edit_2.valueAsTooltip true
	
	--_edit_2.changed "messagebox \"Test\""
	
	--_edit	= _controls_1.path button:"Edit_Text"
	--
	----_control_path	= _controls_1.edit "Edit_Text" 

)



/*---------------------------------------
	RUN TESTS
-----------------------------------------*/

--cretateControlWithPropertiesTest()
--cretateControlWithParameters()
--checkboxTest()
--editControlTest()



/* CREATE DIALOG  */
--_rollout.CreateRollDialog()

--addParameterToExistingControlsTest()






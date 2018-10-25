clearListener();

floater_name = "ControlsTest"
filein ( getFilenamePath(getSourceFileName()) + "/inlcudes/ControlsIncludeTest.ms" )


/*------------------------------------------------------------------------------

	ADD CONTROL TYPES
	
--------------------------------------------------------------------------------*/

/** Set control properties
 */
function buttonTest =
(
	btn_prop_a	= _controls_1.button "Props test A"
	btn_prop_b	= _controls_1.button "Props test B"
)
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
	_edit_1	= _controls_1.edit "Edit control" value:"Auto ids"
	_edit_1	= _controls_1.edit "" value:"Auto ids"

	--_edit.param #width 256
	
	--_edit_2.valueAsTooltip true
	
	--_edit_2.changed "messagebox \"Test\""
	
	--_edit	= _controls_1.path button:"Edit_Text"
	
	----_control_path	= _controls_1.edit "Edit_Text" 
)



/*---------------------------------------
	RUN TESTS
-----------------------------------------*/

buttonTest()
--checkboxTest()
--editControlTest()

/* CREATE DIALOG  */
Floater.create()

--rollout_controlstest.rollout_test_rollout.height = 256

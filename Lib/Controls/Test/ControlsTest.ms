clearListener();

filein( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" )

Dialog	= Dialog_v title:(filenameFromPath(getSourceFileName()))


subroll_A	= Dialog.roll "Subrollout A" id:"subrollout_a"
--subroll_B	= Dialog.roll "Subrollout B"

controls_A1 = rollout_1.controls groupbox:"Test Groupbox"

/*------------------------------------------------------------------------------

	ADD CONTROL TYPES
	
--------------------------------------------------------------------------------*/

/** Set control properties
 */
function buttonTest =
(
	--format " controls_A1	= % \n" controls_A1
	--btn_prop_a	= controls_A1.button "Props test A"
	--btn_prop_b	= controls_A1.button "Props test B"
)
/** Checkbox test
 */
function checkboxTest =
(
	_checkbox 	= controls_A1.checkbox "Checkbox test"
)
/** Edit control test
 */
function editControlTest =
(
	_edit_1	= controls_A1.edit "Edit control" value:"Auto ids"
	_edit_1	= controls_A1.edit "" value:"Auto ids"

	--_edit.param #width 256
	
	--_edit_2.valueAsTooltip true
	
	--_edit_2.changed "messagebox \"Test\""
	
	--_edit	= controls_A1.path button:"Edit_Text"
	
	----_control_path	= controls_A1.edit "Edit_Text" 
)



/*---------------------------------------
	RUN TESTS
-----------------------------------------*/

buttonTest()
--checkboxTest()
--editControlTest()

/* CREATE DIALOG  */
Dialog.create()
--Dialog.create height:256

--rollout_controlstest.rollout_test_rollout.height = 256

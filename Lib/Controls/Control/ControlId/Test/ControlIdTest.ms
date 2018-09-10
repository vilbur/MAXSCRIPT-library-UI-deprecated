filein ( getFilenamePath(getSourceFileName()) + "/../../../../../includes.ms" )
clearListener();


/*---------------------------------------
	ROLLOUT DEFINITION
-----------------------------------------*/
_rollout	= (Rollout_v()).new "Control Id Test"
--_rollout.ini	= getFilenamePath(getSourceFileName()) + "ControlTest.ini"

global _controls_1	= _rollout.controls groupbox:"Test Groupbox"

/*---------------------------------------
	TESTS
-----------------------------------------*/

/** Edit control test
 */
function editControlTest =
(
	_edit_1	= _controls_1.edit "" value:"Auto ids"
	_edit_2	= _controls_1.edit "" value:"Auto ids"
	--_edit_2.col 8
	
	--_button_1	= _controls_1.button	"Caption id"
	--_button_1	= _controls_1.button	"Caption id"
	--_checkbox_1	= _controls_1.checkbox	"Caption id"

	
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

editControlTest()

/* CREATE DIALOG  */
_rollout.CreateRollDialog()







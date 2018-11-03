filein ( getFilenamePath(getSourceFileName()) + "/../../../../../includes.ms" )


/*---------------------------------------
	ROLLOUT DEFINITION
-----------------------------------------*/
_rollout	= (Rollout_v()).new "Events Test"
_rollout.ini	= getFilenamePath(getSourceFileName()) + "ControlTest.ini"



/*---------------------------------------
	ADD CONTROLS
-----------------------------------------*/

/** Set control properties
 */
function cretateControlWithPropertiesTest =
(
	_controls_1	= _rollout.controls groupbox:"Test Groupbox"
	_btn_prop	= _controls_1.button "Props test"
	_checkbox 	= _controls_1.checkbox "Checkbox test"
	
	--_btn_prop.col 6
	_btn_prop.pressed	"messagebox \"Pressed\""	tooltip:"Pressed tooltip"
	_btn_prop.rightclick 	"messagebox \"Rightclick\""	tooltip:"Rightclick tooltip"
)

/** Set control properties
 */
function remoteCheckbox =
(
	_controls_2	= _rollout.controls groupbox:"Toggle Test"

	_btn_toggle	= _controls_2.button "Toggle checkbox" 
	global _checkbox_toggle 	= _controls_2.checkbox "Toggle Test" -- declare controls variable as global, so it can be revoked in callback of button

	_btn_toggle.pressed	"(_checkbox_toggle.toggle())"	tooltip:"Pressed tooltip"

)



/*---------------------------------------
	RUN TESTS
-----------------------------------------*/

cretateControlWithPropertiesTest()
remoteCheckbox()


/* CREATE DIALOG  */
_rollout.CreateRollDialog()




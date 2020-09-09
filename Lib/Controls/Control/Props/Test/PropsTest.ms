clearListener()

filein( getFilenamePath(getSourceFileName()) + "/../../../../Rollouts/Rollout/Rollout.ms" )

--dialog_name = (getFilenameFile(getSourceFileName()))
--filein ( getFilenamePath(getSourceFileName()) + "/../../../Test/inlcudes/ControlsIncludeTest.ms" )


_Rollout	= Rollout_v title:(filenameFromPath(getSourceFileName()))

controls_1 = _Rollout.Controls.new "Groupbox 1"
--controls_1.button "Button before before subrollout 1"




global btn_prop	= controls_1.button "Props test"


--btn_prop.Props.add #width 144
--btn_prop.Props.add #border false





_Rollout.dialogCreate()	-- create with default params

btn_prop.Props.add #height 64


/*---------------------------------------
	ADD CONTROLS
-----------------------------------------*/

/** Set control properties
 */
function cretateControlWithPropertiesTest =
(
	global btn_prop	= controls_1.button "Props test"
	
	btn_prop.Props.add #width 144
	btn_prop.Props.add #height 48
	btn_prop.Props.add #border false
)

/** Create control with parameters
 */
function cretateControlWithParameters =
(
	btn_param	= controls_1.button "Param test"
	 
	btn_param.params "width:144, height:48"
)
/** Add parameter to existing controls
 */
function addParameterToExistingControlsTest =
(
	btn_prop.Props.add #enabled false
)

/*---------------------------------------
	RUN TESTS
-----------------------------------------*/

--cretateControlWithPropertiesTest()
--cretateControlWithParameters()
--
--UI.create()
--
--addParameterToExistingControlsTest()
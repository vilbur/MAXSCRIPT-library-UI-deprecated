floater_name = (getFilenameFile(getSourceFileName()))
filein ( getFilenamePath(getSourceFileName()) + "/../../../Test/inlcudes/ControlsIncludeTest.ms" )

clearListener()

/*---------------------------------------
	ADD CONTROLS
-----------------------------------------*/

/** Set control properties
 */
function cretateControlWithPropertiesTest =
(
	global btn_prop	= _controls_1.button "Props test"
	--format " btn_prop	= % \n" btn_prop
	--format " btn_prop.test_prop	= % \n" (btn_prop.test_prop)
	--format " btn_prop.Props	= % \n" btn_prop.Props
	
	--btn_prop.col 6
	btn_prop.Props.add #width 144
	btn_prop.Props.add #height 48
	btn_prop.Props.add #border false
	
	--btn_prop.testMethod()
)

/** Create control with parameters
 */
function cretateControlWithParameters =
(
	btn_param	= _controls_1.button "Param test"
	
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

cretateControlWithPropertiesTest()
cretateControlWithParameters()

UI.create()

addParameterToExistingControlsTest()
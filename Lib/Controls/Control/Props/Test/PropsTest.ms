dialog_name = (getFilenameFile(getSourceFileName()))
filein ( getFilenamePath(getSourceFileName()) + "/../../../Test/inlcudes/ControlsIncludeTest.ms" )



/*---------------------------------------
	ADD CONTROLS
-----------------------------------------*/

/** Set control properties
 */
function cretateControlWithPropertiesTest =
(
	global btn_prop	= _controls_1.button "Props test"
	
	btn_prop.Props.add #width 144
	btn_prop.Props.add #height 48
	btn_prop.Props.add #border false
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
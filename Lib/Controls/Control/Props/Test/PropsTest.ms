floater_name = (getFilenameFile(getSourceFileName()))
filein ( getFilenamePath(getSourceFileName()) + "/../../../Test/inlcudes/ControlsIncludeTest.ms" )


/*---------------------------------------
	ADD CONTROLS
-----------------------------------------*/

/** Set control properties
 */
function cretateControlWithPropertiesTest =
(
	global btn_prop	= _controls_1.button "Prop test"
	format " btn_prop	= % \n" btn_prop
	--format " btn_prop.test_prop	= % \n" btn_prop.test_prop
	--format " btn_prop.Prop	= % \n" btn_prop.Prop
	
	--btn_prop.col 6
	btn_prop.Prop.add #width 144
	btn_prop.Prop.add #height 48
	btn_prop.Prop.add #border false
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
	clearListener()
	--format " btn_prop	= % \n" btn_prop
	btn_prop.Prop.add #enabled false
)

/*---------------------------------------
	RUN TESTS
-----------------------------------------*/

cretateControlWithPropertiesTest()
--cretateControlWithParameters()

UI.create()

--addParameterToExistingControlsTest()
filein ( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" );

clearListener();

/*------ CREATE FLOATER DIALOG ------*/
/*------ GET FLOATER CLASS ------*/
Floater	= (Floater_v()).new "Test Floater"


/** Add extra rollout
 */
function addRolloutByCodeTest name =
(
	--_rollout = test_floater.roll name ""
	_rollout = __TEST_GLOBAL.floater.roll name ""
	_controls	= _rollout.controls groupbox:"groupbox A" -- get new container for controls
	_controls.button (name + " button")
) 

/** Load ntent test
 */
function loadContentTest =
(
	Content = Content_v dir:(getFilenamePath(getSourceFileName())+"/Content-hierarchy-test")
	
	/* LAOD CONTENT FROM Content\ dir */
	Content.autoLoadRollouts()
	Content.setControlsToUI Floater
	
)



addRolloutByCodeTest "Rollout by code 1"
loadContentTest()
addRolloutByCodeTest "Rollout by code 2"

Floater.create()


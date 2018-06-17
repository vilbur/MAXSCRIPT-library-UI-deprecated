filein ( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" );
clearListener();

/** DEFINE FLOATER  */
Floater	= (Floater_v()).new "Test Floater"

/** Load content from hierarchy
 */
function loadContentTest =
(
	Content = Content_v dir:(getFilenamePath(getSourceFileName())+"/Content-hierarchy-test")
	
	Content.loadTree()
	Content.setControlsToUI Floater
)

/** Add extra rollout
 */
function addRolloutByCodeTest name =
(
	_rollout = __GLOBAL__v.floater.roll name ""
	--_rollout = test_floater.floater.roll name ""
	_controls	= _rollout.controls groupbox:"Groupbox A" -- get new container for controls
	_controls.button ("button by code")
)

/*---------------------------------------
	RUN TEST
-----------------------------------------*/
addRolloutByCodeTest "Rollout by code 1"
loadContentTest()
addRolloutByCodeTest "Rollout by code 2"

Floater.create()
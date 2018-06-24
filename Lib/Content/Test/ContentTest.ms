filein ( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" );
clearListener();


/** DEFINE FLOATER  */
Floater	= (Floater_v()).new "Layout Test"

/** Load content from hierarchy
 */
function loadContentTest =
(
	Content = Content_v dir:(getFilenamePath(getSourceFileName())+"/Rollouts-in-dirs") rollouts:"rollout*"

	Content = Content_v dir:(getFilenamePath(getSourceFileName())+"/Rollouts-in-nested-subdirs/*") rollouts:"*"

	
	Content.loadTree()
	Content.setControlsToUI Floater
)

/** Add extra rollout
 */
function addRolloutByCodeTest name =
(
	--_rollout = __GLOBAL__v.test_floater name ""
	_rollout = __GLOBAL__v.Floater.roll name ""
	_controls	= _rollout.controls groupbox:"Groupbox A" -- get new container for controls
	_controlsB	= _rollout.controls groupbox:"Groupbox B" -- get new container for controls
	_controls.button ("button by code")
	_controlsB.button ("button by code B")
)

/*---------------------------------------
	RUN TEST
-----------------------------------------*/
--addRolloutByCodeTest "Rollout by code 1"
loadContentTest()
--addRolloutByCodeTest "Rollout by code 2"

Floater.create()
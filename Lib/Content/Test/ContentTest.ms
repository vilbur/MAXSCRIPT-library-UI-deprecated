filein ( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" );
clearListener();


/** DEFINE FLOATER  */
Floater	= (Floater_v()).new "Layout Test"

/** Load content from file tree
 */
function loadContentTest =
(
	Content	= Content_v dir:(getFilenamePath(getSourceFileName())+"/Rollouts-in-dirs") match:"rollout-(.*)"
	Content_nested	= Content_v dir:(getFilenamePath(getSourceFileName())+"/Rollouts-in-nested-subdirs/*") match:"rollout-(test-.*)"

	Content.loadTree()
	Content_nested.loadTree()
	
	Content.setControlsToUI Floater
	Content_nested.setControlsToUI Floater
)

/** Add extra rollout
 */
function addRolloutByCodeTest name =
(
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
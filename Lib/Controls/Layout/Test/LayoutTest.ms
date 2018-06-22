filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" )

/** DEFINE FLOATER  */
Floater	= (Floater_v()).new "Test Floater"

/** Load content from hierarchy
 */
function loadContentTest =
(
	Content = Content_v dir:(getFilenamePath(getSourceFileName())+"/Content-hierarchy-test") subdirs:"rollout*"
	--Content = Content_v dir:( getFilenamePath(getSourceFileName()) + "/../../../../../../vilbur" ) subdirs:"_*"

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
	
	for i = 1 to 9 do
		_controls.button ("button by code A "+i as string )

	for i = 1 to 2 do
		_controlsB.button ("button by code B "+i as string )
		
	
	--_controlsB.button ("button by code B")
)

/*---------------------------------------
	RUN TEST
-----------------------------------------*/
addRolloutByCodeTest "Rollout by code 1"
loadContentTest()
--loadContentTest()
addRolloutByCodeTest "Rollout by code 2"

Floater.create()
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
	_controlsB	= _rollout.controls groupbox:"Columns test" -- get new container for controls
	
	for i = 1 to 9 do
		_controls.button ("Button A "+i as string )

	for i = 1 to 12 do
	(
		_button = _controlsB.button ("Col "+i as string )
		_button.col i
	)
		
	--_controlsB.button ("button by code B")
)

/*---------------------------------------
	RUN TEST
-----------------------------------------*/
addRolloutByCodeTest "Rollout by code"
--loadContentTest()

Floater.create()
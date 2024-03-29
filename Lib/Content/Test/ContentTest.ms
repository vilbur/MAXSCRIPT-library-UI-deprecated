
filein ( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" )




/** DEFINE FLOATER  */
Dialog	=  Dialog_v title:"Layout Test"

/** Load content from file tree
 */
function loadContentTest =
(
	current_dir	= getFilenamePath(getSourceFileName())
	----Content	= (Content_v dir:(current_dir+"/Rollout-tooltip-test")	match:"rollout-(.*)$"	).load()
	Content	= (Content_v dir:(current_dir+"/Rollouts-in-dirs")	match:"rollout-(.*)$"	).load()
	--Content_nested	= (Content_v dir:(current_dir+"/Rollouts-in-nested-subdirs/*")	match:"rollout-(test-.*)"	).load()
	
	Content.setControlsToUI Dialog
	--Content_nested.setControlsToUI Dialog
)

/** Add extra rollout
 */
function addRolloutByCodeTest name =
(
	_rollout = __GLOBAL__v.Dialog.roll name ""
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

Dialog.create()

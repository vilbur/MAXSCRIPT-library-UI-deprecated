clearListener()

filein( getFilenamePath(getSourceFileName()) + "/../../Rollout.ms" )

/** CREATE ROLLOUTS 
 *	
 */
--Rollout_main = Rollout_v title:(getFilenameFile(getSourceFileName())) -- test default id by title
Rollout_main = Rollout_v title:(getFilenameFile(getSourceFileName()))
Rollout_A    = Rollout_main.subrollout "Subrollout A"
Rollout_B    = Rollout_main.subrollout "Subrollout B"


/** CONTROLS 
 *	
 */
--controls_A1 = Rollout_A.Controls.box()
--controls_B1 = Rollout_B.Controls.box()
--Button_A1	= controls_A1.button "Test 1" 
--Button_B1	= controls_B1.button "Test 1"


/** Add callback as GLOBAL
 */
function callbackGlobalFunction state =
(
	messageBox ( "callbackGlobalFunction() state = " + ( state as string ) )
)
Rollout_A.RolloutCreator.addText( "on rollout_subrollout_a rolledUp state do callbackGlobalFunction state " )


/** Add callback as OBJECT METHOD
 */
Rollout_B.RolloutCreator.addText( "function callBackInObject state = ( messageBox (@callbackGlobalFunction() state = @ + ( state as string )) )" )
Rollout_B.RolloutCreator.addText( "on rollout_subrollout_b rolledUp state do rollout_subrollout_b.callBackInObject state" )



/* CREATE ROLLOUT */
Rollout_main.dialogCreate()
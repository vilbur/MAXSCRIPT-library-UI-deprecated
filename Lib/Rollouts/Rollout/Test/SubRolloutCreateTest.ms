filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );
clearListener()


/* ROLLOUT DEFINITION */
_rollout	= Rollout_v title:"Test Subrollouts" 

subroll_A	= _rollout.subrollout "Subrollout A" id:"subrollout_a"
subroll_B	= _rollout.subrollout "Subrollout B"

/* CREATE ROLLOUT */
_rollout.dialogCreate() 
--_rollout.dialogCreate height:256

--format "Subrollouts: 	= % \n" rollout_test_subrollouts.controls 

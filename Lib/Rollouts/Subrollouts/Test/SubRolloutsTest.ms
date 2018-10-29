clearListener()
filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );


/* ROLLOUT DEFINITION */
rollout_1	= Rollout_v title:"Test Subrollouts" 

subroll_A	= rollout_1.subrollout "Subrollout A" id:"subrollout_a"
subroll_B	= rollout_1.subrollout "Subrollout B"

/* CREATE ROLLOUT */
rollout_1.dialogCreate() 
--rollout_1.dialogCreate height:256

--format "Subrollouts: 	= % \n" rollout_test_subrollouts.controls A

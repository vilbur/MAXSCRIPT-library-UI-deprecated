filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );
clearListener()


/* ROLLOUT DEFINITION */
_rollout	= Rollout_v title:"Test Subrollouts" 

subroll_A	= _rollout.subrollout "Subrollout A" id:"subrollout_a"
subroll_B	= _rollout.subrollout "Subrollout B"

/* CREATE ROLLOUT */
--_rollout.create() 
_rollout.create height:512

format "Subrollouts: 	= % \n" rollout_test_subrollouts.controls 

--rollout_test_subrollouts.subRollout_subrollout_a.height = 128
--rollout_test_subrollouts.subrollout_a.height = 256
--rollout_test_subrollouts.subRollout_subrollout_b.pos += [0,256]


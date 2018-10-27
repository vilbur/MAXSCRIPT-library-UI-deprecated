filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );
clearListener()


/* ROLLOUT DEFINITION */
_rollout	= Rollout_v title:"Test Subrollouts" 

subroll_A	= _rollout.subrollout "Subrollout A" id:"subrollout_a"
subroll_B	= _rollout.subrollout "Subrollout B"

/* CREATE ROLLOUT */
_rollout.dialogCreate() 
--_rollout.dialogCreate height:512
format "Subrollouts: 	= % \n" rollout_test_subrollouts.controls 

--_rollout.property	#height 512
_rollout.properties.height 256

subroll_A.properties.height 128

subroll_B.properties.height 128
--subroll_B.property	#height 128
subroll_B.properties.pos [0,128] relative:true

/* TRY SET PROPERTIES TO ROLLOUT MANNUALLY */
--rollout_test_subrollouts.subrollout_a.height	 = 128
--rollout_test_subrollouts.rollout_subrollout_b.height	 = 128
--rollout_test_subrollouts.rollout_subrollout_b.pos	+= [0,256]

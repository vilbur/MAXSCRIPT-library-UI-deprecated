filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );
clearListener()


/* ROLLOUT DEFINITION */
_rollout	= Rollout_v title:"Test Subrollouts" 

_subroll_A	= _rollout.subrollout "Subrollout A" id:"subrollout_a"
_subroll_B	= _rollout.subrollout "Subrollout B"

/* CREATE ROLLOUT */
_rollout.dialogCreate() 
--_rollout.dialogCreate height:512


/* SET PROPERTIES INDIVIDUALY */
_subroll_A.property.height 128
_rollout.property.height 256


/* SET PROPERTIES MULTIPLE AT ONCE */
_subroll_B.property.all height:128 pos:[0,128] relative:true

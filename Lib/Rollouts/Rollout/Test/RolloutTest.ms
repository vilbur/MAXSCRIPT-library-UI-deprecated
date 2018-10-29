filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );

clearListener()

/* ROLLOUT DEFINITION */
_rollout	= Rollout_v title:"Test Rollout" id:"optionable_id"

/* CREATE ROLLOUT */
_rollout.dialogCreate()	-- create with default params
--_rollout.dialogCreate height:320 width:520 pos:[0,0]

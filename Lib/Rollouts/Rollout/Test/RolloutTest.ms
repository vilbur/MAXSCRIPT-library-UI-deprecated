filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );

clearListener()

/* ROLLOUT DEFINITION */
_rollout	= Rollout_v title:"Test Rollout" id:"optionable_id"

/* CREATE ROLLOUT */
_rollout.create()	-- create with default params
--_rollout.create height:320 width:520

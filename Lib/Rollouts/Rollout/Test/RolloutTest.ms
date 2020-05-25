clearListener()

filein( getFilenamePath(getSourceFileName()) + "/../Rollout.ms" )


/* ROLLOUT DEFINITION */
_rollout	= Rollout_v title:(getFilenameFile(getSourceFileName())) id:"optionable_id"

/* CREATE ROLLOUT */
--_rollout.dialogCreate()	-- create with default params
_rollout.dialogCreate height:320 width:520 pos:[0,0]

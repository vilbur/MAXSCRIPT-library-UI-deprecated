filein( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" )

/* ROLLOUT DEFINITION */
_Rollout	= Rollout_v title:(filenameFromPath(getSourceFileName()))

Groupbox_1 = _Rollout.Controls.box groupbox:"Groupbox 1"

Groupbox_1.button "Test 1"

/* CREATE ROLLOUT */
_Rollout.dialogCreate()	-- create with default params
--_rollout.dialogCreate height:320 width:520 pos:[0,0]


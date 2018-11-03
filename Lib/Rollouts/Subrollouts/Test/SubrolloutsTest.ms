filein( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" )


_rollout	= Rollout_v title:(getFilenameFile(getSourceFileName())) id:"optionable_id"
Rollout_A	= _rollout.subrollout "Subrollout A"
--Rollout_B	= _rollout.subrollout "Subrollout B"

--controls_A1 = Rollout_A.Controls.box()
--controls_B1 = Rollout_B.Controls.box()
--Button_A1	= controls_A1.button "Test 1"
--Button_B1	= controls_B1.button "Test 1"


/* CREATE ROLLOUT */
_rollout.dialogCreate()	-- create with default params
--_rollout.dialogCreate height:320 width:520 pos:[0,0]

clearListener()

-- format "---------------\nSTART OF TEST"
format "---------------\nSTART OF TEST"

filein( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" )
-- include @"C:\GoogleDrive\Programs\CG\3DsMax\scripts\Library\_UI\includes.ms"

-- fileInTest()

Rollout_main	= Rollout_v title:(getFilenameFile(getSourceFileName())) id:"optionable_id"
Rollout_A	= Rollout_main.subrollout "Subrollout A"
-- Rollout_B	= Rollout_main.subrollout "Subrollout B"

--controls_A1 = Rollout_A.Controls.box()
--controls_B1 = Rollout_B.Controls.box()
--Button_A1	= controls_A1.button "Test 1" 
--Button_B1	= controls_B1.button "Test 1"


/* CREATE ROLLOUT */
-- Rollout_main.dialogCreate()	-- create with default params
Rollout_main.dialogCreate height:320 width:520 pos:[0,0]

-- format "\nEND OF TEST"
format "\n"
print "END OF TEST"

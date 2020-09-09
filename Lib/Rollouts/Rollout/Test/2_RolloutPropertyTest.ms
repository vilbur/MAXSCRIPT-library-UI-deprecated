clearListener()

filein( getFilenamePath(getSourceFileName()) + "/../Rollout.ms" )


/** CREATE ROLLOUTS 
 *	
 */
Rollout_main = Rollout_v title:(getFilenameFile(getSourceFileName())) -- test default id by title
Rollout_A    = Rollout_main.subrollout "Subrollout A"
Rollout_B    = Rollout_main.subrollout "Subrollout B"


/* CREATE ROLLOUT */
Rollout_main.dialogCreate()	-- create with default params


Rollout_A.Property._setProperty "title" "Renamed subrollout"
Rollout_A.Property._setProperty "open" false

Rollout_B.Property._setProperty "height" 128
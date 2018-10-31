clearListener()
filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );


/* ROLLOUT DEFINITION */
rollout_1	= Rollout_v title:(getFilenameFile(getSourceFileName())) 

/* SUBROLLOUT DEFINITION */
subroll_A	= rollout_1.subrollout "Subrollout A" id:"subrollout_a"
subroll_B	= rollout_1.subrollout "Subrollout B"

/* CREATE DIALOG */
rollout_1.dialogCreate() 
--rollout_1.dialogCreate height:256






/* TRY SET PROPS FOR BETTER VIEW RESULT */
try
(
	rollout_subrolloutstest.height	= 128
	rollout_subrolloutstest.subrollouts.height	= 128
)
catch
(
	format "\n************ EXCEPTION ************\n%\n***********************************\n" (getCurrentException())
)
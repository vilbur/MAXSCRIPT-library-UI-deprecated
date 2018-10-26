clearListener()
filein ( getFilenamePath(getSourceFileName()) + "/includes/FloaterIncludeTest.ms" )


subroll_A	= Floater.roll "Subrollout A" id:"subrollout_a"
subroll_B	= Floater.roll "Subrollout B"

/*------ CREATE FLOATER DIALOG ------*/
Floater.create()
--Floater.create height:512 width:320 pos:[0,0]

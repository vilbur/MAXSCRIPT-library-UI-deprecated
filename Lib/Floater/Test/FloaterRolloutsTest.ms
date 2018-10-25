clearListener()
filein ( getFilenamePath(getSourceFileName()) + "/includes/FloaterIncludeTest.ms" )


subroll_A	= Floater.roll "Subrollout A" id:"subrollout_a"
subroll_B	= Floater.roll "Subrollout B"

/*------ CREATE FLOATER DIALOG ------*/
--Floater.create()
Floater.create height:512 width:320


/*------ POSITION METHODS FOR FLOATER ------*/

--Floater.dock #right

--Floater.dock ""

--Floater.position 512 512

--Floater.size 512 512


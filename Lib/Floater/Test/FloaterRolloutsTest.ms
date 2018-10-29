clearListener()

floater_name	= filenameFromPath(getSourceFileName())
filein ( getFilenamePath(getSourceFileName()) + "/includes/FloaterIncludeTest.ms" )


subroll_A	= Floater.roll "Subrollout A" id:"subrollout_a"
subroll_B	= Floater.roll "Subrollout B"

/*------ CREATE FLOATER DIALOG ------*/
Floater.create()
--Floater.create height:512 width:320 pos:[0,0]

/* SET PROPERTIES INDIVIDUALY */
--Floater.RolloutMain.property.height 256
Floater.property.height 256
subroll_A.property.height 128


/* SET PROPERTIES MULTIPLE AT ONCE */
subroll_B.property.all height:128 pos:[0,128] relative:true

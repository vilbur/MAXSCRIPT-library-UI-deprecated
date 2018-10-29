clearListener()

filein( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" )

Dialog	= Dialog_v title:(filenameFromPath(getSourceFileName()))


subroll_A	= Dialog.roll "Subrollout A" id:"subrollout_a"
subroll_B	= Dialog.roll "Subrollout B"

/*------ CREATE FLOATER DIALOG ------*/
Dialog.create()
--Dialog.create height:512 width:320 pos:[0,0]

/* SET PROPERTIES INDIVIDUALY */
--Dialog.RolloutMain.property.height 256
Dialog.property.height 256
subroll_A.property.height 128


/* SET PROPERTIES MULTIPLE AT ONCE */
subroll_B.property.all height:128 pos:[0,128] relative:true

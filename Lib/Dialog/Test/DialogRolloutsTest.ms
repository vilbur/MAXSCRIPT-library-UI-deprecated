clearListener()

filein( getFilenamePath(getSourceFileName()) + "/../Dialog.ms" )

Dialog	= Dialog_v title:(getFilenameFile(getSourceFileName()))


rollout_A	= Dialog.roll "Subrollout A" id:"rolloutout_a"
rollout_B	= Dialog.roll "Subrollout B"

/*------ CREATE FLOATER DIALOG ------*/
Dialog.create()
--Dialog.create height:512 width:320 pos:[0,0]

/* SET PROPERTIES INDIVIDUALY */
--Dialog.RolloutMain.property.height 256
--Dialog.property.height 256
--rollout_A.property.height 128


/* SET PROPERTIES MULTIPLE AT ONCE */
--rollout_B.property.all height:128 pos:[0,128] relative:true

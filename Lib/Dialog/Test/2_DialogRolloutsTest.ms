clearListener()

filein( getFilenamePath(getSourceFileName()) + "/../Dialog.ms" )

Dialog	= Dialog_v title:(getFilenameFile(getSourceFileName()))


rollout_A	= Dialog.roll "Subrollout A" id:"rolloutout_a"
rollout_B	= Dialog.roll "Subrollout B"

/*------ CREATE FLOATER DIALOG ------*/
Dialog.create()
--Dialog.create height:512 width:320 pos:[0,0]

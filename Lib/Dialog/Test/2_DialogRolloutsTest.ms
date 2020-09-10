clearListener()

filein( getFilenamePath(getSourceFileName()) + "/../Dialog.ms" )

Dialog	= Dialog_v title:(getFilenameFile(getSourceFileName()))


rollout_A	= Dialog.roll "Subrollout A" id:"rolloutout_a"
rollout_B	= Dialog.roll "Subrollout B"

/*------ CREATE FLOATER DIALOG ------*/
Dialog.create()
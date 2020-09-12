clearListener()

filein( getFilenamePath(getSourceFileName()) + "/../Dialog.ms" )


Dialog	= Dialog_v title:(getFilenameFile(getSourceFileName()))

/* ROLLOUT DEFINITION */
Rollout_A	= Dialog.roll "Subrollout A"


/* CREATE DIALOG */
Dialog.create()	-- create with default params

/* DIALOG POSITION */
messageBox "Dialog has default position" beep:false

Dialog.position 0 0

messageBox "Dialog position is 0,0 " beep:false

Dialog.position 256 256

messageBox "Dialog position is 256 256 " beep:false
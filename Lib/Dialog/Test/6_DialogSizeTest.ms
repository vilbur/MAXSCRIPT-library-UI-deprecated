clearListener()

filein( getFilenamePath(getSourceFileName()) + "/../Dialog.ms" )


Dialog	= Dialog_v title:(getFilenameFile(getSourceFileName()))

/* ROLLOUT DEFINITION */
Rollout_A	= Dialog.roll "Subrollout A"


/* CREATE DIALOG */
Dialog.create()	-- create with default params

messageBox "Dialog has default size" beep:false

/* DIALOG SIZE */
Dialog.width 512

messageBox "Dialog width is 512" beep:false

Dialog.height 1024

messageBox "Dialog height is 1024" beep:false
clearListener()

filein( getFilenamePath(getSourceFileName()) + "/../Dialog.ms" )

--filein( getFilenamePath(getSourceFileName()) + "/includes/DialogIncludeTest.ms" )

Dialog	= Dialog_v title:(getFilenameFile(getSourceFileName()))

/*------ CREATE FLOATER DIALOG ------*/
Dialog.create()
--Dialog.create height:512 width:320
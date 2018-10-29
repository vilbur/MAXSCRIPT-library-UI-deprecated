clearListener()

filein( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" )

Dialog	= Dialog_v title:(filenameFromPath(getSourceFileName()))

/*------ CREATE FLOATER DIALOG ------*/
Dialog.create()
--Dialog.create height:512 width:320

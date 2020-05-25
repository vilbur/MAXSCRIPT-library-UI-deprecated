/**  Test file for simplified testing
 *	
 */
print "------------\nInclude	DialogIncludeTest.ms"
 filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" )



--dialog_name	= filenameFromPath(getSourceFileName())
--format " dialog_name	= % \n" dialog_name
-- if( dialog_name == undefined ) then
	-- messageBox "Variable dialog_name is undefined.\nPlease set dialog_name before include \"DialogIncludeTest.ms\" " beep:true

Dialog	= Dialog_v title:dialog_name

/*
	For creating Dialog use:
		Dialog.create()
*/

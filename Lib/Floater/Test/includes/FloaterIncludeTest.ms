/**  Test file for simplified testing
 *	
 */

print "------------\nInclude	FloaterIncludeTest.ms"

format " getFilenameFile(getSourceFileName())	= % \n" (getFilenameFile(getSourceFileName()))
format " getThisScriptFilename()	= % \n" (getThisScriptFilename())


if( floater_name == undefined ) then
	messageBox "Variable floater_name is undefinded.\nPlease set floater_name before inlcude \"FloaterIncludeTest.ms\" " beep:true

UI	= (Floater_v()).new floater_name

/*
	For crating UI use:
		UI.create()
*/
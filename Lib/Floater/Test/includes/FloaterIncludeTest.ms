/**  Test file for simplified testing
 *	
 */

print "------------\nInclude	FloaterIncludeTest.ms"
filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" )

floater_name	= filenameFromPath(getSourceFileName())

if( floater_name == undefined ) then
	messageBox "Variable floater_name is undefinded.\nPlease set floater_name before inlcude \"FloaterIncludeTest.ms\" " beep:true

Floater	= Floater_v title:floater_name

/*
	For creating Floater use:
		Floater.create()
*/

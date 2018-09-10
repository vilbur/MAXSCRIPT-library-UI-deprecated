/**  Test file for simplified testing
 *	
 */

print "------------\nInclude	FloaterIncludeTest.ms"
filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" )

if( floater_name == undefined ) then
	messageBox "Variable floater_name is undefinded.\nPlease set floater_name before inlcude \"FloaterIncludeTest.ms\" " beep:true

UI	= (Floater_v()).new floater_name

/*
	For crating UI use:
		UI.create()
*/
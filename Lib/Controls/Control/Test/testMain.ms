clearListener();

--print "testMain"

userscripts_path_default = getDir #userscripts
print ( "userscripts_path_default = " + userscripts_path_default as string ) 

--SetDir #userscripts "c:/Users/vilbur/AppData/Local/Autodesk/3dsMax/2016 - 64bit/ENU/scripts/Library/_UI/Lib/Controls/Control/Test"
SetDir #userscripts (getFilenamePath(getSourceFileName()))

--
----include "$userscripts/Library/_UI/Lib/Controls/Control/Test/testInlcude.ms"
--
include "$userscripts/testInlcude.ms"


SetDir #userscripts userscripts_path_default

print ( "getDir $userscripts = " + (getDir #userscripts ) as string )
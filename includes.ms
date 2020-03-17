--clearListener()

format "\nfilein files  in C:\GoogleDrive\Programs\CG\3DsMax\scripts\Library\_UI\includes.ms"

/** Include all files  
 */
script_files =
#(
	
	/*---------------------------------------
		VENDOR
	-----------------------------------------*/
	--"/Lib/List/List.ms",
	
	/*---------------------------------------
		ID
	-----------------------------------------*/
	--"/Lib/Id/Id.ms",
	--"/Lib/Controls/Control/ControlId/ControlId.ms",
	
	/*---------------------------------------
		PROPERTY
	-----------------------------------------*/
	--"/Lib/Property/PropertyMethods.ms",
	--"/Lib/Property/Property.ms",
	--"/Lib/Dialog/DialogProperty/DialogProperty.ms",

	/*---------------------------------------
		EVENTS
	-----------------------------------------*/
	--"/Lib/Events/Event/Event.ms",	-- moved before control
	--"/Lib/Events/Events.ms",	-- moved before control
	
	--"/Lib/Controls/Control/ControlId/ControlId.ms",	-- imported before "RolloutEvent.ms
	--"/Lib/Controls/Control/ControlEvents/ControlEvents.ms",	-- imported before "RolloutEvent.ms
	--"/Lib/Rollouts/Rollout/RolloutEvent/RolloutEvent.ms",
	
	/*---------------------------------------
		CONTENT 
	-----------------------------------------*/
	--"/Lib/Content/Rollout/ScriptFile/MacroScript/MacroScript.ms", 
	--"/Lib/Content/Rollout/ScriptFile/ScriptFile.ms", 
	--"/Lib/Content/Rollout/Rollout.ms", 
	--"/Lib/Content/Content.ms", 
	
	--"/Lib/Ini/Ini.ms", 
	--"/Lib/Menu/MenuItem.ms", 
	--"/Lib/Menu/Menu.ms", 
	
	/*---------------------------------------
		CONTROLS 
	-----------------------------------------*/
	--"/Lib/Controls/Control/Tooltip/Tooltip.ms", 
	--"/Lib/Controls/Control/Props/Props.ms", 
	
	
	--"/Lib/Controls/Control/ControlTypes/RolloutControl/RolloutControl.ms",
	--"/Lib/Controls/Control/ControlTypes/Checkbox/Checkbox.ms",
	--"/Lib/Controls/Control/ControlTypes/Button/Button.ms",
	--"/Lib/Controls/Control/ControlTypes/EditText/EditText.ms",
	
	--"/Lib/Controls/Control/Control.ms",
	
	--"/Lib/Controls/Layout/Bbox/Bbox.ms", 
	--"/Lib/Controls/Layout/Layout.ms", 
	--"/Lib/Controls/ControlBox/ControlBox.ms",
	--"/Lib/Controls/Controls.ms", 
	
	/*---------------------------------------
		ROLLOUT
	-----------------------------------------*/
	--"/Lib/Rollouts/Rollout/Containers/Containers.ms", 
	--,"/Lib/Rollouts/RolloutProperty/RolloutPropertySetter/RolloutPropertySetter.ms",
	--"/Lib/Rollouts/RolloutProperty/RolloutProperty.ms",
	"/Lib/Rollouts/Subrollouts/Subrollouts.ms",
	"/Lib/Rollouts/Rollout/Rollout.ms"
	
	/*---------------------------------------
		DIALOG
	-----------------------------------------*/
	-- "/Lib/Dialog/Dialog.ms"
	
	
)

/** Set user scripts path
 */
function setUserScriptsPath path =
(
	SetDir #userscripts path
)
/** File in script files
 */
function fileInScriptFiles path_root =
(
	for i = 1 to script_files.count do
	(
		filein_path = ( dotNetObject "System.Text.RegularExpressions.Regex" "[\\\/]+" ).Replace (path_root + script_files[i]) "\\" -- escape full path to script file
		
		try
		(
			filein(filein_path)			
		)
		catch
		(
			format "\n**************** EXCEPTION File: % ****************\n\n%\n\n**************************************************************************************************************************************\n" filein_path (getCurrentException())
			--SetDir #userscripts userscripts_path_default -- revert default path back
		)
	)
)

/* GET PATHS */
userscripts_path_default	= getDir #userscripts 	-- save $userscripts path
current_dir	= getFilenamePath(getSourceFileName())

/* FILE IN FILES */
setUserScriptsPath	current_dir -- set current dir as $userscripts path for including

fileInScriptFiles	current_dir

setUserScriptsPath	userscripts_path_default -- revert default path back
/** Include all files needed 
 */
script_files = #(
	
	/*---------------------------------------
		VENDOR
	-----------------------------------------*/
	"/Lib/List/List.ms",
	
	/*---------------------------------------
		ID
	-----------------------------------------*/
	"/Lib/Id/Id.ms",
	"/Lib/Controls/Control/ControlId/ControlId.ms",
	
	/*---------------------------------------
		PROPERTY
	-----------------------------------------*/
	"/Lib/Property/Property.ms",
	"/Lib/Dialog/DialogProperty/DialogProperty.ms",

	/*---------------------------------------
		EVENTS
	-----------------------------------------*/
	"/Lib/Events/Event/Event.ms",	-- moved before control
	"/Lib/Events/Events.ms",	-- moved before control
	
	"/Lib/Controls/Control/ControlId/ControlId.ms",	-- imported before "RolloutEvent.ms
	"/Lib/Controls/Control/ControlEvents/ControlEvents.ms",	-- imported before "RolloutEvent.ms
	"/Lib/Rollouts/Rollout/RolloutEvent/RolloutEvent.ms",
	
	/*---------------------------------------
		CONTENT 
	-----------------------------------------*/
	"/Lib/Content/Rollout/ScriptFile/MacroScript/MacroScript.ms", 
	"/Lib/Content/Rollout/ScriptFile/ScriptFile.ms", 
	"/Lib/Content/Rollout/Rollout.ms", 
	"/Lib/Content/Content.ms", 
	
	"/Lib/Ini/Ini.ms", 
	"/Lib/Menu/MenuItem.ms", 
	"/Lib/Menu/Menu.ms", 
	
	/*---------------------------------------
		CONTROLS 
	-----------------------------------------*/
	"/Lib/Controls/Control/Tooltip/Tooltip.ms", 
	"/Lib/Controls/Control/Props/Props.ms", 
	
	
	"/Lib/Controls/Control/ControlTypes/Checkbox/Checkbox.ms",
	"/Lib/Controls/Control/ControlTypes/Button/Button.ms",
	"/Lib/Controls/Control/ControlTypes/EditText/EditText.ms",
	
	"/Lib/Controls/Control/Control.ms",	-- moved before control
	
	"/Lib/Controls/Layout/Bbox/Bbox.ms", 
	"/Lib/Controls/Layout/Layout.ms", 
	"/Lib/Controls/ControlBox/ControlBox.ms",
	"/Lib/Controls/Controls.ms", 
	
	/*---------------------------------------
		ROLLOUT
	-----------------------------------------*/
	--,"/Lib/Rollouts/RolloutProperty/RolloutPropertySetter/RolloutPropertySetter.ms",
	"/Lib/Rollouts/RolloutProperty/RolloutProperty.ms",
	"/Lib/Rollouts/Subrollouts/Subrollouts.ms",
	"/Lib/Rollouts/Rollout/Rollout.ms", 
	"/Lib/Rollouts/Rollouts.ms", 
	
	/*---------------------------------------
		DIALOG
	-----------------------------------------*/
	"/Lib/Dialog/Dialog.ms"
)


current_dir = getFilenamePath(getSourceFileName())

/*---------------------------------------
	SET INCLUDE PATH TO CURRENT DIRECTORY
-----------------------------------------*/
userscripts_path_default = getDir #userscripts 	-- save $userscripts path
SetDir #userscripts (getFilenamePath(getSourceFileName()))	-- set current dir as $userscripts path for including


for i = 1 to script_files.count do
(
	filein_path = current_dir + script_files[i]
	
	try
	(
		filein(filein_path)
		
		SetDir #userscripts userscripts_path_default -- revert default path back
	)
	catch
	(
		format "\n************ EXCEPTION ************\nFile: %\n%\n***********************************\n" filein_path (getCurrentException())
	
		SetDir #userscripts userscripts_path_default -- revert default path back
	)
)
	
format "getDir #userscripts = % \n" (getDir #userscripts)

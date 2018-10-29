
/*---------------------------------------
	SET INCLUDE PATH TO CURRENT DIRECTORY
-----------------------------------------*/
userscripts_path_default = getDir #userscripts 	-- save $userscripts path
SetDir #userscripts (getFilenamePath(getSourceFileName()))	-- set current dir as $userscripts path for including

try
(
	current_dir = getFilenamePath(getSourceFileName())	
	/*---------------------------------------
		VENDOR
	-----------------------------------------*/
	filein( current_dir + "/Lib/List/List.ms" );
	
	/*---------------------------------------
		EVENTS
	-----------------------------------------*/
	filein( current_dir + "/Lib/Events/Event/Event.ms" );	-- moved before controls
	filein( current_dir + "/Lib/Events/Events.ms" );	-- moved before controls
	
	filein( current_dir + "/Lib/Controls/Control/ControlId/ControlId.ms" )	-- imported before "RolloutEvent.ms"
	filein( current_dir + "/Lib/Controls/Control/ControlEvents/ControlEvents.ms" )	-- imported before "RolloutEvent.ms"
	filein( current_dir + "/Lib/Rollouts/Rollout/RolloutEvent/RolloutEvent.ms" )
	
	/*---------------------------------------
		CONTENT 
	-----------------------------------------*/
	filein( current_dir + "/Lib/Content/Rollout/ScriptFile/MacroScript/MacroScript.ms" );
	filein( current_dir + "/Lib/Content/Rollout/ScriptFile/ScriptFile.ms" );
	filein( current_dir + "/Lib/Content/Rollout/Rollout.ms" );
	filein( current_dir + "/Lib/Content/Content.ms" );
	
	filein( current_dir + "/Lib/Ini/Ini.ms" );
	filein( current_dir + "/Lib/Menu/MenuItem.ms" );
	filein( current_dir + "/Lib/Menu/Menu.ms" );
	
	/*---------------------------------------
		CONTROLS 
	-----------------------------------------*/
	filein( current_dir + "/Lib/Controls/Control/Tooltip/Tooltip.ms" );
	filein( current_dir + "/Lib/Controls/Control/Props/Props.ms" );
	
	
	filein( current_dir + "/Lib/Controls/Control/ControlTypes/Checkbox/Checkbox.ms" )
	filein( current_dir + "/Lib/Controls/Control/ControlTypes/Button/Button.ms" )
	filein( current_dir + "/Lib/Controls/Control/ControlTypes/EditText/EditText.ms" )
	
	filein( current_dir + "/Lib/Controls/Control/Control.ms" );	-- moved before controls
	
	filein( current_dir + "/Lib/Controls/Layout/Bbox/Bbox.ms" );
	filein( current_dir + "/Lib/Controls/Layout/Layout.ms" );
	filein( current_dir + "/Lib/Controls/ControlBox/ControlBox.ms" ); 
	filein( current_dir + "/Lib/Controls/Controls.ms" );
	
	/*---------------------------------------
		ROLLOUT
	-----------------------------------------*/
	--filein( current_dir + "/Lib/Rollouts/RolloutProperty/RolloutPropertySetter/RolloutPropertySetter.ms" )
	filein( current_dir + "/Lib/Rollouts/RolloutProperty/RolloutProperty.ms" )
	filein( current_dir + "/Lib/Rollouts/Subrollouts/Subrollouts.ms" )
	filein( current_dir + "/Lib/Rollouts/Rollout/Rollout.ms" );
	filein( current_dir + "/Lib/Rollouts/Rollouts.ms" );
	
	/*---------------------------------------
		FLOATER
	-----------------------------------------*/
	filein( current_dir + "/Lib/Dialog/Dialog.ms" );
	
	
	/*---------------------------------------
		REVERT DEFAULT PATH
	-----------------------------------------*/
	SetDir #userscripts userscripts_path_default -- revert default path back

)
catch
(
	SetDir #userscripts userscripts_path_default -- revert default path back
)

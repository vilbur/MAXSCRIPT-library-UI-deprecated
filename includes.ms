
/*---------------------------------------
	SET INCLUDE PATH TO CURRENT DIRECTORY
-----------------------------------------*/
userscripts_path_default = getDir #userscripts 	-- save $userscripts path
SetDir #userscripts (getFilenamePath(getSourceFileName()))	-- set current dir as $userscripts path for including


/*---------------------------------------
	VENDOR
-----------------------------------------*/
filein ( getFilenamePath(getSourceFileName()) + "/Lib/List/List.ms" );

/*---------------------------------------
	EVENTS
-----------------------------------------*/
filein ( getFilenamePath(getSourceFileName()) + "/Lib/Events/Event/Event.ms" );	-- moved before controls
filein ( getFilenamePath(getSourceFileName()) + "/Lib/Events/Events.ms" );	-- moved before controls

filein ( getFilenamePath(getSourceFileName()) + "/Lib/Controls/Control/ControlEvent/ControlEvent.ms" )
filein ( getFilenamePath(getSourceFileName()) + "/Lib/Rollouts/Rollout/RolloutEvent/RolloutEvent.ms" )

/*---------------------------------------
	CONTENT 
-----------------------------------------*/
filein ( getFilenamePath(getSourceFileName()) + "/Lib/Content/Rollout/ScriptFile/MacroScript/MacroScript.ms" );
filein ( getFilenamePath(getSourceFileName()) + "/Lib/Content/Rollout/ScriptFile/ScriptFile.ms" );
filein ( getFilenamePath(getSourceFileName()) + "/Lib/Content/Rollout/Rollout.ms" );
filein ( getFilenamePath(getSourceFileName()) + "/Lib/Content/Content.ms" );

filein ( getFilenamePath(getSourceFileName()) + "/Lib/Ini/Ini.ms" );
filein ( getFilenamePath(getSourceFileName()) + "/Lib/Menu/MenuItem.ms" );
filein ( getFilenamePath(getSourceFileName()) + "/Lib/Menu/Menu.ms" );

/*---------------------------------------
	CONTROLS 
-----------------------------------------*/
filein ( getFilenamePath(getSourceFileName()) + "/Lib/Controls/Control/Tooltip/Tooltip.ms" );
filein ( getFilenamePath(getSourceFileName()) + "/Lib/Controls/Control/Params/Params.ms" );


filein ( getFilenamePath(getSourceFileName()) + "/Lib/Controls/Control/ControlTypes/Checkbox/Checkbox.ms" )
filein ( getFilenamePath(getSourceFileName()) + "/Lib/Controls/Control/ControlTypes/Button/Button.ms" )


filein ( getFilenamePath(getSourceFileName()) + "/Lib/Controls/Control/Control.ms" );	-- moved before controls

filein ( getFilenamePath(getSourceFileName()) + "/Lib/Controls/Layout/Bbox/Bbox.ms" );
filein ( getFilenamePath(getSourceFileName()) + "/Lib/Controls/Layout/Layout.ms" );
filein ( getFilenamePath(getSourceFileName()) + "/Lib/Controls/ControlBox/ControlBox.ms" ); 
filein ( getFilenamePath(getSourceFileName()) + "/Lib/Controls/Controls.ms" );

/*---------------------------------------
	ROLLOUT
-----------------------------------------*/
filein ( getFilenamePath(getSourceFileName()) + "/Lib/Rollouts/Rollout/Rollout.ms" );
filein ( getFilenamePath(getSourceFileName()) + "/Lib/Rollouts/Rollouts.ms" );

/*---------------------------------------
	FLOATER
-----------------------------------------*/
filein ( getFilenamePath(getSourceFileName()) + "/Lib/Floater/Floater.ms" );


/*---------------------------------------
	REVERT DEFAULT PATH
-----------------------------------------*/
SetDir #userscripts userscripts_path_default -- revert drfault path back
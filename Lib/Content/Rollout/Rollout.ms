/** Content
 */
struct Rollout_Content_v
(
	name,
	dir,
	ScriptFiles	= #(),
	--_macros	= #(),

	/** Load
	 */
	function load dir =
	(
		this.dir	= dir

		this.setName (filenameFromPath dir)

		this._loadMacroFiles()

		this --return
	),
	/** Insert rollout
	 */
	function insertRollout Floater index =
	(
		_rollout = Floater.roll (name) ""
		
		for f=1 to ScriptFiles.count do
			if( ScriptFiles[f].MacroScripts.count > 0 ) then
				ScriptFiles[f]._addControls _rollout
	),
	--/** Add Group box
	-- */
	--function _addGroupBox f =
	--(
	--	--MacroFile = ScriptFiles[f]
	--	--print ( "!!! Rollout_Content_v.MacroFile.file=" + MacroFile.file as string )
	--	--print ( "!!! Rollout_Content_v.MacroFile.name=" + MacroFile.name as string )
	--	--_controls	= _rollout.controls groupbox:( MacroFile.name ) -- get new container for controls
	--	
	--	MacroFile._addControls _controls f
	--), 
	/** Set name "Rollout-1" >> "Rollout 1"
	 */
	function setName name =
	(
		name_Sanitized	= ( dotnetObject "System.Text.RegularExpressions.Regex" @"[^A-Za-z0-9-_]" ).Replace name ""
		name_whitespace	= ( dotnetObject "System.Text.RegularExpressions.Regex" @"[-_]+" ).Replace name_Sanitized " "

		this.name = name_whitespace
	),
	/** Set content controls
	 */
	function _loadMacroFiles =
	(
		macro_files = sort ( join (getFiles (dir + "/*.mcr")) (getFiles (dir + "/*.ms")) )
		--macro_files = sort ( getFiles (dir + "/*.mcr")) 

		if( macro_files.count > 0 ) then
			for macro_file in macro_files do
				append ScriptFiles ( (ScriptFile_Content_v()).load macro_file )

		this --return
	),
	function test =
	(
		messagebox "Rollout_Content_v.test()"
	)
)
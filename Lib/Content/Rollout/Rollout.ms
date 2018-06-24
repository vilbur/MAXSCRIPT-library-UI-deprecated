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
		print ( "Rollout_Content_v.load dir=" + dir as string )
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
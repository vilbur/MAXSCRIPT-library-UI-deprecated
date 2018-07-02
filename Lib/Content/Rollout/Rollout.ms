/** Create rollout from dir containing ".ms" & ".mcr"
 * 
 * @property	string	dir	Path to rollout dir
 * @property	string	name	Name of rollout
 *
 */
struct Rollout_Content_v
(
	dir,
	name,
	
	ScriptFiles	= #(),
	--_macros	= #(),

	/** Load
	 */
	function load dir =
	(
		--print ( "Rollout_Content_v.load dir=" + dir as string )
		this.dir	= dir

		this.setName()

		this._loadMacroFiles()

		this --return
	),
	/** Insert rollout
	 */
	function insertRollout Floater index =
	(
		_rollout = Floater.roll (name) ""
		
		for f=1 to ScriptFiles.count do
			if( ScriptFiles[f].hasMacroScripts() or ScriptFiles[f].isMaxscriptFile() ) then
				ScriptFiles[f].addControls _rollout
				
	),
 
	/** Set name "Rollout-1" >> "Rollout 1"
	 */
	function setName =
	(
		if( name==undefined ) then
			name = filenameFromPath dir
		
		name_Sanitized	= ( dotnetObject "System.Text.RegularExpressions.Regex" @"[^A-Za-z0-9-_]" ).Replace name ""
		name_whitespace	= ( dotnetObject "System.Text.RegularExpressions.Regex" @"[_]+" ).Replace name_Sanitized " "

		name = name_whitespace
	),
	/** Set content controls
	 */
	function _loadMacroFiles =
	(
		macro_files = sort ( join (getFiles (dir + "/*.mcr")) (getFiles (dir + "/*.ms")) )
		--print ( "macro_files=" + macro_files as string )

		if( macro_files.count > 0 ) then
			for macro_file in macro_files do
				append ScriptFiles ( (ScriptFile_Content_v()).load macro_file )

		--for item in ScriptFiles do
		--	print ( "item=" + item.file as string )		
				
		this --return
	),
	function test =
	(
		messagebox "Rollout_Content_v.test()"
	)
)








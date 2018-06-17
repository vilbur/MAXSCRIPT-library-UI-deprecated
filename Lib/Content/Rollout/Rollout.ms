/** Content
 */
struct Rollout_Content_v
(
	name,
	dir,
	MacroFiles	= #(),
	--_macros	= #(),

	/** Load
	 */
	function load dir =
	(
		this.dir	= dir

		this.setName (filenameFromPath dir)

		this.setMacroFiles()

		this --return
	),
	/** Insert rollout
	 */
	function insertRollout Floater index =
	(
		print ( "MacroFiles=" + MacroFiles as string )
		_rollout = Floater.roll (name) ""
		
		for f=1 to MacroFiles.count do
		(
			MacroFile = MacroFiles[f]
			_controls	= _rollout.controls groupbox:( MacroFile.name ) -- get new container for controls
			
			MacroFile.insertToUi _controls f
		)
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
	function setMacroFiles =
	(
		macro_files = sort ( join (getFiles (dir + "/*.mcr")) (getFiles (dir + "/*.ms")) )
		--macro_files = getFiles (dir + "/*.mcr")
		--macro_files = join #() (getFiles (dir + "/*.mcr"))

		if( macro_files.count > 0 ) then
			for macro_file in macro_files do
				append MacroFiles ( (MacroFile_Content_v()).load macro_file )

		this --return
	),
	function test =
	(
		messagebox "Rollout_Content_v.test()"
	)
)
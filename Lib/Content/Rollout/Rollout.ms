
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
	function insertRollout _rollout index =
	(
		--_rollout_content	= Rollouts[r]
		--roll_name	= _rollout_content.name
		--_rollout	= Floater.roll roll_name ""
		--print ( "roll_name=" + roll_name as string )
		
		print ( "MacroFiles=" + MacroFiles as string )
		--print ( "MacroFiles.count=" + _rollout_content.MacroFiles.count as string )
		
		for f=1 to MacroFiles.count do
		(
			MacroFile = MacroFiles[f]
			--print ( "======MacroFile.name=" + MacroFile.name as string )
			--print ( "MacroFile=" + MacroFile as string )
			_controls	= _rollout.controls groupbox:( MacroFile.name ) -- get new container for controls
			
			MacroFile.insertToUi _controls f
			
			--button_name	= "Button"	+ r as string	+ f as string
			
			--(_controls.button button_name).pressed ("print @HURAA@")
		
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
		macro_files = getFiles (dir + "/*.mcr")

		if( macro_files.count > 0 ) then
			for macro_file in macro_files do
				append MacroFiles ( (MacroFile_Content_v()).load macro_file )

		print ( "MacroFiles=" + MacroFiles as string )

		this --return
	),
	function test =
	(
		messagebox "Rollout_Content_v.test()"
	)
)
/** Content macro
 */
struct Macro_Content_v
(
	name,
	category,
	buttontext,
	toolTip,
	icon,
	_macroScript,
	self=this,
	/** Set name
	 */
	function setName _string =
	(
		name	= ( dotnetObject "System.Text.RegularExpressions.Regex" @"macroScript\s+" ).Replace _string ""
		name	= ( dotnetObject "System.Text.RegularExpressions.Regex" "[\"]*" ).Replace name ""
		this --return
	),
	/** Set property
	 */
	function setProp props =
	(
		key	=	trimLeft props[1]
		--value	=	props[2]
		value	= ( dotnetObject "System.Text.RegularExpressions.Regex" "\"" ).Replace (trimLeft props[2]) ""

		if( hasProperty self key ) then
		(
			setProperty self key value
		)

		this --return
	),
	function test =
	(
		messagebox "Content.test()"
	)
)

 /** Content macro
 */
struct MacroFile_Content_v
(
	Macro_Content,
	file,
	_macros	= #(),

	/** File
	 */
	function load file_path =
	(
		this._parseMacrosInFile (this._getFileContent file_path)

		Macro_Content = undefined
		
		this --return
	),
	/** Parse _macros in file
	 */
	function _parseMacrosInFile lines =
	(
		--print ( "_parseMacrosInFile=" + lines as string )
		for _line in lines do
		(

			if( matchPattern _line pattern:@"*macroScript*" ) then
			(
				if( Macro_Content!=undefined ) then
				(
					print (  Macro_Content  )
					print ( "append=" + _line as string )
					append _macros Macro_Content
				)
 
				Macro_Content = (Macro_Content_v()).setName _line
			)
			else if( Macro_Content!=undefined and  matchPattern _line pattern:@"*:*" ) then
				Macro_Content.setProp (filterString _line ":") 
		)
		print ( "_macros=" + _macros as string )
	),
	/** Get file content
	 */
	function _getFileContent _path =
	(
		file	= openFile _path mode:"r+"
		line_cnt	= 0
		lines	= #() --the array that will hold the lines

		while not eof file do 
		(
			r =  readLine file --read the first line and store as a string it in r
			append lines r --append the first line to lines array
			line_cnt += 1 --add 1 to the counter
		)

		seek file 0    -- reset position to beginning

		close file -- closes the file

		lines --return
	),

	function test =
	(
		messagebox "Macro_Content.test()"
	)
)

/** ContentControls
 */
struct ContentControls_v
(
	macros	= #(),

	--_macros,
	/** Load macros
	 */
	function loadMacros dir =
	(
		macro_files = getFiles (dir + "/*.mcr")

		if( macro_files.count > 0 ) then
			for macro_file in macro_files do
				append macros ( (MacroFile_Content_v()).load macro_file )

		this --return
	),

	function test =
	(
		messagebox "ContentControls.test()"
	)

)

/** Content
 */
struct Rollout_Content_v
(
	name,
	dir,
	ControlBoxes	= #(),
	--_macros	= #(),

	/** Load
	 */
	function load dir =
	(
		this.dir	= dir

		this.setName (filenameFromPath dir)

		this.setContentControls()

		this --return
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
	function setContentControls =
	(
		macro_files = getFiles (dir + "/*.mcr")

		if( macro_files.count > 0 ) then
			for macro_file in macro_files do
				append ControlBoxes ( (MacroFile_Content_v()).load macro_file )

		print ( "ControlBoxes=" + ControlBoxes as string )

		this --return
	),
	function test =
	(
		messagebox "Rollout_Content_v.test()"
	)
)

/** Content
 */
struct Content_v
(
	content_dir	= getFilenamePath(getSourceFileName()) + "/../../Content",
	Rollouts	= #(),

	/** Auto load rollouts
	 */
	function autoLoadRollouts =
	(
		this._loadRolloutsFromFiles()
		
		this --return
	),
	/** Set controls to
	 */
	function setControlsToUI Floater =
	(
			for r in #("A", "B", "C", "D") do
			(
				roll_name	= "Controls"+r
				--execute ("global "+roll_name)
				_rollout	= Floater.roll roll_name ""
				_controls	= _rollout.controls groupbox:("groupbox "+r) -- get new container for controls
				
				for c = 1 to 5 do
				(
					button_name	= "Button"	+r+c as string 
					checkbox_name	= "Checkbox"	+r+c as string 
			
					cbx = _controls.control #checkbox checkbox_name ""
				
					(_controls.button button_name).pressed ("print "+cbx.path+".state")
			
				)
			)

	),
	/** Load rollouts from files
	 */
	function _loadRolloutsFromFiles =
	(
		_rollout_dirs =  getDirectories( content_dir + "/*")

		for dir in _rollout_dirs do
			append Rollouts ( (Rollout_Content_v()).load dir )
			
		this._insertRolloutsToUi()
	),
	/** Insert rollouts to ui
	 */
	function _insertRolloutsToUi =
	(
		for roll in Rollouts do
			print ( "roll=" + roll as string )
	),

	function test =
	(
		messagebox "Content.test()"
	)
)















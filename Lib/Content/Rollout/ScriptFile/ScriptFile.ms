
 /** Content macro
 */
struct ScriptFile_Content_v
(
	--Macro,
	_name,
	file,
	MacroScripts	= #(),
	_MacroScript,	-- store currently parsed Macro file
	/** File
	 */
	function load file_path =
	(
		file	= file_path

		--print ( " getFilenameType file=" +  getFilenameType file as string )
		if( getFilenameType file == ".mcr" ) then
		(
			print ("MacroFile.load\""+file+"\"")

			filein file

			this._parseMacrosInFile (this._getFileContent file_path)

			--if( _name!=undefined ) then
				--messagebox ("_name="+_name as string )
			
			_name	= getFilenameFile file
			--print ( "_name=" + _name as string )
			Macro = undefined
		)

		this --return
	),
	/** Insert to ui
	 */
	function _addControls _rollout =
	(
		_controls	= _rollout.controls groupbox:( _name ) -- get new container for controls
		
		if( _name==undefined ) then
			_name	= getFilenameFile file
		
		if( getFilenameType file == ".mcr" ) then
			for m = 1 to MacroScripts.count do
				MacroScripts[m]._addControls _controls

		else
			this._runScriptFile()
	),
	/** _run script file
	 */
	function _runScriptFile =
	(
		print ("FILEIN:\""+file+"\"")
		filein file
	),
	/** Parse MacroScripts in file
	 */
	function _parseMacrosInFile lines =
	(
		for _line in lines do
		(
			if( matchPattern _line pattern:@"*macroScript*" ) then
			(
				--print ( "MACRO=" + _line as string )
				if( _MacroScript!=undefined ) then
					append MacroScripts _MacroScript

				_MacroScript = (MacroScript_Content_v()).setName _line
			)
			else if( _MacroScript!=undefined and  matchPattern _line pattern:@"*:*" ) then
				_MacroScript.setProp (filterString _line ":") 
		)

		if( _MacroScript!=undefined) then
			append MacroScripts _MacroScript
	),
	/** Get file content
	 */
	function _getFileContent _path =
	(
		file_opened	= openFile _path mode:"r+"
		line_cnt	= 0
		lines	= #() --the array that will hold the lines

		while not eof file_opened do 
		(
			r =  readLine file_opened --read the first line and store as a string it in r
			append lines r --append the first line to lines array
			line_cnt += 1 --add 1 to the counter
		)

		seek file_opened 0    -- reset position to beginning

		close file_opened -- closes the file

		lines --return
	),

	function test =
	(
		messagebox "Macro_Content.test()"
	)
)

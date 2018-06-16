
 /** Content macro
 */
struct MacroFile_Content_v
(
	Macro,
	name,
	file,
	_macros	= #(),

	/** File
	 */
	function load file_path =
	(
		this._parseMacrosInFile (this._getFileContent file_path)

		name	= getFilenameFile file_path
		
		Macro_Content = undefined
		
		this --return
	),
	/** Insert to ui
	 */
	function insertToUi _controls index =
	(
		--button_name	= "Button"	+ _controls.parent_roll.id + index as string
		--(_controls.button button_name).pressed ("print @HURAA@")
		print ( "_macros=" + _macros as string )
		print ( "_macros.count=" + _macros.count as string )
		for m = 1 to _macros.count do
			--print ( "m=" + m as string )
			--print ( "_macros[m]=" + _macros[m].name as string )
			_macros[m].insertToUi _controls
		
		
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
				--print ( "MACRO=" + _line as string )
				if( Macro!=undefined ) then
					append _macros Macro
 
				Macro = (Macro_Content_v()).setName _line
			)
			else if( Macro!=undefined and  matchPattern _line pattern:@"*:*" ) then
				Macro.setProp (filterString _line ":") 
		)
		
		append _macros Macro

		print ( "_MACROS=" + _macros as string )
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


 /** Content macro
 */
struct MacroFile_Content_v
(
	Macro,
	name,
	file,
	macros	= #(),

	/** File
	 */
	function load file_path =
	(
		file	= file_path
		
		filein file
		
		print ( " getFilenameType file=" +  getFilenameType file as string )
		if( getFilenameType file == ".mcr" ) then
		(
			this._parseMacrosInFile (this._getFileContent file_path)
			
			name	= getFilenameFile file_path
			
			Macro_Content = undefined
			
		)
		
		
		this --return
	),
	/** Insert to ui
	 */
	function insertToUi _controls index =
	(
		--button_name	= "Button"	+ _controls.parent_roll.id + index as string
		--(_controls.button button_name).pressed ("print @HURAA@")
		print ( "macros=" + macros as string )
		print ( "macros.count=" + macros.count as string )
		
		
		if( getFilenameType file == ".mcr" ) then
			for m = 1 to macros.count do
				macros[m].insertToUi _controls
		
		else
			filein file
			--print ( "FILE=" + file as string )

		
	),
	/** Parse macros in file
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
					append macros Macro
 
				Macro = (Macro_Content_v()).setName _line
			)
			else if( Macro!=undefined and  matchPattern _line pattern:@"*:*" ) then
				Macro.setProp (filterString _line ":") 
		)
		
		append macros Macro

		print ( "_MACROS=" + macros as string )
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

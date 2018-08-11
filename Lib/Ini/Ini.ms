/** Save Load ini settings
  *
  *
  */
struct Ini_v
(
	_dir,	-- dir of *.ini file
	_file,	-- *.ini filename
	_ini,	-- full pah to *.ini file
	
	/** Dir
	 */
	function dir _path =
	(
		
	),
	/** File
	 */
	function file filename =
	(
		
	),
	/** Get\set ini file path
	  * @param	string|#get _path	Path to ini file, or #get
	  *
	  * @return	string path to ini file if _path=#get	
	  */
	function ini _path =
	(
		if( _path != #get ) then 
			_ini = _path
		
		_ini --return
	),
	/** Ini save control state
	 */
	function save section key value =
	(
		setINISetting _ini section key ( value as string )
		--print( "Ini_v.save() \nini=" + ini + " \nsection=" + section + " \nkey=" + key + " \nvalue=" + value)
		--messagebox ("Ini.save() \nini=" + ini )
	),
	/** Ini save control state
	 */
	function load section key default:undefined =
	(
		section	= section	as string
		key	= key	as string
		value	= default
		--ini	= ( dotnetObject "System.Text.RegularExpressions.Regex" @"\\/+" ).Replace ini "\\\\"
	
		if( ini!=false and hasINISetting _ini section key == true ) then
			value = getINISetting _ini section key -- return
		
		--print ( "ini=" + ini as string )
		--print ( "Ini_v.load() " + section + " " + key + " = " + value as string )
		--print ( "hasINISetting ini section key =" + (hasINISetting ini section key)  as string )

		value --return
	),
	
	function test =
	(
		messagebox "Ini.test()"
	)
)

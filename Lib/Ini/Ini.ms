/** Save Load ini settings
  *
  *
  */
struct Ini_v
(
	ini,
	
	/** Ini save control state
	 */
	function save section key value =
	--function save =
	(
		setINISetting ini section key (value as string )
		--print( "Ini.save() \nini=" + ini + " \nsection=" + section + " \nkey=" + key + " \nvalue=" + value)
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
	
		if( hasINISetting ini section key == true ) then
			value = getINISetting ini section key -- return
		
		print ( "ini=" + ini as string )
		print ( "Ini_v.load() " + section + " " + key + " = " + value as string )
		print ( "hasINISetting ini section key =" + (hasINISetting ini section key)  as string )

		value --return
	),
	
	function test =
	(
		messagebox "Ini.test()"
	)
)

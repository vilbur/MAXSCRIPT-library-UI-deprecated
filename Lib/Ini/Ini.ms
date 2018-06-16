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
	function load section key =
	--function save =
	(
		getINISetting ini section key -- return
		--print( "Ini.save() \nini=" + ini + " \nsection=" + section + " \nkey=" + key + " \nvalue=" + value)
		--messagebox ("Ini.save() \nini=" + ini )
	),
	
	function test =
	(
		messagebox "Ini.test()"
	)
)

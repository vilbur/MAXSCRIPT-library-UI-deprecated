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
		print( "Ini.save() \nini=" + ini + " \nsection=" + section + " \nkey=" + key + " \nvalue=" + value)
		--messagebox ("Ini.save() \nini=" + ini )
	),
	
	function test =
	(
		messagebox "Ini.test()"
	)
)

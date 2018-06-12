/** Ini
 */
struct Ini_v
(
	self	= this,
	
	/** Ini save control state
	 */
	function save control_id value =
	(
		messagebox "Ini.save() " + control_id + " value="+value
	),
	
	function test =
	(
		messagebox "Ini.test()"
	)
)

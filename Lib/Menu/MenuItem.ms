
/** Menu item_v
 */
struct MenuItem_v
(
	id,
	name,
	
	/** Create
	 */
	function create =
	(
		this.setId()
		
		if( name=="separator" ) then 
			return "\nseparator sep"+( (random 1 1000000000) as string )+"\n"
		
		return "menuItem " + id + " \"" + name + "\"\n"
	),

	/** Get id
	 */
	function setId =
	(
		if( id=="" ) then
			id = ( dotnetObject "System.Text.RegularExpressions.Regex" @"\s+" ).Replace ( toLower name ) "_";
	),
	function test =
	(
		messagebox "MenuItem_v.test()"
	)
)
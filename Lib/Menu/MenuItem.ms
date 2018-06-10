
/** Menu item_v
 */
struct MenuItem_v
(
	id,
	name,
	
	/** Create
	  * @param	string	void	Empty parameter, must be present because method definition should match with Menu_v.create
	  * @return string Definition of menu item
	 */
	function create void =
	(
		this.setId()
		
		if( name=="separator" ) then 
			return "\nseparator sep"+( (random 1 1000000000) as string )
		
		return "\nmenuItem " + id + " \"" + name + "\""
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
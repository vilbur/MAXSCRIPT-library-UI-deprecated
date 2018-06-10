
/** Menu item_v
 */
struct MenuItem_v
(
	self	= this,
	id,
	title,
	
	/** Create
	 */
	function create =
	(
		--print "MenuItem.create()"
		return "menuItem " + id + " \"" + title + "\"\n"
		
	),
	function test =
	(
		messagebox "MenuItem_v.test()"
	)
)

/** Menu
 */
struct Menu_v
(
	self	= this,
	type	= "RCmenu",
	title,
	items	= #(),
	
	/** Submenu
	 */
	function submenu _title =
	(
		_submenu =  Menu_v title:_title type:"submenu"
		
		append items _submenu
		
		return _submenu
	),
	/** Item
	 */
	function item _title id:"" =
	(
		_item =  MenuItem_v title:_title id:id
		append items _item
	),
	/** Create
	 */
	function create =
	(
		--print "Menu.create()"
		subitems = ""
		
		for item in items do
			subitems += item.create()
		
		definition = this._menuDefinition() + "(\n" + subitems + "\n)"

		return definition 
	),
	/** Is menu
	 */
	function isMenu _item =
	(
		return  matchPattern ( classOf _item as string) pattern:"#Struct:Menu*" 
	),
	/** Get menu definition
	 */
	function _menuDefinition =
	(
		if( type=="submenu" ) then
			return "subMenu \"" + title + "\""
		else
			return "RcMenu " + title
	),
	/** Append to submenu
	 */
	function _appendToSubmenu submenu_items_definition =
	(
		return "subMenu \""+title+"\"
				(
					"+submenu_items_definition+"
				)"
	),
	/*---------------------------------------
		HELPERS
	-----------------------------------------*/
	/** Get id
	 */
	function getId caption =
	(
		return ( dotnetObject "System.Text.RegularExpressions.Regex" @"\s+" ).Replace caption "_";
	),
	
	function test =
	(
		messagebox "Menu.test()"
	)

)

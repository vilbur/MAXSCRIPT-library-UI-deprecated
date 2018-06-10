
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
		this.setId()
		
		if( title=="separator" ) then 
			return "\nseparator sep"+( (random 1 1000000000) as string )+"\n"
		
		return "menuItem " + id + " \"" + title + "\"\n"
	),
	/*---------------------------------------
		HELPERS
	-----------------------------------------*/
	/** Get id
	 */
	function setId =
	(
		if( id=="" ) then
			id = ( dotnetObject "System.Text.RegularExpressions.Regex" @"\s+" ).Replace ( toLower title ) "_";
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
		
		this._addItem _submenu
		
		return _submenu
	),
	/** Item
	 */
	function item _title id:"" =
	(
		_item =  MenuItem_v title:_title id:id
		this._addItem _item
	),
	/** Separator
	 */
	function separator =
	(
		this.item "separator"
	),
	/** Create
	 */
	function create =
	(
		subitems = ""
		
		for item in items do
			subitems += item.create()
		
		definition = this._menuDefinition() + "(\n" + subitems + "\n)"
		
		if( type=="RCmenu" ) then 
			execute definition
		else
			return definition 
	),
	/** Add item
	 */
	function _addItem item =
	(
		append items item
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

	
	function test =
	(
		messagebox "Menu.test()"
	)

)

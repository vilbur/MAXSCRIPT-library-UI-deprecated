/** Menu
 */
struct Menu_v
(
	self	= this,
	type	= "RCmenu",
	name,
	items	= #(),
	
	/** New
	 */
	function new _name =
	(
		this.name = _name
		
		return self
	),
	/** Submenu
	 */
	function menu _name =
	(
		_menu =  Menu_v name:_name type:"submenu"
		
		this._addItem _menu
		
		return _menu
	),
	/** Item
	 */
	function item _name id:"" =
	(
		_item =  MenuItem_v name:_name id:id
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
		print "Menu_v.create()"
		subitems = ""
		
		for item in items do
			subitems += item.create()
		
		definition = this._menuDefinition() + "\n(\n" + subitems + "\n)"
		
		if( type=="RCmenu" ) then (
			print ( "definition=" + definition as string )
			return (execute definition)
			
		)else
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
			return "\nsubMenu \"" + name + "\""
		else
			return "RcMenu " + name
	),
	
	function test =
	(
		messagebox "Menu.test()"
	)

)

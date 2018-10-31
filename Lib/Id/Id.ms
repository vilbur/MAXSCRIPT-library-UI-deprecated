/** Id
 */
struct Id_v
(
	__construct = #(),
	
	/* required */
	/* dependency */
	/* reference */
	/* properties */
	
	/** Sanitize id
	 */
	function _sanitizeId =
	(
		print "------------\nControlId._sanitizeId()"
		id_no_whitespace = substituteString id " " "_" -- replace whitespace

		id = (( dotNetObject "System.Text.RegularExpressions.Regex" @"[^A-Za-z0-9_]+" ).Replace ( toLower (id_no_whitespace) ) "") --return
		format " id	= % \n" id
	),
	private
	
	/** Remove whitespace
	 */
	function _removeWhitespace =
	(
		
	),
	--/** Get\set value of property 
	-- * @param	string|name key	Name  of property E.G.: "foo_key" OR #foo_key 
	-- * @param	string|#get value	Value of property
	-- *
	-- * @return	string|self Value or self
	-- *
	-- * @example this._getSetProp "foo" "bar" -- SET "bar" to property "foo"
	-- * @example this._getSetProp #foo  #get  -- GET value of property "foo"
	-- */
	--function _getSetProp key value =
	--(
	--	if( value != #get ) then
	--	(
	--		if( value != undefined ) then
	--			setProperty  this ( key as string ) value
	--		this --return
	--	) else
	--		getProperty this ( key as string ) --return
	--),
	--
	--/** Check if required properties are defined when an instance of the struct is created.
	-- *	
	-- * @example __construct = #( #property_name ) 
	-- */
	--function _checkConstctructProperties =
	--(
	--	for prop in __construct where getProperty this prop == undefined do
	--		messageBox ("Undefined construct property !\n\n"+ ((filterString( classof this as string )"(:")[2]) +"."+ prop )
	--),
	--/**  
	-- */
	--on create do
	--(
	--	_checkConstctructProperties()
	--)
	
)
/** Control id
 */
struct ControlId_v
(
	/* dependency */
	/* properties */
	Parent_control,
	id,
	full,
	
	__construct = this._construct #(),
	
	/** Set
	 */
	function setId _id =
	(
		this._setControlId _id
		this._setIdFull()
	),
	/** Get
	 */
	function get =
	(
		id --return
	),
	--/** Full
	-- */
	--function full =
	--(
	--	_full --return
	--),
	
	/** Set unique id for control
	  * If id exists, then suffix 'controltype_counter' is added E.G.: 'foo_id_button_01'
	  *
	  * @examples of source of id
	  *		1) id is defined	_id	= "foo_id"	>>> id = "foo_id"	-- id is used
	  *		2) id is undefined	Control.caption	= "Foo bar"	>>> id = "foo_bar"	-- sanitized caption is used
	  *
	  * @param	string|undefined	_id	id of control
	  *
	 */
	function _setControlId _id =
	(
		--print "***------------\nControls._setControlId()"
		
		type	= Parent_control.type as string
		id	= ( if( _id == undefined or _id == "" ) then ( this.sanitizeId Parent_control.caption ) else _id ) as string

		if ( id == "" or this.controlExiststs id ) then
			id	= this._getUniqueId ( if( id != "" or id != undefined ) then (id + "_" + type) else type )
		
		format " id	= % \n" id
	),
	/** _set id full
	 */
	function _setIdFull =
	(
		full	= Parent_control.Parent_roll.id +"."+id
	),
	/** Sanitize id
	 */
	function sanitizeId _string =
	(
		--print "------------\nControlId.sanitizeId()"
		--format " _string	= % \n" _string
		_string = substituteString _string " " "_" -- replace whitespace
		--format " _string	= % \n" _string
		(( dotnetObject "System.Text.RegularExpressions.Regex" @"[^A-Za-z0-9_]+" ).Replace ( toLower (_string) ) "") --return
	),
	/** Combine control type and counter, and find next unique id
	  * 
	  * 
	  * 
	  * @return	string E.G.: "edittext_01"
	 */
	function _getUniqueId _string =
	(
		--print "------------\nControlBody._getUniqueId()"
		--format " _string	= % \n" _string
		counter	= 1

		id = this.concat _string counter

		while ( this.controlExiststs id ) do
			id = this.concat _string (counter += 1)
			
		id --return 
	),
	/** Get id string
	 */

	function concat _string _counter =
	(
		_suffix	=  (if( _counter > 9 ) then "" else "0"  )+ _counter as string
		
		_string as string + "_" + _suffix --return
	),
	/** Control existsts
	 */
	function controlExiststs id =
	(
		Parent_control.Parent_roll.hasControl id --return
	),
	/*------------------------------------------------------------------------------
		PRIVATE
	--------------------------------------------------------------------------------*/
	
	/** Get\set value of property 
	  * @param	string|name key	Name  of property E.G.: "foo_key" OR #foo_key 
	  * @param	string|#get value	Value of property
	  *
	  * @return	string|self Value or self
	  *
	  * @example this._getSetProp "foo" "bar" -- SET "bar" to property "foo"
	  * @example this._getSetProp #foo  #get  -- GET value of property "foo"
	  *
	  */
	function _getSetProp key value =
	(
		if( value != #get ) then
		(
			setProperty  this ( key as string ) value
			this --return
		) else
			getProperty this ( key as string ) --return
	),
	
	/** Construct, check if construct_properties are defined
	  * @param	#( #prop_name ) construct_properties this.properties required for initialization of struct
	 */
	function _construct construct_properties =
	(
		--print "------------\nControlId._construct()"
		for prop in construct_properties where getProperty this prop == undefined do
			messageBox ("Undefined construct property\n\nProperty:"+prop+"\n\n"+ classof this as string )
	)
	
)

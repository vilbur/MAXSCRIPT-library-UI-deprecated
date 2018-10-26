/** Control id
 */
struct ControlId_v
(
	__construct = #( #Parent_control ),
	/* dependency */

	/* properties */
	Parent_control,
	id,
	full,
	
	--id_source,
	control_type,
	/** Set
	  @return	string	
	 */
	function setId id =
	(
		this.id	= id
			
		if not( this._isIdValid() ) then
			this._setIdByConrolType()

		this._sanitizeId()
		
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
	
	private
	
	/** Is id valid
	 */
	function _isIdValid =
	(
		id != unsupplied or id != undefined  --return
	),
	/** Use controls caption, if id is unsuplied
	 */
	function _setIdByConrolType =
	(
		id = Parent_control.caption + "_" + Parent_control.type as string
	),
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

	--
	--	if ( id == "" or this.controlExiststs id ) then
	--		id	= this._getUniqueId ( if( id != "" or id != undefined ) then (id + "_" + type) else type )
	--	
	--	--format " id output	= % \n" id
	--),
	/** _set id full
	 */
	function _setIdFull =
	(
		print "HOTFIX ------------\nControlId._setIdFull()"
		--full	= Parent_control.Parent_roll.id +"."+id -- make without Parent_roll
		--full	= id -- hotfix
	),
	/** Sanitize id
	 */
	function _sanitizeId _string =
	(
		--print "------------\nControlId.sanitizeId()"
		--format " _string	= % \n" _string
		_string = substituteString _string " " "_" -- replace whitespace
		--format " _string	= % \n" _string
		(( dotnetObject "System.Text.RegularExpressions.Regex" @"[^A-Za-z0-9_]+" ).Replace ( toLower (_string) ) "") --return
	),
	--/** Combine control type and counter, and find next unique id
	--  * 
	--  * 
	--  * 
	--  * @return	string E.G.: "edittext_01"
	-- */
	--function _getUniqueId _string =
	--(
	--	--print "------------\nControlExtends._getUniqueId()"
	--	--format " _string	= % \n" _string
	--	counter	= 1
	--
	--	id = this.concat _string counter
	--
	--	while ( Parent_control.exists id ) do
	--		id = this.concat _string (counter += 1)
	--		
	--	id --return 
	--),
	--/** Get id string
	-- */
	--
	--function concat _string _counter =
	--(
	--	_suffix	=  (if( _counter > 9 ) then "" else "0"  )+ _counter as string
	--	
	--	_string as string + "_" + _suffix --return
	--),
	/** Control existsts
	 */
	function controlExiststs id =
	(
		print "HOTFIX ------------\nControlId.controlExiststs()"
		--Parent_control.Parent_roll.hasControl id --return
		false --return

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
		)
		else
			getProperty this ( key as string ) --return
	),
	
	/** Check if required properties are defined
	  * Names of construct props are defined in __construct array E.g.: __construct = #( #prop_name ) 
	  * @param	construct_properties this.properties required for initialization of struct
	 */
	function checkConstctructProperties =
	(
		for prop in __construct where getProperty this prop == undefined do
			messageBox ("Undefined construct property !\n\n"+ ((filterString( classof this as string )"(:")[2]) +"."+ prop )
	),
	
	on create do
	(
		checkConstctructProperties()
	),
)

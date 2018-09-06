/** Control id
 */
struct ControlId_v
(
	/* dependency */
	/* properties */
	Parent_control,
	id,
	full,
	--rollout_id,
	
	__construct = this._construct #(),
	
	/** Set
	 */
	function setId _id =
	(
		this._setControlId _id
		full	= Parent_control.Parent_roll.id +"."+id
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
	/** Get id
	 */
	function _setControlId _id =
	(
		print "***------------\nControls._setControlId()"
		format " Parent_control.caption	= % \n" Parent_control.caption
		
		id	= ( if( _id == undefined or _id == "" ) then ( this.sanitizeId Parent_control.caption ) else _id ) as string

		if( id == "" ) then 
			id = this._getIdByType Parent_control.type
		
		format " id	= % \n" id
	),
	/** Sanitize id
	 */
	function sanitizeId _string =
	(
		(( dotnetObject "System.Text.RegularExpressions.Regex" @"[^A-Za-z0-9_]+" ).Replace ( toLower (_string) ) "") --return
	),
	/** Get id by type
	 */
	function _getIdByType type =
	(
		print "------------\nControlBody._getIdByType()"
		id = type  as string + "_01"  as string
		
		id_full	= Parent_control.Parent_roll.id +"."+id
		
		format " id	= % \n" id
		format " id_full	= % \n" id_full
		--format " execute id_full	= % \n" (execute id_full)
		--format " id	= % \n" id
		--format " control	= % \n" control
		--format " Parent_roll.id	= % \n" Parent_roll.id
		
		id --return
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
		print "------------\nControlId._construct()"
		for prop in construct_properties where getProperty this prop == undefined do
			messageBox ("Undefined construct property\n\nProperty:"+prop+"\n\n"+ classof this as string )
	)
	
)

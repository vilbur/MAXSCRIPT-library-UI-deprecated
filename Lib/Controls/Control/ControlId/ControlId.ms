/** Control id
 */
struct ControlId_v
(
	/* dependency */
	/* properties */
	
	
	__construct = this._construct #(),
	
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
		for prop in construct_properties where getProperty this prop == undefined do
			messageBox ("Undefined construct property\n\nProperty:"+prop+"\n\n"+ classof this as string )
	)
	
)

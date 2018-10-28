/** Rollout property setter
  
  CURRENTLY NOT UNUSED
  
  
 */
struct RolloutPropertySetter_v
(
	--__construct = #( #property, #parent_roll_id ),
	__construct = #( #property ),
		
	/* required */
	property,
	parent_roll_id,
	/* dependency */
	/* reference */
	/* properties */
	value,
	
	--private
	
	/** Get set property
	 */
	function getSetProperty value =
	(
		--getSetProperty
	),
	
	/** Get property string
	 */
	function _getPropertyString =
	(
		print "------------\nRolloutProperties._getPropertyString()"
		--format " property	= % \n" (parent_roll.getId() + "." + property as string)
		
		--parent_roll.getId() + "." + property as string  --return
	),
	/** Get\set value of property 
	  * @param	string|name key	Name  of property E.G.: "foo_key" OR #foo_key 
	  * @param	string|#get value	Value of property
	  *
	  * @return	string|self Value or self
	  *
	  * @example this._getSetProp "foo" "bar" -- SET "bar" to property "foo"
	  * @example this._getSetProp #foo  #get  -- GET value of property "foo"
	  */
	function _getSetProp key value =
	(
		if( value != #get ) then
		(
			if( value != undefined ) then
				setProperty this ( key as string ) value
			this --return
		) else
			getProperty this ( key as string ) --return
	),
	
	/** Check if properties in __construct are defined when an instance of the struct is created.
	  * @example __construct = #( #property_name ) 
	 */
	function _checkConstctructProperties =
	(
		for prop in __construct where getProperty this prop == undefined do
			messageBox ("Undefined construct property !\n\n"+ ((filterString( classof this as string )"(:")[2]) +"."+ prop )
	),
	/**  
	 */
	on create do
	(
		_checkConstctructProperties()
	)
	
	
)

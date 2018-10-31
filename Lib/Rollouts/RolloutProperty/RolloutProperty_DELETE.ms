/** Rollout properties
 */
struct RolloutProperty_v
(
	__construct = #(),
	
	/* reference */
	Parent_roll,
	
	private
	
	property_keys	=  #(#width, #height, #pos),
	
	--public
	 
	--include "Lib/Property/PropertyMethods.ms"
	
	--private
	
	/** Set property
	 */
	function _setProperty key value relative =
	(
		print ("------------\nRolloutProperty._setProperty() " + key as string )
		--format "property string = % \n" (this._getPropertyString key)
		--format "value = % \n" (this._getValue key value relative:relative)

		execute ( this._getPropertyString key + " = " + this._getValue key value relative:relative  )
		
	),
	/** Get property string
	 */
	function _getPropertyString key =
	(
		Parent_roll.getId() + "." + key as string  --return
	),
	/** Get value
	 */
	function _getValue key value relative:false =
	(
		if( relative ) then 
			value += this._getProperty key
		
		value as string --return
	),
	/** Get property
	 */
	function _getProperty key =
	(
		execute ( this._getPropertyString key ) --return
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
	
	/** Check if required properties are defined
	  * Names of construct props are defined in __construct array E.g.: __construct = #( #prop_name ) 
	  * @param	construct_properties this.properties required for initialization of struct
	 */
	function _checkConstctructProperties =
	(
		for prop in __construct where getProperty this prop == undefined do
			messageBox ("Undefined construct property !\n\n"+ ((filterString( classof this as string )"(:")[2]) +"."+ prop )
	),
	on create do
	(
		--print "------------\nRolloutProperty.create()"
		
		--format "Parent_roll.getId()	= % \n" (Parent_roll.getId())
		
		this._checkConstctructProperties()
	)
	
	
)

/** Rollout properties
 */
struct RolloutProperties_v
(
	__construct = #(),
	
	/* dependency */
	/* reference */
	parent_roll,
	/* required */
	/* properties */
	_width,
	_height,



	/** Height
	 */
	function height height relative:false =
	(
		this._setProperty #height height relative
	),
	/** Pos
	 */
	function pos position relative:false =
	(
		this._setProperty #pos position relative
	),
	
	private
	
	/** Get property string
	 */
	function _getPropertyString key =
	(
		print "------------\nRolloutProperties._getPropertyString()"
		format " property	= % \n" (parent_roll.getId() + "." + key as string)
		
		parent_roll.getId() + "." + key as string  --return
	),
	/** Set property
	 */
	function _setProperty key value relative =
	(
		execute ( this._getPropertyString key + " = " + this._getValue key value relative:relative  )  
	),
	/** Get property
	 */
	function _getProperty key =
	(
		execute ( this._getPropertyString key ) --return
	),
	/** Get value
	 */
	function _getValue key value relative:false =
	(
		if( relative ) then 
			value += this._getProperty key
		
		value as string --return
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
		_checkConstctructProperties()
	)
	
	
)

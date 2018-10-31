/** Set Property of UI element
 */
struct Property_v
(
	__construct = #( #id ),
	
	/* reference */
	--Parent_roll,
	/* required */
	id, -- id of element to set property
	/* dependency */
	/* properties */	
	
	private
	
	property_keys	=  #(#width, #height, #pos),
	
	public
	 
	/** Height
	 */
	function height height relative:false =
	(
		print "------------\nRolloutProperty.height()"
		this._setProperty #height height relative
	),
	/** Width 
	 */
	function width width relative:false =
	(
		print "------------\nRolloutProperty.width()"
		this._setProperty #width width relative
	),
	/** Pos
	 */
	function pos position relative:false =
	(
		this._setProperty #pos position relative
	),
	
	/** Set properties
	 */
	function all width: height: pos: relative:false =
	(
		--print "------------\nRolloutProperty.all()" 
		properties_values = #( width, height, pos )
		--format " properties_values	= % \n" properties_values
		for i = 1 to property_keys.count where properties_values[i] != unsupplied do
			this._setProperty property_keys[i] properties_values[i] relative
	),
	
	/** Set property
	 */
	function _setProperty key value relative =
	(
		print ("------------\nRolloutProperty._setProperty() " + key as string )

		execute ( this._getPropertyString key + " = " + this._getValue key value relative:relative  )
	),

	private
	
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
	
	/** Get property string
	 */
	function _getPropertyString key =
	(
		id + "." + key as string  --return
	),

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

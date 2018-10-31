/** Dialog properties
 */
struct DialogProperty_v
(
	__construct = #( #id, #subrollouts_slot ),
	
	/* reference */
	--Parent_roll,
	/* required */
	id,	-- id of element to set property
	subrollouts_slot,	-- inherit by Rollout_v.subrollouts_slot
	/* dependency */
	Property_Dialog,
	Property_RollMain,
	/* properties */	
	
	private
	
	property_keys	=  #(#width, #height, #pos),
	
	public
	 
	/** Height
	 */
	function height height relative:false =
	(
		print "------------\nDialogProperty.height()"
		--this._setProperty #height height relative
		Property_Dialog._setProperty	#height height relative
		Property_RollMain._setProperty	#height height relative
		
	),
	/** Width 
	 */
	function width width relative:false =
	(
		print "------------\nDialogProperty.width()"
		--this._setProperty #width width relative
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
		--print "------------\nDialogProperty.all()" 
		properties_values = #( width, height, pos )
		--format " properties_values	= % \n" properties_values
		for i = 1 to property_keys.count where properties_values[i] != unsupplied do
			this._setProperty property_keys[i] properties_values[i] relative
	),
	private
	
	--/** Set property
	-- */
	--function _setProperty key value relative =
	--(
	--	print ("------------\nDialogProperty._setProperty() " + key as string )
	--	--format "property string = % \n" (this._getPropertyString key)
	--	--format "value = % \n" (this._getValue key value relative:relative)
	--	--format "this._getMainRollPropertyString key = % \n" (this._getMainRollPropertyString key)
	--	execute ( this._getPropertyString key + " = " + this._getValue key value relative:relative  )
	--	execute ( this._getMainRollPropertyString key + " = " + this._getValue key value relative:relative  )
	--	
	--),
	--/** Get property string
	-- */
	--function _getPropertyString key =
	--(
	--	id + "." + key as string  --return
	--),
	--/** Get property string
	-- */
	--function _getMainRollPropertyString key =
	--(
	--	id + ".subrollouts." + key as string  --return
	--),
	--/** Get value
	-- */
	--function _getValue key value relative:false =
	--(
	--	if( relative ) then 
	--		value += this._getProperty key
	--	
	--	value as string --return
	--),
	--/** Get property
	-- */
	--function _getProperty key =
	--(
	--	execute ( this._getPropertyString key ) --return
	--),
	
	/** _set property
	 */
	function _setProperty =
	(
		Property_Dialog	= Property_v id:id
		Property_RollMain	= Property_v id:(id + "." + subrollouts_slot)
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
		--print "------------\nDialogProperty.create()"
		
		--format "Parent_roll.getId()	= % \n" (Parent_roll.getId())
		
		this._checkConstctructProperties()
		
		this._setProperty()
		
	)
	
	
)

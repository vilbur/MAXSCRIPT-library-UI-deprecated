/** Set Property of UI element
 */
struct Property_v
(
	__construct = #( #id ),

	/* reference */
	/* required */
	id, -- id of element to set property
	/* dependency */
	/* properties */

	private

	property_keys	=  #(#width, #height, #pos),

	public

	/** Set property
	 */
	function setProp property value relative =
	(
		--print ("------------\nProperty.setProp() " + property as string )
		execute ( this._getPropertyString property + " = " + this._getValue property value relative:relative  )
	),

	private

	/** Get value
	 */
	function _getValue property value relative:false =
	(
		if( relative ) then 
			value += this._getProperty property

		value as string --return
	),

	/** Get property
	 */
	function _getProperty property =
	(
		execute ( this._getPropertyString property ) --returns
	),

	/** Get property string
	 */
	function _getPropertyString property =
	(
		id + "." + property as string  --return
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
		--print "------------\nProperty.create()"

		--format "Parent_roll.getId()	= % \n" (Parent_roll.getId())

		this._checkConstctructProperties()
	)

)

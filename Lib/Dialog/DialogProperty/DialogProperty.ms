/** Dialog properties
 */
struct DialogProperty_v
(
	__construct = #( #id, #subrollouts_slot ),
	
	/* reference */
	/* required */
	id,	-- id of element to set property
	subrollouts_slot,	-- inherit by Rollout_v.subrollouts_slot
	/* dependency */
	Property_Dialog,
	Property_RollMain,
	/* properties */	
	
	public
	
	include "Lib/Property/PropertyMethods.ms"

	/** _call setters
	 */
	function _callProperty property value relative =
	(
		print ("------------\nDialogProperty._callProperty #" + property as string)
		Property_Dialog.setProp	property value relative 
		Property_RollMain.setProp	property value relative 
	),
	
	private
	
	/** _set property
	 */
	function _setPropertyClass =
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
		
		this._setPropertyClass()
		
	)
	
	
)

/** Checkbox
 */
struct Checkbox_v
(
	include "Lib/Controls/Control/ControlBody.ms"

	--Control,
	
	checked,
	
	--Controls,
	--parent_roll,
	--
	--/* config */
	--type,	-- type of control E.G.: #button
	--caption,
	--id,
	--value,
	--
	/** Toggle checkbox
	 */
	function toggle =
	(
		
		current_state = this.prop #state #get
		
		this.prop #state ( not current_state )
	),
	
	
	/*------------------------------------------------------------------------------
		PRIVATE
	--------------------------------------------------------------------------------*/
	--/** Sanitize parameters by specific control type
	--  *
	--  * This method must be in all structs which include "ControlBody.ms"
	-- */
	--function _sanitizeParametersByControlType =
	--(
	--	
	--),
	
	--/** Get\set value of property 
	--  * @param	string|name key	Name  of property E.G.: "foo_key" OR #foo_key 
	--  * @param	string|#get value	Value of property
	--  *
	--  * @return	string|self Value or self
	--  *
	--  * @example this._getSetProp "foo" "bar" -- SET "bar" to property "foo"
	--  * @example this._getSetProp #foo  #get  -- GET value of property "foo"
	--  *
	--  */
	--function _getSetProp key value =
	--(
	--	if( value != #get ) then
	--	(
	--		setProperty  this ( key as string ) value
	--		this --return
	--	) else
	--		getProperty this ( key as string ) --return
	--),
	/** Construct
	 */
	function _construct =
	(
		--print "------------\nCheckbox._construct()"
		type	= #checkbox
		name_of_value_param	= #checked

		
		----Controls.add this
		--Controls.test this
		--print ( "this = " + this as string )
		--print ( "Controls = " + Controls as string )
		
	),
	
	__construct = this._construct()
)

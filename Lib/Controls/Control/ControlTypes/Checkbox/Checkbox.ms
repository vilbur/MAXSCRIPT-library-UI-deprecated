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
		print "Checkbox_v.toggle()"
		current_state = this.prop #state #get
		
		this.prop #state ( not current_state )
	),
	
	
	/*------------------------------------------------------------------------------
		PRIVATE
	--------------------------------------------------------------------------------*/
	
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
		print ("Checkbox._construct()")
		type = #checkbox

		--this.init()
		
		----Controls.add this
		--Controls.test this
		--print ( "this = " + this as string )
		--print ( "Controls = " + Controls as string )
		
	),
	
	__construct = this._construct()
)

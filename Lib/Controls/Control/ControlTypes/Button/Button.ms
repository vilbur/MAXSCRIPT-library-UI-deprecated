



/** Button
 */
struct Button_v 
(
	

	include "Library/_UI/Lib/Controls/Control/ControlExtends.ms"

	--include "/../../ControlExtends.ms"
	--include "c:/GoogleDrive/Programs/CG/3DsMax/scripts/Library/_UI/Lib/Controls/Control/ControlExtends.ms"
	--include( getFilenamePath(getSourceFileName()) + "/../../ControlExtends.ms" )
	
	/*------------------------------------------------------------------------------
		PRIVATE
	--------------------------------------------------------------------------------*/
	--/** Sanitize parameters by specific control type
	--  *
	--  * This method must be in all structs which include "ControlExtends.ms"
	-- */
	--function _sanitizeParametersByControlType =
	--(
	--	
	--),	
	--/** Get/set value of property 
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
	
	--/** Test method
	-- */
	--function testMethod =
	--(
	--	messageBox "testMethod" beep:false
	--),
	
	--/** Construct
	-- */
	--function _construct =
	--(
	--	--print "------------\nButton._construct()"
	--	type	= #button
	--),
	/** Test
	 */
	function test =
	(
		
	)
)

/** Control
 */
struct Control_v 
(
	include "Lib/Controls/Control/ControlBody.ms"
	--include @"c:\Users\vilbur\AppData\Local\Autodesk\3dsMax\2016 - 64bit\ENU\scripts\Library\_UI\Lib\Controls\Control\ControlBody.ms" 

	
	/*------------------------------------------------------------------------------
		INTERFACE METHODS
	--------------------------------------------------------------------------------*/
	
	
	
	/*------------------------------------------------------------------------------
		PRIVATE
	--------------------------------------------------------------------------------*/
	--/** Sanitize parameters by specific control type
	--  *
	--  * This method must be in all structs which include "ControlBody.ms"
	-- */
	--function _sanitizeParame tersByControlType =
	--(
	--	
	--),

	function test =
	(
		messagebox "Control_v.test()"
	)
)

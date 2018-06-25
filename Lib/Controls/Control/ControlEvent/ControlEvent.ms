/** Control
	

	
 */
struct ControlEvent_v 
(
	/* dependency */
	Events	= Events_v event_types:#("pressed", "changed"),
	--event_types	= #("pressed", "changed"),
	parent_control,

	/** Bind pressed event
	 *	@param	string	callback	Code executed on event
	 *	@param	callback	tooltip	Tooltip for control
	 */
	function pressed callback tooltip:"" =
	(
		this.Events._setEvent (Event_v type:"pressed" code:callback) --return 
	),
	/** Bind changed event
	  * Value of control is passed to control as variable "val" 
	 *	@param	string	callback	Code executed on event
	 *	@param	callback	tooltip	Tooltip for control
	  */
	function changed callback tooltip:"" =
	(
		this.Events._setEvent (Event_v type:"changed" code:callback params:"val") --return
	),
	/** _bind default event
	 */
	function _bindDefaultEvents =
	(
		
	),
	/** _add handlers
	 */
	function _addHandlers =
	(
		
	),
	function test =
	(
		messagebox "Control_v.test()"
	)
)

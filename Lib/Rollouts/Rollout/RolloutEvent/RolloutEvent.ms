/** Control
  
  
  
  
 */
struct RolloutEvent_v 
(
	/* dependency */
	Events	= Events_v event_types:#("open", "close"),
	--event_types	= #("open", "close"),
	parent_control,
	
	/** Bind pressed event
	  
	 */
	function open callback tooltip:"" =
	(
		this.Events._setEvent (Event_v type:"open" code:callback) --return
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

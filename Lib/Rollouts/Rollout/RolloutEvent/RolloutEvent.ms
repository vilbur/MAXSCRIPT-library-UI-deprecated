 /** Control
  *		
  *		
  *		
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
	/** Bind pressed event
	  
	 */
	function close callback tooltip:"" =
	(
		--this.Events._setEvent (Event_v type:"close" code:callback) --return
	),
	/** _bind default event
	 */
	function _bindDefaultEvents =
	(
		--	section_key	= filterString parent_control.id "."
			
			save_to_ini = "messagebox (\"Yeees default event\" )"
			--save_to_ini = "messagebox (\"Yeees default event\" )"
			--save_to_ini = "messagebox (\\\"Yeees default event\\\" )"
			
			this.Events._setDefaultEvent (Event_v type:"open" code:save_to_ini  )
	),
	/** _add handlers
	 */
	function _addHandlers =
	(
		_Events = this.Events._getEvents()
		--print ( "RolloutEvent_v._addHandlers() _Events =" + _Events  as string )
		--print ( "parent_control=" + parent_control.roll as string )
		
		
		for _Event in _Events do
		--print ( "RolloutEvent_v._addHandlers() "+parent_control.id+" on "+ _Event.type +" =" + _Event.code  as string )
			parent_control.roll.addText ("on "+parent_control.id+" rolledUp val do ("+_Event.code + ")" ) 

		
	),
	
	function test =
	(
		messagebox "Control_v.test()"
	)
)

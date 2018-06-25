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

	/** _bind default event
	 */
	function _bindDefaultEvents =
	(
		--	section_key	= filterString parent_control.id "."
			
			save_to_ini = "messagebox \"Yeees\""
			
			this.Events._setDefaultEvent (Event_v type:"open" code:save_to_ini  )
	),
	/** _add handlers
	 */
	function _addHandlers =
	(
		--print ( "RolloutEvent_v._addHandlers=" + this.Events._getEvents() as string )
		_Events = this.Events._getEvents()
		print ( "RolloutEvent_v._addHandlers() _Events =" + _Events  as string )
		--print ( "parent_control=" + parent_control.roll as string )
		for _Event in _Events do
		(
			callback_string	= "on "+parent_control.id+" rolledUp val do "+_Event.code 
			
			print "-----------------------------"
			--print ( "parent_control.id=" + parent_control.id as string )
			--print ( "_Event.type =" + _Event.type  as string )
			--print ( "_Event=" + _Event as string )
			parent_control.roll.addText callback_string 
		)
			--parent_control.parent_roll.roll.addText  parent_control.id _Event.type codeStr:_Event.code 
		
	),
	
	function test =
	(
		messagebox "Control_v.test()"
	)
)

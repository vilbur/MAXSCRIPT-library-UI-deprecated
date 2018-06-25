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
		this.Events._setEvent (Event_v type:"open" code:callback params:"val" ) --return
		--this.Events._setEvent (Event_v type:"open" code:callback params:"val" ) --return
	),
	/** Bind pressed event
	  
	 */
	function close callback tooltip:"" =
	(
		this.Events._setEvent (Event_v type:"close" code:callback params:"val" ) --return
	),
	/** _bind default event
	 */
	function _bindDefaultEvents =
	(
			--save_to_ini = "print (\"Event: default \"+val as string )"
			
			section_key	= filterString parent_control.id "."
			
			save_to_ini = parent_control.id + ".saveIni @"+section_key[1]+"@ @open@ (val as string )"

			this.Events._setDefaultEvent (Event_v type:"open"	code:save_to_ini  )
			this.Events._setDefaultEvent (Event_v type:"close"	code:save_to_ini  )
	),
	/** _add handlers
	 */
	function _addHandlers =
	(
		parent_control.roll.addText ("on "+parent_control.id+" rolledUp val do ("+ this._getCallback() + ")" )
	),
	/** _get llback
	 */
	function _getCallback =
	(
		code_open	= this._getEventCode "open"
		code_close	= this._getEventCode "close"
		
		"if(val==true)then (" +code_open+ ")else("+code_close+")" --return
	),
	/** _get event code
	 */
	function _getEventCode event_type =
	(
		_Event	= this.Events.getEvent event_type
		
		if( _Event!=undefined ) then
			_Event.code --return
		else
			"" --return
	),
	
	function test =
	(
		messagebox "Control_v.test()"
	)
)

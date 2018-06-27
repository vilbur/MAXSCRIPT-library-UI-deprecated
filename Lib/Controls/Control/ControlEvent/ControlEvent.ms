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
		section_key	= filterString parent_control.path "."
		
		save_to_ini = parent_control.parent_roll.id + ".saveIni @"+section_key[1]+"@ @"+section_key[2]+"@ (val as string )"
		
		this.Events._setDefaultEvent (Event_v type:"changed" code:save_to_ini params:"val")
	),
	/** _add handlers
	 */
	function _addHandlers =
	(
		--print ( "ControlEvent_v._addHandlers=" + this.Events._getEvents() as string )
		_Events = this.Events._getEvents()
		
		for _Event in _Events do
			parent_control.parent_roll.roll.addhandler  parent_control.id _Event.type codeStr:_Event.code  paramStr:_Event.params 
		
	),
	function test =
	(
		messagebox "Control_v.test()"
	)
)

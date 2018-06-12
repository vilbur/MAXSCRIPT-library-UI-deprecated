
/** Events
 */
struct Events_v 
(
	Events	= List_v(),
	parent_control,

	/** Bind pressed event
	  * @param	string	callback	Code executed on event
	  * @param	callback	tooltip	Tooltip for control
	 */
	function pressed callback tooltip:"" =
	(
		this._setEvent (Event_v type:"pressed" code:callback)
		
		parent_control --return 
	),
	/** Bind changed event
	  * Value of control is passed to control as variable "val" 
	  *
	  * @param	string	callback	Code executed on event
	  * @param	callback	tooltip	Tooltip for control
	  */
	function changed callback tooltip:"" =
	(
		--callback = "messagebox @"+parent_control.path+"@;" + callback
		--callback = "messagebox @"+parent_control.path+"@;" + callback
		callback = parent_control.parent_roll.id + ".save @"+parent_control.path+"@ val;" + callback
		
		--"messagebox @"+parent_control.path+"@;" + callback
		
		this._setEvent (Event_v type:"changed" code:callback params:"val")
		
		parent_control --return 
	),
	
	/** Set Event to Events
	 */
	function _setEvent Event =
	(
		this.Events.setVal Event.type Event
	),
	
	/**  
	 */
	function _addHandlers parent_control =
	(
		this.parent_control = parent_control
		
		for event in this.Events.values do
			this._addHandler event
	),
	/** Add event handler
	  
	 */
	function _addHandler Event =
	(
		if( Event.type=="pressed" ) then
			parent_control.parent_roll.roll.addhandler	parent_control.id Event.type codeStr:Event.code
		
		else
			parent_control.parent_roll.roll.addhandler	parent_control.id Event.type codeStr:Event.code  paramStr:Event.params
	),
	
	function test =
	(
		messagebox "Events_v.test()"
	)	
)

/** Control
 *		  
 *	IMPORTANT: Add New Type:
 *		1) Create method in this file
 *		2) Extend this method in struct Control_v
 *		
 */
struct ControlEvent_v 
(
	/* dependency */
	Events	= Events_v event_types:#("pressed", "rightclick", "changed"), -- 

	parent_control,

	/*---------------------------------------
		BIND EVENT BY TYPE
		
		Common parameters:
			@param	string	callback	Code executed on event
			@param	callback	tooltip	Tooltip for control
	-----------------------------------------*/
	/** Bind pressed event

	 */
	function pressed callback tooltip:"" =
	(
		this.Events._setEvent (Event_v type:"pressed" code:callback) --return 
	),
	/** Bind changed event
	  * Value of control is passed to control as variable "val" 
	  */
	function changed callback tooltip:"" =
	(
		this.Events._setEvent (Event_v type:"changed" code:callback params:"val") --return
	),
	/** Bind rightclick event
	  */
	function rightclick callback tooltip:"" =
	(
		this.Events._setEvent (Event_v type:"rightclick" code:callback ) --return
	),
	/*---------------------------------------
		PRIVATE 
	-----------------------------------------*/
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

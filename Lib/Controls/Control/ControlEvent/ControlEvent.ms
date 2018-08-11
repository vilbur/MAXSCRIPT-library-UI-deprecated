/** Control
 *
 *	====================================================================
 *
 *		!!!!!! IMPORTANT !!!!!!
 *
 *		Add New EVENT Type:
 *			1) Create method in this file
 *			2) Extend this method in struct Control_v
 *		
 *	====================================================================
 *		
 */
struct ControlEvent_v 
(
	/* dependency */
	Events	= Events_v event_types:#("pressed", "rightclick", "changed"),

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
		this._setEvent "pressed" callback tooltip
	),
	/** Bind changed event
	  * Value of control is passed to control as variable "val" 
	  */
	function changed callback tooltip:"" =
	(
		this._setEventWithValue "changed" callback tooltip
	),
	/** Bind rightclick event
	  */
	function rightclick callback tooltip:"" =
	(
		this._setEvent "rightclick" callback tooltip
	),

	/** Set default event, save to ini if ini is defined in rollout
	 */
	function setDefaultEvents =
	(
		section_key	= filterString parent_control.path "."
		
		if( parent_control.parent_roll.ini != undefined ) then
		(
			save_to_ini = parent_control.parent_roll.id + ".saveIni @"+section_key[1]+"@ @"+section_key[2]+"@ (val as string )"
			
			this.Events.setDefaultEvent(Event_v type:"changed" code:save_to_ini params:"val")
		)
	),
	/*---------------------------------------
		PRIVATE 
	-----------------------------------------*/
	/** Set event
	 */
	function _setEvent type callback tooltip =
	(
		this.Events.setEvent (Event_v type:type code:callback tooltip:tooltip)
		
		parent_control --return
	),
	/** Set event with parameter in callback, E.G.: for checkbox
	  *	placeholder for variable of value is "val"
	 */
	function _setEventWithValue type callback tooltip =
	(
		this.Events.setEvent (Event_v type:type code:callback tooltip:tooltip params:"val")
		
		parent_control --return
	),

	/** _add handlers
	 */
	function _addHandlers =
	(
		--print ( "ControlEvent_v._addHandlers=" + this.Events.getEvents() as string )
		_Events = this.Events.getEvents()
		
		for _Event in _Events do
			parent_control.parent_roll.roll.addhandler  parent_control.id _Event.type codeStr:_Event.code  paramStr:_Event.params 
		
	),
	function test =
	(
		messagebox "Control_v.test()"
	)
)

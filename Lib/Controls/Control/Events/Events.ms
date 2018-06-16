/** Events
 */
struct Events_v 
(
	Events	= List_v(),
	Events_default	= List_v(),
	event_types	= #("pressed", "changed"),
	parent_control,
	
	
	/** Bind default event called before user defined callback
	 */
	function _bindDefaultEvent =
	(

		if( parent_control.type == #checkbox ) then
		(
			section_key	= filterString parent_control.path "."
			
			save_to_ini = parent_control.parent_roll.id + ".saveIni @"+section_key[1]+"@ @"+section_key[2]+"@ (val as string )"
			
			this._setDefaultEvent (Event_v type:"changed" code:save_to_ini params:"val")
		)

	),
	/*---------------------------------------
		EVENT TYPES
	-----------------------------------------*/
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
		this._setEvent (Event_v type:"changed" code:callback params:"val")
		
		parent_control --return 
	),
	/*---------------------------------------
		SET EVENTS TO LSIT
	-----------------------------------------*/
	/** Set Event to Events
	 */
	function _setDefaultEvent Event =
	(
		print ( "_setDefaultEvent=" + Event as string )
		this.Events_default.setVal Event.type Event
	),
	/** Set Event to Events
	 */
	function _setEvent Event =
	(
		this.Events.setVal Event.type Event
	),
	/*---------------------------------------
		ADDING EVENT HANDLERS
	-----------------------------------------*/
	/**  
	 */
	function _addHandlers parent_control =
	(
		this.parent_control = parent_control
		
		for event_type in event_types do
			this._addHandler (this._getEvents event_type)
	),
	/** Add event handler
	  
	 */
	function _addHandler Event =
	(
		if( Event!=undefined ) then
			parent_control.parent_roll.roll.addhandler  parent_control.id Event.type codeStr:Event.code  paramStr:Event.params 
	),
	/*---------------------------------------
		MERGE EVENTS
	-----------------------------------------*/
	/** Get events
	 */
	function _getEvents event_type =
	(
		Event_default	= Events_default.getVal	event_type
		Event	= Events.getVal	event_type
	
		if( Event_default!=undefined or Event!=undefined ) then
			this.mergeEvents Event_default Event
	),
	/** Merge events
	 */
	function mergeEvents Event_default Event =
	(
		Event_merged 	= Event_v type:(this._getEventProperty Event_default Event "type")
		Event_merged.params	= this._getEventProperty Event_default Event "params"
		Event_merged.code	= ( this._getCodeStr Event_default ) + ";" + ( this._getCodeStr Event )
		print ( "Event_merged=" + Event_merged as string )
		Event_merged --return
	),
	/** Get property from one of ddefined evetts
	 */
	function _getEventProperty Event_default Event property =
	(
		if( Event_default!=undefined ) then
			getProperty Event_default property --return
			
		else
			getProperty Event property --return
	),
	/** Get code str
	 */
	function _getCodeStr Event =
	(
		if( Event!=undefined ) then
			Event.code
		else
			""
	),

	
	function test =
	(
		messagebox "Events_v.test()"
	)	
)

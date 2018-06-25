/** Events
  *
  * @property	array	event_types	Allowed types of events, E.G.: for button event_types = #("pressed", "changed")
  *
  *
 */
struct Events_v 
(
	Events	= List_v(),
	Events_default	= List_v(),
	event_types,
	--parent_control,
	
	
	/** Bind default event called before user defined callback
	 */
	function _bindDefaultEvent =
	(

		--if( parent_control.type == #checkbox ) then
		--(
		--	section_key	= filterString parent_control.path "."
		--	
		--	save_to_ini = parent_control.parent_roll.id + ".saveIni @"+section_key[1]+"@ @"+section_key[2]+"@ (val as string )"
		--	
		--	this._setDefaultEvent (Event_v type:"changed" code:save_to_ini params:"val")
		--)
		--else if( parent_control.type == #rollout ) then
		--(
		--	section_key	= filterString parent_control.id "."
		--	
		--	save_to_ini = "messagebox \"message\""
		--	
		--	this._setDefaultEvent (Event_v type:"open" code:save_to_ini  )
		--
		--)

	),
	--/*---------------------------------------
	--	EVENT TYPES
	--	
	--	PARAMETERS:
	--		@param	string	callback	Code executed on event
	--		@param	callback	tooltip	Tooltip for control
	--
	-------------------------------------------*/
	--/** Bind pressed event
	-- */
	--function pressed callback tooltip:"" =
	--(
	--	this._setEvent (Event_v type:"pressed" code:callback) --return 
	--),
	--/** Bind changed event
	--  * Value of control is passed to control as variable "val" 
	--  */
	--function changed callback tooltip:"" =
	--(
	--	this._setEvent (Event_v type:"changed" code:callback params:"val") --return
	--),
	--/** Bind pressed event
	-- */
	--function open callback tooltip:"" =
	--(
	--	this._setEvent (Event_v type:"open" code:callback) --return
	--),

	/*---------------------------------------
		SET EVENTS TO LIST
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
		--print ( "Events_v._setEvent()=" + Event as string )
		this.Events.setVal Event.type Event
		
		--parent_control --return 
	),
	--/*---------------------------------------
	--	ADDING EVENT HANDLERS
	-------------------------------------------*/
	/**  
	 */
	function _getEvents =
	(
		Events_merged	= #()
		--parent_control	= _parent_control
		
		for event_type in event_types do
			append Events_merged (this.getEvent event_type)
		
		--Events_merged --return
		for Event_merged in Events_merged where Event_merged!=undefined collect Event_merged --return
			
	),
	--/** Add event handler
	--  
	-- */
	--function _addHandler Event =
	--(
	--	if( Event!=undefined ) then
	--		parent_control.parent_roll.roll.addhandler  parent_control.id Event.type codeStr:Event.code  paramStr:Event.params 
	--),
	/*---------------------------------------
		MERGE EVENTS
	-----------------------------------------*/
	/** Get events
	 */
	function getEvent event_type =
	(
		--print ( "Events_v._mergeEvent() " + event_type as string )
		Event_default	= Events_default.getVal	event_type
		Event	= Events.getVal	event_type
		
		if( Event_default!=undefined or Event!=undefined ) then
			this.mergeEvents Event_default Event
			
		--print ( "Events_v._mergeEvent() " + event_type as string )
	),
	/** Merge events
	 */
	function mergeEvents Event_default Event =
	(
		Event_merged 	= Event_v type:(this._getEventProperty Event_default Event "type")
		Event_merged.params	= this._getEventProperty Event_default Event "params"
		Event_merged.code	= ( this._getCodeStr Event_default ) + ";" + ( this._getCodeStr Event )
		print ( "===Event_merged=" + Event_merged as string )
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

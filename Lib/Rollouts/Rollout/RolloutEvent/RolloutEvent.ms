 /** RolloutEvent
  *		
  *		
  */
struct RolloutEvent_v 
(
	event_types	= #("onOpen", "onClose"),
	/* dependency */
	Events	= Events_v event_types:event_types,
	parent_control,
	
	/** Bind pressed event
	  
	 */
	function onOpen callback tooltip:"" =
	(
		this.Events._setEvent (Event_v type:"onOpen" code:callback params:"val" tooltip:tooltip ) --return
	),
	/** Bind pressed event
	  
	 */
	function onClose callback tooltip:"" =
	(
		this.Events._setEvent (Event_v type:"onClose" code:callback params:"val" tooltip:tooltip ) --return
	),
	
	/*---------------------------------------
		PRIVATE 
	-----------------------------------------*/
	/** Add default callback for event
	  * Default callback function is added in "Rollout_v._addSaveIniFunction()"
	  *
	 */
	function setDefaultEvents =
	(
		print (parent_control.id + ".setDefaultEvents()")
		--rollout_id_split	= filterString parent_control.id "."
		--save_to_ini_method	= parent_control.id + ".saveIni @"+rollout_id_split[1]+"@ @open@ ( val as string )"
		save_to_ini_method	= parent_control.id + ".saveIni @"+rollout_id_split[1]+"@ @open@ ( val as string )"
		--
		----print ( "RolloutEvent_v._bindDefaultEvents() save_to_ini_method = " + save_to_ini_method as string )
		this.Events.setDefaultEvent ( Event_v type:"onOpen"	code:save_to_ini_method )
		--this.Events.setDefaultEvent ( Event_v type:"onClose"	code:save_to_ini_method )
	),
	/** Bind events handlers to rollout 
	 */
	function _addHandlers =
	(
		--parent_control._rolloutCreator.addText ("on "+parent_control.id+" rolledUp val do ("+ this._getCallback() + ")" )
	),
	/** Get callback on rollout open\close
	 */
	function _getCallback =
	(
		callback_open	= this._getEventCode "onOpen"
		callback_close	= this._getEventCode "onClose"
				
		"if( val==true ) then (" +callback_open+ ")else(" +callback_close+ ")" --return
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

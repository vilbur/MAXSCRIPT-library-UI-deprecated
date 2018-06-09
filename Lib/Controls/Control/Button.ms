
/** Button
 */
struct Button_v 
(
	self	= this,
	--events	= List(),
	--event = Event_v control:this,
	roll,
	type,
	id,
	caption,

	/**  Bind Event to control
	 */
	function bind type code_str param_str =
	(
		event	= Event_v roll:this.roll control:id type:type code_str:code_str param_str:param_str
		
		this.events.setVal type event
	),
	/** Add control to UI 
	 */
	function _addButton =
	(
		this.roll.addButton this.type this.id this.caption paramStr:"width: 128"
		
		--this._addEvents()
	),
	/** Add events to UI 
	 */
	function _addEvents =
	(
		for event in this.events.values do
			event._add()
	)
	
)

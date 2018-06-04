
/** Control
 */
struct Control_v 
(
	self	= this,
	events	= List(),
	--event = Event_v control:this,
	roll,
	type,
	id,
	caption,


	function pressed code params =
	(
		this.bind #pressed code params 
	),
	/**  Bind Event to control
	 */
	function bind type code params =
	(
		event	= Event_v roll:this.roll control:id type:type code:code params:params
		
		this.events.setVal type event
	),
	/** Add control to UI 
	 */
	function _addControl =
	(
		this.roll.addControl this.type this.id this.caption paramStr:"width: 128"
		
		this._addEvents()
	),
	/** Add events to UI 
	 */
	function _addEvents =
	(
		for event in this.events.values do
			event._add()
	)
	
)


/** Control
 */
struct Control_v 
(
	self	= this,
	events	= List(),
	roll,
	type,
	id,
	title,

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
		this.roll.addControl this.type this.id this.title paramStr:"width: 128"
		
		this._addEvents()
	),
	/** Add events to UI 
	 */
	function _addEvents =
	(
		for event in this.events.values do
			event.add()
	)
	
)

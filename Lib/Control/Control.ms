
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

	/**  Bind event to control
	 */
	function bind type code params =
	(
		event	= Event_v roll:this.roll control:id type:type code:code params:params
		this.events.setVal type event
	),
	/** Add control to UI 
	 */
	function addControl =
	(
		this.roll.addControl this.type this.id this.title
		
		this.addEvents()
	),
	/** Add events to UI 
	 */
	function addEvents =
	(
		for event in this.events.values do
			event.add()
	)
	
)


/** Events
 */
struct Events_v 
(
	self	= this,
	events	= List(),
	parent_control,

	function pressed code params =
	(
		event	= Event_v type:"pressed" code:code params:params
		
		this.events.setVal #pressed event
		
	),
	function _add =
	(
		for event in this.events.values do
			this._addHandler event
	),
	
	/** Add handler
	 */
	function _addHandler event =
	(
		this.parent_control.parent_roll.roll.addhandler this.parent_control.id event.type codeStr:event.code
	),
	
	function test =
	(
		messagebox "Events_v.test()"
	)	
)

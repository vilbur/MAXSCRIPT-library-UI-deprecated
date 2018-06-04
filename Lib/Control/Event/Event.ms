
/** Event
 */
struct Event_v 
(
	self	= this,
	roll,
	control,
	type,
	code,
	params,
	events	= List(),

	function pressed code =
	(
		
		--this.roll.addhandler this.control #pressed codeStr:code_str
		--paramStr:this.params
		
	),
	function _add =
	(
		this.roll.addhandler this.control this.type codeStr:this.code paramStr:this.params
	)
	
)

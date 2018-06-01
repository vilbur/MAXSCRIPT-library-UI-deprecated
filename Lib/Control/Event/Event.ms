
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
	
	function add =
	(
		this.roll.addhandler this.control this.type codeStr:this.code paramStr:this.params
	)
	
)

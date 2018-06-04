
/** Control
 */
struct Control_v 
(
	self	= this,
	Events	= Events_v parent_control:this,
	parent_roll,
	type,
	id,
	caption,

	col_width	= 24,
	padding	= 2,
	width 	= 4,
	
	
	/** Add control to UI 
	 */
	function _addControl parent_roll pos =
	(
		width = this._getWidth()
		
		parent_roll.roll.addControl this.type this.id this.caption paramStr:("width: "+width as string +" height:24 pos:" + pos as string )
		
		this.Events._add this
		
		return [pos[1]+width + padding, pos[2]]
	),
	/** Get width
	 */
	function _getWidth =
	(
		return this.width * col_width
	),
	function test =
	(
		messagebox "Control_v.test()"
	)
)

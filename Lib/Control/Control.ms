
/** Control
 */
struct Control_v 
(
	self	= this,
	Events	= Events_v parent_control:this,
	Params	= Params_v(),
	Layout,
	parent_roll,
	type,
	id,
	caption,

	col 	= 4,

	/** Add control to UI 
	 */
	function _addControl parent_roll =
	(
		parent_roll.roll.addControl this.type this.id this.caption paramStr:(parent_roll.Layout.nextControlPos col)
		
		this.Events._add this
	),
	/** Get width
	 */
	function _getWidth =
	(
		return this.col * this.Layout.col_px
	),
	
	function test =
	(
		messagebox "Control_v.test()"
	)
)

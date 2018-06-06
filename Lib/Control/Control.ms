/** Control
 */
struct Control_v 
(
	Events	= Events_v parent_control:this,
	--Params	= Params_v(),
	Layout,
	parent_roll,
	type,
	id,
	caption,

	_col 	= 4,
	
	/** Params
	 */
	function params params_string =
	(
		
		
	),
	/** Col
	 */
	function col number =
	(
		_col = number
		
		return this
	),
	/** Add control to UI 
	 */
	function _addControl parent_roll =
	(
		--print ( _col );
		parent_roll.roll.addControl this.type this.id this.caption paramStr:(parent_roll.Layout._getControlsParams _col)
		
		this.Events._add this
	),
	/** Get width
	 */
	function _getWidth =
	(
		return this._col * this.Layout.col_px
	),
	
	function test =
	(
		messagebox "Control_v.test()"
	)
)

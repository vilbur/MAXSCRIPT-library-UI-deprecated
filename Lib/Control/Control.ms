/** Control
 */
struct Control_v 
(
	Events	= Events_v parent_control:this,
	_Params	= Params_v(),
	Layout,
	parent_roll,
	type,
	id,
	caption,

	_col 	= 4,
	
	/** Set params for control
	  * @param	string	params_string	String of params E.G.: "enabled: false, border: false"
	 */
	function params params_string =
	(
		string_split	= filterString params_string "," 

		for key_value_string in string_split do
		(
			key_value	= filterString key_value_string ":"
			_Params.add key_value[1] key_value[2]
		)
		return this 
	),
	/** Set width of control in columns 
	  * @param	integer	_width	Number of columns
	  * @return	self
	 */
	function col _width =
	(
		_col = _width
		
		return this
	),
	/** Add control to UI 
	 */
	function _addControl parent_roll =
	(
		--print ( _col );
		parent_roll.roll.addControl this.type this.id this.caption paramStr:(parent_roll.Layout._getControlsParams _Params _col)
		
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

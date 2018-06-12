/** Control
 */
struct Control_v 
(
	/* dependency */
	Events	= Events_v parent_control:this,
	_Params	= Params_v(),
	Layout,
	
	parent_roll,
	
	/* config */
	type,
	caption,
	id,
	
	/* options */
	_col 	= 4,
	
	/* access */ 
	path, -- full path to control id E.G.: "foo_rollout.bar_control"
	
	/* Extend methods */
	pressed = Events.pressed,
	changed = Events.changed,
	
	/** Init object
	 */
	function init =
	(
		this.path = parent_roll.id +"."+id
		print ( "path=" + this.path as string )
		return this
	),
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
	function _addControl =
	(
		--print ( "path=" + path as string )
		parent_roll.roll.addControl type id caption paramStr:(parent_roll.Layout._getControlsParams _Params _col)
		
		Events._addHandlers this
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

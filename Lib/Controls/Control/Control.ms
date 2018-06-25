/** Control
 */
struct Control_v 
(
	/* dependency */
	Events	= ControlEvent_v parent_control:this,
	_Params	= Params_v(),
	Layout,

	parent_roll,

	/* config */
	type,
	caption,
	id,
	value,

	/* options */
	_col 	= 4,

	/* access */ 
	path, -- full path to control id E.G.: "foo_rollout.bar_control"

	/*------ EXTENDED METHODS ------*/
	pressed = Events.pressed,
	changed = Events.changed,

	/** Init object
	 */
	function init =
	(
		this._setCaption()
		this._setPath()
		this._setValue()

		--this.Events._bindDefaultEvents()

		return this
	),
	/** Param
	 */
	function param key value =
	(
		_Params.add key value

		this --return
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

		this --return
	),

	/** _set value
	 */
	function _setValue =
	(
		if( value==undefined ) then
			this._getValueFromIni()

		key = #value

		if( value!=undefined and value!=""  ) then
		(
			if( type == #checkbox ) then
				key = #checked

			this.param key value

		) else
			this._getValueFromIni()

	),
	/** Get value from ini
	 */
	function _getValueFromIni =
	(
		value = (Ini_v ini:(parent_roll.ini)).load parent_roll.id id

	),
	/** Add control to UI 
	 */
	function _addControl =
	(
		print ("Control._addControl() " + type +" " + id +"=path"+path)

		parent_roll.roll.addControl type id caption paramStr:(parent_roll.Layout.getControlsParams _Params _col)

		--Events._addHandlers this
		
	),

	/** _set caption
	 */
	function _setCaption =
	(
		--caption = trimLeft (trimRight caption)
		caption	= trimLeft ( trimRight  caption "_" )  "_"
	),
	/** Set path
	 */
	function _setPath =
	(
		this.path = parent_roll.id +"."+id
	),
	/** Get width
	 */
	function _getWidth =
	(
		return this._col * this.Layout.col_px
	),
	/** _get tooltip
	 */
	function _getTooltip =
	(

	),
	function test =
	(
		messagebox "Control_v.test()"
	)
)

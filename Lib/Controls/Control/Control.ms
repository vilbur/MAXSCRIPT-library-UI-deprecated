/** Control
 */
struct Control_v 
(
	/* dependency */
	ControlEvent	= ControlEvent_v parent_control:this,
	_Params	= Params_v(),
	Layout,

	parent_roll,

	/* config */
	type,	-- type of control E.G.: #button
	caption,
	id,
	value,

	/* options */
	_col 	= 4,

	/* access */ 
	path, -- full path to control id E.G.: "foo_rollout.bar_control"

	/*------ EXTENDED METHODS ------*/
	pressed	= ControlEvent.pressed,
	changed	= ControlEvent.changed,
	rightclick	= ControlEvent.rightclick,

	/** Init object
	 */
	function init =
	(
		this._setCaption()
		this._setId()
		this._setPath()
		this._setValue()

		this.ControlEvent.setDefaultEvents()

		return this
	),
	/** Param
	 */
	function param key value =
	(
		_Params.add ( key as string ) value

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

	/** Get\Set property of control, or get promise string
	  * @param	string|name	prop_name	Name of property
	  * @param	mixin|#get|#path	_value	Value or mode of set\get
	  *
	  * @example this.prop #state #get	// return current value of property "state"
	  * @example this.prop #state #path	// return path string to property e.g.: "rollout_id.control_id.state"
	  * @example this.prop #state true	// set value to control
	  *
	  * @return	string	Path to controls property
	 */
	function prop prop_name _value =
	(
		prop_path	= path + "." + ( prop_name as string )
		
		if( _value == #get ) then 
			execute prop_path
			
		else if( _value == #path ) then 
			prop_path -- return path to property 

		else
			execute (prop_path + "="+_value as string ) -- set value
			
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
		--value = (Ini_v ini:(parent_roll.ini)).load parent_roll.id id
		ini_path = parent_roll.ini
		
		value = ((Ini_v()).path ini_path ).load parent_roll.id id
	),
	/** Add control to UI 
	 */
	function _addControl =
	(
		--print ( "Control_v._addControl() " + id as string )
		--print ( "Control_v._addControl() " + (id+(parent_roll.Layout.getControlsParams _Params _col)) as string )
		parent_roll.roll.addControl type id caption paramStr:(parent_roll.Layout.getControlsParams _Params _col + this._getTooltip())

		ControlEvent._addHandlers()
	),
	/** Get id
	 */
	function _setId =
	(
		id_source	= ( if( id==undefined or id=="" )then caption else id ) as string

		id = ( ( dotnetObject "System.Text.RegularExpressions.Regex" @"[^A-Za-z0-9_]+" ).Replace ( toLower (id_source) ) "" ) as string
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
		path = parent_roll.id +"."+id
	),
	/** Get width
	 */
	function _getWidth =
	(
		return this._col * this.Layout.col_px
	),
	/** Get tooltip, if button then get tooltips from events
		Set prefixes "Leftclick:" & "\nRightclick:"
	 */
	function _getTooltip =
	(
		tooltip =	""
		
		if( type == #button ) then
		(
			Event_pressed	= ControlEvent.Events.getEvent "pressed"
			Event_rightclick	= ControlEvent.Events.getEvent "rightclick" 
			--print ( "Event_pressed = " + Event_pressed as string )
			--print ( "Event_rightclick = " + Event_rightclick as string )
			
			if( Event_pressed != undefined  and Event_rightclick != undefined ) then
				tooltip = "Leftclick:    " + Event_pressed.tooltip + "\nRightclick: " + Event_rightclick.tooltip

			else if( Event_pressed != undefined ) then
				tooltip = Event_pressed.tooltip
		)
		
		if( tooltip!=undefined ) then ( " tooltip:\""+tooltip+"\"" ) else "" --return
	),
	function test =
	(
		messagebox "Control_v.test()"
	)
)






















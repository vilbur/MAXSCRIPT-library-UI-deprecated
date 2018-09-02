	/* dependency */
	ControlEvent	= ControlEvent_v parent_control:this,
	_Params	= Params_v(),
	--Layout,

	parent_roll,
	name_of_value_param	= #value,
	
	/* config */
	id,
	type,	-- type of control E.G.: #button
	caption,
	
	value,
	
	/* options */
	_col 	= 4,
	dimensions	= #(),	-- dimensions of conrol #( [xy] position, integer width, integer height )
	
	/* access */ 
	path, -- full path to control id E.G.: "foo_rollout.bar_control"

	/*------ EXTENDED EVENTS ------*/
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
		--this._setDimensions()

		this.ControlEvent.setDefaultEvents()

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
	/** Param
	 */
	function param key value =
	(
		_Params.add ( key as string ) value

		this --return
	),	
	
	/** Set width of control in columns 
	  * @param	integer	columns	Number of columns
	  * @return	self
	 */
	function col columns =
	(
		_col = columns

		this --return
	),

	/** Get\Set property of control, or get promise string
	  * @param	string|name	prop_name	Name of property 
	  * @param	mixin|#get|#path	_value	Value or mode of set\get
	  *
	  * @example this.prop #state "value"	// set value to control
	  * @example this.prop #state #get	// return current value of property "state"
	  * @example this.prop #state #path	// return path string to property e.g.: "rollout_id.control_id.state"
	  *
	  * @return	string	Path to controls property
	 */
	function prop prop_name _value =
	(
		prop_path	= path + "." + ( prop_name as string )
		format "\nprop_path = % " prop_path

		if( _value == #get ) then 
			execute prop_path
			
		else if( _value == #path ) then 
			prop_path -- return path to property 

		else
			execute (prop_path + "="+_value as string ) -- set value
			
	),
	
	/*------------------------------------------------------------------------------
		PRIVATE
	--------------------------------------------------------------------------------*/

	/** _set value
	 */
	function _setValue =
	(
		if( value==undefined ) then
			this._getValueFromIni()

		if( value!=undefined and value!=""  ) then
			this._setValueParameter value
		--else
			--this._getValueFromIni()
	),
	/** Add quotes to parameter if value is string
	  * Add value to params
	 */
	function _setValueParameter value =
	(
		if( classOf value == string ) then 
			value = "\""+value+"\""
		
		this.param name_of_value_param value
	),
	/** Get value from ini
	 */
	function _getValueFromIni =
	(
		ini_path = parent_roll.ini
		
		if( ini_path != undefined ) then
			value = ((Ini_v()).path ini_path ).load parent_roll.id id --return 
	),
	/** _set dimensions
	 */
	function _setDimensions =
	(
		--print ( "_Params = " + _Params as string )
		dimensions = parent_roll.Layout.setControlDimensions _col (_Params.get #pos) (_Params.get #width) (_Params.get #height)
	
		_Params.add #pos	dimensions[1] force:false
		_Params.add #width	dimensions[2] force:false
		_Params.add #height dimensions[3] force:false
	),
	/** Add control to UI 
	 */
	function _addControl =
	(
		--this._sanitizeParametersByControlType()
		format "\n\n=== ControlBody._addControl()\nid = % " id
		--parent_roll.roll.addControl type id caption paramStr:(this._getParameters())
		parent_roll.roll.addControl type id caption paramStr:(this._getParameters())

		ControlEvent._addHandlers()
	),
	/** Get id
	 */
	function _setId =
	(
		id_source	= ( if( id==undefined or id=="" )then caption else id ) as string
		--format "\n\n=== ControlBody._setId()\nid_source = % " id_source
		id = ( ( dotnetObject "System.Text.RegularExpressions.Regex" @"[^A-Za-z0-9_]+" ).Replace ( toLower (id_source) ) "" ) as string
		
		if( id == "" ) then 
			id = type  as string + random 1000 9999  as string
	),
	/** _set caption
	 */
	function _setCaption =
	(
		caption	= trimLeft ( trimRight  caption "_" )  "_"
	),
	/** Set path
	 */
	function _setPath =
	(
		path = parent_roll.id +"."+id
	),
	--/** Get width
	-- */
	--function _getWidth =
	--(
	--	format "\nControlBody._getWidth()\n" 
	--	--return this._col * this.Layout.col_px
	--),
	/** Get parameters
	 */
	function _getParameters =
	(
		this._setDimensions()

		_Params.join() + this._getTooltip() --return
	),

	/** Get tooltip, if button then get tooltips from eventsz
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
	--
	--/** Get Name of value parameter by type of control E.G.: CKECBOX = #checked | EDITTEXT = #text | DEFAULT = #value
	--  * 
	--  * Return value name_of_value_param property if defined, else return #value
	--  * 
	--  * @return	name 
	-- */
	--function _getNameOfValueParameter =
	--(
	--	if( hasProperty this "name_of_value_param" ) then name_of_value_param else name_of_value_param_extend --return
	--),
	
	

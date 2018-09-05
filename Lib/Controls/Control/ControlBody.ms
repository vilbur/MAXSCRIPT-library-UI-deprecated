	/* dependency */
	Events	= ControlEvents_v parent_control:this,
	Prop	= Props_v Control:this,
	--Layout,

	Parent_roll,
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
	control, -- full path to control id E.G.: "foo_rollout.bar_control"

	/*------ EXTENDED EVENTS ------*/
	pressed	= Events.pressed,
	changed	= Events.changed,
	rightclick	= Events.rightclick,

	/** Init object
	 */
	function init =
	(
		--print "------------\nControlBody.init()"
		this._setCaption()
		this._setId()
		this._setControl()

		this.Events.setDefaultEvents()
		--this.exists()
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
			Prop.add key_value[1] key_value[2]
		)
		this --return  
	),
	/** Param
	 */
	function param key value =
	(
		Prop.add ( key as string ) value

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
	/** Find if control is rendered in ui already
	  *
	  * When rollout is rendered, then control is rendered immediately
	 */
	function exists =
	(
		Parent_roll.exists() --return
	),
	
	/*------------------------------------------------------------------------------
		PRIVATE
	--------------------------------------------------------------------------------*/
	/** Add control to UI 
	 */
	function _renderControl =
	(
		--print "------------\nControlBody._renderControl()"
		this._setValue()

		Parent_roll.roll.addControl type id caption paramStr:(this._getParameters())

		Events._addHandlers()
	),
	
	/*---------------------------------------
		GETTERS & SETTERS
	-----------------------------------------*/
	/** _set value
	 */
	function _setValue =
	(
		if( value==undefined ) then
			this._getValueFromIni()

		if( value!=undefined and value!=""  ) then
			this._setValueParameter value
		----else
			----this._getValueFromIni()
	),
	/** Add quotes to parameter if value is string
	  * Add value to params
	 */
	function _setValueParameter value =
	(
		--print "------------\nControlBody._setValueParameter()"
		this.param name_of_value_param (this._formatDatatypeValue value)
	),
	/** Format datatype of value
	  * Put quotes around string value
	 */
	function _formatDatatypeValue value =
	(
		if( classOf value == String and this._isValueBooleanString value == false ) then 
			"\""+value+"\"" --return
		else
			value --return 
	),
	/** Is value boolean string E.G.: "true" OR "false"
	 */
	function _isValueBooleanString value =
	(
		matchPattern value pattern:"true" or matchPattern value pattern:"false" 
	),
	/** Get value from ini
	 */
	function _getValueFromIni =
	(
		print "------------\nControlBody._getValueFromIni()"
		ini_path = Parent_roll.ini
		
		if( ini_path != undefined ) then
			value = ((Ini_v()).path ini_path ).load Parent_roll.id id --return
			
		format " value	= % \n" value
		value --return
	),
	/** _set dimensions
	 */
	function _setDimensions =
	(
		--print "------------\nControlBody._setDimensions()"
		dimensions = Parent_roll.Layout.setControlDimensions _col (Prop.get #pos) (Prop.get #width) (Prop.get #height)
		--format " Prop.get #width = % \n" (Prop.get #width)
		--format " pos 	= % \n width	= % \n height	= % \n\n" dimensions[1] dimensions[2] dimensions[3]

		Prop.add #pos	dimensions[1] force:true
		Prop.add #width	dimensions[2] force:true
		Prop.add #height dimensions[3] force:true
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
		caption	= trimLeft ( trimRight caption "_" )  "_"
	),
	/** Set path
	 */
	function _setControl =
	(
		path = Parent_roll.id +"."+id
		control = Parent_roll.id +"."+id
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

		Prop.join() + this._getTooltip() --return
		--this._getTooltip() --return
	),

	/** Get tooltip, if button then get tooltips from eventsz
		Set prefixes "Leftclick:" & "\nRightclick:"
	 */
	function _getTooltip =
	(
		tooltip =	""
		
		if( type == #button ) then
		(
			Event_pressed	= Events.Events.getEvent "pressed"
			Event_rightclick	= Events.Events.getEvent "rightclick" 
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
	
	

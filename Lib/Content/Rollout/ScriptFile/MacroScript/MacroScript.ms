/** Struct present single macrosript in ".mcr" file
  *
  * This macro is able to add self calling button to UI
  * Macro is called with left click
  * Right click macro for button is added with another macroscript with same button name stored in "buttontext:"
  *
  */
struct MacroScript_Content_v
(
	name,
	category,
	buttontext,
	tooltip,
	icon,
	_macroScript,
	
	
	Controls_added	= #(),

	/** Set name
	 */
	function setName _string =
	(
		name	= trimLeft (trimRight (substring _string 13 -1))
		name	= ( dotnetObject "System.Text.RegularExpressions.Regex" "[\"]*" ).Replace name ""
		
		this --return
	),
	/** Set property
	 */
	function setProp props =
	(
		key	= trimLeft (trimRight (trimLeft props[1]))
		value	= ( dotnetObject "System.Text.RegularExpressions.Regex" "\"" ).Replace ( trimLeft ( trimRight props[2] )  ) ""
		--print ( key +" = " + value as string )
		if( hasProperty this key ) then
			setProperty this key value

		this --return
	),
	
	/*---------------------------------------
		PRIVATE
	-----------------------------------------*/	
	/** Insert Macro as button to UI
	  * Button runs macro on preesed
	 */
	function _addControls _Controls =
	(
		control_id	=  this.getControlId()
	
		_button	= _Controls.button (buttontext as string) id:control_id add:false
		_button_exists	= _Controls.get ( _button.id )
		
		if( _button_exists==false ) then
		(
			_button = this._setOnClickEvent #left _button 
			_controls.add _button
		)
		else
			_button = this._setOnClickEvent #right _button_exists 
	),
	/** Get control id
	 */
	function getControlId =
	(
		category as string + "_"+ buttontext as string --return
	),
	/** Set leftClick
	 */
	function _setOnClickEvent _mbutton Control =
	(
		callback = "macros.run @"+category+"@ @"+name+"@"
		
		if( _mbutton==#left ) then
			Control.pressed callback tooltip:tooltip
		
		else
			Control.rightclick callback tooltip:tooltip
		
		Control --return
	),

	function test =
	(
		messagebox "Content.test()"
	)
)
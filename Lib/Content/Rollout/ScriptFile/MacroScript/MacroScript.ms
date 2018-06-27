/** Content macro
 */
struct MacroScript_Content_v
(
	name,
	category,
	buttontext,
	toolTip,
	icon,
	_macroScript,
	self=this,
	/** Set name
	 */
	function setName _string =
	(
		--name	= ( dotnetObject "System.Text.RegularExpressions.Regex" @"macroScript\s+" ).Replace _string ""
		--name	= trimleft _string "macroScript "
		name	= trimLeft (trimRight (substring _string 13 -1))
		name	= ( dotnetObject "System.Text.RegularExpressions.Regex" "[\"]*" ).Replace name ""
		this --return
	),
	/** Set property
	 */
	function setProp props =
	(
		key	=	 trimLeft (trimRight (trimLeft props[1]))
		--value	=	props[2]
		value	= ( dotnetObject "System.Text.RegularExpressions.Regex" "\"" ).Replace ( trimLeft ( trimRight props[2] )  ) ""

		if( hasProperty self key ) then
			setProperty self key value

		this --return
	),
	/** Insert Macro as button to UI
	  * Button runs macro on preesed
	 */
	function _addControls _controls =
	(

		button_name	= buttontext as string
		_button	= _controls.button button_name
		
		_button.pressed ("macros.run @"+category+"@ @"+name+"@")
		_button.params ( "Tooltip:"+(this._getTooltip()) )

	),
	/** _get tooltip
	 */
	function _getTooltip =
	(
		tooltip_text = "X"

		if( toolTip!=undefined ) then
		(
			string_split	= filterString toolTip "|"
			--print ( "string_split=" + string_split as string )
			if( string_split[1]!=undefined ) then
				tooltip_text = 	"" + string_split[1]

			if( string_split[2]!=undefined ) then
				tooltip_text += "\n" + string_split[2]
			--	"EMTY:"

		)
		--else
			--" macro @"+category+"@ @"+name+"@"

			"\""+tooltip_text+"\""

	),
	function test =
	(
		messagebox "Content.test()"
	)
)
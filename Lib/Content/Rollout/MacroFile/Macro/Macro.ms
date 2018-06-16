/** Content macro
 */
struct Macro_Content_v
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
		name	= ( dotnetObject "System.Text.RegularExpressions.Regex" @"macroScript\s+" ).Replace _string ""
		name	= ( dotnetObject "System.Text.RegularExpressions.Regex" "[\"]*" ).Replace name ""
		this --return
	),
	/** Set property
	 */
	function setProp props =
	(
		key	=	trimLeft props[1]
		--value	=	props[2]
		value	= ( dotnetObject "System.Text.RegularExpressions.Regex" "\"" ).Replace (trimLeft props[2]) ""

		if( hasProperty self key ) then
		(
			setProperty self key value
		)

		this --return
	),
	/** Insert to
	 */
	function insertToUi _controls =
	(
		button_name	= buttontext as string
		(_controls.button button_name).pressed ("print @HURAA@")
		
	),
	function test =
	(
		messagebox "Content.test()"
	)
)
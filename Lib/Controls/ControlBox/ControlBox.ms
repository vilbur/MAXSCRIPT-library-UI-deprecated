/** Section box of controls, an be groupbox if "ControlBox_v.groupbox" is set
  *
  * Id of groupbox has preffix "gb_"
 */
struct ControlBox_v 
(
	parent_roll,
	id,
	groupbox,

	/** Set parent roll
	 */
	function new _parent_roll _groupbox =
	(
		parent_roll	= _parent_roll
		groupbox	= _groupbox
		
		this --return 
	),	
	/** Add groupbox
	 */
	function addGroupBox =
	(
		print ( "ControlBox_v.addGroupBox() = " + groupbox as string )
		if( groupbox!=undefined ) then
			parent_roll.roll.addControl #groupbox (this.getId()) groupbox paramStr:(parent_roll.Layout._getGroupboxParams())
	),
	
	/** Get id
	 */
	function getId =
	(
		"_gb" + (( dotnetObject "System.Text.RegularExpressions.Regex" @"[\s-]+" ).Replace ( toLower groupbox ) "_" ) --return
	),

	function test =
	(
		messagebox "Control_v.test()"
	)
)

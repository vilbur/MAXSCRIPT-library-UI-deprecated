
/** ControlBox
 */
struct ControlBox_v 
(
	parent_roll,
	id,
	groupbox,
	--pos,

	/** Set parent roll
	 */
	function setNewControlBox _parent_roll _groupbox =
	(
		parent_roll	= _parent_roll
		groupbox	= _groupbox
		
		return this
	),	
	/** Add groupbox
	 */
	function addGroupBox =
	(
		if( groupbox!=undefined ) then
			parent_roll.roll.addControl #groupbox (this.getId()) groupbox paramStr:(parent_roll.Layout._getGroupboxParams())
	),
	
	/** Get id
	 */
	function getId =
	(
		return ( dotnetObject "System.Text.RegularExpressions.Regex" @"[\s-]+" ).Replace ( toLower groupbox ) "_";
	),

	function test =
	(
		messagebox "Control_v.test()"
	)
)

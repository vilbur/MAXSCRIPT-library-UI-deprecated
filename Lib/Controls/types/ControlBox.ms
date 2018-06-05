
/** ControlBox
 */
struct ControlBox_v 
(
	self	= this,
	parent_roll,
	id,
	groupbox,
	pos,

	/** Set parent roll
	 */
	function setNewControlBox _parent_roll =
	(
		parent_roll = _parent_roll
		
		parent_roll.Layout.setNewBoxPosition groupbox
		
		return this
	),	
	/** Add groupbox
	 */
	function _addGroupBox =
	(
		if( groupbox!=false ) then
		(
			parent_roll.roll.addControl #groupbox (this.getId()) groupbox paramStr:(parent_roll.Layout._getGroupboxParams())
			print ( "ControlBox_v._addGroupBox()=" + groupbox as string )
		)
		
		parent_roll.Layout.setNextBoxPosition()
	),
	
	/** Get id
	 */
	function getId =
	(
		return ( dotnetObject "System.Text.RegularExpressions.Regex" @"\s+" ).Replace groupbox "_";
	),
	


	function test =
	(
		messagebox "Control_v.test()"
	)
)

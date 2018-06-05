/** Controls
 */
struct Controls_v
(
	self = this,
	parent_roll,
	groupbox, -- store caption of groupbox
	--_Groupbox	= Groupbox_v(),
	--Layout	= Layout_v(),
	ControlBox,
	_Control	= #(),
	
	pos,
	pos_groupbox,
	
	/**  Add control of any type
	 *  @param	string	type	Type of control
	 *  @param	string	caption	Caption of control
	 *  @return	[Control](../../Control)
	 */
	function control type caption id =
	(
		Control_new = Control_v parent_roll:parent_roll type:type caption:caption id:id 
		
		append _Control Control_new
		
		return Control_new
	),
	/** Add controls
	 */ 
	function _addControls =
	(
		this.setNewControlBox()
		
		for Control in this._Control do
			Control._addControl parent_roll
		
		ControlBox._addGroupBox()
	),

	/** Set groupbox
	 */
	function setNewControlBox =
	(
		--if( this.groupbox!=false ) then
		ControlBox = (ControlBox_v groupbox:groupbox).setNewControlBox parent_roll
	),
	--/** Next control pos
	-- */
	--function nextControlPos pos =
	--(
	--	this.pos = [pos[1] + this.Layout.padding, pos[2]]
	--),
	--/** Add groupbox
	-- */
	--function addGroupbox =
	--(
	--	if( groupbox!=false ) then
	--		ControlBox._addGroupBox()
	--),
	
	function test =
	(
		messagebox "UI.test()"
	)
	
)

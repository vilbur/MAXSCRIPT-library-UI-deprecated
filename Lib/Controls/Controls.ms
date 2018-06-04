/** Controls
 */
struct Controls_v
(
	self = this,
	parent_roll,
	_Control	= #(),
	
	/**  Add control of any type
	 *  @param	string	type	Type of control
	 *  @param	string	caption	Caption of control
	 *  @return	[Control](../../Control)
	 */
	function control type caption id =
	(
		--messagebox "message" beep:false;
		
		Control_new = Control_v parent_roll:parent_roll type:type caption:caption id:id 
		
		append _Control Control_new
		
		return Control_new
	),
	/** Add controls
	 */
	function _addControls =
	(
		for Control in this._Control do
			--print Control
			Control._addControl parent_roll
	),
	--/** Add control to UI 
	-- */
	--function _addControl Control =
	--(
	--	this.parent_roll.roll.addControl Control.type Control.id Control.caption paramStr:"width: 128"		
	--),
	
	function test =
	(
		messagebox "UI.test()"
	)
	
)

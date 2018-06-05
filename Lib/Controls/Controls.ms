/** Controls
 */
struct Controls_v
(
	parent_roll,
	groupbox, -- store caption of groupbox
	ControlBox	= ControlBox_v(),
	_Control	= #(),
	
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
		this.setNewBoxPosition()
		
		for Control in this._Control do
			Control._addControl parent_roll
		
		this.addGroupbox()
		this.setNextBoxPosition()
	),

	--private
	/** Set groupbox
	 */
	function setNewControlBox =
	(
		ControlBox.setNewControlBox parent_roll groupbox
	),
	/** Set new box position
	 */
	function setNewBoxPosition =
	(
		parent_roll.Layout.setNewBoxPosition groupbox
	),
	/** Add groupbox
	 */
	function addGroupbox =
	(
		ControlBox.addGroupBox()
	),
	/** Set next box position
	 */
	function setNextBoxPosition =
	(
		parent_roll.Layout.setNextBoxPosition groupbox
	),
	
	function test =
	(
		messagebox "UI.test()"
	)
	
)

/** Controls
 */
struct Controls_v
(
	self = this,
	parent_roll,
	groupbox	= false, -- store caption of groupbox
	--_Groupbox	= Groupbox_v(),
	Layout	= Layout_v(),
	_Groupbox,
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
	function _addControls pos =
	(
		pos = this.setGroupbox pos
		this.nextControlPos pos

		for Control in this._Control do
			this.nextControlPos (Control._addControl parent_roll this.pos)

		this.addGroupbox()
		
		return this.pos
	),

	/** Set groupbox
	 */
	function setGroupbox pos =
	(
		if( this.groupbox==false ) then
			return pos
		
		_Groupbox = Groupbox_v caption:this.groupbox pos:pos
			
		--if this.groupbox!=false then y = pos[2]+16 else y = pos[2]
		return (_Groupbox._getControlsPosition())
	),
	/** Next control pos
	 */
	function nextControlPos pos =
	(
		this.pos = [pos[1] + this.Layout.padding, pos[2]]
	),
	/** Add groupbox
	 */
	function addGroupbox =
	(
		if( this.groupbox!=false ) then
			_Groupbox._add parent_roll this.pos
	),
	
	function test =
	(
		messagebox "UI.test()"
	)
	
)

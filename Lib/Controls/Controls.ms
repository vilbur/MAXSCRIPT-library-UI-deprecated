/** Controls
 */
struct Controls_v
(
	parent_roll,
	groupbox, -- caption of groupbox
	ControlBox	= ControlBox_v(),
	Controls	= #(),
	
	/**  Add control of any type
	 *  @param	string	type	Type of control
	 *  @param	string	caption	Caption of control
	 * 
	 *  @return	[Control](../../Control)
	 */
	function control type caption id value:undefined add:true =
	(
		print ( "----- control =" + type as string )
		
		if( id==undefined or id=="" ) then
			id = this.getId caption 
		
		Control_new = (Control_v parent_roll:parent_roll type:type caption:caption id:id value:value ).init() 
		
		if( add==true ) then
			this.add Control_new
		
		Control_new --return
	),
	/** Add control to rollout
	 */
	function add Control =
	(
		append Controls Control
	),
	
	/*---------------------------------------
		CONTROLS TYPES
	-----------------------------------------*/
	/** Add Button
	 */
	function button caption id:undefined add:true =
	(
		this.control #button caption id add:add
	),
	/** Add Checkbox
	 */
	function checkbox caption id:undefined add:true checked:undefined =
	(
		this.control #checkbox caption id value:checked add:add
	),
	/*---------------------------------------
		ADDING CONTROLS
	-----------------------------------------*/
	/** Add controls to rollout
	 */ 
	function _addControls =
	(
		print "-------Controls_v._addControls"
		--this.setNewControlBox()
		--this.setNewBoxPosition()
		ControlBox.new	parent_roll groupbox	-- Set new groupbox
		parent_roll.Layout.newControlsBox	groupbox	-- Set position to layout

		
		for Control in this.Controls do
			Control._addControl()
		
		ControlBox.addGroupBox()	-- Add groupbox control
		parent_roll.Layout.nextControlsBox groupbox	--
		--this.addGroupbox()
		--this.setNextBoxPosition()
	),

	--private
	--/** Set groupbox
	-- */
	--function setNewControlBox =
	--(
	--	ControlBox.setNewControlBox parent_roll groupbox
	--),
	--/** Set new box position
	-- */
	--function setNewBoxPosition =
	--(
	--	parent_roll.Layout.setNewBoxPosition groupbox
	--),
	--/** Set next box position
	-- */
	--function setNextBoxPosition =
	--(
	--	parent_roll.Layout.setNextBoxPosition groupbox
	--),
	--/** Add groupbox
	-- */
	--function addGroupbox =
	--(
	--	ControlBox.addGroupBox()
	--),
	/*---------------------------------------
		HELPERS
	-----------------------------------------*/
	/** Get id
	 */
	function getId caption =
	(
		return ( dotnetObject "System.Text.RegularExpressions.Regex" @"\s+" ).Replace ( toLower caption ) "_";
	),
	
	function test =
	(
		messagebox "UI.test()"
	)
	
)

/** Controls
 */
struct Controls_v
(
	parent_roll,
	groupbox, -- caption of groupbox
	ControlBox	= ControlBox_v(),
	_Control	= #(),
	
	/*---------------------------------------
		DEFINITION CONTROLS
	-----------------------------------------*/
	/**  Add control of any type
	 *  @param	string	type	Type of control
	 *  @param	string	caption	Caption of control
	 * 
	 *  @return	[Control](../../Control)
	 */
	function control type caption id =
	(
		if( id==undefined or id=="" ) then
			id = this.getId caption 
		
		Control_new = (Control_v parent_roll:parent_roll type:type caption:caption id:id).init() 
		
		append _Control Control_new
		
		return Control_new
	),
	/** Button
	 */
	function button caption id:undefined =
	(
		--if( id==undefined ) then
		--	id = this.getId caption 
		this.control #button caption id
	),
	
	/*---------------------------------------
		ADDING CONTROLS
	-----------------------------------------*/
	/** Add controls
	 */ 
	function _addControls =
	(
		this.setNewControlBox()
		this.setNewBoxPosition()
		
		for Control in this._Control do
			Control._addControl()
		
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

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
		Control_new = (Control_v parent_roll:parent_roll type:type caption:caption value:value ).init() 
		
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
	/** Get existing control
	  * @return	false|Control_v
	 */
	function get id =
	(
		control_exists = false 
		
		for Control in Controls do
			if( Control.id == id ) then 
				control_exists = Control
			
		control_exists --return
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
	/** Add Check button
	 */
	function checkbutton caption id:undefined add:true =
	(
		this.control #checkbutton caption id add:add
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
		ControlBox.new	parent_roll groupbox	-- Set new groupbox
		parent_roll.Layout.newControlsBox	groupbox	-- Set position to layout

		for Control in this.Controls do
			Control._addControl()
		
		ControlBox.addGroupBox()	-- Add groupbox control
		parent_roll.Layout.nextControlsBox groupbox	--
	),



	/*---------------------------------------
		HELPERS
	-----------------------------------------*/

	
	function test =
	(
		messagebox "UI.test()"
	)
	
)

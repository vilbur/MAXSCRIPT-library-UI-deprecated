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
	function control type caption id:undefined add:true =
	(
		this.newControl (Control_v type:type caption:caption id:id ) add:add
	),
	/** Add control to rollout
	 */
	function add &Control =
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
		this.newControl (Button_v caption:caption id:id ) add:add
	),
	/** Add Check button
	 */
	function checkbutton caption id:undefined add:true =
	(
		this.newControl (Control_v type:#checkbutton caption:caption id:id ) add:add
	),
	/** Add Checkbox
	 */
	function checkbox caption id:undefined add:true checked:undefined =
	(
		this.newControl (Checkbox_v caption:caption id:id ) add:add
	),
	/** Add Checkbox
	 */
	function edit caption id:undefined add:true value:undefined =
	(
		--this.control #edittext caption id value:value add:add
	),
	
	/**  Add control of any type
	 *  @param	string	type	Type of control
	 *  @param	string	caption	Caption of control
	 * 
	 *  @return	[Control](../../Control)
	 */
	function newControl _Control add:true =
	(
		_Control.parent_roll	= parent_roll
		
		_Control.init() 
		--Control_new = (Checkbox_v parent_roll:parent_roll type:type caption:caption value:value ).init() 
		
		if( add == true ) then
			this.add _Control
			
		_Control --return
	),
	
	
	/*---------------------------------------
	  
		ADDING CONTROLS TO UI
		
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
		print "Controls_v.test()"
	)
	
)

/** Controls
 */
struct Controls_v
(
	Parent_roll,
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
		
		Parent_roll.addControl Control
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
		this.newControl (Button_v caption:caption ) id:id add:add
	),
	/** Add Check button
	 */
	function checkbutton caption id:undefined add:true =
	(
		this.newControl (Control_v type:#checkbutton caption:caption ) id:id add:add
	),
	/** Add Checkbox
	 */
	function checkbox caption id:undefined checked:undefined add:true =
	(
		this.newControl (Checkbox_v caption:caption ) id:id add:add
	),
	/** Add Edit text control
	 */
	function edit caption id:undefined value:undefined add:true =
	(
		this.newControl (EditText_v caption:caption value:value ) id:id add:add
	),
	/** Path
	 */
	function path =
	(
		browse_button	= this.button "..."	add:false
		edit_text	= this.edit "test_edit" value:"Test"	add:false

		initial_dir	= "C:\\"

		--browse_button.pressed "getSavePath()"
		--browse_button.pressed "messagebox \"XXX\""
		browse_button.pressed ( "messagebox "+(edit_text.prop #text #path ) )
		--browse_button.pressed ( edit_text.text = "getSavePath")

		--format "\n\n=== Controls.path()\nedit_text.get = % " (edit_text.prop #text #get)
		--format "\n\n=== Controls.path()\nedit_text.path = % " (edit_text.prop #text #path)

		this.add browse_button
		this.add edit_text

		--this.newControl (Control_v type:#edittext caption:caption id:id value:value name_of_value_param:#text ) add:add
	),

	/*---------------------------------------

		ADDING CONTROLS TO UI

	-----------------------------------------*/

	/**  Add control of any type
	 *  @param	string	type	Type of control
	 *  @param	string	caption	Caption of control
	 * 
	 *  @return	[Control](../../Control)
	 */
	function newControl _Control id: add:true =
	(
		--print "------------\nControls.newControl()"
		--format " _Control	= % \n" _Control
		_Control.init Parent_roll id

		if( add == true ) then
			this.add _Control

		_Control --return
	),

	/** Add controls to rollout
	 */ 
	function _renderControls =
	(
		ControlBox.new	Parent_roll groupbox	-- Set new groupbox
		Parent_roll.Layout.newControlsBox	groupbox	-- Set position to layout

		for Control in this.Controls do
			Control._renderControl()

		ControlBox.addGroupBox()	-- Add groupbox control to UI
		Parent_roll.Layout.nextControlsBox groupbox	--
	),

	/*---------------------------------------
		HELPERS
	-----------------------------------------*/

	function test =
	(
		print "Controls_v.test()"
	)

)




filein( getFilenamePath(getSourceFileName()) + "/Control/ControlId/ControlId.ms" )
filein( getFilenamePath(getSourceFileName()) + "/Control/ControlEvents/ControlEvents.ms" )
filein( getFilenamePath(getSourceFileName()) + "/Control/Props/Props.ms" )

filein( getFilenamePath(getSourceFileName()) + "/ControlBox/ControlBox.ms" )


/** Controls
 */
struct Controls_v
(
	
	__construct = #( #Parent_roll ),

	/* required */
	/* dependency */
	/* reference */
	Parent_roll,
	/* properties */
	ControlBoxes	= #(),
	
	/** Get new groupbox of controls
	 *
	 * @param	string	[groupbox]	Title of group box
	 *
	 * @return [Controls](/ControlsBox/ControlsBox)
	 */
	function new groupbox =
	(
		this.box groupbox:groupbox --return
	),
	
	/** Get new groupbox of controls
	 *
	 * @param	string	[groupbox]	Title of group box
	 *
	 * @return [Controls](/ControlsBox/ControlsBox)
	 */
	function box groupbox: =
	(
		--print "------------\nControls.box()"
		ControlBox 	= ControlBox_v groupbox:groupbox
		--format " ControlBox	= % \n" ControlBox
		append ControlBoxes ControlBox
		
		ControlBox --return
	),
	
	/** Add controls to rollout
	 */ 
	function _addControlsToRollout =
	(
		--print "------------\nControls._addControlsToRollout()"
		--format " ControlBoxes	= % \n" ControlBoxes
		for ControlBox in ControlBoxes do
			this._addControls ControlBox.controls
	),
	/** Add each control to rollout
	  *
	  * @param	[Control_v]	controls	Array of Control_v
	 */
	function _addControls controls =
	(
		--print "------------\nControls._addControls()"
		--format "controls = % \n" controls
		for Control in controls do
			if( Control.type != #rolloutcontrol ) then 
				this._addControlToUi Control
			else
				this._addRollout Control
			
	),
	/** Add each control to rollout
	 *
	 * @param	[Control_v]	controls	Array of Control_v
	 */
	function _addControlToUi Control =
	(
		format "Control.type = %\nControl.id   = %\nControl.caption = %\n"  Control.type Control.id Control.caption
		
		Parent_roll._rolloutCreator.addControl Control.type Control.id Control.caption
	),
	/** _add rollout
	 */
	function _addRollout _rollout =
	(
		--print "------------\nControls._addRollout()"
		Parent_roll._rolloutCreator.addText "subrollout subrollouts \"Subrollouts\""
	),
	
	--/** Get Controls for rollout
	--  * @param	string	[groupbox]	Title of group box
	--  * @return [Controls](../../Controls)
	-- */
	--function controls groupbox:undefined =
	--(

	--),
	--groupbox, -- caption of groupbox
	--ControlBox	= ControlBox_v(),
	--Controls	= #(),

	--/**  Add control of any type
	-- *  @param	string	type	Type of control
	-- *  @param	string	caption	Caption of control
	-- * 
	-- *  @return	[Control](../../Control)
	-- */
	--function control type caption id: add:true =
	--(
	--	this.newControl (Control_v type:type caption:caption id:id ) add:add
	--),
	--/** Add control to rollout
	-- */
	--function add &Control =
	--(
	--	append Controls Control
	--	
	--	Parent_roll.addControl Control
	--),
	--/** Get existing control
	--  * @return	false|Control_v
	-- */
	--function get id =
	--(
	--	control_exists = false
	--	
	--	for Control in Controls do
	--		if( Control.id == id ) then 
	--			control_exists = Control
	--
	--	control_exists --return
	--),
	--
	--/*---------------------------------------
	--
	--	CONTROLS TYPES
	--
	-------------------------------------------*/
	--
	--/** Add Button
	-- */
	--function button caption id: add:true =
	--(
	--	this.newControl (Button_v caption:caption ) id:id add:add
	--),
	--/** Add Check button
	-- */
	--function checkbutton caption id: add:true =
	--(
	--	this.newControl (Control_v type:#checkbutton caption:caption ) id:id add:add
	--),
	--/** Add Checkbox
	-- */
	--function checkbox caption id: checked: add:true =
	--(
	--	this.newControl (Checkbox_v caption:caption ) id:id add:add
	--),
	--/** Add Edit text control
	-- */
	--function edit caption id: value: add:true =
	--(
	--	this.newControl (EditText_v caption:caption value:value ) id:id add:add
	--),
	--/** Path
	-- */
	--function path =
	--(
	--	browse_button	= this.button "..."	add:false
	--	edit_text	= this.edit "test_edit" value:"Test"	add:false
	--
	--	initial_dir	= "C:\\"
	--
	--	browse_button.pressed ( "messagebox "+(edit_text.prop #text #path ) )
	--
	--	this.add browse_button
	--	this.add edit_text
	--),
	--
	--/*---------------------------------------
	--
	--	ADDING CONTROLS TO UI
	--
	-------------------------------------------*/
	--
	--/**  Add control of any type
	-- *  @param	string	type	Type of control
	-- *  @param	string	caption	Caption of control
	-- * 
	-- *  @return	[Control](../../Control)
	-- */
	--function newControl _Control add:true =
	--(
	--	print "------------\nControls.newControl()"
	--	format " _Control	= % \n" _Control
	--	
	--	--_Control.init id
	--
	--	if( add ) then
	--		this.add _Control
	--	
	--	_Control --return
	--),
	--

	/*---------------------------------------
		HELPERS
	-----------------------------------------*/
	
	/*------------------------------------------------------------------------------
		CONSTRUCT
	--------------------------------------------------------------------------------*/
	
	/** Check if required properties are defined when an instance of the struct is created.
	 *	
	 * @example __construct = #( #property_name ) 
	 */
	function _checkConstctructProperties =
	(
		for prop in __construct where getProperty this prop == undefined do
			messageBox ("Undefined construct property !\n\n"+ ((filterString( classof this as string )"(:")[2]) +"."+ prop )
	),
	/**  
	 */
	on create do
	(
		this._checkConstctructProperties()
	)

)



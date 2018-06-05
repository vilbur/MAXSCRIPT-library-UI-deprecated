
/** ControlBox
 */
struct ControlBox_v 
(
	self	= this,
	parent_roll,
	id,
	groupbox,
	pos,
	--pos_controls,
	--Layout	= Layout_v(),

	--col_px	= 24,
	--padding	= 2,
	--width 	= 4,
	
	/** Add groupbox
	 */
	function _addGroupBox =
	(
		--this.pos_controls = _pos_controls
		--this._ControlBox = ControlBox_v caption:this.groupbox pos:pos
		--print (this._paramsString pos_controls)
		parent_roll.roll.addControl #groupbox #groupbox groupbox
		--paramStr:(parent_roll.Layout.getGroupboxParams groupbox)

		--paramStr:(this._paramsString pos_controls)
		
		--paramStr:("pos:" + this.pos_groupbox as string + " width:" + pos[1] as string + " height:" + (pos[2] - this.pos_groupbox[2] +32 ) as string  )
	),
	--/** Get controls position
	-- */
	--function _getControlsPosition =
	--(
	--	return [pos[1], pos[2]+16]
	--),
	/** Get params string
	 */
	function _paramsString pos_controls =
	(
		--_width	= (pos_controls[1] - pos[1] ) as string 
		--_height	= (pos_controls[2] - pos[2] + this.Layout.col_px + this.Layout.padding ) as string 
		
		--return "pos:"+pos as string +"width:" + _width + " height:" + _height
	),
	/** Set parent roll
	 */
	function setParentRoll _parent_roll =
	(
		parent_roll = _parent_roll
		
		parent_roll.Layout.setInitPos() 
		
		return this
	),
	--/** Add control to UI 
	-- */
	--function _addControl parent_roll pos =
	--(
	--	width = this._getWidth()
	--	
	--	parent_roll.roll.addControl this.type this.id this.caption paramStr:("width: "+width as string +" height:24 pos:" + pos as string )
	--	
	--	this.Events._add this
	--	
	--	return [pos[1]+width + padding, pos[2]]
	--),
	--/** Get width
	-- */
	--function _getWidth =
	--(
	--	return this.width * col_width
	--),
	function test =
	(
		messagebox "Control_v.test()"
	)
)

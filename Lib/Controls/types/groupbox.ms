
/** Groupbox
 */
struct Groupbox_v 
(
	self	= this,
	parent_roll,
	id,
	caption,
	pos,
	--pos_controls,
	Layout	= Layout_v(),

	--col_px	= 24,
	--padding	= 2,
	--width 	= 4,
	
	/** Add groupbox
	 */
	function _add parent_roll pos_controls =
	(
		--this.pos_controls = _pos_controls
		--this._Groupbox = Groupbox_v caption:this.groupbox pos:pos
		--print (this._paramsString pos_controls)
		parent_roll.roll.addControl #groupbox #groupbox caption paramStr:(this._paramsString pos_controls)
		
		--paramStr:("pos:" + this.pos_groupbox as string + " width:" + pos[1] as string + " height:" + (pos[2] - this.pos_groupbox[2] +32 ) as string  )
	),
	/** Get controls position
	 */
	function _getControlsPosition =
	(
		return [pos[1], pos[2]+16]
	),
	/** Get params string
	 */
	function _paramsString pos_controls =
	(
		_width	= (pos_controls[1] - pos[1] ) as string 
		_height	= (pos_controls[2] - pos[2] + this.Layout.col_px + this.Layout.padding ) as string 
		
		return "pos:"+pos as string +"width:" + _width + " height:" + _height
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

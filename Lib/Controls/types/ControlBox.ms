
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
		if( groupbox!=false ) then
			parent_roll.roll.addControl #groupbox #groupbox groupbox paramStr:(parent_roll.Layout._getGroupboxParams())
			--paramStr:"pos:[0,28]"
			--parent_roll.roll.addControl #groupbox #groupbox groupbox paramStr:"width:512"

		--paramStr:(this._paramsString pos_controls)
		
		--paramStr:("pos:" + this.pos_groupbox as string + " width:" + pos[1] as string + " height:" + (pos[2] - this.pos_groupbox[2] +32 ) as string  )
	),

	/** Set parent roll
	 */
	function setParentRoll _parent_roll =
	(
		parent_roll = _parent_roll
		
		parent_roll.Layout.setInitPos groupbox
		
		return this
	),

	function test =
	(
		messagebox "Control_v.test()"
	)
)

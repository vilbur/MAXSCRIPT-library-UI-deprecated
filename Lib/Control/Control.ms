
/** Control
 */
struct Control_v 
(
	self	= this,
	Events	= Events_v parent_control:this,
	Layout	= Layout_v(),
	parent_roll,
	type,
	id,
	caption,

	col 	= 4,
	
	
	/** Add control to UI 
	 */
	function _addControl parent_roll pos =
	(
		print ( "pos" );
		print ( pos  );
		width = this._getWidth()
		
		parent_roll.roll.addControl this.type this.id this.caption paramStr:("width: "+width as string +" pos:" + pos as string )
		--paramStr:("width: "+width as string +" height:"+col_px as string +" pos:" + pos as string )
		
		this.Events._add this

		return  [pos[1]+width, pos[2]]
		--return [pos[1]+width + this.Layout.padding, pos[2]]
	),
	/** Get width
	 */
	function _getWidth =
	(
		return this.col * this.Layout.col_px
	),
	function test =
	(
		messagebox "Control_v.test()"
	)
)

/** Layout
 */
struct Layout_v
(
	self = this,
	col_px	= 24,
	padding	= 4,
	pos	= [0,4],
	
	padding_box	= 12,
	
	/** Next control pos
	 */
	function controlsBoxPos pos groupbox =
	(
		if( groupbox!=false ) then
			pos[2] += this.padding_box
	
		this.pos[2] = pos[2] + this.col_px
	),	
	
	function test =
	(
		messagebox "Layout_v.test()"
	)
)

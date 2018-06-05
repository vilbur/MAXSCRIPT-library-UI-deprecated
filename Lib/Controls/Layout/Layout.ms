/** Layout
 */
struct Layout_v
(
	self = this,
	col_px	= 24,
	padding	= 4,
	pos	= [0,4],
	
	roll_width	= 164,
	padding_box	= 12,
	
	/** Next control pos
	 */
	function controlsBoxPos pos groupbox =
	(
		if( groupbox!=false ) then
			pos[2] += this.padding_box
	
		this.pos[2] = pos[2] + this.col_px
	),	
	/** Next control pos
	  * @param	2point	pos	Position of previous control
	  * @param	int	width	Width of current control
	  *
	 */
	function nextControlPos col =
	(
		width	= col * this.col_px
		str_width	= "width:"+ width    as string
		str_pos	= "pos:"  + this.pos as string
		this.pos	= [ this.pos[1] + width, this.pos[2] ]
		
		return str_width + " "+str_pos
	),
	
	function test =
	(
		messagebox "Layout_v.test()"
	)
)

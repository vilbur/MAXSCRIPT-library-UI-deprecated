/** Layout
 */
struct Layout_v
(
	self = this,
	col_px	= 24,
	padding	= 4,
	pos_init	= [0,4],
	pos,
	
	roll_width	= 164,
	padding_box	= 12,
	
	/** Set init pos
	 */
	function setInitPos =
	(
		print ( "setInitPos=" + pos as string )
		
		if( pos==undefined ) then
			pos = pos_init
		else
			pos	= [pos_init[1], pos[2] + col_px]
		
		--pos_init	= pos
	),
	/** Next control pos
	 */
	function getGroupboxParams groupbox =
	(
		--print ( "pos_init=" + pos_init as string )
		--print ( "pos=" + pos as string ) 
		--pos = [ pos_init[1], pos[2] += col_px ]
		return ""
		--return (pos as string)
	),	
	/** Next control pos
	  * @param	2point	pos	Position of previous control
	  * @param	int	width	Width of current control
	  *
	 */
	function nextControlPos col =
	(
		width	= col * col_px
		str_width	= "width:"+ width    as string
		str_pos	= "pos:"  + pos as string
		
		this.pos	= [ pos[1] + width, pos[2] ]
		
		return str_width + " "+str_pos
	),
	
	function test =
	(
		messagebox "Layout_v.test()"
	)
)

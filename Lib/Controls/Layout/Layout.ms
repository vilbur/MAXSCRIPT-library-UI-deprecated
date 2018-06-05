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
		if( pos==undefined ) then
			pos = pos_init
		else
			pos	= [pos_init[1], pos[2] + col_px]
	),
	/** Next control pos
	 */
	function _getGroupboxParams =
	(
		print ( "pos_init=" + pos_init as string )
		print ( "pos=" + pos as string )
		 
		Params	= Params_v()

		Params.add #width	(pos[1] - pos_init[1] )
		Params.add #height (pos[2] - pos_init[2] + col_px + padding )

		return Params.join()
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

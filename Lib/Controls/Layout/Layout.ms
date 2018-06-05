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
		--print ( "setInitPos=" + pos as string )
		
		if( pos==undefined ) then
			pos = pos_init
		else
			pos	= [pos_init[1], pos[2] + col_px]
		
		--pos_init	= pos
	),
	/** Next control pos
	 */
	function _getGroupboxParams =
	(
		_width	= (pos_init[1] - pos[1] ) as string 
		_height	= (pos_init[2] - pos[2] + col_px + padding ) as string 
		print ( "pos:" + pos as string )
		print ( "width:" + _width as string )
		print ( "height:" + _height as string )
		
		--return "pos:"+pos as string +"width:" + _width + " height:" + _height
		
		
		
		--pos = [ pos_init[1], pos[2] += col_px ]
		--return "pos:"+pos as string +" width: 128"
		--return ( "pos:"+pos as string )
		--return "height: 256 pos:[288,56]"

		return "height: 256"
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

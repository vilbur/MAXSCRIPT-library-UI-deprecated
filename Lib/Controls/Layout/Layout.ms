/** Layout
 */
struct Layout_v
(
	col_px	= 24,
	padding	= 4,
	pos_box	= [0,4],
	pos,
	
	roll_width	= 164,
	padding_box	= 24,

	/** Set init pos
	 */
	function setNewBoxPosition groupbox =
	(
		if( pos == undefined ) then
			pos = pos_box
		
		else
			pos = pos_box = [ pos_box[1], pos[2] ]
	
		if( groupbox!=undefined ) then
			pos[2] += padding_box
	),
	/** Set next box position
	 */
	function setNextBoxPosition groupbox =
	(
		y = pos[2] + col_px
		
		if( groupbox!=undefined ) then -- Set offset of new box after groupbox
			y += 8 
		
		pos = pos_box = [ pos_box[1], y ]
	),
	
	/** Next control pos
	 */
	function _getGroupboxParams =
	(
		--print ( "pos_box=" + pos_box as string )
		--print ( "pos=" + pos as string )
		Params	= Params_v()
		
		Params.add #pos	[pos_box[1], pos_box[2] - padding_box]
		Params.add #width	(pos[1] - pos_box[1] )
		Params.add #height (pos[2] - pos_box[2] + col_px + padding_box + padding)
		print ( "Params.join()=" + Params.join()as string )
		
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

Viewport
Window
×
×
×
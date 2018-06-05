/** Layout
 */
struct Layout_v
(
	col_size	= 24,
	padding	= 4,
	pos_box	= [0,4],
	pos,
	
	roll_width	= 8,
	padding_box	= 16,

	/** Set init pos
	 */
	function setNewBoxPosition groupbox =
	(
		if( pos == undefined ) then -- first control box in rollout
			pos = pos_box
		
		else
			pos = pos_box = [ pos_box[1], pos[2] ] -- any other control box in rollout
	
		if( groupbox!=undefined ) then -- move controls in groupbox lower
			pos[2] += padding_box
	),
	/** Set next box position
	 */
	function setNextBoxPosition groupbox =
	(
		y = pos[2] + col_size
		
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
		Params.add #height (pos[2] - pos_box[2] + col_size + padding_box + padding)
		print ( "Params.join()=" + Params.join()as string )
		
		return Params.join()
	),	
	/** Next control pos
	  * @param	2point	pos	Position of previous control
	  * @param	int	width	Width of current control
	  *
	 */
	function _getControlsParams col =
	(
		if( pos[1] > 164 ) then
			pos = [ pos_box[1], pos[2] + col_size ]
		
		width	= col * col_size
		str_width	= "width:"+ width as string
		str_pos	= "pos:"  + pos   as string
		
		pos_x	= pos[1] + width 
		pos	= [ pos_x, pos[2] ]
		
		return str_width + " " + str_pos
	),
	/** _get roll width
	 */
	function _getRollWidth =
	(
		return  roll_width * col_size
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
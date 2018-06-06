/** Layout
 */
struct Layout_v
(
	col_size	= 32,
	padding	= 2,
	margin	= 0,
	pos_box	= [margin*2,4],
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
		
		--pos = pos_box = [ pos_box[1], y ]
		pos = [ pos_box[1], y ]
	),
	
	/** Get params string of Controls box
	 */
	function _getGroupboxParams =
	(
		--print ( "pos_box=" + pos_box as string )
		--print ( "pos=" + pos as string )
		Params	= Params_v()
		
		Params.add #pos	[pos_box[1] - margin, pos_box[2] - padding_box]
		Params.add #width	(pos[1] - pos_box[1] )
		Params.add #height (pos[2] - pos_box[2] + col_size + padding_box)
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
		Params	= Params_v()
		print ( "pos_box=" + pos_box as string )
		this.trySetNewControlsRow()
		
		width	= col * col_size
		
		
		Params.add #pos	[ pos[1] + padding, pos[2] ]
		Params.add #width	(width - padding*2)
		Params.add #height (col_size - padding*2)

		this.setNewControlPosition width
		
		return Params.join()
	),
	/** Try set new controls row
	 */
	function trySetNewControlsRow =
	(
		if( pos[1] > 164 ) then
			pos = [ pos_box[1], pos[2] + col_size ]
	),
	/** Set new control position
	 */
	function setNewControlPosition with_last =
	(
		--pos_x	= pos[1] + with_last 
		pos	= [ pos[1] + with_last, pos[2] ]
	),
	/** _get roll width
	 */
	function _getRollWidth =
	(
		return (roll_width * col_size)
		--return  (roll_width * col_size) as integer    
	),
	
	
	function test =
	(
		messagebox "Layout_v.test()"
	)
)

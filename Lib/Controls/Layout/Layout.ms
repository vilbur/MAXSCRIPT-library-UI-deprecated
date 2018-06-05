/** Layout
 */
struct Layout_v
(
	self = this,
	col_px	= 24,
	padding	= 4,
	pos_box	= [0,4],
	pos,
	
	roll_width	= 164,
	padding_box	= 16,

	/** Set init pos
	 */
	function setNewBoxPosition groupbox =
	(
		if( pos == undefined ) then
			pos = pos_box
		
		else
			pos = pos_box = [ pos_box[1], pos[2] ]
			
		--if( pos==undefined and groupbox != false ) then
		--	after_groupbox_offset = padding_box
		--else 
		--	after_groupbox_offset = padding_box
		--
		--
		--if( pos==undefined ) then
		--	pos = pos_box
		--
		--else
		--	pos = [ pos_box[1], pos[2] + col_px + after_groupbox_offset]

	),
	/** Set next box position
	 */
	function setNextBoxPosition =
	(
		pos = pos_box = [ pos_box[1], pos[2] + col_px ]
	),
	
	/** Get after groupbox offset
	 */
	function getAfterGroupboxOffset groupbox =
	(
		
		if( groupbox != undefined ) then
			return 32
			--return padding_box as integer
		
		else if( pos==undefined  ) then
			return 16
	),
	
	/** Next control pos
	 */
	function _getGroupboxParams =
	(
		Params	= Params_v()

		Params.add #pos	[pos_box[1], pos[2] - padding_box]
		Params.add #width	(pos[1] - pos_box[1] )
		Params.add #height (pos[2] - pos_box[2] + padding )
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
/** Layout
 */
struct Layout_v
(
	Bbox,
	_grid	= 32,	-- width and height of _grid
	padding	= 2,	-- padding between controls
	margin	= 2,
	pos_box	= [margin*2,4],
	pos,
	
	roll_width	= 8, -- columns width of rollout
	padding_box	= 16,

	/*---------------------------------------
		CONTROLS BOX
	-----------------------------------------*/
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
		
		Bbox = Bbox_v()
	),
	/** Set next box position
	 */
	function setNextBoxPosition groupbox =
	(
		y = pos[2] + _grid
		
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
		print ( "Bbox.width=" + Bbox.width as string )
		Params.add #pos	[pos_box[1] - margin, pos_box[2] - padding_box]
		Params.add #width	( Bbox.width + margin )
		Params.add #height (pos[2] - pos_box[2] + _grid + padding_box)
		--print ( "Params.join()=" + Params.join()as string )
		
		return Params.join()
	),
	/*---------------------------------------
		CONTROLS
	-----------------------------------------*/
	/** Next control pos
	  * @param	2point	pos	Position of previous control
	  * @param	int	width	Width of current control
	  *
	 */
	function _getControlsParams Params col =
	(
		--Params	= Params_v()
		--print ( "pos_box=" + pos_box as string )
		width	= col * _grid

		this.trySetNewControlsRow width
		
		
		Params.add #pos	[ pos[1] + padding, pos[2] ]
		Params.add #width	(width - padding*2)
		Params.add #height (_grid - padding*2)
		
		Bbox.add Params
		this.setNewControlPosition width
		
		return Params.join()
	),
	/** Try set new controls row
	 */
	function trySetNewControlsRow width =
	(
		if( (pos[1] + width) > this._getRollWidth() ) then
			pos = [ pos_box[1], pos[2] + _grid ]
	),
	/** Set new control position
	 */
	function setNewControlPosition with_last =
	(
		pos	= [ pos[1] + with_last, pos[2] ]
	),
	/*---------------------------------------
		ROLLOUT
	-----------------------------------------*/
	/** _get roll width
	 */
	function _getRollWidth =
	(
		return (roll_width * _grid) + margin*4
	),
	/** _get roll height
	 */
	function _getRollHeight =
	(
		print ( "_getRollHeight()=" + (Bbox.height + 48) as string )
		
		
		return Bbox.height + 48
		--return 64
	),
	
	function test =
	(
		messagebox "Layout_v.test()"
	)
)

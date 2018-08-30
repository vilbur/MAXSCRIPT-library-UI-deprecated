/** Layout
 */
struct Layout_v
(
	Bbox,
	_grid	= 24,	-- width and height of _grid
	roll_width	= 12, -- columns width of rollout
	padding	= 2,	-- padding between controls
	margin	= 2,
	padding_box	= 16,

	pos_box	= [margin*2,4],
	pos,

	/*---------------------------------------
		CONTROLS BOX
	-----------------------------------------*/
	/** Set init pos
	 */
	function newControlsBox groupbox =
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
	function nextControlsBox groupbox =
	( 
		print ( "Layout_v.nextControlsBox() groupbox=" + groupbox as string )
		
		y = pos[2] + _grid
		--y = pos[2] + 16

		if( groupbox!=undefined ) then -- Set offset of new box after groupbox
			y += 8

		pos = [ pos_box[1], y ]
	),

	/** Get params string of Controls box
	 */
	function _getGroupboxParams =
	(
		--print ( "pos_box=" + pos_box as string )
		--print ( "pos=" + pos as string )
		Params	= Params_v()
		--print ( "Bbox.width=" + Bbox.width as string )
		Params.add #pos	[ pos_box[1] - margin, pos_box[2] - padding_box ]
		Params.add #width	( Bbox.width + margin )
		Params.add #height ( pos[2] - pos_box[2] + _grid + padding_box )
		--print ( "Params.join()=" + Params.join()as string )

		return Params.join()
	),
	/*---------------------------------------
		CONTROLS
	-----------------------------------------*/
	/** Set dimensions of control, add to Bounding box
	  * @param	Params	Params
	  * @param	int	col	Width of control
	  *
	 */
	function setControlDimensions col _pos _width _height =
	(
		width_raw	= if( _width == undefined ) then col * _grid else _width
		
		this.trySetNewControlsRow width_raw

		pos	= if( _pos == undefined ) then [ pos[1] + padding, pos[2] ] else _pos
		
		width	=  width_raw	- padding * 2
		
		height	= if( _height == undefined ) then  _grid 	- padding * 2 else _height
		
		dimensions	= #( pos, width, height ) 
		
		Bbox.add dimensions
		
		this._setNewControlPosition width_raw
		--print ( "dimensions = " + dimensions as string )
		dimensions --return
	),
	/** Try set new controls row
	 */
	function trySetNewControlsRow width =
	(
		--print ( "(this._getRollWidth()) = " + (this._getRollWidth()) as string )
		--print ( "pos = " + pos as string )
		if( (pos[1] + width) > this._getRollWidth() ) then
			pos = [ pos_box[1], pos[2] + _grid ]
	),
	/** Set new control position
	 */
	function _setNewControlPosition with_last =
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
		return (roll_width * _grid) + margin*4 + 14
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

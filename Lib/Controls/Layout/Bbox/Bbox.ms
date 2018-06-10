/** Bbox strore max positions of controls in COntrols box
  * Used for sizing of groupbox
 */
struct Bbox_v
(
	width	= 0,
	height	= 0,
	
	/** Add
	 */
	function add Params =
	(
		pos	= Params.get #pos
		--_width	= Params.get #width
		bbox_width	= pos[1] + (Params.get #width)
		bbox_height	= pos[1] + (Params.get #height)
		
		if( bbox_width > width ) then
			width = bbox_width as integer
			
		if( bbox_height > height ) then
			height = bbox_height as integer
	),
	
	function test =
	(
		messagebox "Bbox.test()"
	)
)

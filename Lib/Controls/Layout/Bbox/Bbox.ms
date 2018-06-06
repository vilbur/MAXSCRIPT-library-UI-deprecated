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
		_width	= Params.get #width
		bbox_width	= pos[1] + _width
		print "---------------";
		print ( "pos[1]=" + pos[1] as string )
		print ( "_width=" + _width as string )
		print ( "bbox_width=" + bbox_width as string )
		print (  bbox_width > width );
		if( bbox_width > width ) then
			width = bbox_width as integer
			
		--print ( "Bbox.width=" + width as string )
	),
	
	function test =
	(
		messagebox "Bbox.test()"
	)
)

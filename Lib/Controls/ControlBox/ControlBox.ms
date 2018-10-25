/** Section box of controls, an be groupbox if "ControlBox_v.groupbox" is set
  *
  * Id of groupbox has preffix "gb_"
 */
struct ControlBox_v 
(
	Parent_roll,
	id,
	groupbox,

	/** Set parent roll
	 */
	function new _parent_roll _groupbox =
	(
		Parent_roll	= _parent_roll
		groupbox	= _groupbox
		
		this --return 
	),	
	/** Add groupbox
	 */
	function addGroupBox =
	(
		print "------------\nControlBox.addGroupBox()"
		----print ( "ControlBox_v.addGroupBox() = " + groupbox as string )
		--if( groupbox!=undefined ) then
		format " this._getGroupboxParams()	= % \n" (this._getGroupboxParams())
			--Parent_roll.roll.addControl #groupbox (this.getId()) groupbox paramStr:(this._getGroupboxParams())
		--Parent_roll.roll.addControl #groupbox (this.getId()) groupbox
		
		--format " groupbox	= % \n" groupbox
	),
	
	/** Get id
	 */
	function getId =
	(
		"_gb" + (( dotnetObject "System.Text.RegularExpressions.Regex" @"[\s-]+" ).Replace ( toLower groupbox ) "_" ) --return
	),
	/** Exists
	 */
	function exists =
	(
		false
	),
	/*------------------------------------------------------------------------------
		PRIVATE
	--------------------------------------------------------------------------------*/
	/** _get groupbox params
	 */
	function _getGroupboxParams =
	(
		--print "------------\nControlBox._getGroupboxParams()"
		dimensions	= Parent_roll.Layout._getGroupboxDimensions()
		--format " pos 	= % \n width	= % \n height	= % \n\n" dimensions[1] dimensions[2] dimensions[3]
		
		--Props	= Props_v Control:this
		--
		--Props.add #pos	dimensions[1]
		--Props.add #width	dimensions[2]
		--Props.add #height dimensions[3]
		--Props.add #height 48
		
		--Props.join() --return
		""
	),

	function test =
	(
		messagebox "Control_v.test()"
	)
)

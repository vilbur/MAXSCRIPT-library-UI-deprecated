/** Create Rollout
  * Rollout has generated global variable by id with prefix "rollout" E.G.: "foo_rollout" >>> "rollout_foo_rollout"
  *
  * @property	string	title	Title of rollout
  * @property	string	id	Id of rollout, if not defined then sanitized title is used E.G.: title="Foo Rollout" >>> id="foo_rollout"
  * @property	int	height	Height of rollout
  *
  *
  * @property	string	ini	Path to ini where state of UI is saved, if false then ini state is not saved
  *
  * @method	void	onOpen(  @param	string	callback[, @param	string	tooltip] )	
  * @method	void	onClose( @param	string	callback[, @param	string	tooltip] )	
  *
  *
  * -------------------------------------------------------------------------------------
  * Class structure:
  *			Rollout
  *				Controls
  *					ControlBox
  *						Control
  * -------------------------------------------------------------------------------------
  */
struct Rollout_v
(
	__construct = #( #title ),
	/* required */
	title,

	/* options */
	id,
	
	/* reference */
	Parent_roll, -- Parent rollout if this is subrollout, undefined for RolloutMain

	/* properties */
	ini, -- inherit by Dialog_v
	subrollouts_slot = "subrollouts",
	_rolloutCreator,
	
 	Controls	= Controls_v	Parent_roll:this,
	Property	= RolloutProperty_v	Parent_roll:this,
	Subrollouts	= Subrollouts_v slot:subrollouts_slot,
	Layout	= Layout_v(),

	private
	
	/* options */

	/* lists */
	RolloutEvent	= RolloutEvent_v parent_control:this,
	
	_controls_ids	= #(),	-- store ids of added controls in rollout
	
	type	= #rollout, -- reference for this.RolloutEvent._bindDefaultEvent()

	/*------ EXTENDED METHODS ------*/
	onOpen	= RolloutEvent.onOpen,
	onClose	= RolloutEvent.onClose,

	public	

	/** Create rollout dialog
	  * [ Wrapper for CreateDialog()](http://help.autodesk.com/view/3DSMAX/2015/ENU/?guid=__files_GUID_816D257C_CD2D_4753_A792_6E7AEFAFA6A7_htm)
	  * @return	RolloutClass
	 */
    function dialogCreate width: height: pos: =
	(
		--print "------------\nRollout.dialogCreate()"
		this._createRollout()
		
		CreateDialog (_rolloutCreator.def)
		--CreateDialog (_rolloutCreator.def) height:512
		
		this.Property.all width:width height:height pos:pos -- SET PROPERTIES WITH RolloutProperties_v CLASS
		
		Subrollouts.addSubRollouts id
		--_rolloutCreator --return
	),
	/** Create rollout with [ rolloutCreator() ](http://help.autodesk.com/view/3DSMAX/2015/ENU/?guid=__files_GUID_5FC5036F_E2D7_46C9_9AFA_7B3550B9F254_htm)
	 */
	function _setRolloutCreator =
	(
		_rolloutCreator = rolloutCreator id title
		
		_rolloutCreator.begin()
	),
	/** Create rollout with [ rolloutCreator() ](http://help.autodesk.com/view/3DSMAX/2015/ENU/?guid=__files_GUID_5FC5036F_E2D7_46C9_9AFA_7B3550B9F254_htm)
	 */
	function _createRollout =
	(
		print ("------------\nRollout._createRollout() "+id)
		--_rolloutCreator.begin()
		
		--this._addControlsToRollout()
		this.Controls._addControlsToRollout()
		
		this._createSubrollouts()

		this._addEventHandlers()

		this._addSaveIniFunction()

		--print ("------------\nRollout._createRollout() rollout " + id + " created")
		_rolloutCreator.end()
	),
	/** Subrollout
	  * @return	object new instance of this
	 */
	function subrollout title id: =
	(
		--print "------------\nRollout.subrollout()"
		_subrollout = Rollout_v title:title id:id Parent_roll:this
		
		Subrollouts.add _subrollout
		--format " _subrollout.id	= % \n" _subrollout.id
		_subrollout --return 
	),

	/** Get id of rollout or get full id with parent rollout if subrullout
	  *
	  * @return	string	"rollout_id|parent_rollout_id.rollout_id"
	 */
	function getId =
	(
		--if( this._isSubrollout() ) then id else Parent_roll.id + "." + id
		--if( this._isSubrollout() ) then Parent_roll.id + "." + id else id
		if( this._isSubrollout() ) then Parent_roll.id + "." + subrollouts_slot else id
	),
	/** Open close rollout
	 */
	function open state =
	(
		--print ( "Rollout."+id+".open()=" + state as string )
		execute ( id+".open = "+state as string )
	),
	/** Find if rollout has been added to UI already
	 */
	function exists =
	(
		(execute id) != undefined --return
	),

	/** Try destroy dialog by global variable before variable will be overwritten
	 */
	function destroy =
	(
		try( execute("cui.UnRegisterDialogBar " +id) )catch()
		try( execute("DestroyDialog "           +id) )catch()
	),
	/*---------------------------------------
		CONTROLS 
	-----------------------------------------*/
	--/** Get Controls for rollout
	--  * @param	string	[groupbox]	Title of group box
	--  * @return [Controls](../../Controls)
	-- */
	--function controls groupbox:undefined =
	--(
	--	--print "------------\nRollout.controls()"
	--	Controls_new 	= Controls_v Parent_roll:this groupbox:groupbox
	--	--format " Controls_new	= % \n" Controls_new
	--	append this.Controls Controls_new
	--
	--	Controls_new --return
	--),
	--/** Add control id to array controls
	-- */
	--function addControl Control =
	--(
	--	print "------------\nRollout.addControl()"
	--	appendIfUnique _controls_ids Control.id.id
	--	--format " _controls_ids	= % \n" _controls_ids
	--),
	--/** Has control
	-- */
	--function hasControl id =
	--(
	--	--print "------------\nRollout.hasControl()"
	--	has_control = findItem _controls_ids id > 0
	--	--format " id	= % \n has_control	= % \n\n" id has_control
	--	has_control --return
	--	--findItem _controls_ids id > 0 --return
	--),
	
	private
	
	/*---------------------------------------
		ROLLOUT NEW
	-----------------------------------------*/
	/** Set id by title if not defined
	 */
	function _setId =
	(
		if not ( id == undefined or id == unsupplied ) then
			return()
			
		title_no_whitespace = substituteString title " " "_" -- replace whitespace

		id_by_title = (( dotNetObject "System.Text.RegularExpressions.Regex" @"[^A-Za-z0-9_]+" ).Replace ( toLower (title_no_whitespace) ) "") --return
		
		id = "rollout_" + id_by_title
	),

	/** Declare rollout global variable
	  * Global variable is id with prefix "rollout" E.G.: "foo_rollout" >>> "rollout_foo_rollout"
	  *
	  * Declared as undefined, because of reset rollout when script is restarted
	  *
	  */
	function _setRolloutGlobalVariable =
	(
		execute ( "global "+ id +" = undefined")
	),

	/** Add default events
	 */
	function setDefaultEvents =
	(
		if( ini != undefined ) then 
			this.RolloutEvent.setDefaultEvents()
	),
	/*---------------------------------------
		CREATE ROLLOUT
	-----------------------------------------*/
	--/**  Add controls to UI on rollout creation
	--*/
	--function _addControlsToRollout =
	--(
	--	print "------------\nRollout._addControlsToRollout()"
	--	--for Controls in Controls do
	--		--Controls._addControlsToRollout()
	--),
	/** _create subrollouts
	 */
	function _createSubrollouts =
	(
		Subrollouts.createSubRollouts()

		if( Subrollouts.definition != "" ) then
			_rolloutCreator.addText ( Subrollouts.definition  )
	),
	/*------------------------------------------------------------------------------
		EVENTS
	--------------------------------------------------------------------------------*/
	/** Bind events to rollout 
	 */
	function _addEventHandlers =
	(
		this.RolloutEvent._addHandlers()
	),
	/** Add saveIni() function to rollout
	  * This function is called before user callback
	  */
	function _addSaveIniFunction =
	(
		if( ini != undefined ) then
			_rolloutCreator.addText( "function saveIni _section _key _value = ( ((Ini_v()).path @"+ini+"@).save _section _key _value )" )
	),
	
	/*------------------------------------------------------------------------------
		HELPERS
	--------------------------------------------------------------------------------*/
	/** Test if this rollout is subrollout
	 */
	function _isSubrollout =
	(
		Parent_roll != undefined --return
	),
	/*------------------------------------------------------------------------------
		CONSTRUCT
	--------------------------------------------------------------------------------*/
	
	/** Check if properties in __construct are defined when an instance of the struct is created.
	  * @example __construct = #( #property_name ) 
	 */
	function _checkConstctructProperties =
	(
		for prop in __construct where getProperty this prop == undefined do
			messageBox ("Undefined construct property !\n\n"+ ((filterString( classof this as string )"(:")[2]) +"."+ prop )
	),
	/**  
	 */
	on create do
	(
		--print "------------\nRollout.on create ()"
		this._checkConstctructProperties()
		
		this._setId()

		this.destroy()
		
		this._setRolloutGlobalVariable()
		
		this.setDefaultEvents()
		
		this._setRolloutCreator()
	)


)


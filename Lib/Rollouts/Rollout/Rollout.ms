filein( getFilenamePath(getSourceFileName()) + "/RolloutCreator/RolloutCreator.ms" )

filein( getFilenamePath(getSourceFileName()) + "/../Subrollouts/Subrollouts.ms" )


--filein( getFilenamePath(getSourceFileName()) + "/../../Controls/Control/ControlId/ControlId.ms" )
--filein( getFilenamePath(getSourceFileName()) + "/../../Controls/Control/ControlEvents/ControlEvents.ms" )


filein( getFilenamePath(getSourceFileName()) + "/../../Controls/Controls.ms" )

filein( getFilenamePath(getSourceFileName()) + "/../RolloutProperty/RolloutProperty.ms" )

filein( getFilenamePath(getSourceFileName()) + "/RolloutEvent/RolloutEvent.ms" )


/** Create Rollout
  * Rollout has generated global variable by id with prefix "rollout" E.G.: "fooroll" >>> "rollout_fooroll"
  *
  * @property	string	title	Title of rollout
  * @property	string	id	Id of rollout, if not defined then sanitized title is used E.G.: title="Foo Roll" >>> id="fooroll"
  * @property	int	height	Height of rollout
  *
  *
  * @property	string	ini	Path to ini where state of UI is saved, if false then ini state is not saved
  *
  * @method	void	onOpen(  @param	string	callback[, @param	string	tooltip] )	
  * @method	void	onClose( @param	string	callback[, @param	string	tooltip] )	
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
	subrollouts_slot = "default_slot",
	RolloutCreator,
	
 	Controls	= Controls_v	Parent_roll:this,
	Property	= RolloutProperty_v	Parent_roll:this,
	Subrollouts	= Subrollouts_v     slot:subrollouts_slot,
	--Layout	= Layout_v(),
	
	--_Containers	= Containers_v(),
	definition = " ", -- used in "rolloutCreator.addText( definition )", !!! NOTE: empty string must has whitespace, otherwise is threated as undefined 

	private
	
	/* options */

	/* lists */
	RolloutEvent	= RolloutEvent_v parent_control:this,

	_controls_ids = #(),	-- store ids of added controls in rollout
	
	type	= #rollout,     -- reference for this.RolloutEvent._bindDefaultEvent()

	/*------ EXTENDED METHODS ------*/
	--onOpen	= RolloutEvent.onOpen,
	--onClose	= RolloutEvent.onClose,

	public	

	/** Create rollout dialog
	  * [ Wrapper for CreateDialog()](http://help.autodesk.com/view/3DSMAX/2015/ENU/?guid=__files_GUID_816D257C_CD2D_4753_A792_6E7AEFAFA6A7_htm)
	  * @return	RolloutClass
	 */
    function dialogCreate width: height: pos: =
	(
		--format "\n------------\nRollout_v.dialogCreate()"
		this._createRollout()
		--format "\n------------\n_rolloutCreator.def\n%" RolloutCreator.def

		CreateDialog ( RolloutCreator.getDefinition() ) height:height
		
		--this.Property.all width:width height:height pos:pos -- SET PROPERTIES WITH RolloutProperties_v CLASS
		Subrollouts.addSubRollouts id
		
		--RolloutCreator --return
	),

	/** Add subrollout
	  *
	  * @return	object new instance of Rollout_v
	 */
	function subrollout title id: =
	(
		--print "------------\nRollout_v.subrollout()"
		new_subrollout = Rollout_v title:title id:id Parent_roll:this
		
		Subrollouts.add new_subrollout
		--format " new_subrollout.id	= % \n" new_subrollout.id
		new_subrollout --return 
	),
	
	/** Create rollout with [ rolloutCreator() ](http://help.autodesk.com/view/3DSMAX/2015/ENU/?guid=__files_GUID_5FC5036F_E2D7_46C9_9AFA_7B3550B9F254_htm)
	  * Used for creation of rollout and subrollout subrollout
	 */
	function _createRollout =
	(
		--format "\n------------\n%._createRollout()" id
		
		this.Controls._addControlsToRollout()
		
		Subrollouts.createSubRollouts()
		Subrollouts.setSubrolloutSlot()
		
		RolloutCreator.addSubrolloutSlot( Subrollouts.slot_string )
		--RolloutCreator.addSaveIniFunction( "function saveIni _section _key _value = ( ((Ini_v()).path @"+ini+"@).save _section _key _value )" )
		--RolloutCreator.addDefaultEvents( "on "+parent_control.id+" rolledUp val do ("+ this._getCallback() + ")"  )
	
		--print ("------------\nRollout_v._createRollout() rollout " + id + " created")
		RolloutCreator.endOfDefinition()
		--format "_rolloutCreendOfCreationator.def = % \n" RolloutCreator.def
	),
	
	/** Open close rollout
	  *
	  * @property	boolean	state	open\close state of rollout
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
		try( execute("cui.UnRegisterDialogBar " +i d) )catch()
		try( execute("DestroyDialog "           + id) )catch()
	),
	
	/** Get id of rollout or get full id with parent rollout if subrollout
	  *
	  * @return	string	"rollout_id|parent_rollout_id.subrollouts_slot.rollout_id"
	 */
	function getId =
	(
		--if( this._isSubrollout() ) then id else Parent_roll.id + "." + id
		--if( this._isSubrollout() ) then Parent_roll.id + "." + id else id
		if( this._isSubrollout() ) then Parent_roll.id + "." + subrollouts_slot + "." + id else id
	),
	
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
		print ( title_no_whitespace as String )
		id_by_title = (( dotNetObject "System.Text.RegularExpressions.Regex" @"[^A-Za-z0-9_]+" ).Replace ( toLower (title_no_whitespace) ) "") --return
		
		id = "rollout_" + id_by_title
		
		print ( "------ID = "+id as String )	
	),

	/** Declare rollout global variable
	  * Global variable is id with prefix "rollout" E.G.: "fooroll" >>> "rollout_fooroll"
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
		--print (  " Rollout_v.setDefaultEvents()" + ( classof ini == undefined ) )
		print (  " Rollout_v.setDefaultEvents()"  )

		--if( ini != undefined ) then 
			--this.RolloutEvent.setDefaultEvents()
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
		--print "------------\nRollout_v.on create()"
		this._checkConstctructProperties()
		
		this._setId()
		
		this.destroy()
		
		this._setRolloutGlobalVariable()
		
		this.setDefaultEvents()
		
		RolloutCreator = RolloutCreator_v id:id title:title
	)

)
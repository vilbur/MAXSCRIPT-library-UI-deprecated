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
  * @method	void	onOpen( @param	string	callback[, @param	string	tooltip] )	
  * @method	void	onClose( @param	string	callback[, @param	string	tooltip] )	
  *
  */
struct Rollout_v
(
	/* required properties */
	title,
	__construct = #(#title),

	/* optionable properties */
	id,

	/* store rollout and parent rollout */
	roll,
	parent_roll,

	--private
	
	/* dependency */
	Layout	= Layout_v(),
	
	/* options */
	ini, -- inherit by Floater_v
	properties_keys	=  #(#width, #height, #pos),

	/* lists */
 	ControlBoxes	= #(),
	Subrollouts	= Subrollouts_v parent_roll:this,
	RolloutEvent	= RolloutEvent_v parent_control:this,
	
	_controls	= #(),	-- store ids of added controls in rollout
	
	type	= #rollout, -- reference for this.RolloutEvent._bindDefaultEvent()

	/*------ EXTENDED METHODS ------*/
	onOpen	= RolloutEvent.onOpen,
	onClose	= RolloutEvent.onClose,

	public	

	/** Create rollout dialog
	  * [ Wrapper for CreateDialog()](http://help.autodesk.com/view/3DSMAX/2015/ENU/?guid=__files_GUID_816D257C_CD2D_4753_A792_6E7AEFAFA6A7_htm)
	  * @return	RolloutClass
	 */
    function create width: height: pos: =
	(
		this._createRollout()
		
		CreateDialog (roll.def) 
		
		this.properties #(width, height, pos)
		
		Subrollouts.addSubRollouts()
		
		roll --return
	),
	/** Create rollout
	 */
	function _createRollout =
	(
		roll.begin()
		
		this._renderControls()
		
		Subrollouts.createSubRollouts()
		Subrollouts.addSubrolloutsDefinition()

		this._addEventHandlers()

		this._addSaveIniFunction()

		roll.end()
	),
	/** Subrollout
	 */
	function subrollout title id: =
	(
		_subrollout = Rollout_v title:title id:id
		
		Subrollouts.add _subrollout
		
		_subrollout --return 
	),
	/** Set properties
	 */
	function properties properties_values =
	(
		for i = 1 to properties_keys.count where properties_values[i] != unsupplied do
			execute ( id + "."+properties_keys[i]+" = " + properties_values[i] as string )  
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

	/*---------------------------------------
		CONTROLS 
	-----------------------------------------*/
	/** Get Controls for rollout
	  * @param	string	[groupbox]	Title of group box
	  * @return [Controls](../../Controls)
	 */
	function controls groupbox:undefined =
	(
		Controls_new 	= Controls_v parent_roll:this groupbox:groupbox

		append this.ControlBoxes Controls_new

		Controls_new --return
	),
	/** Add control id to array controls
	 */
	function addControl Control =
	(
		--print "------------\nRollout.addControl()"
		appendIfUnique _controls Control.id.id
		--format " _controls	= % \n" _controls
	),
	/** Has control
	 */
	function hasControl id =
	(
		--print "------------\nRollout.hasControl()"
		has_control = findItem _controls id > 0
		--format " id	= % \n has_control	= % \n\n" id has_control
		has_control --return
		--findItem _controls id > 0 --return
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
		
		id_by_title = ( dotNetObject "System.Text.RegularExpressions.Regex" @"[\s-]+" ).Replace ( toLower title ) "_";

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
	/** Try destroy dialog by global variable before variable will be overwritten
	 */
	function destroy =
	(
		try( execute("cui.UnRegisterDialogBar " +id) )catch()
		try( execute("DestroyDialog "           +id) )catch()
	),
	/** Create new roll with [ RolloutCreator() ](http://help.autodesk.com/view/3DSMAX/2019/ENU/?guid=GUID-5FC5036F-E2D7-46C9-9AFA-7B3550B9F254)
	 */
	function _setRoll =
	(
		roll = rolloutCreator id title
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

	/**  Add controls to UI on rollout creation
	*/
	function _renderControls =
	(
		for Controls in ControlBoxes do
			Controls._renderControls()
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
	  *
	  */
	function _addSaveIniFunction =
	(
		if( ini != undefined ) then
			roll.addText( "function saveIni _section _key _value = ( ((Ini_v()).path @"+ini+"@).save _section _key _value )" )
	),

	
	/*------------------------------------------------------------------------------
		CONSTRUCT
	--------------------------------------------------------------------------------*/
	

	/** Check if required properties are defined
	  * Names of construct props are defined in __construct array E.g.: __construct = #( #prop_name ) 
	  * @param	construct_properties this.properties required for initialization of struct
	 */
	function checkConstctructProperties =
	(
		for prop in __construct where getProperty this prop == undefined do
			messageBox ("Undefined construct property !\n\n"+ ((filterString( classof this as string )"(:")[2]) +"."+ prop )
	),
	
	
	on create do
	(
		checkConstctructProperties()
		
		this._setId()
		
		this.destroy()
		
		this._setRolloutGlobalVariable()
		
		this._setRoll()
		
		this.setDefaultEvents()
	)


)
s

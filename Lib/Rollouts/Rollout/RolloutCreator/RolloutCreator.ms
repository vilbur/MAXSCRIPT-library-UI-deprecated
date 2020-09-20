/** [ Wrapper for RolloutCreator ](http://help.autodesk.com/view/3DSMAX/2015/ENU/?guid=__files_GUID_5FC5036F_E2D7_46C9_9AFA_7B3550B9F254_htm)
 *
 */
struct RolloutCreator_v
(
	__construct = #( #id, #title ),
	/* required */
	id,
	title,

	/* options */
	
	--subrollouts_slot = "default_slot",
	_rolloutCreator,
	
	--_Containers	= Containers_v(),
	definition = " ", -- used in "rolloutCreator.addText( definition )", !!! NOTE: empty string must has whitespace, otherwise is threated as undefined 

	public
	/** Add subrollout slot
	 */
	function addSubrolloutSlot slot_string =
	(
		_rolloutCreator.addText( slot_string )

	),
	/** 
	 */
    function getDefinition =
	(
		_rolloutCreator.def --return
	),

	/** 
	 */
	function endOfDefinition =
	(
		_rolloutCreator.end()
	),
	/** Add saveIni() function to rollout
	  * This function is called before user callback
	  */
	function addSaveIniFunction text_to_write =
	(
		_rolloutCreator.addText ( text_to_write )
		
	--	/** Bind events to rollout 
	--	 */
	--	--if( ini != undefined ) then 
	--		--_rolloutCreator.addText ()
	),
	/** Add default events to rollout
	 */
	function addDefaultEvents =
	(
		_rolloutCreator.addText ( text_to_write )
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
		this._checkConstctructProperties()
		
		_rolloutCreator = rolloutCreator id title
		
		_rolloutCreator.begin()
	)

)
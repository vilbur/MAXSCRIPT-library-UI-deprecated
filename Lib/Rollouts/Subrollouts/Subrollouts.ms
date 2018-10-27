/** Create List
  *
  */
struct Subrollouts_v
(
	subrollouts_created,
	
	List	= #(),
	
	/** Add
	 */
	function add _subrollout =
	(
		append List _subrollout  
	),
	
	/** Add sub rollouts definition to rollout
	  *
	  *
	 */
	function createSubRollouts =
	(
		if not ( this._anySubrolloutExists() ) then
			return()
			
		for _rollout in List do
			_rollout._setRolloutCreator()
			
		subrollouts_created = true
		--if( height==undefined ) then
			--height = (getMAXWindowSize()).y - 256 -- SIZE_OF_DIALOG
	),
	/** [ Get definition of subrollouts ](http://help.autodesk.com/view/3DSMAX/2019/ENU/?guid=GUID-CDE5B06D-4BB4-4DEA-96C1-6BAB98709F09#GUID-CDE5B06D-4BB4-4DEA-96C1-6BAB98709F09__WS73099CC142F487553098682E12AC2FC2BC7-7472)
	  *
	  * This definitions is added to with "rolloutCreator.addText( getSubrolloutsDefinition() )"
	  *
	  * @example of returned snippet:
	  * --------------------------------------------------------------------------------
	  *		rollout rollout_id "Main rollout"
	  *		(
	  *		  	subRollout subrollout_id_a "Subrollouts" -- LINES LIKE THESE ARE RETURNED
	  *		  	subRollout subrollout_id_b "Subrollouts" -- LINES LIKE THESE ARE RETURNED
	  *		)
	  * --------------------------------------------------------------------------------
	  *
	  * @return	string|undefined If any subrollout is defined, otherwise undefined
	 */
	function getSubrolloutsDefinition =
	(
		subrollouts_definition = ""
		
		if( this._anySubrolloutExists() ) then
			for subrollout in List do
				subrollouts_definition += "\n subRollout " + subrollout.id + " \"Subrollouts\""
		
		if( subrollouts_definition != "" ) then 
			subrollouts_definition --return
	),

	/** [ Execute "AddSubRollout" command for all subrollouts ](http://help.autodesk.com/view/3DSMAX/2019/ENU/?guid=GUID-CDE5B06D-4BB4-4DEA-96C1-6BAB98709F09#GUID-CDE5B06D-4BB4-4DEA-96C1-6BAB98709F09__WS73099CC142F487553098682E12AC2FC2BC7-7472)
	  *
	  * @example of executed snippet:
	  * --------------------------------------------------------------------------------
	  *		AddSubRollout rollout_id.subrollout_id_a subrollout_id_a -- LINES LIKE THESE ARE EXECUTED
	  *		AddSubRollout rollout_id.subrollout_id_b subrollout_id_b -- LINES LIKE THESE ARE EXECUTED
	  *
	  * --------------------------------------------------------------------------------
	  *
	  * @param	string	parrent_rollout_id
	 */
	function addSubRollouts parrent_rollout_id =
	(
		if not ( this._anySubrolloutExists() ) then
			return()

		if not ( this._anySubroullotsAreCreated() ) then
			messageBox "✖ ERROR:\n\nBefore method:\n    Subrollouts_v.addSubRollouts()\n\nMust be executed:\n    Subrollouts_v._createSubrollouts()" beep:true
			
		add_subrollouts = ""
		
		for subrollout in List do
			add_subrollouts += "\n AddSubRollout " + parrent_rollout_id + "." + subrollout.id +  " " + subrollout.id

		format "Subrollouts_v._getAddSubrolloutString() Added subrollouts: % \n" add_subrollouts
		execute (add_subrollouts)
	),
	
	private
	
	/** Any subrollout exists
	 */
	function _anySubrolloutExists =
	(
		List.count > 0 --return
	),
	/** Subrouulots are created
	 */
	function _anySubroullotsAreCreated =
	(
		subrollouts_created != undefined and subrollouts_created == true
	),
	/*------------------------------------------------------------------------------
		CONSTRUCT
	--------------------------------------------------------------------------------*/
	
	__construct = #(),

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
	)


)

/** Create Rollouts
  *
  */
struct Subrollouts_v
(
	__construct = #( #slot ),

	/* required */
	slot,

	/* dependency */
	/* reference */
	/* properties */
	subrollouts_slot = " ", -- used in "rolloutCreator.addText( subrollouts_slot )", !!! NOTE: empty string must has whitespace, otherwise is threated as undefined 
	
	Rollouts	= #(),
	
	/** Add
	 */
	function add _subrollout =
	(
		--print "\n------------\nSubrollouts.add()"
		--format "_subrollout = % \n" _subrollout
		--format "Rollouts = % \n" Rollouts
		--format "classof Rollouts = % \n" (classof Rollouts)
		append Rollouts _subrollout  
	),
	
	/** Create Subrollouts and generate subrollouts_slot
	 */
	function createSubRollouts =
	(
		print "\n------------\nSubrollouts.createSubRollouts() "
		format " this._anySubrolloutExists()	= % \n" (this._anySubrolloutExists())
		if not ( this._anySubrolloutExists() ) then
			return()
			
		for _rollout in Rollouts do
			_rollout._createRollout()
				
		--if( height==undefined ) then
			--height = (getMAXWindowSize()).y - 256 -- SIZE_OF_DIALOG
			
	),
	/** [ Get subrollouts_slot of subrollouts ](http://help.autodesk.com/view/3DSMAX/2019/ENU/?guid=GUID-CDE5B06D-4BB4-4DEA-96C1-6BAB98709F09#GUID-CDE5B06D-4BB4-4DEA-96C1-6BAB98709F09__WS73099CC142F487553098682E12AC2FC2BC7-7472)
	  *
	  * This definitions is added to with "rolloutCreator.addText( getSubrolloutsDefinition() )"
	  *
	  * @example of returned snippet:
	  * --------------------------------------------------------------------------------
	  *		
	  *	  subRollout subrollout_id_1 "Subrollouts"
	  *	  subRollout subrollout_id_2 "Subrollouts"
	  *		
	  * --------------------------------------------------------------------------------
	  *
	  * @return	string|undefined If any subrollout is defined, otherwise undefined
	 */
	function setSubrolloutSlot =
	(
		for subrollout in Rollouts do
			subrollouts_slot += "\n subrollout " + subrollout.id + " \""+ subrollouts_slot +"\""
			--subrollouts_slot = "\n subrollout " + slot + " \"subrollouts\""
			
		--format "\n-----------\nSubrollouts_v.subrollouts_slot = %" subrollouts_slot
	),

	/** [ Execute "AddSubRollout" command for all subrollouts ](http://help.autodesk.com/view/3DSMAX/2019/ENU/?guid=GUID-CDE5B06D-4BB4-4DEA-96C1-6BAB98709F09#GUID-CDE5B06D-4BB4-4DEA-96C1-6BAB98709F09__WS73099CC142F487553098682E12AC2FC2BC7-7472)
	  *
	  * @example of executed snippet:
	  * --------------------------------------------------------------------------------
	  *
	  *		AddSubRollout rollout_id.subrollout_id_1 subrollout_id_1 -- THIS KIND OF LINES IS EXECUTED
	  *		AddSubRollout rollout_id.subrollout_id_2 subrollout_id_2 -- THIS KIND OF LINES IS EXECUTED
	  *
	  * --------------------------------------------------------------------------------
	  *
	  * @param	string	parrent_rollout_id
	 */
	function addSubRollouts parrent_rollout_id =
	(
		print "\n------------\nSubrollouts.addSubRollouts()"
		format " this._anySubrolloutExists()	= % \n" (this._anySubrolloutExists())
		if not ( this._anySubrolloutExists() ) then
			return()
		
		----if not ( this._anySubroullotsAreCreated() ) then
		--	--messageBox "✖ ERROR:\n\nBefore method:\n    Subrollouts_v.addSubRollouts()\n\nMust be executed:\n    Subrollouts_v._createSubrollouts()" beep:true
			
		add_subrollouts = " "
		
		for subrollout in Rollouts do
			--add_subrollouts += "\n AddSubRollout " + parrent_rollout_id + "." + subrollout.id +  " " + subrollout.id
			add_subrollouts += "\n AddSubRollout " + parrent_rollout_id + "." + slot + " " + subrollout.id
		
			
		format "\n-----------\nSubrollouts_v._getAddSubrolloutString()\nADDED SUBROLLOUTS: %\n\n" add_subrollouts
		--execute (add_subrollouts)
	),
	/** Any subrollout exists
	 */
	function _anySubrolloutExists =
	(
		Rollouts.count > 0 --return
	),
	
	private
	

	/*------------------------------------------------------------------------------
		CONSTRUCT
	--------------------------------------------------------------------------------*/
		
	/** Check if required properties are defined when an instance of the struct is created.
	 *
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
	)
)

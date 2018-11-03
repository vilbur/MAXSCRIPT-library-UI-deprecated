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
	definition = "", -- used in "rolloutCreator.addText( definition )"
	
	Rollouts	= #(),
	
	/** Add
	 */
	function add _subrollout =
	(
		print "------------\nSubrollouts.add()"
		format "_subrollout = % \n" _subrollout
		format "Rollouts = % \n" Rollouts
		format "classof Rollouts = % \n" (classof Rollouts)
		append Rollouts _subrollout  
	),
	
	/** Create Subrollouts and generate definition
	 */
	function createSubRollouts =
	(
		--print "------------\nSubrollouts.createSubRollouts()"
		if not ( this._anySubrolloutExists() ) then
			return()
			
		for _rollout in Rollouts do
			_rollout._createRollout()
		
		this._setDefinition()
		
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
	--function _setDefinition =
	--(
	--	--for subrollout in Rollouts do
	--		--definition += "\n subrollout " + subrollout.id + " \"Subrollouts\""s
	--		
	--	definition = "\n subrollout " + slot + " \"Subrollouts\""
	--),

	/** [ Execute "AddSubRollout" command for all subrollouts ](http://help.autodesk.com/view/3DSMAX/2019/ENU/?guid=GUID-CDE5B06D-4BB4-4DEA-96C1-6BAB98709F09#GUID-CDE5B06D-4BB4-4DEA-96C1-6BAB98709F09__WS73099CC142F487553098682E12AC2FC2BC7-7472)
	  *
	  * @example of executed snippet:
	  * --------------------------------------------------------------------------------
	  *
	  *		AddSubRollout rollout_id.subrollout_id_a subrollout_id_a -- LINES LIKE THESE ARE EXECUTED
	  *		AddSubRollout rollout_id.subrollout_id_b subrollout_id_b -- LINES LIKE THESE ARE EXECUTED
	  *
	  * --------------------------------------------------------------------------------
	  *
	  * @param	string	parrent_rollout_id
	 */
	function addSubRollouts parrent_rollout_id =
	(
		print "------------\nSubrollouts.addSubRollouts()"
		format " this._anySubrolloutExists()	= % \n" (this._anySubrolloutExists())
		if not ( this._anySubrolloutExists() ) then
			return()

		--if not ( this._anySubroullotsAreCreated() ) then
			--messageBox "✖ ERROR:\n\nBefore method:\n    Subrollouts_v.addSubRollouts()\n\nMust be executed:\n    Subrollouts_v._createSubrollouts()" beep:true
			
		add_subrollouts = ""
		
		for subrollout in Rollouts do
			--add_subrollouts += "\n AddSubRollout " + parrent_rollout_id + "." + subrollout.id +  " " + subrollout.id
			add_subrollouts += "\n AddSubRollout " + parrent_rollout_id + "." + slot + " " + subrollout.id

			
		format "\n-----------\nSubrollouts_v._getAddSubrolloutString()\n ADDED SUBROLLOUTS: %\n\n" add_subrollouts
		execute (add_subrollouts)
	),
	
	private
	
	/** Any subrollout exists
	 */
	function _anySubrolloutExists =
	(
		Rollouts.count > 0 --return
	),

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

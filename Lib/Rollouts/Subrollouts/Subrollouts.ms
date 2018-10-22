/** Create List
  *
  */
struct Subrollouts_v
(
	
	parent_roll,
	
	private
	
	List	= #(),
	
	public
	
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
		if( List.count == 0 ) then
			return ()
		--if( height==undefined ) then
			--height = (getMAXWindowSize()).y - 256 -- SIZE_OF_DIALOG
		for _rollout in List do
			_rollout._createRollout()
	),
	/** Add sub rollouts definition to rollout
	  *
	  *
	 */
	function addSubrolloutsDefinition =
	(
		if( List.count == 0 ) then
			return ()

		--print ( "\nsubRollout " + id + "List " + "\"List\"" )
		parent_roll.roll.addText ( "\nsubRollout " + parent_roll.id + "List " + "\"List\"" )
	),

	/** Add sub rollouts
	 *
	 * create and execute following example of code:
	 *   "AddSubRollout rollout_main.subRollout1 subRollout1a
	 * 	 AddSubRollout rollout_main.subRollout1 subRollout1b"
	 */
	function addSubRollouts =
	(
		print "------------\nSubrollouts.addSubRollouts()"
		format " List	= % \n" List
		if( List.count == 0 ) then
			return ()
		
		add_subrollouts = ""
		
		for subrollout in List do
			add_subrollouts += "\nAddSubRollout " + parent_roll.id + "." + parent_roll.id + "List " +  " " + subrollout.id
		--format " add_subrollouts	= % \n" add_subrollouts
		execute add_subrollouts
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
		checkConstctructProperties()s
		
		--this._setId()
		--
		--this.destroy()
		--
		--this._setRolloutGlobalVariable()
		--
		--this._setRoll()
		--
		--this.setDefaultEvents()
	)


)

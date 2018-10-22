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
		if( this.anySubrolloutExists() ) then
			for _rollout in List do
				_rollout._createRollout()
		--if( height==undefined ) then
			--height = (getMAXWindowSize()).y - 256 -- SIZE_OF_DIALOG
	),
	/** Add sub rollouts definition to rollout
	  *
	  * [Get following example of code:](http://help.autodesk.com/view/3DSMAX/2019/ENU/?guid=GUID-CDE5B06D-4BB4-4DEA-96C1-6BAB98709F09#GUID-CDE5B06D-4BB4-4DEA-96C1-6BAB98709F09__WS73099CC142F487553098682E12AC2FC2BC7-7472)
	  *		   subrollout test1 "test1"
	  *		   subrollout test2 "test2"
	  *
	  * @return	string 	'subRollout {subrollout.id}_subrollout "Subrollouts"'
	 */
	function addSubrolloutsDefinition =
	(
		if( this.anySubrolloutExists() ) then
			for subrollout in List do
				parent_roll.roll.addText ( "\n subRollout " + this.getSubrolloutSlotId subrollout + " \"Subrollouts\"" )
	),

	/** Add sub rollouts
	 * [ Execute this "AddSubRollout rollout_main.subRollout1 subRollout1a" example of code: ](http://help.autodesk.com/view/3DSMAX/2019/ENU/?guid=GUID-CDE5B06D-4BB4-4DEA-96C1-6BAB98709F09#GUID-CDE5B06D-4BB4-4DEA-96C1-6BAB98709F09__WS73099CC142F487553098682E12AC2FC2BC7-7472)
	 */
	function addSubRollouts =
	(
		if( this.anySubrolloutExists() ) then
			execute (this.getAddSubrolloutString())
	),
	
	private
	
	/** Get executable string for adding of subrollouts
	 *
	 * [ Get this "AddSubRollout test.test2 test2a" example on lines 11-12: ](http://help.autodesk.com/view/3DSMAX/2019/ENU/?guid=GUID-CDE5B06D-4BB4-4DEA-96C1-6BAB98709F09#GUID-CDE5B06D-4BB4-4DEA-96C1-6BAB98709F09__WS73099CC142F487553098682E12AC2FC2BC7-7472)
	 *
	 *  @return	string "AddSubRollout {rollout.id}.{subrollout.id}_subrollout {subrollout.id}"	
	 */
	function getAddSubrolloutString =
	(
		add_subrollouts = ""
		
		for subrollout in List do
			add_subrollouts += "\n AddSubRollout " + parent_roll.id + "." + this.getSubrolloutSlotId subrollout +  " " + subrollout.id
		
		add_subrollouts --return
	),
	/** Any subrollout exists
	 */
	function anySubrolloutExists =
	(
		List.count > 0 --return
	),

	/** Get subrollout slot id
	  * @param	object	__[rollout](../Rollout)__
	  * @return	string	"{subrollout.id}_subrollout"
	 */
	function getSubrolloutSlotId subrollout =
	(
		subrollout.id + "_subrollout " --return
	),
	/*------------------------------------------------------------------------------
		CONSTRUCT
	--------------------------------------------------------------------------------*/
	
	__construct = #(#parent_roll),

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

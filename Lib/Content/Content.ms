/** Load content to UI by structure on disk
  *
  * @example
  * 	'Content dir\'          - Main dir
  * 		'Rollout 1\'        - Every directory is rollout
  * 			'groupbox.mcr'	- Hole file is Gorupbox & every macro in *.mcr file is buton
  * 			'custom-ui.ms'	- Each script will be executed on floater creation
  *
 */
struct Content_v
(
	dir	= getFilenamePath(getSourceFileName()) + "/../../../Content",
	subdirs	="*",
	Rollouts	= #(),

	/** Load UI structure from dir
	 */
	function loadTree =
	(
		this._loadRolloutsFromFiles()
		
		this --return
	),
	
	/** Set controls to
	  * @param	__[Floater](../Floater)__
	 */
	function setControlsToUI Floater =
	(
		print ( "-------------Rollouts=" + Rollouts as string )
		
		for r=1 to Rollouts.count do
			Rollouts[r].insertRollout Floater r
			
	),
	/** Load rollouts from files
	 */
	function _loadRolloutsFromFiles =
	(
		_rollout_dirs =  getDirectories( dir + "/"+ subdirs)

		for dir in _rollout_dirs do
			append Rollouts ( (Rollout_Content_v()).load dir )
			
		--this._insertRolloutsToUi()
	),


	function test =
	(
		messagebox "Content.test()"
	)
)















/** Load content to UI by file tree
  *
  * @property	string	dir	Directory where rollout directories are placed, rollouts are used if ends with "*"
  * @property	regEx	rollouts	Only directories matching 
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
	rollouts	="*",
	
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
		content_dirs =  this._getContentDirs()
		--print ( "content_dirs=" + content_dirs as string )
		for main_dir in content_dirs do
			for _rollouts_dir in main_dir do
				append Rollouts ( (Rollout_Content_v()).load _rollouts_dir )
			
	),
	
	/** Get directories which contain rollout directories
	  *
	  * @example return #( "MainDir" )
	  *		1) MainDir\  
	  * 				rollout-A
	  * 				rollout-B
	  * 
	  * @example return #( "MainDir\Subdir-1", "MainDir\Subdir-2" )
	  *		2) MainDir\
	  * 				Subdir-1\
	  * 					rollout-A
	  * 					rollout-B
	  * 				Subdir-2\
	  * 					rollout-C
	  *
	  * @return	array	Array of directories which contains rollout directories 
	 */
	function _getContentDirs =
	(
		if ((dotnetObject "System.Text.RegularExpressions.Regex" "").IsMatch dir @"\*$") then
		(
			content_dirs	= getDirectories dir
			sub_dirs	= #()
			
			for _dir in content_dirs do
				append sub_dirs (this._getRolloutDirectories _dir)

			sub_dirs --return
		)
		else
			return #( this._getRolloutDirectories dir )
	),
	
	/** Get rollout directories
	 */
	function _getRolloutDirectories _dir =
	(
		return getDirectories( _dir + "/"+ rollouts)
	),
	


	function test =
	(
		messagebox "Content.test()"
	)
)




/** Load content to UI by file tree
  *
  * @property	string	dir	Directory where rollout directories are placed, rollouts are used if ends with "*"
  * @property	regEx	match	Only directories matching this regex are threaded as rollouts, rollout name is matching group if defined
  *
  * --------------------------------------------------------------------------------------------------------------------
  * @example 1) Content_v dir:("C:/ContentDir") -- load all dirs in directory as rollouts
  *		ContentDir\  
  *			rollout-A\
  *				groupbox.mcr	- Hole file is Gorupbox & every macro in *.mcr file is buton
  *			rollout-B\
  *				custom-ui.ms	- Each script will be executed on floater creation
  *	 
  * --------------------------------------------------------------------------------------------------------------------
  * @example 2) Content_v dir:("C:/ContentDir/*") match:"rollout-(.*)" -- load directories in subdirs, only dirs matching regex are used as rollouts, rollout name is match group
  *		ContentDir\
  *			Subdir-1\
  *				rollout-A\
  *				this-is-not-matching\
  *			Subdir-2\
  *				rollout-C\
  *
  */
struct Content_v
(
	
	dir	= getFilenamePath(getSourceFileName()) + "/../../../Content",
	match	= ".*",
	
	Rollouts	= #(),
	
	rx_options	= dotNetClass "System.Text.RegularExpressions.RegexOptions",
	rx	= dotNetClass "System.Text.RegularExpressions.Regex",
	
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

		for main_dir in content_dirs do
			for _rollouts_dir in main_dir do
				append Rollouts ( (Rollout_Content_v name:(this._getRolloutName _rollouts_dir) ).load _rollouts_dir )
	),
	
	/** Get directories which contain rollout directories
	  *
	  * @example return #( "ContentDir" )
	  *		1) ContentDir\  
	  * 				rollout-A\
	  * 				rollout-B\
	  * 
	  * @example return #( "ContentDir\Subdir-1", "ContentDir\Subdir-2" )
	  *		2) ContentDir\
	  * 				Subdir-1\
	  * 					rollout-A\
	  * 					rollout-B\
	  * 				Subdir-2\
	  * 					rollout-C\
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
		match_dirs	= #()
		dirs	= getDirectories (_dir + "/*")
		
		for dir in dirs where this._isDirNameMatch dir == true do
			append match_dirs dir
		
		match_dirs --return
	),
	/** If directory name match to regext
	 */
	function _isDirNameMatch _dir =
	(
		dir_name = filenameFromPath (trimRight _dir "\\")
		
		print ( "_isDirNameMatch=" + dir_name as string )
		print ( "match=" + (rx.isMatch dir_name match rx_options.IgnoreCase) as string )
		
		
		
		rx.isMatch dir_name match rx_options.IgnoreCase --return
	),	
	/** If directory name match to regext
	 */
	function _getRolloutName _dir =
	(
		print ( "_dir=" + _dir as string )
		match_dirname	= rx.Match _dir match rx_options.IgnoreCase 
		matches	= for i = 1 to (match_dirname.Groups.count - 1) collect (match_dirname.groups.item[i].value )

		matches[1] --return
	),	
	function test =
	(
		messagebox "Content.test()"
	)
)




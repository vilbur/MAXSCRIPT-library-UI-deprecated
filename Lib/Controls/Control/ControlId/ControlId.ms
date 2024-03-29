filein( getFilenamePath(getSourceFileName()) + "/../../../Id/Id.ms" )

/** Control id
 */
struct ControlId_v
(
	__construct = #( #Parent_control ),
	/* dependency */

	/* properties */
	Parent_control,
	id,
	full,
	
	/** Set
	  @return	string	
	 */
	function setId id =
	(
		this.id	= id
		
		if not( this._isIdValid() ) then
			this._setIdByConrolType()

		this._sanitizeId()
		
		this._setIdFull()
	),
	/** Get
	 */
	function get =
	(
		id --return
	),
	--/** Full
	-- */
	--function full =
	--(
	--	_full --return
	--),
	
	private
	
	/** Is id valid
	 */
	function _isIdValid =
	(
		( id == unsupplied or id == undefined ) == false  --return
	),
	/** Use controls caption, if id is unsuplied
	 */
	function _setIdByConrolType =
	(
		id = Parent_control.caption + "_" + Parent_control.type as string
	),

	/** _set id full
	 */
	function _setIdFull =
	(
		--print "HOTFIX ------------\nControlId._setIdFull()"
		--full	= Parent_control.Parent_roll.id +"."+id -- make without Parent_roll
		--full	= id -- hotfix
	),
	/** Sanitize id
	 */
	function _sanitizeId =
	(
		--print "------------\nControlId._sanitizeId()"
		--id_no_whitespace = substituteString id " " "_" -- replace whitespace
		--
		--id = (( dotNetObject "System.Text.RegularExpressions.Regex" @"[^A-Za-z0-9_]+" ).Replace ( toLower (id_no_whitespace) ) "") --return
		--format " id	= % \n" id
		id = (Id_v	id:id).sanitizeId()
	),


	/** Check if required properties are defined
	  * Names of construct props are defined in __construct array E.g.: __construct = #( #prop_name ) 
	  * @param	construct_properties this.properties required for initialization of struct
	 */
	function _checkConstctructProperties =
	(
		for prop in __construct where getProperty this prop == undefined do
			messageBox ("Undefined construct property !\n\n"+ ((filterString( classof this as string )"(:")[2]) +"."+ prop )
	),
	
	on create do
	(
		this._checkConstctructProperties()
	)
)

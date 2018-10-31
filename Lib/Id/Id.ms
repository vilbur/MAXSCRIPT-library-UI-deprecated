/** Id
 */
struct Id_v
(
	__construct = #( #id ),
	
	/* required */
	id,
	/* dependency */
	/* reference */
	/* properties */
	
	/** Sanitize id
	 */
	function sanitizeId =
	(
		--print "------------\nControlId._sanitizeId()"
		(( dotNetObject "System.Text.RegularExpressions.Regex" @"[^A-Za-z0-9_]+" ).Replace ( toLower (this._removeWhitespace()) ) "") --return
	),
	
	private
	
	/** Replace whitespace with underscore
	 */
	function _removeWhitespace =
	(
		substituteString id " " "_" -- replace whitespace
	),

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
		_checkConstctructProperties()
	)
	
)

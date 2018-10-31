
property_keys	=  #(#width, #height, #pos),
	
/** Height
 */
function height height relative:false =
(
	this._callProperty #height height relative
),
/** Width 
 */
function width width relative:false =
(
	this._callProperty #width width relative
),
/** Pos
 */
function pos position relative:false =
(
	this._callProperty #pos position relative
),

/** Set properties
 */
function all width: height: pos: relative:false =
(
	--print "------------\nPropertyMethods.all()" 
	properties_values = #( width, height, pos )
	--format " properties_values	= % \n" properties_values
	for i = 1 to property_keys.count where properties_values[i] != unsupplied do
		this._setProperty property_keys[i] properties_values[i] relative
),
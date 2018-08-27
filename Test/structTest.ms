--global test_path = "c:/Users/vilbur/AppData/Local/Autodesk/3dsMax/2016 - 64bit/ENU/scripts/Library/_UI/Test/structTestBody.ms"
--global test_path = #("$userscripts/Library/_UI/Test/structTestBody.ms")

userscripts_path_default = getDir #userscripts
SetDir #userscripts (getFilenamePath(getSourceFileName()))

/** Struct test
 */
struct StructTest_v
(
	
	__construct = this._construct #(),
	

	include "structTestBody.ms" 
 

	--include "$userscripts/Library/_UI/Test/structTestBody.ms"
	--execute ("include "+test_path[1])
	--include @( getFilenamePath(getSourceFileName()) + "/structTestBody.ms" )
	/*------------------------------------------------------------------------------
		PRIVATE
	--------------------------------------------------------------------------------*/
	 
	/** Get\set value of property 
	  * @param	string|name key	Name  of property E.G.: "foo_key" OR #foo_key 
	  * @param	string|#get value	Value of property
	  *
	  * @return	string|self Value or self
	  *
	  * @example this._getSetProp "foo" "bar" -- SET "bar" to property "foo"
	  * @example this._getSetProp #foo  #get  -- GET value of property "foo"
	  *
	  */
	function _getSetProp key value =  
	(
		if( value != #get ) then
		(
			setProperty  this ( key as string ) value
			this --return
		) else
			getProperty this ( key as string ) --return
	),
	
	/** Construct, check if construct_properties are defined
	  * @param	#( #prop_name ) construct_properties
	 */
	function _construct construct_properties =
	(
		for prop in construct_properties where getProperty this prop == undefined do
			messageBox ("Undefined construct property\n\nProperty:"+prop+"\n\n"+ classof this as string )
	)
	
)


(StructTest_v()).test()

SetDir #userscripts userscripts_path_default
--print ( "getDir $userscripts = " + (getDir #userscripts ) as string ) 
/** Props
 */
struct Props_v
(
	Control,

	List	= List_v(),
	
	/** Add value
	 */
	function add param value force:true =
	(
		--print "------------\nParams.add()"
		
		if( force == true or this.get param == undefined ) then  
			List.setVal param value
		
		--format "Control = % \n" Control
		--format "Control.exists() = % \n" (Control.exists())
		if ( Control.exists() ) then
			this.setProp param value
			--format "****param = % \nvalue = % \n" param value
		
		return this
	),
	/** Get value
	 */
	function get param =
	(
		if not ( Control.exists() ) then
			List.getVal param -- return
			
		else
			this.getProp param 
	),
	/** Remove
	 */
	function remove param =
	(
		List.delete param
		
		this
	),
	/** Join
	 */
	function join =
	(
		--print "------------\nParams.join()"
		params = ""

		for k=1 to List.keys.count do
			params = params + " " + List.keys[k] +":"+ List.values[k] as string

		--format " params	= % \n" params
		params --return
	),
	
	/*------------------------------------------------------------------------------
		PRIVATE
	--------------------------------------------------------------------------------*/
	/** Get prop path
	 */
	function propPath prop_name =
	(
		--print "------------\nParams.propPath()"
		--format "Path = % \n" (Control.control + "." + (prop_name as string ))
		Control.control + "." + (prop_name as string ) --return
	),
	/** Set prop
	 */
	function setProp prop_name _value =
	(
		if( classOf _value == String ) then 
			_value = "\""+_value as string +"\""
		
		execute ((this.propPath prop_name) + "="+_value as string ) -- set value
		--execute ((this.propPath prop_name) + "=\""+_value as string +"\"" ) -- set value
		
		this --return	
	),
	/** Get prop
	 */
	function getProp prop_name =
	(
		execute (this.propPath prop_name)
	),
	
	/** Construct
	 */
	function _construct =
	(
		--print "------------\nParams._construct()"
	),
	
	__construct = this._construct()	
	
	--function test =
	--(
	--	messagebox "Props.test()"
	--)
	
	
)

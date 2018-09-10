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
		--print "------------\nProps.add()"

		if( force == true or this.get param == undefined ) then  
			List.setVal param value
		
		if ( Control.exists() ) then
			this.setProp param value
		
		this --return
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
		--print "------------\nProps.join()"
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
		--print "------------\nProps.propPath()"
		Control.id.full + "." + (prop_name as string ) --return
	),
	/** Set prop
	 */
	function setProp prop_name _value =
	(
		--print "------------\nProps.setProp()"
		if( classOf _value == String ) then 
			_value = "\""+_value as string +"\""
		
		execute ((this.propPath prop_name) + "="+_value as string ) -- set value
		
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
		--print "------------\nProps._construct()"
	),
	
	__construct = this._construct()	
	
	--function test =
	--(
	--	messagebox "Props.test()"
	--)
	
	
)

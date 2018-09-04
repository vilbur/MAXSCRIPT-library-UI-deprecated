/** Params
 */
struct Params_v
(
	Control,

	List	= List_v(),
	
	/** Add value
	 */
	function add param value force:true =
	(
		--execute ((path + ".text" ) + "=\"Test\"" ) -- set value

		--rollout_test_rollout.paramtest.text = "Test"
		
		
		if( force == true or this.get param == undefined ) then  
			List.setVal param value
			
		return this
	),
	/** Get value
	 */
	function get param =
	(
		return (List.getVal param)
	),
	/** Remove
	 */
	function remove param =
	(
		List.delete param
		
		return this
	),
	/** Join
	 */
	function join =
	(
		params = ""

		for k=1 to List.keys.count do
			params = params + " " + List.keys[k] +":"+ List.values[k] as string
		format "\nParams.join()\nparams = % " params
		return params
	),
	
	/*------------------------------------------------------------------------------
		PRIVATE
	--------------------------------------------------------------------------------*/
	/** Get prop path
	 */
	function propPath prop_name =
	(
		control + "." + (prop_name as string ) --return
	),
	/** Set prop
	 */
	function setProp prop_name _value =
	(
		execute ((this.propPath prop_name) + "="+_value as string ) -- set value
		
		this --return	
	),
	/** Get prop
	 */
	function getProp prop_name =
	(
		execute (this.propPath prop_name)
	),
	
	
	
	function test =
	(
		messagebox "Params.test()"
	)
)

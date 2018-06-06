/** Params
 */
struct Params_v
(
	List	= List_v(),
	
	/** Add value
	 */
	function add param value =
	(
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
		
		return params
	),
	
	function test =
	(
		messagebox "Params.test()"
	)
)

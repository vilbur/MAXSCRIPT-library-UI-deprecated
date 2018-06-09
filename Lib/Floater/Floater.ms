/** Floater
 */
struct Floater_v
(
	self	= this,
	title,
	
	Rollouts	= #(),
	
	/**  
	 */
	function new _title =
	(
		title = _title
		messagebox "Floater.new()"
		return this
	),
	/** Create
	 */
	function create =
	(
		
	),
	/** Create rollout in floater
	  *
	  * 
	 */
	function roll id title =
	(
		messagebox "Floater.rollout()"

	),
	
	
	function test =
	(
		messagebox "Floater.test()"
	)
)

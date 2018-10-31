
/** Button
 */
struct Button_RolloutControl_test 
(
	include "Lib/Controls/Control/ControlExtends.ms"
	
	/** Value as tooltip
	 */
	function valueAsTooltip toggle =
	(
		print "------------\nEditText.valueAsTooltip()"
		if( toggle != true ) then
			return ()
		
		
		--format " Events	= % \n" Events
		format " Events	= % \n" Events.Events.getEvent #changed
		
	),
	
	
	/** Test
	 */
	function test =
	(
		
	)
	
)

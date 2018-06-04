
/** Control
 */
struct Control_v 
(
	self	= this,
	Events	= Events_v parent_control:this,
	--parent_roll,
	type,
	id,
	caption,

	--/** Button
	-- */
	--function button caption id =
	--(
	--	return this.control caption id
	--),
	--/**  Add control of any type
	-- *  @param	string	type	Type of control
	-- *  @param	string	caption	Caption of control
	-- *  @return	[Control](../../Control)
	-- */
	--function control type caption id =
	--(
	--	this.id	= id;
	--	this.type	= type;
	--	this.caption	= caption;
	--	
	--	append this.parent_roll.Controls this
	--	
	--	return this
	--),
	--/** Add control to UI 
	-- */
	--function _addControl =
	--(
	--	this.parent_roll.roll.addControl this.type this.id this.caption paramStr:"width: 128"
	--	
	--	--this.Events._add()
	--),
	/** Add events to UI 
	 */
	function _addEvents =
	(
		for event in this.events.values do
			event._add()
	),
	function test =
	(
		messagebox "Control_v.test()"
	)
)

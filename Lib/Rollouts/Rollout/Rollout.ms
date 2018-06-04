/* Import sub substructs */

/** Rollout
 */
struct Rollout_v
(
	self	= this,
	--test_prop	= "Test value",
	--_Control	= Control_v parent_roll:this,
	--control	= this._Control.control,
	id,
	title,
	roll,
 	_Controls	= #(),
	pos = [0,0],
	/** Set roll property 
	 */
	function new id title =
	(
		this.id	= id
		this.title	= title
		
		this.roll = rolloutCreator this.id this.title
		
		return self
	),
	/** Create rollout 
	 *	
	 */
    function create =
	(
		id = this.id
		try(DestroyDialog id)catch() -- must be above rollout definition

		this.roll.begin()
		
		this._addControls()
		
		CreateDialog (this.roll.end()) width:288
        
		this.roll = this.roll.def
		
	),
	/** Controls
	 */
	function controls groupbox:false =
	(
		Controls_new 	= Controls_v parent_roll:this groupbox:groupbox
		
		append this._Controls Controls_new
		
		return Controls_new
	),
	
	/**  Add controls on rollout creation
	 */
	function _addControls =
	(		
		--for _Controls in this._Controls do
			--this.setPosition ( _Controls._addControls this.pos )
			--pos = _Controls._addControls [0, pos[2]+24]
			
		for i = 1 to this._Controls.count do
			this.setPosition ( this._Controls[i]._addControls this.pos ) i

	),
	/** Get position
	 */
	function setPosition pos index =
	(
		x	= 0
		y = 24
		--if index>1 then y = pos[2]+24 else y = 0
	
		this.pos = [x, y]
	),
	
	function test =
	(
		messagebox "Rollout_v.test()"
	)
	
)
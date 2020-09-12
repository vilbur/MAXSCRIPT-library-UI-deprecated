/** Create Dialog
  * Same parameters as __[ Rollout.create() ](../Rollouts/Rollout)__
 */
function create width: height: pos: =
(		
	--_RolloutMain.dialogCreate height:height width:width pos:pos
	_RolloutMain.dialogCreate()

	Dialog = _RolloutMain._rolloutCreator.def
),

/** Set rollout in Dialog
  * UPDATE OF THIS BLOCK IS NEEDED
  *
  * @param	string	title	Title of rollout
  * @param	string	id	Id of roullout, if empty then sanitized title is used
  * @return	[Rollout](../Rollouts/Rollout)
  *
  * @example roll "Roll Title" "rollout_id" 	// set rollout
  * @example roll "Roll Title" "" 	// set rollout, id will be sanitized title "roll_title"
  */
function roll title id:  =
(
	--_rollout	= Rollout_v ini:(Ini.path #get) title:title id:id
	
	_RolloutMain.subrollout title id:id --return
),

/** Get Rollouts of main roll
 */
function rollouts =
(
	_RolloutMain.Subrollouts.Rollouts --return
),


/** Close
 */
function destroy =
(
	--print "------------\nDialog.destroy()"
	this._unregister()

	--try(DestroyDialog Dialog)catch()
	try(DestroyDialog Dialog )catch()
	
),
/** Set position of dialog relative 3Ds Max window
 */
function position x y =
(
	this.undock()
	
	--Dialog.pos = [ x, y ]
	if not( this._isRegistered() ) then 
		SetDialogPos Dialog ( getMAXWindowPos() + [ x, y ] )
	else
		Dialog.pos = [ x, y ]
),
/** Set size of dialog
 */
function size width height =
(
	this.undock()
	
	Dialog.size = [ width, height ]
),
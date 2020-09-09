clearListener()

/**  Test of adding controls to Parent_roll
 *	
 */

filein( getFilenamePath(getSourceFileName()) + "/../../Rollouts/Rollout/Rollout.ms" )


_Rollout	= Rollout_v title:(filenameFromPath(getSourceFileName()))

struct Control_mock(type = #button, id="test", caption="Test button")

Controls = Controls_v Parent_roll:_Rollout

Controls._addControlToUi (Control_mock())

/* CREATE ROLLOUT */
_Rollout.dialogCreate()	-- create with default params
/**  Test of adding controls to Parent_roll
 *	
 */

clearListener();

filein( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" )

/* ROLLOUT DEFINITION */
_Rollout	= Rollout_v title:(filenameFromPath(getSourceFileName()))

struct Control_mock(type = #button, id="test", caption="Test button")

Controls = Controls_v Parent_roll:_Rollout

Controls._addControl (Control_mock())

/* CREATE ROLLOUT */
_Rollout.dialogCreate()	-- create with default params

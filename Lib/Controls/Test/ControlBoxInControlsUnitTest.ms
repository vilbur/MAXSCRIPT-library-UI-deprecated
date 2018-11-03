/**  Define controls in ControlBox_v and add them to Rollout
 */


filein( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" )

/* ROLLOUT DEFINITION */
struct Control_mock(type = #button, id="", caption="Test button")

_Rollout	= Rollout_v title:(filenameFromPath(getSourceFileName()))
Controls	= Controls_v Parent_roll:_Rollout
ControlBox_1	= ControlBox_v()


for i = 1 to 10 do
	ControlBox_1.add (Control_mock id:("button_"+i as string ) caption:("Button "+i as string))

appendIfUnique  Controls.ControlBoxes ControlBox_1

Controls._addControlsToRollout()

/* CREATE ROLLOUT */
_Rollout.dialogCreate()	-- create with default params

clearListener()

filein( getFilenamePath(getSourceFileName()) + "/../../Rollouts/Rollout/Rollout.ms" )

/* ROLLOUT DEFINITION */
struct Control_mock(type = #button, id="", caption="Test button")

_Rollout	= Rollout_v title:(filenameFromPath(getSourceFileName()))


_SubRollout = _Rollout.subrollout "Rollout 1"
controls_sub = _SubRollout.Controls.box groupbox:"_SubRollout Groupbox 1"


controls_sub.button "Button"

controls_sub.checkbutton "Checkbutton"

/* CREATE ROLLOUT */
_Rollout.dialogCreate()	-- create with default params
--_Rollout.dialogCreate height:320 width:520 pos:[0,0]
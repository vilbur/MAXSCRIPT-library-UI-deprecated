clearListener();

filein( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" )

/* ROLLOUT DEFINITION */
_Rollout	= Rollout_v title:(filenameFromPath(getSourceFileName()))

controls_1 = _Rollout.Controls.box groupbox:"Groupbox 1"

struct Control_mock(type = #button, id="", caption="Test button")

_SubRollout = _Rollout.subrollout "Subrollout 1"

--controls_1.button "Before subrollout 1"

controls_1.add (Control_mock id:("Before_subrollout" ) caption:("Before subrollout"))

--controls_1.button "Before subrollout 2"
controls_1.add (Control_mock id:("Subrollout" ) caption:("Subrollout") type:#rollout)

controls_1.add (Control_mock id:("After_subrollout" ) caption:("After subrollout"))



/* CREATE ROLLOUT */
_Rollout.dialogCreate()	-- create with default params
--_rollout.dialogCreate height:320 width:520 pos:[0,0]


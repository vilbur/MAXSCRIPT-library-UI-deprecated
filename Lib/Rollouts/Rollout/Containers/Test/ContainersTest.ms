filein( getFilenamePath(getSourceFileName()) + "/../../../../../includes.ms" )


/* ROLLOUT DEFINITION */
struct Control_mock(type = #button, id="", caption="Test button")

--_Rollout	= Rollout_v title:(filenameFromPath(getSourceFileName()))

--controls_1 = _Rollout.Controls.box groupbox:"Groupbox 1"
--
--_SubRollout = _Rollout.subrollout "Subrollout 1"
--
----controls_1.button "Before subrollout 1"
--
--controls_1.add (Control_mock id:("Before_subrollout" ) caption:("Before subrollout"))
--
--controls_1.add (Control_mock id:("subrollout_1" ) caption:("Subrollout 1") type:#rolloutcontrol)
--controls_1.add (Control_mock id:("subrollout_2" ) caption:("Subrollout 2") type:#rolloutcontrol)
--
--controls_1.add (Control_mock id:("After_subrollout" ) caption:("After subrollout"))



/* CREATE ROLLOUT */
--_Rollout.dialogCreate()	-- create with default params
--_rollout.dialogCreate height:320 width:520 pos:[0,0]

--format "Control_mock = % \n" classOf ( (Control_mock()) as string  )
--format "Control_mock = % \n" classOf (Control_mock() as string )

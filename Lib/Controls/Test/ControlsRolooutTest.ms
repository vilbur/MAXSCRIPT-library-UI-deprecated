clearListener();

filein( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" )

--Dialog	= Dialog_v title:(filenameFromPath(getSourceFileName()))
--
--
--rollout_1	= Dialog.roll "Subrollout A" id:"subrollout_a"
----rollout_2	= Dialog.roll "Subrollout B"
--
--controls_A1 = rollout_1.controls groupbox:"Test Groupbox"

/* ROLLOUT DEFINITION */
_Rollout	= Rollout_v title:(filenameFromPath(getSourceFileName()))

--Controls = Controls_v Parent_roll:_Rollout
--Controls = Controls_v Parent_roll:_Rollout
--format " Controls	= % \n" Controls
Groupbox_1 = _Rollout.Controls.new groupbox:"Groupbox 1"

Groupbox_1.button "Test 1"

/* CREATE ROLLOUT */
_Rollout.dialogCreate()	-- create with default params
--_rollout.dialogCreate height:320 width:520 pos:[0,0]


clearListener();

filein( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" )

Dialog	= Dialog_v title:(getFilenameFile(getSourceFileName()))

/* ROLLOUT DEFINITION */
Rollout_A	= Dialog.roll "Subrollout A"
Rollout_B	= Dialog.roll "Subrollout B"

/* CONTROLS BOX DEFINITION */
controls_A1 = Rollout_A.Controls.box()
controls_B1 = Rollout_B.Controls.box()

/* CONTROLS DEFINITION */
Button_B1	= controls_B1.button "Test 1"
Button_A1	= controls_A1.button "Test 1"



/* CREATE DIALOG */
Dialog.create()	-- create with default params


rollout_controls_dialogtest.subrollout_slot.height = 512
--rollout_controls_dialogtest.height = 512

--Dialog.RolloutMain.property.height 512
Dialog.property.height 512







--
--
--
--rollout test "test" height:200
--(
--  subrollout test1 "test1"
--  --subrollout test2 "test2"
--  --subrollout test3 "test3"
--)
--rollout test1a "test1a"
--(
--  spinner test1as "test1as"
--  spinner test1as2 "test1as"
--)
--rollout test2a "test2a"
--(
--  spinner test2as "test2as"
--)
--rollout test3a "test3a"
--(
--  spinner tes3as "tes3as"
--)
--createdialog test
--
--
--
--AddSubRollout test.test1 test1a
--test.test1.height += 512
----test.test1.pos = [0, 1]
----test1a.open = false 
--
--AddSubRollout test.test1 test2a
----test.test2.height += 100
----test.test2.pos += [0,550]
----test2a.open = false 
--
--AddSubRollout test.test1 test3a
----AddSubRollout test.test2 test3a
----test.test2.height += 100
----test.test2.pos += [0,200]
----test3a.open = false 
--
--
--test.height = 512
--
----cui.RegisterDialogBar	test style:#(#cui_dock_left,#cui_dock_right,#cui_floatable,#cui_handles)

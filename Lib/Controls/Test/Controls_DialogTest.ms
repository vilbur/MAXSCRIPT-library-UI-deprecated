clearListener()

filein( getFilenamePath(getSourceFileName()) + "/../../Dialog/Dialog.ms" )

--filein( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" )
--filein( "c:/GoogleDrive/Programs/CG/3DsMax/scripts/Library/_UI/includes.ms" )

Dialog	= Dialog_v title:(getFilenameFile(getSourceFileName()))

/* ROLLOUT DEFINITION */
Rollout_A	= Dialog.roll "Subrollout A"
--Rollout_B	= Dialog.roll "Subrollout B"

--/* CONTROLS BOX DEFINITION */
controls_A1 = Rollout_A.Controls.box()
--controls_B1 = Rollout_B.Controls.box()

/* CONTROLS DEFINITION */
controls_A1.button "Test 1"

--for i = 1 to 10 do
	--controls_B1.button ("Test "+i as string )


/* CREATE DIALOG */
Dialog.create()	-- create with default params
 




 



/* TRY SET PROPS FOR BETTER VIEW RESULT */
--try
--(
--	rollout_controls_dialogtest.height = 512
--	
--	--rollout_controls_dialogtest.rollout_subrollout_a.height = 512
--	--rollout_controls_dialogtest.rollout_subrollout_b.height = 512
--	--rollout_controls_dialogtest.rollout_subrollout_b.pos += [0,100]
--	
--	--Dialog.RolloutMain.property.height 512
--	--
--	--Dialog.property.height 512	-- set property of RolloutMain
--	--Dialog.property.width 512
--	rollout_controls_dialogtest.subrollouts.height = 256
--	--rollout_controls_dialogtest.subrollouts.width  = 256
--	-- 
--	--Rollout_A.property.height 256
--	--rollout_controls_dialogtest.subrollouts.height = 256
--	
--	
--	--Rollout_A.open false
--	--Rollout_A.property.height 512	-- set property of RolloutMain
--
--)
--catch
--(
--	format "\n************ EXCEPTION ************\n%\n***********************************\n" (getCurrentException())
--)















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

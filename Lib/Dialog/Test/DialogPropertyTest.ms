clearListener();

filein( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" )
--filein( "c:\\GoogleDrive\\Programs\\CG\\3DsMax\\scripts\\Library\\_UI\\includes.ms" )

Dialog	= Dialog_v title:(getFilenameFile(getSourceFileName()))

/* ROLLOUT DEFINITION */
Rollout_A	= Dialog.roll "Subrollout A"
Rollout_B	= Dialog.roll "Subrollout B"

--/* CONTROLS BOX DEFINITION */
controls_A1 = Rollout_A.Controls.box()
controls_B1 = Rollout_B.Controls.box()

/* CONTROLS DEFINITION */
controls_A1.button "Test 1"

for i = 1 to 10 do
	controls_B1.button ("Test "+i as string )


/* CREATE DIALOG */
Dialog.create()	-- create with default params



Dialog.Property.height 256





/* TRY SET PROPS FOR BETTER VIEW RESULT */
try
(
	--rollout_controls_dialogtest.height = 512
	
	--rollout_controls_dialogtest.rollout_subrollout_a.height = 512
	--rollout_controls_dialogtest.rollout_subrollout_b.height = 512
	--rollout_controls_dialogtest.rollout_subrollout_b.pos += [0,100]
	
	--Dialog.RolloutMain.property.height 512
	--clearListener()
	--Dialog.property.height 512	-- set property of RolloutMain
	--Dialog.property.width 512
	--rollout_controls_dialogtest.subrollouts.height = 256
	--rollout_controls_dialogtest.subrollouts.width  = 256
	-- 
	--Rollout_A.property.height 256
	--rollout_controls_dialogtest.subrollouts.height = 256
	
	
	--Rollout_A.open false
	--Rollout_A.property.height 512	-- set property of RolloutMain

)
catch
(
	format "\n************ EXCEPTION ************\n%\n***********************************\n" (getCurrentException())
)













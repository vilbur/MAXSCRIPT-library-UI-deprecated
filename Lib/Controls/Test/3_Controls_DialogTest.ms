clearListener()

filein( getFilenamePath(getSourceFileName()) + "/../../Dialog/Dialog.ms" )

--filein( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" )
--filein( "c:/GoogleDrive/Programs/CG/3DsMax/scripts/Library/_UI/includes.ms" )

Dialog	= Dialog_v title:(getFilenameFile(getSourceFileName()))

/* ROLLOUT DEFINITION */
Rollout_A	= Dialog.roll "Subrollout A"
Rollout_B	= Dialog.roll "Subrollout B"

--/* CONTROLS BOX DEFINITION */
controls_A1 = Rollout_A.Controls.box()
controls_B1 = Rollout_B.Controls.box()

/* CONTROLS DEFINITION */
for i = 1 to 3 do
(
	controls_A1.button ("Test "+i as string )
	controls_B1.button ("Test "+i as string )
	
)

/* CREATE DIALOG */
Dialog.create()	-- create with default params
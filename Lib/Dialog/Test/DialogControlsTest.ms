

filein( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" )

Dialog	= Dialog_v title:(getFilenameFile(getSourceFileName()))

/* ROLLOUT DEFINITION */
Rollout_A	= Dialog.roll "Subrollout A"
Rollout_B	= Dialog.roll "Subrollout B"

/* CONTROLS BOX DEFINITION */
controls_main	= Dialog.RolloutMain.Controls.box()
controls_A1	= Rollout_A.Controls.box()
controls_B1	= Rollout_B.Controls.box()

/* ADD CONTROLS */
controls_A1.button "Test 1"
controls_main.button "Test 1"

for i = 1 to 5 do
	controls_B1.button ("Test "+i as string )

/*------ CREATE FLOATER DIALOG ------*/
Dialog.create()
--Dialog.create height:512 width:320 pos:[0,0]

/*
	TEST SET PROPERTY 
*/
Dialog.Property.height 320
Dialog.Property.width  320
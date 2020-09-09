clearListener()

filein( getFilenamePath(getSourceFileName()) + "/../../Rollout/Rollout.ms" )


/* ROLLOUT DEFINITION */
Roll_main	= Rollout_v title:"Property test" 

Rollout_A	= Roll_main.subrollout "Subrollout A"
--Rollout_B	= Roll_main.subrollout "Subrollout B"

/* CREATE ROLLOUT */
Roll_main.dialogCreate() 
--Roll_main.dialogCreate height:512


--Rollout_A.open false
--Rollout_B.open true

/* Test properties with default maxscript
  
*/
print ( rollout_property_test.title as String )

--rollout_property_test.default_slot.rollout_subrollout_a.title  = "Renamed rollout manually"

--Rollout_A.Property.title "Renamed rollout"

--print ( (Rollout_A.Property._getPropertyString #title) as String )

--Rollout_A.Property.title "New title"

--rollout_property_test.default_slot.rollout_subrollout_a.title = "New title" 
--execute ( "rollout_property_test.default_slot.rollout_subrollout_a.title = \"New title\"")
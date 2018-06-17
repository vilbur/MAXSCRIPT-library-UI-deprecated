

--__TEST_GLOBAL.button "button_name AAA"

--messagebox "Rollout Def !!!"

--__TEST_GLOBAL.test()

	_rollout	= __TEST_GLOBAL.floater.roll "roll_name" ""
	_controls	= _rollout.controls groupbox:("groupbox Rollout") -- get new container for controls
	
	_controls.button "button_name"

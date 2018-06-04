--filein ( getFilenamePath(getSourceFileName()) + "/../Rollout.ms" );
filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );
clearListener();

/* ROLLOUT DEFINITION */
_rollout = (Rollout_v()).new "test_rollout" "Test Rollout"

/* ADD CONTROLS */
--Button1 = _rollout.control #button "Button 1" #button_1
--Button1.bind  #pressed "MessageBox @Button pressed@" "";

--Button = _rollout.button "Button 1" "button_1"
--Button.pressed "MessageBox @Button pressed@" "";

--Control1 = _rollout.control #button "Control 1" #button_1
--Control1.Events.pressed "MessageBox @Control pressed@" "";
--
--Control2 = _rollout.control #checkbutton "Checkbutton 1" #checkbutton_1
--Button1.Events.pressed "MessageBox @Button pressed@" "";

--Button1.Events.test()

--Button1.text = "XXX"


/* MODIFY CONTROLS */
--_rollout.roll.button_1.text = "XXX"
--_rollout.roll.butto n_1.enabled  = false
--_rollout.roll.button_1.width 128

controls_A = _rollout.controls() -- get new container for controls
controls_A.control #button "Control A1" #control_A1
controls_A.control #button "Control A2" #control_A2

controls_B = _rollout.controls() -- get new container for controls
controls_B.control #button "Control B1" #control_B1
controls_B.control #button "Control B2" #control_B2

--groupbox_1 = _rollout.controls groupbox:"Groupbox 1" -- get new container for controls
--groupbox_1.button "Button Group"
--
--controls_2 = _rollout.controls -- get new container for controls
--controls_2.button "Control 2"

--_rollout.testProp() 

--controls_1.test()

/* CREATE ROLLOUT */
_rollout.create() 
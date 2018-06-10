filein ( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" );
clearListener();


/*------ GET FLOATER CLASS ------*/
Floater	= Floater_v();
--
--_menu	= Floater.Menu.menu "Menu"
--_menu_2	= Floater.Menu.menu "Menu 2"
--
--_menu.item "Test Item 1" "" id:"test_item1"


/*------ CREATE ROLLOUT ------*/
_rollout = Floater.roll "Test Rollout" ""
_rollout_controls	= _rollout.controls groupbox:"groupbox A" -- get new container for controls
_control	= _rollout_controls.control #button "Control A1" #control_A1
--rollout_A.Events.pressed "MessageBox @Control A1 pressed@" ""



/*------ CREATE ROLLOUT ------*/
--_rollout = Floater.roll "Sub 1" "sub1"



/*------ CREATE FLOATER DIALOG ------*/
Floater.create "Test floater"

--sleep 2
Floater.dock #right
--sleep 2
--Floater.dock ""
--sleep 2
--Floater.position 512 512
--sleep 2
--Floater.size 512 512
 
 

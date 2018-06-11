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

for r in #("A", "B", "C") do
(
	print ( "r=" + r as string )
	_rollout	= Floater.roll ("Controls "+r) ""
	_controls	= _rollout.controls groupbox:("groupbox "+r) -- get new container for controls
	
	for i = 1 to 10 do
		_controls.button (("Control "+r) + i as string )	
)


/*------ CREATE ROLLOUT ------*/
--_rollout = Floater.roll "Sub 1" "sub1"



/*------ CREATE FLOATER DIALOG ------*/
Floater.create "Test floater" height:920



--sleep 2
--Floater.dock #right
--sleep 2
--Floater.dock ""
--sleep 2
--Floater.position 512 512
--sleep 2
--Floater.size 512 512
 
 

--messagebox (SetDialogSize test_floater as string )
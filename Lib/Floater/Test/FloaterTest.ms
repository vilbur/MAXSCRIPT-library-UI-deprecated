filein ( getFilenamePath(getSourceFileName()) + "/../../../includes.ms" );
clearListener();


/*------ GET FLOATER CLASS ------*/
Floater	= Floater_v title:"Test floater"
--Floater	= (Floater_v()).new
--
--_menu	= Floater.Menu.menu "Menu"
--_menu_2	= Floater.Menu.menu "Menu 2"
--
--_menu.item "Test Item 1" "" id:"test_item1"

/*------ CREATE ROLLOUT ------*/

for r in #("A", "B", "C", "D") do
(
	
	roll_name	= "Controls"+r
	execute ("global "+roll_name)
	_rollout	= Floater.roll roll_name ""
	_controls	= _rollout.controls groupbox:("groupbox "+r) -- get new container for controls
	
	for c = 1 to 5 do
	(
		button_name	= "Button"	+r+c as string 
		checkbox_name	= "Checkbox"	+r+c as string 

		cbx = _controls.control #checkbox checkbox_name ""
	
		(_controls.button button_name).Events.pressed ("print "+cbx.path+".state") ""

	)
)


/*------ CREATE ROLLOUT ------*/
--_rollout = Floater.roll "Sub 1" "sub1"



/*------ CREATE FLOATER DIALOG ------*/
Floater.create()
--Floater.create "Test floater2" 
--Floater.create "Test floater" height:320



--sleep 2
--Floater.dock #right
--sleep 2
--Floater.dock ""
--sleep 2
--Floater.position 512 512
--sleep 2
--Floater.size 512 512
 


--messagebox (SetDialogSize test_floater as string )


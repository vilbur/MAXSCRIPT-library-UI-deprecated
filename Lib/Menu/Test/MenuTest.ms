filein ( getFilenamePath(getSourceFileName()) + "/../Menu.ms" );
clearListener();

--(
--	try(destroyDialog roll_main) catch()
--	global roll_main
--	
--	RCmenu TopMenu
--	(
--		subMenu "File"
--		(
--			menuItem m1_1 "Open..."
--			menuItem m1_2 "Save"
--			separator sep1
--			menuItem m1_3 "Exit"
--		)
--		
--		subMenu "Edit"
--		(
--			menuItem m2_1 "Copy"
--			menuItem m2_2 "Cut"
--			menuItem m2_3 "Paste"
--			subMenu "Submenu"
--			(
--				menuItem ms1_1 "subitem"
--			)
--		)
--	)
--	
--	rollout roll_main "Menu Test"
--	(
--	)
--	
--	createdialog roll_main menu:TopMenu
--)

Menu = Menu_v title:"TopMenu"

Submenu = Menu.submenu "submenu"

Submenu.item "Test Item 1" id:"test_item1"
Submenu.item "Test Item 2" id:"test_item2"

definition = Menu.create()

execute definition
print ( "MENU=" + definition as string )

rollout roll_main "Menu Test"
(
)

createdialog roll_main menu:TopMenu

	
	
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

main_menu = Menu_v title:"TopMenu"

menu = main_menu.submenu "Menu"

menu.item "Test Item 1" id:"test_item1"
menu.separator()
menu.item "Test Item 2"
menu.separator()

submenu = menu.submenu "Submenu"
submenu.item "Submenu Item 1"

--definition = main_menu.create()
main_menu.create()

--execute definition
--print ( "MENU=" + definition as string )

rollout roll_main "Menu Test"
(
)

createdialog roll_main menu:TopMenu

	
	
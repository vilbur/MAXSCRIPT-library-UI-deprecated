filein ( getFilenamePath(getSourceFileName()) + "/../MenuItem.ms" );
filein ( getFilenamePath(getSourceFileName()) + "/../Menu.ms" );
clearListener();

/** CREATE MENU 
 */
function menuTest =
(
	/* DEFINE MAIN MENU */
	--main_menu = Menu_v name:"MainMenu" -- create menu with construct
	main_menu = (Menu_v()).new "MainMenu" -- create menu with method
	
	/* DEFINE MENU */
	menu	= main_menu.menu "Menu"
	menu_2	= main_menu.menu "Menu 2"
	
	menu.item "Test Item 1" id:"test_item1"
	menu.separator()f
	menu.item "Test Item 2"
	menu.separator()
	
	/* DEFINE SUBMENU */
	submenu = menu.menu "Submenu"
	submenu.item "Submenu Item 1"
	
	/* CREATE MENU */
	MainMenu = main_menu.create()
	
	/* define rollout for menu */
	rollout roll_main "Menu Test"
	(
		
	)
	createdialog roll_main menu:(main_menu.create())
)


/*---------------------------------------
	RUN TEST
-----------------------------------------*/
menuTest()

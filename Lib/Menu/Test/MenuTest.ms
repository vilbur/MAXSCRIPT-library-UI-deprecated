filein ( getFilenamePath(getSourceFileName()) + "/../Menu.ms" );
clearListener();

/** CREATE MENU 
 */
function menuTest =
(
	/* DEFINE MAIN MENU */
	main_menu = Menu_v name:"MainMenu"
	
	/* DEFINE MENU */
	menu	= main_menu.menu "Menu"
	menu_2	= main_menu.menu "Menu 2"
	
	menu.item "Test Item 1" id:"test_item1"
	menu.separator()
	menu.item "Test Item 2"
	menu.separator()
	
	/* DEFINE SUBMENU */
	submenu = menu.menu "Submenu"
	submenu.item "Submenu Item 1"
	
	/* CREATE MENU */
	main_menu.create()

)
/** Add menu to rollout
 */
function addMenuToRollout =
(
	/* define rollout for menu */
	rollout roll_main "Menu Test"
	(
	)
	
	createdialog roll_main menu:MainMenu
)

/*---------------------------------------
	RUN TEST
-----------------------------------------*/
menuTest()
addMenuToRollout()
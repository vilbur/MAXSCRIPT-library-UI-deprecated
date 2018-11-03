filein ( getFilenamePath(getSourceFileName()) + "/../UI.ms" );



--function UIRollTest =
--(
--	try(DestroyDialog UIRollTest)catch() -- must be above rollout definition
--
--	/** Edit poly test
--	 */
--	rollout UIRollTest "Edit poly test"
--	(
--		local UIClass = (UI_v()).UIClass
--		
--		button Test_btn "Test method" 
--			on Test_btn pressed do ( UIClass.test() )
--
--	)
--	
--	CreateDialog UIRollTest width:128 pos:[( (getMAXWindowPos()).x + 512 ), ( (getMAXWindowPos()).y + 512 ) ]
--)
--
--
--
--UIRollTest()

--__TEST_GLOBAL = "JUPIII"

--test = filein ( @"C:\Users\vilbur\AppData\Local\Autodesk\3dsMax\2016 - 64bit\ENU\scripts\vilbur\test.ms" );

--print ( "test=" + test as string ) 
--filein ( getFilenamePath(getSourceFileName()) + "/../UI.ms" );


UI 	= UI_v();
--UI.test();

/* Create ui dialog */
UI.loadContent();


--UI.roll "newRollout"

--UI.Rollouts.new "newRollout"

--print ( UI.Rollouts.get "newRollout" );
--UI.Rollouts.test()


/* Create ui dialog */
--UI.destroy(); A
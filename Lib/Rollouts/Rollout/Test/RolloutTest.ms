--filein ( getFilenamePath(getSourceFileName()) + "/../Rollout.ms" );
filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );
clearListener();

/** Create rollout
 */
function createSingleRollout =
(
	/* ROLLOUT DEFINITION */
	_rollout	= (Rollout_v()).new "Test Rollout" id:"optionable_id"

	/* ========= CONTROLS A ========= */
	--controls_A	= _rollout.controls() -- get new container for controls
	controls_A	= _rollout.controls groupbox:"groupbox A" -- get new container for controls
	--
	/*------ Control to var ------*/
	control_A1	= controls_A.control #button "Control A1" #control_A1
	--control_A1.Events.pressed "MessageBox @Control A1 pressed@" ""
	--/*------ Control in chain ------*/
	--(controls_A.control #button "Control A2" #control_A2).Events.pressed "MessageBox @Control A2 pressed@" ""
	--
	--/* ========= CONTROLS B ========= */
	----controls_B	= _rollout.controls()-- get new groupbox for controls
	--controls_B	= _rollout.controls groupbox:"groupbox B" -- get new groupbox for controls
	--controls_B.button "Control B1" id:#control_b1	-- id is optionable
	--(controls_B.button "Disabled B2").params " enabled: false, border: false"
	--((controls_B.button "Control B3" ).col 2).Events.pressed "MessageBox @Control B3 pressed@" ""
	--(controls_B.button "Control B4" ).col 6
	
	/* CREATE ROLLOUT */
	_rollout.CreateRollDialog() 
)

/** Crate subrollouts
 */
function crateSubrollouts =
(
	/* ROLLOUT DEFINITION */
	_rollout	= (Rollout_v()).new "Test Subrolloutes"
	
	/* ========= CONTROLS A ========= */
	----controls_main	= _rollout.controls() -- get new container for controls
	--controls_main	= _rollout.controls groupbox:"Main rollout" -- get new container for controls
	--control_main	= controls_main.control #button "Control Main" ""
	
	/* ========= SUBROLLOUT A ========= */
	subroll_A	= _rollout.subrollout "Subrollout A"
	subcontrols_A	= subroll_A.controls() -- get new container for controls
	
	(subcontrols_A.control #button "Control A2" #control_A2).Events.pressed "MessageBox @Control A2 pressed@" ""
	
	--/* ========= CONTROLS B ========= */
	--controls_B	= _rollout.controls()-- get new groupbox for controls
	subroll_B	= _rollout.subrollout "Subrollout B"
	subcontrols_B	= subroll_B.controls groupbox:"groupbox B" -- get new groupbox for controls
	subcontrols_B.button "Control B1" id:#control_b1	-- id is optionable
	(subcontrols_B.button "Disabled B2").params " enabled: false, border: false"
	((subcontrols_B.button "Control B3" ).col 2).Events.pressed "MessageBox @Control B3 pressed@" ""
	(subcontrols_B.button "Control B4" ).col 6
	
	/* CREATE ROLLOUT */
	_rollout.CreateRollDialog() 
)


/*---------------------------------------
	RUN TESTS
-----------------------------------------*/
--createSingleRollout()
crateSubrollouts()
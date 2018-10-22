--filein ( getFilenamePath(getSourceFileName()) + "/../Rollout.ms" );
filein ( getFilenamePath(getSourceFileName()) + "/../../../../includes.ms" );
clearListener();

/** Create rollout
 */
function createSingleRollout =
(
	/* ROLLOUT DEFINITION */
	_rollout	= Rollout_v title:"Test Rollout" id:"optionable_id"
	
	/* CREATE ROLLOUT */
	--_rollout.create()	-- create with default params
	_rollout.create height:320 width:520
)

/** Crate subrollouts
 */
function crateSubrollouts =
(
	/* ROLLOUT DEFINITION */
	_rollout	= Rollout_v title:"Test Subrollouts" 

	/* ========= SUBROLLOUT A ========= */
	subroll_A	= _rollout.subrollout "Subrollout A" id:"Subrollout_A"
	--subcontrols_A	= subroll_A.controls() -- get new container for controls

	--(subcontrols_A.control #button "Control A2" #control_A2).pressed "MessageBox @Control A2 pressed@"
	----/* ========= CONTROLS B ========= */
	----controls_B	= _rollout.controls()-- get new groupbox for controls
	--subroll_B	= _rollout.subrollout "Subrollout B"
	--subcontrols_B	= subroll_B.controls groupbox:"groupbox B" -- get new groupbox for controls
	----subcontrols_B.button "Control B1" id:#control_b1 -- id is optionable
	----(subcontrols_B.button "Disabled B2").params " enabled: false, border: false"
	----((subcontrols_B.button "Control B3" ).col 2).pressed "MessageBox @Control B3 pressed@"
	----(subcontrols_B.button "Control B4" ).col 6
	
	/* CREATE ROLLOUT */
	--_rollout.create() 
	_rollout.create height:320 width:520
)


/*---------------------------------------
	RUN TESTS
-----------------------------------------*/
--createSingleRollout()
crateSubrollouts()

filein( getFilenamePath(getSourceFileName()) + "/../Rollouts/Rollout/Rollout.ms" )
filein( getFilenamePath(getSourceFileName()) + "/../Ini/Ini.ms" )
--filein( getFilenamePath(getSourceFileName()) + "/DialogProperty/DialogProperty.ms" )

/** Globals
 */
struct Globals_v
(
	Dialog
)
if( __GLOBAL__v == undefined ) then
	global __GLOBAL__v = Globals_v()



/** Dialog dialog
  *
  * Rollout dialog with subroullouts is used as "Dialog" instead of using regular [RolloutDialog](https://help.autodesk.com/view/3DSMAX/2018/ENU/?guid=__files_GUID_A72112A6_BDFB_47A6_88FB_8D49C4CBD049_htm)
  *
  */
struct Dialog_v
(
	__construct = #(#title),

	/* required properties */
	title,

	/* dependency */
	_RolloutMain,
	--Property,
	--Menu	= Menu_v(),
	Ini	= Ini_v(),
	
	/* config */	
	id,
	
	/* options */	
	_ini,
	
	/* store */
	Dialog,
	size_init, -- size of dialog after creation


	include "Library/_UI/Lib/Dialog/DialogPublicMethods_temp-name.ms"
	include "Library/_UI/Lib/Dialog/DialogRegister.ms"
	include "Library/_UI/Lib/Dialog/DialogDock.ms"

	private
	
	/** Set main rollout
	 */
	function _setMainRollout =
	(
		_RolloutMain	= Rollout_v title:title id:id
	),

	/** Set id of rollout as global variable
	  *	Id is sanitized title to id "Foo Bar" >>> "foo_bar"
	  */
	function _setDialogGlobal =
	(
		--id	= ( dotNetObject "System.Text.RegularExpressions.Regex" @"\s+" ).Replace ( toLower title ) "_";
		--id	= ( dotNetObject "System.Text.RegularExpressions.Regex" @"[^a-zA-Z0-9-_]" ).Replace id ""
		__GLOBAL__v.Dialog = this
	),
	--/** _open close rollouts
	-- */
	--function _openCloseRollouts =
	--(
	--	for _rollout_id in Rollouts.keys do
	--	(
	--		_RolloutMain	= Rollouts.getVal _rollout_id
			--_RolloutMain.open ( Ini.load _RolloutMain.id #open default:true )
	--	)
	--),
	
	/** Set default path to ini file
	  *
	  * Default dir:	"#temp\ini-files\"
	  * Default file:	"%dialog_id%.ini"
	 */
	function _setIniDefaults =
	(
		if( Ini.dir #get == undefined ) then
			Ini.dir (( pathConfig.GetDir #temp ) + "\ini-files")
			--Ini.dir (( pathConfig.GetDir #temp ) )
		
		if( Ini.file #get == undefined ) then
			Ini.file ( (getFilenameFile id) + ".ini" )
	), 

	--/** Set access shortcut to properties
	--  *
	--  * @example 
	--  * 	Dialog.property.height	512	-- THIS METHOD ALLOW USE THIS
	--  * 	Dialog._RolloutMain.property.height	512	-- INSTEAD OF THIS
	-- */
	--function _setProperty =
	--(
	--	--Property	= _RolloutMain.Property
	--	Property	= DialogProperty_v id:_RolloutMain.id subrollouts_slot:_RolloutMain.subrollouts_slot
	--),

	--/** Get\set value of property 
	--  * @param	string|name key	Name  of property E.G.: "foo_key" OR #foo_key 
	--  * @param	string|#get value	Value of property
	--  *
	--  * @return	string|self Value or self
	--  *
	--  * @example this._getSetProp "foo" "bar" -- SET "bar" to property "foo"
	--  * @example this._getSetProp #foo  #get  -- GET value of property "foo"
	--  */
	--function _getSetProp key value =
	--(
	--	if( value != #get ) then
	--	(
	--		if( value != undefined ) then
	--			setProperty this ( key as string ) value
	--		
	--		this --return
	--	) else
	--		getProperty this ( key as string ) --return
	--),
	/** Check if required properties are defined
	  * Names of required props are defined in __construct array
	 */
	function _checkConstctructProperties =  
	(
		for prop in __construct where getProperty this prop == undefined do
			messageBox ("Undefined construct property !\n\n"+ ((filterString( classof this as string )"(:")[2]) +"."+ prop )
	),
	on create do
	(		
		this._unregisterOldDialog()
		
		this._setMainRollout()
		
		--this._setProperty()
				
		this._setDialogGlobal()
		
		--this._setIniDefaults() -- DIABLED FOR DEBUGGING
	)
)

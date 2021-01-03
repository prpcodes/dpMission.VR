params ["_lb", "_dialog", "_inventory", "_returnWithoutEmptyStrings"];

_dialog = _this select 0; // Display #-1
_lb = _dialog displayCtrl 1500; // Control #1500

// clear listbox in case of reopening
lbClear _lb;

//get the players inventory
_inventory = [];

{ _inventory pushBack _x; } forEach [
	uniform player, //string
	vest player, //string
	backpack player, //string
	headgear player, //string
	goggles player, //string
	primaryWeapon player, //string
	secondaryWeapon player, //string
	handgunWeapon player //string
];

{ _inventory append _x; } forEach [
	uniformItems player, //array
	vestItems player, //array
	backpackItems player,//array
	primaryWeaponMagazine player, ///array
	assignedItems player, //array
	secondaryWeaponMagazine player, //array
	handgunMagazine player, //array
	primaryWeaponItems player, //array
	secondaryWeaponItems player,  //array
	handgunItems player //array
];



// clear array of empty strings
_returnWithoutEmptyStrings = [];

{
	if!(_x isEqualTo "") then {
		_returnWithoutEmptyStrings pushBack _x;
	};
} forEach _inventory;

_returnWithoutEmptyStrings deleteAt (_returnWithoutEmptyStrings findIf {_x = ""});
_inventory = _returnWithoutEmptyStrings;
_listBoxArray =_inventory call BIS_fnc_consolidateArray;


// add the given array to listbox
{ 
	private _str = _x #0;
	private _num = _x #1;
	
	// sets the name and value of the item and adds it to the listbox
	if ( _num > 1 ) then {
		_index = _lb lbAdd format ["%1x %2", _num, _str];
		_lb lbSetValue [_index, _num];
		_lb lbSetData [_index, _str];
	} else {
		_index = _lb lbAdd _str;
		_lb lbSetValue [_index, _num];
		_lb lbSetData [_index, _str];
	};

	// search CFG for the picture of the given item
	switch true do {
		case (isClass (configFile >> "CfgWeapons" >> _str)): {
			_lb lbSetPicture [_foreachIndex, getText(configFile >> "CfgWeapons" >> _x select 0 >> "picture")];
		};
		case (isClass (configFile >> "CfgMagazines" >> _str)): {
			_lb lbSetPicture [_foreachIndex, getText(configFile >> "CfgMagazines" >> _x select 0 >> "picture")];
		};
		case (isClass (configFile >> "CfgGlasses" >> _str)): {
			_lb lbSetPicture [_foreachIndex, getText(configFile >> "CfgGlasses" >> _x select 0 >> "picture")];
		};
		case (isClass (configFile >> "CfgVehicles" >> _str)): {
			_lb lbSetPicture [_foreachIndex, getText(configFile >> "CfgVehicles" >> _x select 0 >> "picture")];
		};
		case (_str in [0, 1, 2, 3]): {
			_lb lbSetPicture [_foreachIndex, getText(configFile >> "attachment" >> _x select 0 >> "picture")];
		};
		default {
			"";
		};
	};
} forEach _listBoxArray;
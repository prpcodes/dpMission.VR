private _inventory = [];

{ _inventory pushBack _x; } forEach [
	uniform player, //string
	vest player, //string
	backpack player, //string
	headgear player, //string
	goggles player, //string
	primaryWeapon player, //string
	secondaryWeapon player //string
];

{ _inventory append _x; } forEach [
	uniformItems player, //array
	vestItems player, //array
	backpackItems player,//array
	magazines player, //array
	primaryWeaponMagazine player, ///array
	assignedItems player, //array
	secondaryWeaponMagazine player, //array
	handgunMagazine player, //array
	primaryWeaponItems player, //array
	secondaryWeaponItems player,  //array
	handgunItems player //array
];


_returnWithoutEmptyStrings = [];

{
	if!(_x isEqualTo "") then {
		_returnWithoutEmptyStrings pushBack _x;
	};
} forEach _inventory;


_returnWithoutEmptyStrings deleteAt (_returnWithoutEmptyStrings findIf {_x = ""});



_inventory = _returnWithoutEmptyStrings;

//[_inventory] call life_fnc_inventory_addToList;


{
	lbAdd [1500, _x];
} forEach _inventory;
// get the items from the inventory
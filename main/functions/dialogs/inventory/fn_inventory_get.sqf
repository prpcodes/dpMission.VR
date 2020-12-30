private _inventory = [];

{
	if!(_x isEqualTo "") then {
		_inventory pushBack _x;
	};
} forEach [
	uniform player, 
	vest player, 
	backpack player, 
	headgear player, 
	goggles player, 
	assignedItems player,
	primaryWeapon player,
	primaryWeaponItems player, 
	secondaryWeapon player,
	secondaryWeaponItems player, 
	handgunItems player, 
	primaryWeaponMagazine player, 
	secondaryWeaponMagazine player, 
	handgunMagazine player
];


_returnWithoutEmptyStrings = [];

{
	if!(_x isEqualTo "") then {
		_returnWithoutEmptyStrings pushBack _x;
	};
} forEach _inventory;

_inventory = _returnWithoutEmptyStrings;

[_inventory] call life_fnc_inventory_addToList;
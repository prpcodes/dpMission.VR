_selected = lbCurSel 1500; //_selected = index

_itemToRemove = lbData [1500, _selected];

// gets the given item class to remove the item
switch true do {
	case (isClass (configFile >> "CfgWeapons" >> _itemToRemove)): {
    	player removeWeapon _itemToRemove;
    	player removePrimaryWeaponItem _itemToRemove;
    	player removeSecondaryWeaponItem _itemToRemove;
    	player removeHandgunItem _itemToRemove;
	};
	case (isClass (configFile >> "CfgMagazines" >> _itemToRemove)): {
    	player removeMagazine _itemToRemove;
	};
	case (isClass (configFile >> "CfgGlasses" >> _itemToRemove)): {
		player unassignItem _itemToRemove;
		player unlinkItem _itemToRemove;
	};
	case (isClass (configFile >> "CfgVehicles" >> _itemToRemove)): {
		removeBackpack player;
	};
	case (_itemToRemove in [0, 1, 2, 3]): {
		player unassignItem _itemToRemove;
		player unlinkItem _itemToRemove;
	};
	default {
		"";
	};
};

closeDialog 1;
createDialog "dialog_inventory";
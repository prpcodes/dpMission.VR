dp_in_progress = false;

player addAction ["Open Inventory", { 
	_inventory = createDialog "dialog_inventory"; 
	if (!_inventory) then {
		hint "Dialog couldn't be opened!";
	} else {
		[] call life_fnc_inventory_get;
	};
}, "", 0, false, false, "", "!dialog"];
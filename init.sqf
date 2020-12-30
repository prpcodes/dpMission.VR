dp_in_progress = false;

player addAction ["Open Inventory", { 
	_inventory = createDialog "dialog_inventory"; 
	if (!_inventory) then {hint "Dialog couldn't be opened!"};
}, "", 0, false, false, "", "!dialog"];
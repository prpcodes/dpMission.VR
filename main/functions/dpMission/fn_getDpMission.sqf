//	checks for ItemGPS in inventory and  for the player not beeing on a mission already
if ("ItemGPS" in assignedItems player && !dp_in_progress) then {
	
	// get pos player for calculation
	_dpStart = getPos player;
	_timeStart = diag_tickTime;

	// get random Marker
	private _markers = ["dp_0", "dp_1", "dp_2", "dp_3"];
	_dpMarker = selectRandom _markers;

	// checks if the given markes is the same as the starting point
	while {_dpMarker == _this select 3} do {
		_dpMarker = selectRandom _markers;
	};

	// restricts the player from starting another mission
	dp_in_progress = true;
	
	// creates task and assigns it to the player
	[player, _dpMarker, ["Do this and you get a cookie", "Deliver the Package.", getMarkerPos _dpMarker], _dpMarker, true] call BIS_fnc_taskCreate;
	["dp", true] call BIS_fnc_taskSetAlwaysVisible;

	// find nearest infostand next to the DP marker
	_dpEnd = nearestObject [getMarkerPos _dpMarker, "Land_InfoStand_V2_F"];

	// add action and finish the task after the player ends it
	_dpEnd addAction ["Finish DP-Mission", {
		// player has finished the dpMission
		dp_in_progress = false;
		(_this select 3 select 0) removeAction 1;
		[(_this select 3 select 2),"SUCCEEDED", true] call BIS_fnc_taskSetState;
		[(_this select 3 select 2), player] call BIS_fnc_deleteTask;

		// calculate the distance the player treveled
		private _name = name player;
		private _metersTraveled = round (getMarkerPos (_this select 3 select 2) distance (_this select 3 select 3));
		private _timeElapsed = round (diag_tickTime - (_this select 3 select 1));

		systemChat (format ["%1 traveled %2 meters to finish a DP-Mission. It took %3 secounds.", _name, _metersTraveled, _timeElapsed]);
		

		//Get all available primary weapons from config
		private _allPrimaryWeapons = "
		( getNumber ( _x >> 'scope' ) isEqualTo 2	&& { getText ( _x >> 'simulation' ) isEqualTo 'Weapon' 
		&& { getNumber ( _x >> 'type' ) isEqualTo 1 } } ) " configClasses ( configFile >> "cfgWeapons" );
		
		//Get a random weapon from config and assign it to the player
		private _rndWeapon = configName ( _allPrimaryWeapons select (floor (random (count _allPrimaryWeapons ))) );
		player addWeapon _rndWeapon;

	}, [_dpEnd, _timeStart, _dpMarker, _dpStart], 1, false, true, "", "dp_in_progress",5];

} else {
	hint "You either need a GPS to get the mission or you already started one.";
}

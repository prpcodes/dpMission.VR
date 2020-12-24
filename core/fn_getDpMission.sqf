//	checks for ItemGPS in inventory and  for the player not beeing on a mission already
if ("ItemGPS" in assignedItems player && !dp_in_progress) then {
	
	// get pos player for calculation
	dpStart = getPos player;

	// get random Marker
	_markers = ["dp_0", "dp_1", "dp_2", "dp_3"];
	dpMarker = selectRandom _markers;

	// checks if the given markes is the same as the starting point
	while {dpMarker == _this select 3} do {
		dpMarker = selectRandom _markers;
	};

	// restricts the player from starting another mission
	dp_in_progress = true;
	
	// creates task and assigns it to the player
	[player, dpMarker, ["Do this and you get a cookie", "Deliver the Package.", getMarkerPos dpMarker], dpMarker, true] call BIS_fnc_taskCreate;
	["dp", true] call BIS_fnc_taskSetAlwaysVisible;

	// find nearest infostand next to the DP marker
	dpEnd = nearestObject [getMarkerPos dpMarker, "Land_InfoStand_V2_F"];

	// add action and finish the task after the player ends it
	dpEnd addAction ["Finish DP-Mission", {
		// player has finished the dpMission
		dp_in_progress = false;
		dpEnd removeAction 1;
		[dpMarker,"SUCCEEDED", true] call BIS_fnc_taskSetState;
		[dpMarker, player] call BIS_fnc_deleteTask;

		// calculate the distance the player treveled
		_meters = getMarkerPos dpMarker distance dpStart;
		systemChat (format ["You traveled %1 meters to finish your DP-Mission.",_meters]);


		//Get all available primary weapons from config
		allPrimaryWeapons = "
		( getNumber ( _x >> 'scope' ) isEqualTo 2
		&&
		{ getText ( _x >> 'simulation' ) isEqualTo 'Weapon'
		&&
		{ getNumber ( _x >> 'type' ) isEqualTo 1 } } )
		"configClasses ( configFile >> "cfgWeapons" );
		
		//Get a random weapon from config and assign it to the player
		_rndWeapon = configName ( allPrimaryWeapons select (floor (random (count allPrimaryWeapons ))) );
		player addWeapon _rndWeapon;

	}, nil, 1, false, true, "", "dp_in_progress",5];

} else {
	hint "You either need a GPS to get the mission or you already started one.";
}

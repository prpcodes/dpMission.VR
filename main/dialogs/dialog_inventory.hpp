/* #Hakyxu
$[
	1.063,
	["dialog_inventory",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[-1500,"lb_inventory",[1,"",["0.410281 * safezoneW + safezoneX","0.25074 * safezoneH + safezoneY","0.179583 * safezoneW","0.475149 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1600,"btn_delete",[1,"Delete Item",["0.410261 * safezoneW + safezoneX","0.731926 * safezoneH + safezoneY","0.0790625 * safezoneW","0.0444813 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"btn_close",[1,"Close",["0.510312 * safezoneW + safezoneX","0.731 * safezoneH + safezoneY","0.0790625 * safezoneW","0.0444813 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/
class dialog_inventory
{
    idd = -1;
	movingenable = 0;
    onLoad = "_this call life_fnc_inventory_get;";
    onUnload = "_this call life_fnc_inventory_get;";

    class controlsBackground
    {

    };

    class controls
    {
      class lb_inventory: RscListbox
        {
            idc = 1500;
            x = 0.410281 * safezoneW + safezoneX;
            y = 0.25074 * safezoneH + safezoneY;
            w = 0.179583 * safezoneW;
            h = 0.475149 * safezoneH;
        };
        class btn_delete: RscButton
        {
            idc = 1600;
            text = "Delete Item"; //--- ToDo: Localize;
		    onButtonClick = "_this call life_fnc_inventory_remove;";
            x = 0.410261 * safezoneW + safezoneX;
            y = 0.731926 * safezoneH + safezoneY;
            w = 0.0790625 * safezoneW;
            h = 0.0444813 * safezoneH;
        };
        class btn_close: RscButton
        {
            idc = 1601;
            text = "Close"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
            x = 0.510312 * safezoneW + safezoneX;
            y = 0.731 * safezoneH + safezoneY;
            w = 0.0790625 * safezoneW;
            h = 0.0444813 * safezoneH;
        };
    };
};
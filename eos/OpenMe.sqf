/* EOS 1.98 by BangaBob
GROUP SIZES
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20

EXAMPLE CALL - EOS
 null = [["MARKERNAME","MARKERNAME2"],[2,1,70],[0,1],[1,2,30],[2,60],[2],[1,0,10],[1,0,250,WEST]] call EOS_Spawn;
 null=[["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call EOS_Spawn;

EXAMPLE CALL - BASTION
 null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST,false,false],[10,2,120,TRUE,TRUE]] call Bastion_Spawn;
 null=[["M1","M2","M3"],[PATROL GROUPS,SIZE OF GROUPS],[LIGHT VEHICLES,SIZE OF CARGO],[ARMOURED VEHICLES],[HELICOPTERS,SIZE OF HELICOPTER CARGO],[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG],[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]] call Bastion_Spawn;
*/

params ["_side"];
private _fac1 = 1;//major
private _fac2 = 2;//minor
private _infPb = InfPb;
private _dis = AI_SpawnDis;
private _mecArmPb = MecArmPb;

EOS_Spawn = compile preprocessfilelinenumbers "eos\core\eos_launch.sqf";
Bastion_Spawn=compile preprocessfilelinenumbers "eos\core\b_launch.sqf";
null=[] execVM "eos\core\spawn_fnc.sqf";
if (isServer) then {["updateEOSmkrs","onplayerConnected", {[] execVM "eos\functions\EOS_Markers.sqf";}] call BIS_fnc_addStackedEventHandler;};

VictoryColor="ColorGreen";	// Colour of marker after completion
hostileColor="ColorRed";	// Default colour when enemies active
bastionColor="ColorOrange";	// Colour for bastion marker
EOS_KILLCOUNTER=false;		// Counts killed units

// Infantry markers
null=[["m1"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m2"],[2,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m3"],[2,0,_infPb],[1,1,_infPb],[0,0],[0],[1],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m4"],[3,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m5"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[1],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m6"],[2,1,_infPb],[1,0,_infPb],[0,0],[0],[0],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m7"],[1,0,_infPb],[1,1,_infPb],[0,0],[0],[1],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m8"],[2,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m9"],[1,0,_infPb],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m10"],[0,0],[1,1,_infPb],[0,0],[0],[0],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m11"],[3,1,_infPb],[0,0],[0,0],[0],[1],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m12"],[3,1,_infPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m13"],[2,0,_infPb],[2,0,_infPb],[0,0],[0],[0],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m14"],[2,0,_infPb],[1,1,_infPb],[0,0],[0],[1],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m15"],[0,0],[2,1,_infPb],[0,0],[0],[0],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;
null=[["m16"],[3,1,_infPb],[4,1,_infPb],[2,1],[0],[3],[0,0],[_fac2,0,_dis,_side]] call EOS_Spawn;

// Light Vehicles invisible markers
null=[["mv1"],[0,0],[0,0],[2,1],[0],[0],[0,0],[_fac2,1,_dis,_side]] call EOS_Spawn;
null=[["mv2"],[0,0],[0,0],[1,1],[0],[0],[0,0],[_fac2,1,_dis,_side]] call EOS_Spawn;
null=[["mv3"],[0,0],[0,0],[1,1],[0],[0],[0,0],[_fac2,1,_dis,_side]] call EOS_Spawn;

// Heavy Vehicles invisible markers
null=[["mh1"],[0,0],[0,0],[0,0],[1,_mecArmPb],[0],[0,0],[_fac2,1,_dis,_side]] call EOS_Spawn;

// Patrol boats invisible markers

// Heli invisible markers
null=[["h1"],[0,0],[0,0],[0,0],[0],[0],[1,2],[_fac2,1,_dis,_side]] call EOS_Spawn;
null=[["h2"],[0,0],[0,0],[0,0],[0],[0],[1,0],[_fac2,1,_dis,_side]] call EOS_Spawn;


//Persistence and headless client JIP setup
null=[] call BMRINS_fnc_persistence;
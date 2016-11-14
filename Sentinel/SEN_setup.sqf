/*

This script adds a request for a sentinel drone (not physically spawned) which provides tracking and targeted strike capability.

Author: Incontinentia

Requires:

sentinelUp.sqf
sentinelSensors.sqf

Compromised variable.

Called by radio trigger or addaction.

Example:

this addaction ["Request Sentinel RPA","Sentinel\sentinelSpawn.sqf",[],1,false,true];

*/

private ["_percentage","_hqCallsign","_airCallsign","_nightTimeOnly","_dawn","_dusk","_minTimeOnTgt","_randomDelay","_altitudeMin","_altitudeRandom","_radius","_speed","_ammoArray","_targetHVTs","_maxCollateral","_sideFriendly","_trackingEnabled","_percentageReliability","_isAffectedByOvercast","_objectOcclusion","_maxOvercastDegradation","_trackingRange","_terminalNecessary","_friendlySide"];

//General Options
_percentage = 100;
_hqCallsign = "DARK HORSE";
_airCallsign = "GRENDEL ONE-FOUR";
_nightTimeOnly = false;
_dawn = 5;
_dusk = 19;


//Aicraft options
_minTimeOnTgt = 2;                     //How long should the aircraft take to reach the AO in seconds
_randomDelay = 3;                       //Random delay factor (could be delayed by up to this many seconds)
_altitudeMin = 5000;                    //Minimum altitude of ordnance launch
_altitudeRandom = 1000;                 //Random additional altitude above minimum for ordnance launch
_radius = 1500;                         //Radius of launch position around player in meters
_rtbOnNoAmmo = false; 					//Should the unit RTB when out of ammo?
_multiAllowed = true;                   //Mark multiple targets simultaneaously

//Ordnance options
_bomb = 5;							    //How many GBUs will the air unit carry?
_missile = 5;                           //How many AT missiles the air unit carry?

//Are HVTs legitimate targets (only applicable if using INC_killorcapture)
_targetHVTs = false;

//Mission aborted if more than this number of civilians are in the probable kill radius (only civilians visible from overhead will be counted, more may be present in reality)
_maxCollateral = 1;

//Cancel strike if units of this side are in kill zone
_sideFriendly = west;

//Sensor options
_trackingEnabled = true;                //Is tracking enabled? (If false, below settings are ignored)
_percentageReliability = 98;			//What percentage of units will be picked up by tracking in perfect conditions?
_isAffectedByOvercast = true;			//Is tracking affected by overcase conditions?
_objectOcclusion = true;				//Do objects block tracking (i.e. a unit standing under a building)?
_maxOvercastDegradation = 70;			//How much % reliability will be lost at full overcast?
_trackingRange = 800;					//Maximum tracking range from player

//Player sensor options
_terminalNecessary = true;				//Is a UAV terminal necessary to view tracking information?
_friendlySide = west;                   //Side of friendly units (will show blue markers)

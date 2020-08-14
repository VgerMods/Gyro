-- Gyro: Get Your Raid On!  by Vger-Azjol-Nerub
-- 
-- English resources

------------------------------------------------------------


GyroLocal =
{

	-- Macro names
	StartRaidMacro = "GyroStartRaid",
	StartRaidMacroText = "# Replace the entire contents of this macro with commands to run when joining a raid.",
	EndRaidMacro = "GyroEndRaid",
	EndRaidMacroText = "# Replace the entire contents of this macro with commands to run when leaving a raid.",

	-- General messages
	["NeedNewerVgerCoreMessage"] = "Gyro needs a newer version of VgerCore.  Please use the version of VgerCore that came with Gyro.",
	
	-- Slash commands
	["EnabledCommand"] = "on",
	["DisabledCommand"] = "off",
	["AutoCommand"] = "auto",
	["MacrosCommand"] = "macros",
	["BattlegroundsOnCommand"] = "bg on",
	["BattlegroundsOnMessage"] = "Gyro: battlegrounds now count as raids.",
	["BattlegroundsOffCommand"] = "bg off",
	["BattlegroundsOffMessage"] = "Gyro: battlegrounds now do not count as raids.",
	
	-- Status messages
	["EnabledMessage"] = "Gyro: raid mode on.",
	["DisabledMessage"] = "Gyro: raid mode off.",
	["AutoEnabledMessage"] = "Gyro: raid mode on (automatically detected).",
	["AutoDisabledMessage"] = "Gyro: raid mode off (automatically detected).",
	
	["Usage"] = [[
Gyro: Get Your Raid On! by Vger-Azjol-Nerub
www.vgermods.com
 
/gyro [ auto | on | off ]  --  set Gyro mode
/gyro macros  --  show help on setting up macros for Gyro
/gyro bg [ on | off ]  --  set whether or not Battlegrounds count as raids
]],

	["MacroHelp"] = [[
Setting up the Gyro macros
 
Gyro needs two macros to work: GyroStartRaid and GyroEndRaid.  You can put whatever you like in those macros, and Gyro will run them when you enter and leave raids, respectively.  You don't need to put them on your action bars.  Gyro created those macros for you.  Look for them in the character-specific macros section.
Very important: Gyro macros can't cast spells or use items!  The game will block them.
]],

}
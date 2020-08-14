-- Gyro: Get Your Raid On!  by Vger-Azjol-Nerub
-- www.vgermods.com
-- 
-- Version 1.2.1: Improved WoW 5.0 compatibility
-- 
------------------------------------------------------------

-- Gyro requires this version of VgerCore:
local GyroVgerCoreVersionRequired = 1.07

-- Core frame
local GyroCoreFrame = nil

-- Constants
local GyroModeAuto = nil
local GyroModeOn = 1
local GyroModeOff = 0

-- Unsaved local variables
GyroInRaidState = nil

------------------------------------------------------------
-- Gyro events
------------------------------------------------------------

-- Called when an event that Gyro cares about is fired.
function GyroOnEvent(self, Event, arg1)
	if Event == "ADDON_LOADED" then 
		if arg1 == "Gyro" then GyroInitialize() end
	elseif Event == "GROUP_ROSTER_UPDATE" or Event == "PLAYER_ENTERING_WORLD" then
		GyroDetectState()
	end 
end

-- Initializes Gyro after all saved variables have been loaded.
function GyroInitialize()

	-- Check the current version of VgerCore.
	if (not VgerCore) or (not VgerCore.Version) or (VgerCore.Version < GyroVgerCoreVersionRequired) then
		if DEFAULT_CHAT_FRAME then DEFAULT_CHAT_FRAME:AddMessage("|cfffe8460" .. GyroLocal.NeedNewerVgerCoreMessage) end
		message(GyroLocal.NeedNewerVgerCoreMessage)
		return
	end

	SLASH_GYRO1 = "/gyro"
	SlashCmdList["GYRO"] = GyroCommand

	-- If they don't have any options set yet (no saved variable), reset them.
	if not GyroOptions then GyroResetOptions() end
	
end

-- Resets all Gyro options.  Used to set the saved variable to a default state.
function GyroResetOptions()
	GyroOptions = {}
	GyroOptions.Mode = GyroModeAuto
	GyroOptions.BattlegroundsAreRaids = false
end

------------------------------------------------------------
-- Gyro core methods
------------------------------------------------------------

-- Processes a Gyro slash command.
function GyroCommand(Command)
	if Command == GyroLocal.EnabledCommand then
		GyroSetMode(GyroModeOn)
	elseif Command == GyroLocal.DisabledCommand then
		GyroSetMode(GyroModeOff)
	elseif Command == GyroLocal.AutoCommand then
		GyroSetMode(GyroModeAuto)
	elseif Command == GyroLocal.MacrosCommand then
		GyroMacroHelp()
	elseif Command == GyroLocal.BattlegroundsOnCommand then
		GyroSetBattlegroundsAreRaids(true)
	elseif Command == GyroLocal.BattlegroundsOffCommand then
		GyroSetBattlegroundsAreRaids(false)
	else
		GyroUsage()
	end
end

-- Displays Gyro usage information.
function GyroUsage()
	VgerCore.Message(" ")
	VgerCore.MultilineMessage(GyroLocal.Usage)
	VgerCore.Message(" ")
	GyroDisplayMode()
end

-- Displays instructions on how to set up the Gyro macros.
function GyroMacroHelp()
	VgerCore.Message(" ")
	VgerCore.MultilineMessage(GyroLocal.MacroHelp)
	VgerCore.Message(" ")
	GyroCreateMacros()
	VgerCore.ExecuteChatCommand("/macro")
end

-- Creates the Gyro macros if they don't already exist.
function GyroCreateMacros()
	GyroCreateDefaultMacro(GyroLocal.StartRaidMacro, "Spell_ChargePositive", GyroLocal.StartRaidMacroText)
	GyroCreateDefaultMacro(GyroLocal.EndRaidMacro, "Spell_ChargeNegative", GyroLocal.EndRaidMacroText)
end

-- Creates a per-character macro with a specific name if it doesn't already exist, and if there's room.
-- Returns true if a macro was created.
function GyroCreateDefaultMacro(MacroName, MacroIcon, MacroText)
	local MacroIndex = GetMacroIndexByName(MacroName)
	if not (MacroIndex > 0) then
		-- This macro doesn't exist.  Create it.
		local TotalMacros, PerCharacterMacros = GetNumMacros()
		local PerCharacter
		if PerCharacterMacros < 18 and TotalMacros < 36 then
			PerCharacter = 1
		elseif TotalMacros < 36 then
			PerCharacter = nil
		else
			-- No room for another macro D:
			return false
		end
		CreateMacro(MacroName, MacroIcon, MacroText, PerCharacter, 1)
		return true
	end
	return false
end

-- Displays the current Gyro raid mode setting, and if set to auto, whether or not
-- Gyro thinks the player is in a raid.
function GyroDisplayMode()
	if GyroOptions.Mode == GyroModeAuto then
		if (GyroInRaidMode) then
			VgerCore.Message(GyroLocal.AutoEnabledMessage)
		else
			VgerCore.Message(GyroLocal.AutoDisabledMessage)
		end
	elseif GyroOptions.Mode == GyroModeOn then
		VgerCore.Message(GyroLocal.EnabledMessage)
	elseif GyroOptions.Mode == GyroModeOff then
		VgerCore.Message(GyroLocal.DisabledMessage)
	else
		VgerCore.Fail("GyroDisplayMode: variable GyroOptions.Mode is broken")
	end
end

-- Sets the raid mode override option.
function GyroSetMode(NewMode)
	GyroOptions.Mode = NewMode
	GyroDetectState()
	GyroDisplayMode()
end

-- Sets the option that determines whether Battlegrounds count as raids.
function GyroSetBattlegroundsAreRaids(NewValue)
	GyroOptions.BattlegroundsAreRaids = NewValue
	if NewValue then
		VgerCore.Message(GyroLocal.BattlegroundsOnMessage)
	else
		VgerCore.Message(GyroLocal.BattlegroundsOffMessage)
	end
	GyroDetectState()
end

-- Detects whether or not the player is currently in a raid or not, and if this has
-- changed, calls GyroStartRaid or GyroEndRaid as appropriate.
function GyroDetectState()
	local CurrentlyInRaid = nil
	if GyroOptions.Mode == GyroModeAuto then
		CurrentlyInRaid = IsInRaid()
		if CurrentlyInRaid and not GyroOptions.BattlegroundsAreRaids then
			CurrentlyInRaid = (not VgerCore.IsInBattleground())
		end
	elseif GyroOptions.Mode == GyroModeOn then
		CurrentlyInRaid = true
	elseif GyroOptions.Mode == GyroModeOff then
		CurrentlyInRaid = false
	else
		VgerCore.Fail("GyroDetectState: variable GyroOptions.Mode is broken")
	end
	if CurrentlyInRaid ~= GyroInRaidState then
		if CurrentlyInRaid then
			GyroStartRaid()
		else
			GyroEndRaid()
		end
	end
end

function GyroStartRaid()
	GyroInRaidState = true;
	VgerCore.RunMacro(GyroLocal.StartRaidMacro)
end

function GyroEndRaid()
	GyroInRaidState = false;
	VgerCore.RunMacro(GyroLocal.EndRaidMacro)
end

------------------------------------------------------------

-- Core frame setup
if not GyroCoreFrame then
	GyroCoreFrame = CreateFrame("Frame", "GyroCoreFrame")
end

GyroCoreFrame:SetScript("OnEvent", GyroOnEvent)

GyroCoreFrame:RegisterEvent("ADDON_LOADED")
GyroCoreFrame:RegisterEvent("GROUP_ROSTER_UPDATE")
GyroCoreFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

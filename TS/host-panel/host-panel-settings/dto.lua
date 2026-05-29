local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "map-environment-types").EnvironmentPreset
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v5 = {}
local v6 = setmetatable({}, {
    ["__index"] = v5
})
v6.TeamOverflow = "TeamOverflow"
v5.TeamOverflow = "TeamOverflow"
v6.TeamSwitching = "TeamSwitching"
v5.TeamSwitching = "TeamSwitching"
v6.LateJoining = "LateJoining"
v5.LateJoining = "LateJoining"
v6.HideAllNametags = "HideAllNametags"
v5.HideAllNametags = "HideAllNametags"
v6.BypassPlacementLimits = "BypassPlacementLimits"
v5.BypassPlacementLimits = "BypassPlacementLimits"
v6.LockServer = "LockServer"
v5.LockServer = "LockServer"
v6.PvP = "PvP"
v5.PvP = "PvP"
v6.Recalling = "Recalling"
v5.Recalling = "Recalling"
v6.BedBreaking = "BedBreaking"
v5.BedBreaking = "BedBreaking"
v6.BlockBreaking = "BlockBreaking"
v5.BlockBreaking = "BlockBreaking"
v6.BlockPlacing = "BlockPlacing"
v5.BlockPlacing = "BlockPlacing"
v6.IgnoreBuildRestrictedRegions = "IgnoreBuildRestrictedRegions"
v5.IgnoreBuildRestrictedRegions = "IgnoreBuildRestrictedRegions"
v6.MapBorderDamage = "MapBorderDamage"
v5.MapBorderDamage = "MapBorderDamage"
v6.KeepInventoryOnDeath = "KeepInventoryOnDeath"
v5.KeepInventoryOnDeath = "KeepInventoryOnDeath"
v6.AllowRandomlySelectedShopItems = "AllowRandomlySelectedShopItems"
v5.AllowRandomlySelectedShopItems = "AllowRandomlySelectedShopItems"
v6.Emotes = "Emotes"
v5.Emotes = "Emotes"
v6.SpawnGuardians = "SpawnGuardians"
v5.SpawnGuardians = "SpawnGuardians"
v6.SpawnTitan = "SpawnTitan"
v5.SpawnTitan = "SpawnTitan"
v6.SpawnOres = "SpawnOres"
v5.SpawnOres = "SpawnOres"
v6.SpawnVoidMonsters = "SpawnVoidMonsters"
v5.SpawnVoidMonsters = "SpawnVoidMonsters"
v6.PassiveWeatherEffectsEnabled = "PassiveWeatherEffectsEnabled"
v5.PassiveWeatherEffectsEnabled = "PassiveWeatherEffectsEnabled"
v6.WeatherEventsEnabled = "WeatherEventsEnabled"
v5.WeatherEventsEnabled = "WeatherEventsEnabled"
v6.GameVisibilityMode = "GameVisibilityMode"
v5.GameVisibilityMode = "GameVisibilityMode"
v6.AutoRestartGame = "AutoRestartGame"
v5.AutoRestartGame = "AutoRestartGame"
local v7 = {}
local v8 = setmetatable({}, {
    ["__index"] = v7
})
v8.LateJoinTeam = "LateJoinTeam"
v7.LateJoinTeam = "LateJoinTeam"
v8.Weather = "Weather"
v7.Weather = "Weather"
local v9 = {
    [v8.LateJoinTeam] = {
        "Spectator",
        "AllowPick",
        "Random",
        "SmallestTeam"
    },
    [v8.Weather] = v2.values(v3)
}
local v10 = {}
local v11 = setmetatable({}, {
    ["__index"] = v10
})
v11.ON = "on"
v10.on = "ON"
v11.OFF = "off"
v10.off = "OFF"
v11.HOST_ONLY = "host_only"
v10.host_only = "HOST_ONLY"
local v12 = {
    ["deathmatchTime"] = 1200,
    ["randomlySelectedShopItemCount"] = 2,
    ["blockDecayTime"] = 1260,
    ["serverMaxPlayers"] = 1000,
    ["teamGenerators"] = {},
    ["globalGenerators"] = {
        [v4.EMERALD] = 1,
        [v4.DIAMOND] = 1
    },
    ["dropdowns"] = {
        [v8.LateJoinTeam] = "Spectator",
        [v8.Weather] = v3.None
    },
    ["generalToggles"] = {
        [v6.LockServer] = v11.OFF,
        [v6.GameVisibilityMode] = v11.OFF,
        [v6.LateJoining] = v11.ON,
        [v6.TeamOverflow] = v11.OFF,
        [v6.TeamSwitching] = v11.ON,
        [v6.AutoRestartGame] = v11.OFF,
        [v6.HideAllNametags] = v11.OFF,
        [v6.PvP] = v11.ON,
        [v6.Recalling] = v11.ON,
        [v6.KeepInventoryOnDeath] = v11.OFF,
        [v6.AllowRandomlySelectedShopItems] = v11.OFF,
        [v6.SpawnGuardians] = v11.ON,
        [v6.SpawnTitan] = v11.ON,
        [v6.SpawnOres] = v11.ON,
        [v6.SpawnVoidMonsters] = v11.ON,
        [v6.PassiveWeatherEffectsEnabled] = v11.ON,
        [v6.WeatherEventsEnabled] = v11.ON,
        [v6.BedBreaking] = v11.ON,
        [v6.BlockBreaking] = v11.ON,
        [v6.BlockPlacing] = v11.ON,
        [v6.BypassPlacementLimits] = v11.OFF,
        [v6.IgnoreBuildRestrictedRegions] = v11.OFF,
        [v6.MapBorderDamage] = v11.ON,
        [v6.Emotes] = v11.ON
    },
    ["disabledKits"] = {},
    ["disabledItems"] = {}
}
local v13 = {}
local v14 = setmetatable({}, {
    ["__index"] = v13
})
v14.HOST_PANEL = "host_panel"
v13.host_panel = "HOST_PANEL"
v14.COMMAND = "command"
v13.command = "COMMAND"
v14.SCRIPT = "script"
v13.script = "SCRIPT"
return {
    ["HostPanelToggle"] = v6,
    ["HostPanelDropdown"] = v8,
    ["HostPanelDropdownMeta"] = v9,
    ["HostPanelToggleValue"] = v11,
    ["starterHostPanelSettings"] = v12,
    ["AuditTag"] = v14
}
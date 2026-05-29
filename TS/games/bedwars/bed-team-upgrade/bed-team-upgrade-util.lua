local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-team-upgrade", "bed-team-upgrade-type").BedTeamUpgrade
local u4 = {
    [v3.BED_ALARM] = {
        ["name"] = "Bed Alarm",
        ["description"] = "Alerts you when enemies are near your bed!",
        ["cost"] = 2,
        ["icon"] = v2.BED_ALARM_ICON
    },
    [v3.BED_SHIELD] = {
        ["name"] = "Bed Barrier",
        ["description"] = "Generates an energy barrier that protects your base from projectiles for 3 minutes.",
        ["cost"] = 5,
        ["duration"] = 3,
        ["icon"] = v2.BED_SHIELD_ICON
    }
}
return {
    ["getBedTeamUpgradeDefinition"] = function(p5) --[[ Name: getBedTeamUpgradeDefinition, Line 30 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        return u4[p5]
    end,
    ["BedTeamUpgradeUtil"] = {
        ["PlayerHighlightDuration"] = 10,
        ["BedAlarmRadius"] = 35,
        ["BedAlarmTriggeredDuration"] = 5
    },
    ["BedTeamUpgrades"] = u4
}
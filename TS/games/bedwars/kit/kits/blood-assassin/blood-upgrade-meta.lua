local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "blood-assassin", "blood-upgrade").BloodUpgrade
local v10 = {
    [v1.DAMAGE] = {
        ["display"] = "Damage",
        ["initialValue"] = 2,
        ["baseValue"] = 0.5,
        ["description"] = function(p2) --[[ Name: description, Line 7 ]]
            return "+" .. tostring(p2) .. " decay damage"
        end,
        ["summarize"] = function(p3) --[[ Name: summarize, Line 10 ]]
            return tostring(p3)
        end
    },
    [v1.ARMOR_PEN] = {
        ["display"] = "Armor Penetration",
        ["initialValue"] = 0,
        ["baseValue"] = 4.5,
        ["maxValue"] = 75,
        ["description"] = function(p4) --[[ Name: description, Line 18 ]]
            return "+" .. tostring(p4) .. "% decay armor penetration"
        end,
        ["summarize"] = function(p5) --[[ Name: summarize, Line 21 ]]
            return tostring(p5) .. "%"
        end
    },
    [v1.DURATION] = {
        ["display"] = "Duration",
        ["initialValue"] = 2,
        ["baseValue"] = 0.5,
        ["maxValue"] = 5,
        ["description"] = function(p6) --[[ Name: description, Line 30 ]]
            return "+" .. tostring(p6) .. "s decay duration"
        end,
        ["summarize"] = function(p7) --[[ Name: summarize, Line 33 ]]
            return tostring(p7) .. "s"
        end
    },
    [v1.TARGET_DAMAGE] = {
        ["display"] = "Target Damage",
        ["initialValue"] = 0,
        ["baseValue"] = 5,
        ["maxValue"] = 25,
        ["description"] = function(p8) --[[ Name: description, Line 42 ]]
            return "+" .. tostring(p8) .. "% damage toward your active target"
        end,
        ["summarize"] = function(p9) --[[ Name: summarize, Line 45 ]]
            return tostring(p9) .. "%"
        end
    },
    [v1.ASSASSIN_INSTINCT] = {
        ["display"] = "Assassin\'s Instinct",
        ["perk"] = true,
        ["description"] = function() --[[ Name: description, Line 54 ]]
            return "Decay deals double damage to your active target"
        end
    },
    [v1.DARK_INSIGHT] = {
        ["display"] = "Dark Insight",
        ["perk"] = true,
        ["description"] = function() --[[ Name: description, Line 61 ]]
            return "Heal for 50% of decay damage dealt"
        end
    },
    [v1.SERRATED_BLADE] = {
        ["display"] = "Serrated Blade",
        ["perk"] = true,
        ["description"] = function() --[[ Name: description, Line 68 ]]
            return "+1 decay stack per attack and +20% decay damage"
        end
    },
    [v1.SILENCE] = {
        ["display"] = "Silence",
        ["perk"] = true,
        ["description"] = function() --[[ Name: description, Line 75 ]]
            return "Any healing on decaying enemies is reduced by 75%"
        end
    },
    [v1.BOUNTY] = {
        ["display"] = "Bounty",
        ["perk"] = true,
        ["description"] = function() --[[ Name: description, Line 82 ]]
            return "Killing your target will give you 2 emeralds"
        end
    },
    [v1.VULNERABLE] = {
        ["display"] = "Vulnerable",
        ["perk"] = true,
        ["description"] = function() --[[ Name: description, Line 89 ]]
            return "Decaying enemies take +12% damage from all sources"
        end
    },
    [v1.THRILL_OF_THE_HUNT] = {
        ["display"] = "Thrill of the Hunt",
        ["perk"] = true,
        ["description"] = function() --[[ Name: description, Line 96 ]]
            return "+15% move speed when moving toward decaying enemies"
        end
    },
    [v1.ABSOLUTION] = {
        ["display"] = "Absolution",
        ["perk"] = true,
        ["description"] = function() --[[ Name: description, Line 103 ]]
            return "Your contract menu closes"
        end
    }
}
return {
    ["BloodUpgradeMeta"] = v10
}
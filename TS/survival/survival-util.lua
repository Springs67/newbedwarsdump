local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "survival-monster-definitions").SurvivalMonsterDefinitions
return {
    ["SurvivalUtil"] = {
        ["isSurvivalMonster"] = function(p4) --[[ Name: isSurvivalMonster, Line 8 ]]
            --[[
            Upvalues:
                [1] = u3
            --]]
            return u3[p4:getInstance():GetAttribute("MonsterType")] ~= nil
        end,
        ["getBed"] = function() --[[ Name: getBed, Line 13 ]]
            --[[
            Upvalues:
                [1] = u2
            --]]
            return u2:GetTagged("bed:1")[1]
        end
    }
}
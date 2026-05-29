local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
return {
    ["AbilityUtil"] = {
        ["disableAllAbilities"] = function() --[[ Name: disableAllAbilities, Line 8 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u2
            --]]
            if u3:IsClient() then
                for _, v4 in u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbilities() do
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(v4.abilityId)
                end
            end
        end
    }
}
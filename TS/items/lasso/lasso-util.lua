local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitServer
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "lasso-wars", "lasso-wars-types").LassoUpgradeType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "lasso-wars", "lasso-wars-util").LassoWarsUtil
return {
    ["LassoUtil"] = {
        ["getProjectileOverrides"] = function(p8) --[[ Name: getProjectileOverrides, Line 12 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u5
                [3] = u4
                [4] = u3
                [5] = u6
            --]]
            if not u7.isInLassoWarsMode() then
                return nil
            end
            local v9
            if u5:IsServer() then
                v9 = u4.Services.LassoWarsService:getLassoModifierMapForPlayer(p8)
            else
                v9 = u3.Controllers.LassoWarsController:getLassoModifierMapForPlayer(p8)
            end
            local v10
            if v9 == nil then
                v10 = v9
            else
                v10 = v9[u6.SPEED]
            end
            local v11
            if v9 == nil then
                v11 = v9
            else
                v11 = v9[u6.RANGE]
            end
            if v9 ~= nil then
                v9 = v9[u6.COOLDOWN]
            end
            local v12
            if v10 then
                v12 = u7.getModifiedSpeed(v10.level)
            else
                v12 = nil
            end
            local v13 = u7.getModifiedLassoCooldown(0)
            if v9 then
                v13 = u7.getModifiedLassoCooldown(v9.level)
            end
            local v14 = u7.getModifiedReturnDistance(0)
            if v11 then
                v14 = u7.getModifiedReturnDistance(v11.level)
            end
            return {
                ["canHitAlliesOverride"] = true,
                ["walkSpeedMultiplierOverride"] = 1,
                ["launchVelocityOverride"] = v12,
                ["cooldownOverride"] = v13,
                ["returnDistanceOverride"] = v14
            }
        end
    }
}
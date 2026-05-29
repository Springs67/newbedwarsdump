local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitServer
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "lasso-wars", "lasso-wars-upgrade-meta").LassoWarsUpgrades
return {
    ["LassoWarsUtil"] = {
        ["LASSO_WARS_COIN_ITEM"] = v8.LASSO_COIN,
        ["WIN_AMOUNT"] = 50,
        ["ITEM_INTERVAL_MIN"] = 15,
        ["ITEM_INTERVAL_MAX"] = 30,
        ["ITEM_SPAWN_Z_RANGE"] = 150,
        ["isInLassoWarsMode"] = function() --[[ Name: isInLassoWarsMode, Line 25 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u5
                [3] = u4
                [4] = u6
                [5] = u3
                [6] = u7
            --]]
            if u9.isLobbyServer() then
                return false
            end
            if not u5:IsServer() then
                return u3.Controllers.MatchController:getQueueType() == u7.LASSO_WARS
            end
            local v11 = u4.Services.MatchService:getQueueMeta()
            if v11 ~= nil then
                v11 = v11.game
            end
            return v11 == u6.LASSO_WARS
        end,
        ["getUpgradeMapForPlayer"] = function(p12) --[[ Name: getUpgradeMapForPlayer, Line 40 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u4
                [3] = u3
            --]]
            if u5:IsServer() then
                return u4.Services.LassoWarsService:getLassoModifierMapForPlayer(p12)
            else
                return u3.Controllers.LassoWarsController:getLassoModifierMapForPlayer(p12)
            end
        end,
        ["getSpecificUpgradeDataForPlayer"] = function(p13, p14) --[[ Name: getSpecificUpgradeDataForPlayer, Line 48 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u4
                [3] = u3
            --]]
            local v15
            if u5:IsServer() then
                v15 = u4.Services.LassoWarsService:getLassoModifierMapForPlayer(p13)
            else
                v15 = u3.Controllers.LassoWarsController:getLassoModifierMapForPlayer(p13)
            end
            if v15 then
                return v15[p14]
            else
                return nil
            end
        end,
        ["getCurrentUpgradeLevelForPlayer"] = function(p16, p17) --[[ Name: getCurrentUpgradeLevelForPlayer, Line 57 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u4
                [3] = u3
            --]]
            local v18
            if u5:IsServer() then
                v18 = u4.Services.LassoWarsService:getLassoModifierMapForPlayer(p16)
            else
                v18 = u3.Controllers.LassoWarsController:getLassoModifierMapForPlayer(p16)
            end
            local v19
            if v18 then
                v19 = v18[p17]
            else
                v19 = nil
            end
            if v19 ~= nil then
                v19 = v19.level
            end
            return v19 == nil and 0 or v19
        end,
        ["setUpgradeLevelForPlayer"] = function(p20, p21, p22) --[[ Name: setUpgradeLevelForPlayer, Line 70 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u4
                [3] = u3
            --]]
            local v23
            if u5:IsServer() then
                v23 = u4.Services.LassoWarsService:getLassoModifierMapForPlayer(p20)
            else
                v23 = u3.Controllers.LassoWarsController:getLassoModifierMapForPlayer(p20)
            end
            if not v23 then
                return nil
            end
            v23[p21] = {
                ["upgradeType"] = p21,
                ["level"] = p22
            }
        end,
        ["getPriceForUpgradeLevel"] = function(p24, p25) --[[ Name: getPriceForUpgradeLevel, Line 83 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            local v26 = nil
            for v27, v28 in u10[p24].upgrades do
                local _ = v27 - 1
                if v28.level == p25 == true then
                    v26 = v28
                    break
                end
            end
            if v26 ~= nil then
                v26 = v26.price
            end
            return v26
        end,
        ["getModifiedSpeed"] = function(p29) --[[ Name: getModifiedSpeed, Line 105 ]]
            return p29 == 1 and 240 or (p29 == 2 and 265 or (p29 == 3 and 305 or (p29 == 4 and 365 or 220)))
        end,
        ["getModifiedReturnDistance"] = function(p30) --[[ Name: getModifiedReturnDistance, Line 127 ]]
            return p30 == 1 and 80 or (p30 == 2 and 88 or (p30 == 3 and 100 or (p30 == 4 and 118 or 75)))
        end,
        ["getModifiedLassoCooldown"] = function(p31) --[[ Name: getModifiedLassoCooldown, Line 149 ]]
            return p31 == 1 and 5 or (p31 == 2 and 3.5 or (p31 == 3 and 2 or 6))
        end,
        ["getTeslaResistance"] = function(p32) --[[ Name: getTeslaResistance, Line 166 ]]
            return p32 == 1 and 0.75 or (p32 == 2 and 0.5 or (p32 == 3 and 0.25 or 1))
        end,
        ["getHeavyResponsiveness"] = function(p33) --[[ Name: getHeavyResponsiveness, Line 181 ]]
            return p33 == 1 and 10 or (p33 == 2 and 1 or 20)
        end,
        ["getDamage"] = function(p34) --[[ Name: getDamage, Line 193 ]]
            return p34 == 1 and 8 or (p34 == 2 and 18 or (p34 == 3 and 30 or 8))
        end
    }
}
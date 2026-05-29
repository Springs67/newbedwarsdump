local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "frosty-hammer-balance").FrostyHammerBalance
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "frosty-hammer", "frosty-hammer-upgrades").FrostyHammerUpgrade
return {
    ["FrostyHammerUtil"] = {
        ["getUpgradesFromHammer"] = function(p6) --[[ Name: getUpgradesFromHammer, Line 10 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u5
            --]]
            local v7 = {}
            for _, v8 in u3.values(u5) do
                local v9 = p6:GetAttribute(v8)
                v7[v8] = v9 == nil and 0 or v9
            end
            return v7
        end,
        ["setUpgradesForHammer"] = function(p10, p11) --[[ Name: setUpgradesForHammer, Line 23 ]]
            --[[
            Upvalues:
                [1] = u2
            --]]
            for _, v12 in u2.keys(p11) do
                p10:SetAttribute(v12, p11[v12])
            end
        end,
        ["getAttackSpeed"] = function(p13) --[[ Name: getAttackSpeed, Line 29 ]]
            --[[
            Upvalues:
                [1] = u4
            --]]
            if p13 == 1 then
                return u4.ATTACK_SPEED_LV1
            elseif p13 == 2 then
                return u4.ATTACK_SPEED_LV2
            elseif p13 == 3 then
                return u4.ATTACK_SPEED_LV3
            else
                return u4.DEFAULT_ATTACK_SPEED
            end
        end,
        ["getAttackDamage"] = function(p14) --[[ Name: getAttackDamage, Line 44 ]]
            --[[
            Upvalues:
                [1] = u4
            --]]
            if p14 == 1 then
                return u4.DAMAGE_LV1
            elseif p14 == 2 then
                return u4.DAMAGE_LV2
            else
                return p14 ~= 3 and 23 or u4.DAMAGE_LV3
            end
        end,
        ["getShield"] = function(p15) --[[ Name: getShield, Line 59 ]]
            --[[
            Upvalues:
                [1] = u4
            --]]
            if p15 == 1 then
                return u4.SHIELD_LV1
            elseif p15 == 2 then
                return u4.SHIELD_LV2
            else
                return p15 ~= 3 and 0 or u4.SHIELD_LV3
            end
        end
    }
}
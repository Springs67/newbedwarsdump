local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-team-upgrade", "bed-team-upgrade-util").getBedTeamUpgradeDefinition
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-meta").getTeamUpgradeDefinition
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-type").TeamUpgrade
local u6 = {}
local u7 = v2.DIAMOND
u6.TEAM_UPGRADE_RESOURCE = u7
u6.MAX_UPGRADE_TIER = 3
u6.ENCHANT_TABLE_COST = 8
u6.TARGET_END_COOLDOWN = 0.3
u6.BASE_COOLDOWN = 0.9
u6.BASE_MAX_STACK_SIZE = 100
u6.IRON_DROPS_PER_EMERALD = 20 / u6.TARGET_END_COOLDOWN
local v8 = {
    ["RESOURCE_SPLIT_RATIOS"] = {
        [v2.IRON] = {
            ["splitRatio"] = 0.2
        },
        [v2.EMERALD] = {
            ["splitRatio"] = 0.25
        }
    }
}
u6.OutOfRangeSplitConfig = v8
local u9 = nil
local u10 = nil
function u6.hasEnoughForTeamUpgrade(p11, p12, p13, p14) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
        [3] = u10
    --]]
    local v15 = u4(p12)
    if v15 ~= nil then
        v15 = v15.tiers[p13].cost
    end
    if v15 == 0 or (v15 ~= v15 or not v15) then
        return false
    else
        local v16 = u9(p11)
        local v17 = u10(p11)
        if p14 then
            return v15 <= v16 + v17
        else
            return v15 <= v16
        end
    end
end
function u6.hasEnoughForBedTeamUpgrade(p18, p19, p20) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u9
        [3] = u10
    --]]
    local v21 = u3(p19).cost
    if v21 == 0 or (v21 ~= v21 or not v21) then
        return false
    else
        local v22 = u9(p18)
        local v23 = u10(p18)
        if p20 then
            return v21 <= v22 + v23
        else
            return v21 <= v22
        end
    end
end
u9 = function(p24) --[[ Name: getPlayerResourceAmount, Line 74 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v25 = nil
    for v26, v27 in p24.inventory.items do
        local _ = v26 - 1
        if v27.itemType == u7 == true then
            v25 = v27
            break
        end
    end
    if v25 ~= nil then
        v25 = v25.amount
    end
    return v25 == nil and 0 or v25
end
u6.getPlayerResourceAmount = u9
u10 = function(p28) --[[ Name: getTeamResourceAmount, Line 100 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v29 = p28.observedChest
    if v29 ~= nil then
        v29 = v29.items
        if v29 ~= nil then
            v29 = nil
            for v30, v31 in v29 do
                local _ = v30 - 1
                local v32
                if v31 == "empty" then
                    v32 = false
                else
                    v32 = v31.itemType == u7
                end
                if v32 == true then
                    v29 = v31
                    break
                end
            end
        end
    end
    if v29 ~= nil then
        v29 = v29.amount
    end
    return v29 == nil and 0 or v29
end
u6.getTeamResourceAmount = u10
function u6.getAdditionalMaxStackSizeFromLevel(p33, p34) --[[ Line: 144 ]]
    return p33 * (p34 == nil and 100 or p34)
end
local u35 = nil
function u6.getTotalTeamGenCDRFromTier(p36) --[[ Line: 158 ]]
    --[[
    Upvalues:
        [1] = u35
    --]]
    return p36 * u35()
end
u35 = function() --[[ Name: getTeamGenCDRPerTier, Line 163 ]]
    return 0.20000000000000004
end
u6.getTeamGenCDRPerTier = u35
function u6.getTeamGenTimer(p37, p38) --[[ Line: 169 ]]
    --[[
    Upvalues:
        [1] = u35
    --]]
    local v39 = 0.9 - p37 * u35()
    if not p38 then
        return v39
    end
    local v40 = v39 * 10
    return math.round(v40) / 10
end
function u6.getTeamGenDiamondTimer(p41, p42, p43, p44) --[[ Line: 176 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u35
    --]]
    if p42 == 0 then
        return 0
    else
        local v45 = u4(u5.DIAMOND_GENERATOR)
        if v45 ~= nil then
            v45 = v45.tiers[p42].value
        end
        if v45 == 0 or (v45 ~= v45 or not v45) then
            return 0
        else
            if p44 ~= nil then
                v45 = v45 * p44
            end
            local v46 = (0.9 - p41 * u35()) * v45
            if p43 then
                return math.round(v46)
            else
                return v46
            end
        end
    end
end
function u6.getTeamGenEmeraldTimer(p47, p48) --[[ Line: 196 ]]
    --[[
    Upvalues:
        [1] = u35
        [2] = u6
    --]]
    if p47 == 3 then
        local v49 = (0.9 - p47 * u35()) * u6.IRON_DROPS_PER_EMERALD
        if p48 then
            return math.round(v49)
        else
            return v49
        end
    else
        return 0
    end
end
return {
    ["TeamUpgradeUtil"] = u6
}
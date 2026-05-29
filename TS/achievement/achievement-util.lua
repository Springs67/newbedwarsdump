local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-category").AchievementCategoryMeta
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-id").AchievementId
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-meta")
local u7 = v6.AchievementsMeta
local u8 = v6.AchievementTierGroups
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-rank").AchievementRankMeta
local u24 = {
    ["DEFAULT_ICON"] = v3.ACHIEVEMENT_DEFAULT_ICON,
    ["makeStarterMap"] = function() --[[ Name: makeStarterMap, Line 18 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u5
        --]]
        return u2:IsStudio() and {
            [u5.GUNGAME_TOP_1] = {
                ["achieved"] = true
            },
            [u5.GUNGAME_TOP_5] = {
                ["achieved"] = true
            }
        } or {}
    end,
    ["makeStarterData"] = function() --[[ Name: makeStarterData, Line 33 ]]
        return {
            ["achieved"] = false
        }
    end,
    ["getMeta"] = function(p10) --[[ Name: getMeta, Line 40 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        return u7[p10]
    end,
    ["getProgressString"] = function(p11, p12) --[[ Name: getProgressString, Line 45 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        local v13 = u24.getMeta(p11)
        return not v13.progressString and "" or v13.progressString(p12)
    end,
    ["getTrackedStatValue"] = function(p14, p15) --[[ Name: getTrackedStatValue, Line 54 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        local v16 = u24.getMeta(p14)
        if not v16.trackedStat then
            return nil
        end
        local v17 = p15[v16.trackedStat.key]
        local v18 = v16.trackedStat
        if v18 ~= nil then
            v18 = v18.extra
        end
        local v19 = v18 == "gunGame"
        if v19 then
            v19 = p15.extra
            if v19 ~= nil then
                v19 = v19.gunGame
            end
        end
        if v19 then
            v17 = p15.extra.gunGame[v16.trackedStat.key]
        end
        local v20 = v16.trackedStat
        if v20 ~= nil then
            v20 = v20.extra
        end
        local v21 = v20 == "survival"
        if v21 then
            v21 = p15.extra
            if v21 ~= nil then
                v21 = v21.survival
            end
        end
        if v21 then
            v17 = p15.extra.survival[v16.trackedStat.key]
        end
        local v22 = v16.trackedStat
        if v22 ~= nil then
            v22 = v22.extra
        end
        local v23 = v22 == "halloween"
        if v23 then
            v23 = p15.extra
            if v23 ~= nil then
                v23 = v23.halloween
            end
        end
        if v23 then
            v17 = p15.extra.halloween[v16.trackedStat.key]
        end
        return v17
    end
}
local function u30(p25) --[[ Line: 112 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v26 = nil
    local v27 = v26
    for v28, v29 in u8 do
        local _ = v28 - 1
        if table.find(v29, p25) ~= nil then
            v26 = v29
            v27 = v26
        end
    end
    return v27
end
u24.getTierGroup = u30
function u24.getNextTier(p31) --[[ Line: 129 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    local v32 = u30(p31)
    if not v32 then
        return nil
    end
    local v33
    if v32 == nil then
        v33 = v32
    else
        v33 = -1
        for v34, v35 in v32 do
            local _ = v34 - 1
            if v35 == p31 == true then
                v33 = v34 - 1
                break
            end
        end
    end
    if #v32 <= v33 + 1 or v33 == -1 then
        return nil
    else
        return v32[v33 + 1 + 1]
    end
end
function u24.getPrevTier(p36) --[[ Line: 158 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    local v37 = u30(p36)
    if not v37 then
        return nil
    end
    local v38
    if v37 == nil then
        v38 = v37
    else
        v38 = -1
        for v39, v40 in v37 do
            local _ = v39 - 1
            if v40 == p36 == true then
                v38 = v39 - 1
                break
            end
        end
    end
    if v38 <= 0 or v38 == -1 then
        return nil
    else
        return v37[v38 - 1 + 1]
    end
end
function u24.hasUnclaimedRewards(p41, p42) --[[ Line: 187 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v43 = u24.getMeta(p41)
    if p42.achieved then
        if v43.rewards then
            if #v43.rewards == 0 then
                return false
            else
                return not p42.rewardsClaimed
            end
        else
            return false
        end
    else
        return false
    end
end
function u24.countUnclaimedRewards(p44) --[[ Line: 205 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v45 = 0
    local v46 = v45
    for v47, v48 in p44 do
        local v49 = u24.getMeta(v47)
        local v50
        if v48.achieved and (v49.rewards and #v49.rewards ~= 0) then
            v50 = not v48.rewardsClaimed
        else
            v50 = false
        end
        if v50 then
            v45 = v46 + 1
            v46 = v45
        end
    end
    return v46
end
function u24.getCategoryMeta(p51) --[[ Line: 220 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4[p51]
end
function u24.getRankMeta(p52) --[[ Line: 225 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    return u9[p52]
end
return {
    ["AchievementUtil"] = u24
}
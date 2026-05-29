local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-tier").RankTier
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-emote-definitions").KitContractEmoteDefinitions
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-rewards").KitContractRewards
local u6 = {
    v3.BRONZE,
    v3.SILVER,
    v3.GOLD,
    v3.PLATINUM,
    v3.DIAMOND,
    v3.EMERALD,
    v3.NIGHTMARE
}
local u7 = {
    ["ProgressColor"] = Color3.fromRGB(255, 238, 152)
}
local function u13(p8, p9) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
    --]]
    local v10 = 0
    if not p9 then
        return v10
    end
    local v11 = u5[p8]
    if not v11 then
        return v10
    end
    for _, v12 in v11.rewards do
        if not u7.isTierUnlocked(v12.tier, p8, p9) then
            break
        end
        v10 = v12.tier
    end
    return v10
end
u7.getTierFromStatProfile = u13
function u7.getKitMasteryTierData(p14, p15) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u6
    --]]
    local v16 = {
        ["currentKitContractTier"] = 0
    }
    local v17 = u13(p14, p15)
    v16.currentKitContractTier = v17
    local v18 = 0
    local v19 = nil
    if v17 == 0 then
        v19 = 1
    elseif v17 <= 1 then
        v18 = 1
        v19 = 2
    elseif v17 <= 2 then
        v18 = 2
        v19 = 3
    elseif v17 <= 4 then
        v18 = 3
        v19 = 5
    elseif v17 <= 5 then
        v18 = 4
        v19 = 6
    elseif v17 <= 7 then
        v18 = 5
        v19 = 8
    elseif v17 <= 9 then
        v18 = 6
        v19 = 10
    elseif v17 == 10 then
        v18 = 7
        v19 = nil
    end
    v16.selectedKitMasteryTier = v18
    local v20 = u6[v18 - 1 + 1]
    if v20 ~= nil then
        v16.currentTierRank = v20
    end
    v16.nextTierNumber = v19
    return v16
end
function u7.isTierUnlocked(p21, p22, p23) --[[ Line: 90 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
    --]]
    local v24 = u5[p22]
    if v24 ~= nil then
        v24 = v24.rewards[p21 - 1 + 1]
    end
    if not v24 then
        return false
    end
    local v25 = true
    for v26, v27 in u2.entries(v24.task) do
        local _ = v26 - 1
        local v28 = v27[1]
        local v29 = v27[2]
        local v30 = p23[v28]
        if v29 > (v30 == nil and 0 or v30) then
            v25 = false
            break
        end
    end
    return v25
end
function u7.getNumTasksInTier(p31, p32) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
    --]]
    local v33 = u5[p32]
    if v33 ~= nil then
        v33 = v33.rewards[p31 - 1 + 1]
    end
    if not v33 then
        return 0
    end
    local function u40(p34) --[[ Line: 134 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u40
        --]]
        local v35 = u2.entries(p34)
        local v36 = 0
        for v37 = 1, #v35 do
            local v38 = v35[v37]
            local _ = v37 - 1
            local _ = v38[1]
            local v39 = v38[2]
            if type(v39) == "number" then
                v36 = v36 + 1
            end
            if type(v39) == "table" then
                v36 = v36 + u40(v39)
            end
        end
        return v36
    end
    return u40(v33.task)
end
function u7.getProgressBarPercentage(p41, p42, p43) --[[ Line: 159 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u2
    --]]
    local v44 = u5[p42]
    if v44 ~= nil then
        v44 = v44.rewards
    end
    if not v44 then
        return 0
    end
    local v45 = u7.getRewardFromTier(v44, p41)
    local v46 = (table.find(v44, v45) or 0) - 1
    local v47
    if v46 == 0 then
        v47 = false
    else
        v47 = u7.getProgressBarPercentage(v44[v46 - 1 + 1].tier, p42, p43) < 1
    end
    if v47 then
        return 0
    end
    local v48 = u7.getNumTasksInTier(v45.tier, p42)
    local v49 = u2.entries(v45.task)
    local v50 = 0
    for v51 = 1, #v49 do
        local v52 = v49[v51]
        local _ = v51 - 1
        local v53 = v52[1]
        local v54 = v52[2]
        if p43[v53] ~= nil then
            local v55 = p43[v53] / v54
            local v56 = math.clamp(v55, 0, 1) / v48
            v50 = v50 + (v56 == nil and 0 or v56)
        end
    end
    return v50
end
function u7.getRewardFromTier(p57, p58) --[[ Line: 198 ]]
    local v59 = nil
    for v60, v61 in p57 do
        local _ = v60 - 1
        if v61.tier == p58 == true then
            return v61
        end
    end
    return v59
end
function u7.isKitContractAvailable(p62) --[[ Line: 215 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
    --]]
    local v63 = u2.keys(u5)
    return table.find(v63, p62) ~= nil
end
function u7.isKitContractEmoteAvailable(p64) --[[ Line: 224 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
    --]]
    local v65 = u2.keys(u4)
    return table.find(v65, p64) ~= nil
end
return {
    ["KitContractUtils"] = u7
}
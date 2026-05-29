local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "weekly-event", "weekly-event-meta").WeeklyEventMeta
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "weekly-event", "weekly-timed-event").WeeklyTimedEvent
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank").ArmorTrimEffectRank
local v6 = {}
local u7 = nil
function v6.getXpAtTier(p8) --[[ Line: 11 ]]
    local v9 = 105 * p8
    return math.pow(v9, 2)
end
function v6.getTierProgress(p10) --[[ Line: 15 ]]
    return math.pow(p10, 0.5) / 105
end
local u11 = nil
function v6.getTier(p12) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v13 = u11()
    local v14 = math.pow(p12, 0.5) / 105
    local v15 = math.floor(v14)
    return math.min(v13, v15)
end
function v6.isMaxTier(p16) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v17 = u11()
    local v18 = math.pow(p16, 0.5) / 105
    local v19 = math.floor(v18)
    return math.min(v17, v19) >= u11()
end
local u20 = u5.T5
v6.NEXT_ARMOR_TRIM_TIER_UNLOCK = u20
function v6.isNextArmorTrimUnlockable(p21) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u20
    --]]
    local v22 = u11()
    local v23 = math.pow(p21, 0.5) / 105
    local v24 = math.floor(v23)
    return u20 <= math.min(v22, v24)
end
u11 = function() --[[ Name: getMaxTier, Line 61 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u5
    --]]
    if u7 == 0 or (u7 ~= u7 or not u7) then
        u7 = #u2.keys(u5) - 1
    end
    return u7
end
v6.getMaxTier = u11
function v6.getArmorTrimXpPotential(p25, p26) --[[ Line: 68 ]]
    local v27 = p25 + p26
    return math.clamp(v27, 0, 176400)
end
function v6.isDoubleExp() --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    local v28 = u3[u4.ARMOR_TRIM_BOOST]
    local v29 = v28.endTime
    if v29 == 0 then
        v29 = false
    elseif v29 ~= v29 then
        v29 = false
    end
    local v30 = v29 and true or false
    if v30 then
        local v31 = v28.startTime
        if v31 == 0 then
            v31 = false
        elseif v31 ~= v31 then
            v31 = false
        end
        v30 = v31 and true or false
        if v30 then
            if os.time() < v28.endTime then
                v30 = os.time() > v28.startTime
            else
                v30 = false
            end
        end
    end
    return v30
end
return {
    ["ArmorTrimProgressUtil"] = v6
}
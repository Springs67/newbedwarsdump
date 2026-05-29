local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-types").PvPArenaStageType
local u6 = {
    ["STUDIO_AUGMENT_OVERRIDE"] = { v4.SHOPPING_SPREE, v4.EVELYNN, v4.HEALTH_REGEN },
    ["STUDIO_FLAG_AUGMENT_EVERY_ROUND"] = true,
    ["GRACE_PERIOD_TIME"] = 5,
    ["FIRST_INTERMISSION_TIME"] = 10,
    ["PRODUCTION_INTERMISSION_ROUND_TIME"] = 15,
    ["PRODUCTION_INTERMISSION_ROUND_TIME_WITH_AUGMENT"] = 30,
    ["PRODUCTION_AUGMENT_SELECTION_TIME"] = 25,
    ["PRODUCTION_MATCH_ROUND_TIME"] = 50,
    ["STUDIO_INTERMISSION_ROUND_TIME"] = 10,
    ["STUDIO_INTERMISSION_ROUND_WITH_AUGMENT"] = 15,
    ["STUDIO_AUGMENT_SELECTION_TIME"] = 10,
    ["STUDIO_MATCH_ROUND_TIME"] = 60,
    ["ROUND_END_DELAY"] = 6,
    ["ROUNDS_PER_RESOURCES"] = 1,
    ["ROUND_TEAM_DAMAGE_INCREMENT"] = 5,
    ["ROUND_TEAM_HEAL_AMOUNT"] = 10,
    ["DAMAGE_MULTIPLIER"] = 0.5,
    ["HEALING_MULTIPLIER"] = 0.5,
    ["GOLD_PER_KILL"] = 500,
    ["GOLD_PER_ROUND_END"] = 1000,
    ["GOLD_STARTING_AMOUNT"] = 1000
}
local u7 = v3.SWORD_ICON
u6.MATCH_ICON = u7
local u8 = v3.PVP_ARENA_AUGMENT_ICON
u6.AUGMENT_ICON = u8
local u9 = v3.PVP_ARENA_INTERMISSION_ICON
u6.INTERMISSION_ICON = u9
function u6.getIconType(p10) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u9
        [4] = u8
    --]]
    if p10 == u5.NONE then
        return ""
    end
    if p10 == u5.MATCH then
        return u7
    end
    if p10 == u5.INTERMISSON then
        return u9
    end
    if p10 == u5.INTERMISSION_AUGMENT_SELECTION then
        return u8
    end
end
function u6.getStageType(p11) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    if p11 <= 0 then
        return u5.NONE
    elseif (p11 - 3) % 4 == 0 then
        return u5.INTERMISSION_AUGMENT_SELECTION
    elseif p11 % 2 == 0 then
        return u5.MATCH
    elseif p11 % 2 == 1 then
        return u5.INTERMISSON
    else
        return u5.NONE
    end
end
function u6.isIntermissionStage(p12) --[[ Line: 91 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
    --]]
    local v13 = { u5.INTERMISSON, u5.INTERMISSION_AUGMENT_SELECTION }
    local v14 = u6.getStageType(p12)
    return table.find(v13, v14) ~= nil
end
function u6.getIntermissionRoundTime(p15) --[[ Line: 97 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    return p15 and (u2:IsStudio() and 15 or 30) or (u2:IsStudio() and 10 or 15)
end
function u6.getAugmentSelectionTime() --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    return u2:IsStudio() and 10 or 25
end
function u6.getMatchRoundTime() --[[ Line: 109 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    return u2:IsStudio() and 60 or 50
end
function u6.isAugmentRound(p16) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
    --]]
    local v17 = u2:IsStudio()
    if v17 then
        v17 = u6.STUDIO_FLAG_AUGMENT_EVERY_ROUND
    end
    local v18
    if p16 == 0 or p16 % 2 == 0 then
        v18 = not v17
    else
        v18 = false
    end
    return not v18
end
function u6.isRewardRound(p19) --[[ Line: 119 ]]
    local v20
    if p19 % 4 == 0 then
        v20 = p19 ~= 0
    else
        v20 = false
    end
    return v20
end
function u6.getTeamDamage(p21) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v22 = (p21 - 1) / 2
    return (math.floor(v22) + 1) * u6.ROUND_TEAM_DAMAGE_INCREMENT + 5
end
local v23 = {}
local v24 = setmetatable({}, {
    ["__index"] = v23
})
v24.TEAM_A = 0
v23[0] = "TEAM_A"
v24.TEAM_B = 1
v23[1] = "TEAM_B"
local v25 = {}
local v26 = setmetatable({}, {
    ["__index"] = v25
})
v26.TOP_RIGHT = 1
v25[1] = "TOP_RIGHT"
v26.BOTTOM_RIGHT = 2
v25[2] = "BOTTOM_RIGHT"
v26.TOP_LEFT = 3
v25[3] = "TOP_LEFT"
v26.BOTTOM_LEFT = 4
v25[4] = "BOTTOM_LEFT"
return {
    ["PvPArenaConfig"] = u6,
    ["ArenaTeam"] = v24,
    ["ArenaSide"] = v26
}
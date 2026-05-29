local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-meta").BPRewardDisplayMeta
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-display-type").RewardDisplayType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-meta").getBattlePassMetadata
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-rewards").BattlePassRewards
local u12 = {
    ["MAX_LEVEL"] = 50,
    ["EPILOGUE_LEVELS"] = 5,
    ["PAID_MULTIPLIER"] = 1.2,
    ["SOCIAL_CONNECTIONS_MULTIPLIER"] = 1.2,
    ["EXPERIENCE_BOOST_MULT"] = 2,
    ["XP_BOOST_END_TIME"] = 1773698400
}
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-type").BattlePass.EASTER_2026
u12.BATTLE_PASS_SEASON = v13
local v14 = u10(v13).icon
if v14 == nil then
    v14 = v4.BATTLE_ICON
end
u12.BATTLE_PASS_SEASON_ICON = v14
u12.BATTLE_PASS_SEASON_GAMEPASS = v6[v13]
u12.BATTLE_PASS_SEASON_NUMBER = u10(v13).seasonNumber
function u12.getMetadata() --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
    --]]
    return u10(u12.BATTLE_PASS_SEASON)
end
local u15 = nil
function u12.getLevelFromExperience(p16) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v17 = false
    local v18 = 1
    local v19 = 0
    while true do
        if v17 then
            v18 = v18 + 1
        else
            v17 = true
        end
        if v18 > 55 then
            return v19
        end
        if p16 < u15(v18) then
            return v19
        end
        v19 = v19 + 1
    end
end
function u12.getExperienceForLevel(p20) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    if p20 == 0 then
        return 0
    end
    local v21 = 2000 + p20 * 1300
    if u12.MAX_LEVEL < p20 then
        v21 = v21 * (p20 - u12.MAX_LEVEL)
    end
    return math.ceil(v21)
end
u15 = function(p22) --[[ Name: getTotalExperienceForLevel, Line 108 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v23 = false
    local v24 = 0
    local v25 = 0
    while true do
        if v23 then
            v24 = v24 + 1
        else
            v23 = true
        end
        if v24 > p22 then
            return v25
        end
        local v26
        if v24 == 0 then
            v26 = 0
        else
            local v27 = 2000 + v24 * 1300
            if u12.MAX_LEVEL < v24 then
                v27 = v27 * (v24 - u12.MAX_LEVEL)
            end
            v26 = math.ceil(v27)
        end
        v25 = v25 + v26
    end
end
u12.getTotalExperienceForLevel = u15
function u12.getCurrExperienceProgression(p28, p29) --[[ Line: 134 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    return p28 - u15(p29)
end
function u12.getRequiredLevelForKit(p30, p31) --[[ Line: 138 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u11
    --]]
    local v32 = u2.values(u11)
    for _, v33 in v32[#v32 - p31 + 1] do
        if v33.kit == p30 then
            return v33.level
        end
    end
end
function u12.getRewardThemeColor(p34) --[[ Line: 148 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
        [3] = u5
        [4] = u9
        [5] = u8
    --]]
    local v35 = p34.kit ~= nil
    if not v35 then
        local v36 = p34.comingSoon
        if v36 ~= nil then
            v36 = v36.rewardDisplayType
        end
        v35 = v36 == u7.KIT
    end
    if v35 then
        return u3.kit.backgroundColor
    else
        local v37 = p34.kitSkin ~= nil
        if not v37 then
            local v38 = p34.comingSoon
            if v38 ~= nil then
                v38 = v38.rewardDisplayType
            end
            v37 = v38 == u7.KIT_SKIN
        end
        if v37 then
            return u3.kitSkin.backgroundColor
        else
            local v39 = p34.killEffect ~= nil
            if not v39 then
                local v40 = p34.comingSoon
                if v40 ~= nil then
                    v40 = v40.rewardDisplayType
                end
                v39 = v40 == u7.KILL_EFFECT
            end
            if v39 then
                return u3.killEffect.backgroundColor
            else
                local v41 = p34.lobbyGadget ~= nil
                if not v41 then
                    local v42 = p34.comingSoon
                    if v42 ~= nil then
                        v42 = v42.rewardDisplayType
                    end
                    v41 = v42 == u7.LOBBY_GADGET
                end
                if v41 then
                    return u3.lobbyGadget.backgroundColor
                else
                    local v43 = p34.emote ~= nil
                    if not v43 then
                        local v44 = p34.comingSoon
                        if v44 ~= nil then
                            v44 = v44.rewardDisplayType
                        end
                        v43 = v44 == u7.EMOTE
                    end
                    if v43 then
                        if p34.emote then
                            if u5[p34.emote].animation then
                                return u3.emote.backgroundColor
                            else
                                return u9.backgroundTertiary
                            end
                        else
                            return
                        end
                    else
                        local v45 = p34.winEffect ~= nil
                        if not v45 then
                            local v46 = p34.comingSoon
                            if v46 ~= nil then
                                v46 = v46.rewardDisplayType
                            end
                            v45 = v46 == u7.WIN_EFFECT
                        end
                        if v45 then
                            return u3.winEffect.backgroundColor
                        else
                            local v47 = p34.bedBreakEffect ~= nil
                            if not v47 then
                                local v48 = p34.comingSoon
                                if v48 ~= nil then
                                    v48 = v48.rewardDisplayType
                                end
                                v47 = v48 == u7.BED_BREAK_EFFECT
                            end
                            if v47 then
                                return u3.bedBreakEffect.backgroundColor
                            else
                                return u8.getRewardColors(p34).backgroundColor or u9.backgroundTertiary
                            end
                        end
                    end
                end
            end
        end
    end
end
function u12.isActiveBattlePass() --[[ Line: 243 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
    --]]
    local v49
    if os.time() >= u10(u12.BATTLE_PASS_SEASON).startDate then
        v49 = os.time() <= u10(u12.BATTLE_PASS_SEASON).endDate
    else
        v49 = false
    end
    return v49
end
return {
    ["BattlePassUtils"] = u12
}
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-display-type").RewardDisplayType
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "store-consts").RobuxProductType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-meta").BPRewardDisplayMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-rewards").BattlePassRewards
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-type").BattlePass
local u16 = {
    [v15.season1] = {
        ["startDate"] = 1630101600,
        ["endDate"] = 1635008400,
        ["maxLevel"] = 50,
        ["seasonNumber"] = 1,
        ["rewardsDisabled"] = true,
        ["icon"] = v4.season1,
        ["paidTrackProduct"] = {
            ["productType"] = v10.GamePass,
            ["productId"] = v8.season1
        }
    },
    [v15.season2] = {
        ["startDate"] = 1635008400,
        ["endDate"] = 1639782000,
        ["maxLevel"] = 50,
        ["seasonNumber"] = 2,
        ["rewardsDisabled"] = true,
        ["icon"] = v4.season2,
        ["paidTrackProduct"] = {
            ["productType"] = v10.GamePass,
            ["productId"] = v8.season2
        }
    },
    [v15.season3] = {
        ["startDate"] = 1639782000,
        ["endDate"] = 1647640800,
        ["maxLevel"] = 50,
        ["seasonNumber"] = 3,
        ["rewardsDisabled"] = true,
        ["icon"] = v4.season3,
        ["paidTrackProduct"] = {
            ["productType"] = v10.GamePass,
            ["productId"] = v8.season3
        }
    },
    [v15.season4] = {
        ["startDate"] = 1647640800,
        ["endDate"] = 1654898400,
        ["maxLevel"] = 50,
        ["seasonNumber"] = 4,
        ["rewardsDisabled"] = true,
        ["icon"] = v4.season4,
        ["paidTrackProduct"] = {
            ["productType"] = v10.GamePass,
            ["productId"] = v8.season4
        }
    },
    [v15.season5] = {
        ["startDate"] = 1654898400,
        ["endDate"] = 1663970400,
        ["maxLevel"] = 50,
        ["seasonNumber"] = 5,
        ["rewardsDisabled"] = true,
        ["icon"] = v4.season5,
        ["paidTrackProduct"] = {
            ["productType"] = v10.GamePass,
            ["productId"] = v8.season5
        }
    },
    [v15.season6] = {
        ["startDate"] = 1663970400,
        ["endDate"] = 1676674800,
        ["maxLevel"] = 50,
        ["seasonNumber"] = 6,
        ["rewardsDisabled"] = true,
        ["icon"] = v4.season6,
        ["paidTrackProduct"] = {
            ["productType"] = v10.GamePass,
            ["productId"] = v8.season6
        }
    },
    [v15.season7] = {
        ["startDate"] = 1676674800,
        ["endDate"] = 1687557600,
        ["maxLevel"] = 50,
        ["seasonNumber"] = 7,
        ["rewardsDisabled"] = true,
        ["icon"] = v4.season7,
        ["paidTrackProduct"] = {
            ["productType"] = v10.GamePass,
            ["productId"] = v8.season7
        }
    },
    [v15.season8] = {
        ["startDate"] = 1687557600,
        ["endDate"] = 1700262000,
        ["maxLevel"] = 50,
        ["epilogueLevels"] = 5,
        ["seasonNumber"] = 8,
        ["rewardsDisabled"] = true,
        ["icon"] = v4.season8,
        ["paidTrackProduct"] = {
            ["productType"] = v10.GamePass,
            ["productId"] = v8.season8
        }
    },
    [v15.season9] = {
        ["startDate"] = 1700262000,
        ["endDate"] = 1712354400,
        ["maxLevel"] = 50,
        ["epilogueLevels"] = 5,
        ["seasonNumber"] = 9,
        ["rewardsDisabled"] = true,
        ["icon"] = v4.season9,
        ["paidTrackProduct"] = {
            ["productType"] = v10.GamePass,
            ["productId"] = v8.season9
        }
    },
    [v15.season10] = {
        ["startDate"] = 1712354400,
        ["endDate"] = 1723240800,
        ["maxLevel"] = 50,
        ["epilogueLevels"] = 5,
        ["seasonNumber"] = 10,
        ["rewardsDisabled"] = true,
        ["icon"] = v4.season10,
        ["paidTrackProduct"] = {
            ["productType"] = v10.GamePass,
            ["productId"] = v8.season10
        }
    },
    [v15.season11] = {
        ["startDate"] = 1723240800,
        ["endDate"] = 1734130800,
        ["maxLevel"] = 50,
        ["epilogueLevels"] = 5,
        ["seasonNumber"] = 11,
        ["rewardsDisabled"] = true,
        ["icon"] = v4.season11,
        ["paidTrackProduct"] = {
            ["productType"] = v10.GamePass,
            ["productId"] = v8.season11
        }
    },
    [v15.season12] = {
        ["startDate"] = 1734130800,
        ["endDate"] = 1745013600,
        ["maxLevel"] = 50,
        ["epilogueLevels"] = 5,
        ["seasonNumber"] = 12,
        ["rewardsDisabled"] = true,
        ["icon"] = v4.season12,
        ["paidTrackProduct"] = {
            ["productType"] = v10.GamePass,
            ["productId"] = v8.season12
        }
    },
    [v15.season13] = {
        ["startDate"] = 1745013600,
        ["endDate"] = 1757109600,
        ["maxLevel"] = 50,
        ["epilogueLevels"] = 5,
        ["seasonNumber"] = 13,
        ["rewardsDisabled"] = true,
        ["icon"] = v4.season13,
        ["paidTrackProduct"] = {
            ["productType"] = v10.GamePass,
            ["productId"] = v8.season13
        }
    },
    [v15.XMAS_2025] = {
        ["name"] = "Holiday Battle Pass",
        ["startDate"] = 1764975600,
        ["endDate"] = 1767999600,
        ["maxLevel"] = 30,
        ["rewardsDisabled"] = true,
        ["icon"] = v5(v6.CHRISTMAS_TREE_DEPLOY).image
    },
    [v15.LNY_2026] = {
        ["name"] = "Valentine & LNY Battle Pass",
        ["endDate"] = 1773698400,
        ["maxLevel"] = 30,
        ["rewardsDisabled"] = true,
        ["icon"] = v4.LNY2026_FIRE_HORSE_RED_GOLD_ENVELOPE,
        ["startDate"] = (v12.isStaging() or v3:IsStudio()) and 1770023000 or 1771023600,
        ["paidTrackProduct"] = {
            ["productType"] = v10.GamePass,
            ["productId"] = v8[v15.LNY_2026]
        }
    },
    [v15.EASTER_2026] = {
        ["name"] = "Spring Battle Pass",
        ["icon"] = "rbxassetid://133026429697896",
        ["endDate"] = 1778882400,
        ["maxLevel"] = 41,
        ["startDate"] = (v12.isStaging() or v3:IsStudio()) and 1770023000 or 1775253600,
        ["paidTrackProduct"] = {
            ["productType"] = v10.GamePass,
            ["productId"] = v8[v15.EASTER_2026]
        }
    }
}
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 218 ]]
        return "BattlePassC"
    end
})
u17.__index = u17
function u17.new(...) --[[ Line: 223 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20, p21) --[[ Line: 227 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    p20.bp = p21
    p20.metadata = u16[p21]
end
function u17.getLevelFromExperience(p22, p23) --[[ Line: 231 ]]
    local v24 = false
    local v25 = 1
    local v26 = 0
    while true do
        if v24 then
            v25 = v25 + 1
        else
            v24 = true
        end
        local v27 = p22.metadata.maxLevel
        local v28 = p22.metadata.epilogueLevels
        if v25 > v27 + (v28 == nil and 0 or v28) then
            return v26
        end
        if p23 < p22:getTotalExperienceForLevel(v25) then
            return v26
        end
        v26 = v26 + 1
    end
end
function u17.getExperienceForLevel(p29, p30) --[[ Line: 262 ]]
    if p30 == 0 then
        return 0
    end
    local v31 = 2000 + p30 * 1000
    if p29.metadata.maxLevel < p30 then
        v31 = v31 * (p30 - p29.metadata.maxLevel)
    end
    return math.ceil(v31)
end
function u17.getTotalExperienceForLevel(p32, p33) --[[ Line: 275 ]]
    local v34 = false
    local v35 = 0
    local v36 = 0
    while true do
        if v34 then
            v35 = v35 + 1
        else
            v34 = true
        end
        if v35 > p33 then
            return v36
        end
        v36 = v36 + p32:getExperienceForLevel(v35)
    end
end
function u17.getCurrExperienceProgression(p37, p38, p39) --[[ Line: 294 ]]
    return p38 - p37:getTotalExperienceForLevel(p39)
end
function u17.getRequiredLevelForKit(_, p40, p41) --[[ Line: 297 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u14
    --]]
    local v42 = u2.values(u14)
    for _, v43 in v42[#v42 - p41 + 1] do
        if v43.kit == p40 then
            return v43.level
        end
    end
end
function u17.getRewardThemeColor(_, p44) --[[ Line: 306 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u13
        [3] = u7
        [4] = u11
    --]]
    local v45 = p44.kit ~= nil
    if not v45 then
        local v46 = p44.comingSoon
        if v46 ~= nil then
            v46 = v46.rewardDisplayType
        end
        v45 = v46 == u9.KIT
    end
    if v45 then
        return u13.kit.backgroundColor
    else
        local v47 = p44.kitSkin ~= nil
        if not v47 then
            local v48 = p44.comingSoon
            if v48 ~= nil then
                v48 = v48.rewardDisplayType
            end
            v47 = v48 == u9.KIT_SKIN
        end
        if v47 then
            return u13.kitSkin.backgroundColor
        else
            local v49 = p44.killEffect ~= nil
            if not v49 then
                local v50 = p44.comingSoon
                if v50 ~= nil then
                    v50 = v50.rewardDisplayType
                end
                v49 = v50 == u9.KILL_EFFECT
            end
            if v49 then
                return u13.killEffect.backgroundColor
            else
                local v51 = p44.lobbyGadget ~= nil
                if not v51 then
                    local v52 = p44.comingSoon
                    if v52 ~= nil then
                        v52 = v52.rewardDisplayType
                    end
                    v51 = v52 == u9.LOBBY_GADGET
                end
                if v51 then
                    return u13.lobbyGadget.backgroundColor
                else
                    local v53 = p44.emote ~= nil
                    if not v53 then
                        local v54 = p44.comingSoon
                        if v54 ~= nil then
                            v54 = v54.rewardDisplayType
                        end
                        v53 = v54 == u9.EMOTE
                    end
                    if v53 then
                        if p44.emote then
                            if u7[p44.emote].animation then
                                return u13.emote.backgroundColor
                            else
                                return u11.backgroundTertiary
                            end
                        else
                            return
                        end
                    else
                        local v55 = p44.crate ~= nil
                        if not v55 then
                            local v56 = p44.comingSoon
                            if v56 ~= nil then
                                v56 = v56.rewardDisplayType
                            end
                            v55 = v56 == u9.CRATE
                        end
                        if v55 then
                            return u13.crate.backgroundColor
                        else
                            local v57 = p44.winEffect ~= nil
                            if not v57 then
                                local v58 = p44.comingSoon
                                if v58 ~= nil then
                                    v58 = v58.rewardDisplayType
                                end
                                v57 = v58 == u9.WIN_EFFECT
                            end
                            if v57 then
                                return u13.winEffect.backgroundColor
                            else
                                local v59 = p44.bedBreakEffect ~= nil
                                if not v59 then
                                    local v60 = p44.comingSoon
                                    if v60 ~= nil then
                                        v60 = v60.rewardDisplayType
                                    end
                                    v59 = v60 == u9.BED_BREAK_EFFECT
                                end
                                if v59 then
                                    return u13.bedBreakEffect.backgroundColor
                                else
                                    return u11.backgroundTertiary
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
return {
    ["BattlePassMeta"] = u16,
    ["getBattlePassMetadata"] = function(p61) --[[ Line: 212 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        return u16[p61]
    end
}
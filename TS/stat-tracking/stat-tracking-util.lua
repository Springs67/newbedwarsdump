local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stats", "queue-stats-util").QueueStatsUtil
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking").TrackType
local v6 = {
    ["makeStatsStarter"] = function() --[[ Name: makeStatsStarter, Line 10 ]]
        return {
            ["damage"] = 0,
            ["healing"] = 0,
            ["kills"] = 0,
            ["damageTaken"] = 0,
            ["knockIntoVoid"] = 0,
            ["blockBreaks"] = 0,
            ["blocksPlaced"] = 0,
            ["bedBreaks"] = 0,
            ["projectilesUsed"] = 0,
            ["projectileDamage"] = 0,
            ["arrowDamage"] = 0,
            ["ironCollected"] = 0,
            ["diamondCollected"] = 0,
            ["emeraldCollected"] = 0,
            ["diamondGuardianKills"] = 0,
            ["titanKills"] = 0,
            ["telepearlsUsed"] = 0,
            ["telepearlBlocksTravelled"] = 0,
            ["enchants"] = 0,
            ["playTime"] = 0,
            ["finalKills"] = 0,
            ["multiKills"] = 0,
            ["highestKillStreak"] = 0,
            ["highestMultiKillChain"] = 0
        }
    end,
    ["DUMMY_TRACKED_STATS"] = {
        ["damage"] = 100,
        ["healing"] = 100,
        ["kills"] = 10,
        ["damageTaken"] = 0,
        ["knockIntoVoid"] = 0,
        ["blockBreaks"] = 0,
        ["blocksPlaced"] = 0,
        ["bedBreaks"] = 1,
        ["projectilesUsed"] = 0,
        ["projectileDamage"] = 0,
        ["arrowDamage"] = 0,
        ["ironCollected"] = 0,
        ["diamondCollected"] = 0,
        ["emeraldCollected"] = 0,
        ["diamondGuardianKills"] = 0,
        ["titanKills"] = 0,
        ["telepearlsUsed"] = 0,
        ["telepearlBlocksTravelled"] = 0,
        ["enchants"] = 0,
        ["playTime"] = 0,
        ["finalKills"] = 0,
        ["multiKills"] = 0,
        ["highestKillStreak"] = 0,
        ["highestMultiKillChain"] = 0,
        ["player"] = {
            ["displayName"] = "Player",
            ["name"] = "Player",
            ["userId"] = 0
        }
    },
    ["HIGHLIGHT_TYPES"] = {
        v5.DAMAGE,
        v5.KILLS,
        v5.BEDBREAKS,
        v5.HEALING,
        v5.BLOCKBREAKS
    },
    ["MATCH_TYPES"] = {
        v5.DAMAGE,
        v5.KILLS,
        v5.BEDBREAKS,
        v5.HEALING,
        v5.BLOCKBREAKS,
        v5.BLOCKSPLACED,
        v5.IRONCOLLECTED,
        v5.DIAMONDCOLLECTED,
        v5.EMERALDCOLLECTED,
        v5.ARROWDAMAGE
    }
}
local u7 = {
    v5.HIGHESTKILLSTREAK,
    v5.HIGHESTMULTIKILLCHAIN,
    "finalKillsRecord",
    "playerKillsRecord",
    "totalDamageDealtRecord",
    "totalRangedDamageDealtRecord",
    "ironSpentRecord",
    "diamondsSpentRecord",
    "emeraldsSpentRecord"
}
v6.RECORD_STATS = u7
v6.PROFILE_EXCLUDE = { v5.DAMAGETAKEN, v5.HIGHESTMULTIKILLCHAIN }
function v6.getAccumulatedQueueStats(p8, u9) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u2
        [4] = u7
    --]]
    local v10
    if u9 then
        local function v17(p11) --[[ Line: 86 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u3
            --]]
            local v12
            if u9.games then
                local v13 = u9.games
                local v14 = u3(p11[1])
                if v14 ~= nil then
                    v14 = v14.game
                end
                v12 = table.find(v13, v14) ~= nil
            else
                v12 = true
            end
            local v15
            if u9.queues then
                v15 = u9.queues
                if v15 ~= nil then
                    local v16 = p11[1]
                    v15 = table.find(v15, v16) ~= nil
                end
            else
                v15 = true
            end
            return v12 and v15
        end
        local v18 = 0
        v10 = {}
        for v19, v20 in p8 do
            if v17(v20, v19 - 1, p8) == true then
                v18 = v18 + 1
                v10[v18] = v20
            end
        end
    else
        v10 = p8
    end
    local u21 = u4.makeStarterBedwarsQueueStats()
    local function v72(p22) --[[ Line: 127 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u21
            [3] = u7
        --]]
        local u23 = p22[2]
        local v24 = u2.keys(u21)
        local function v69(u25) --[[ Line: 130 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u2
                [3] = u21
                [4] = u7
            --]]
            if u25 == "obtainedAchievements" then
                return nil
            elseif u25 == "extra" then
                local u26 = u23[u25]
                if not u26 then
                    return nil
                end
                local v27 = u2.keys(u26)
                local function v63(p28) --[[ Line: 140 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                        [2] = u21
                        [3] = u25
                    --]]
                    if p28 == "blockHunt" then
                        local v29 = u26[p28]
                        if v29 ~= nil then
                            v29 = v29.currency
                        end
                        local v30 = v29 == nil and 0 or v29
                        local v31 = u21[u25][p28]
                        v31.currency = v31.currency + v30
                        local v32 = u26[p28]
                        if v32 ~= nil then
                            v32 = v32.accumulatedCurrency
                        end
                        local v33 = v32 == nil and 0 or v32
                        local v34 = u21[u25][p28]
                        v34.accumulatedCurrency = v34.accumulatedCurrency + v33
                        return
                    elseif p28 == "skywars" then
                        local v35 = u26[p28]
                        if v35 ~= nil then
                            v35 = v35.chestsOpened
                        end
                        local v36 = v35 == nil and 0 or v35
                        local v37 = u21[u25][p28]
                        v37.chestsOpened = v37.chestsOpened + v36
                        return
                    elseif p28 == "pvpArena" then
                        local v38 = u26[p28]
                        if v38 ~= nil then
                            v38 = v38.goldEarned
                        end
                        local v39 = v38 == nil and 0 or v38
                        local v40 = u21[u25][p28]
                        v40.goldEarned = v40.goldEarned + v39
                        return
                    elseif p28 == "allRandomKit" then
                        local v41 = u26[p28]
                        if v41 ~= nil then
                            v41 = v41.rerolls
                        end
                        local v42 = v41 == nil and 0 or v41
                        local v43 = u21[u25][p28]
                        v43.rerolls = v43.rerolls + v42
                    elseif p28 == "gunGame" then
                        if u21[u25][p28].topPlacement == -1 then
                            local v44 = u26[p28]
                            if v44 ~= nil then
                                v44 = v44.topPlacement
                            end
                            local v45 = v44 == nil and -1 or v44
                            u21[u25][p28].topPlacement = v45
                            return
                        end
                        local v46 = u26[p28]
                        if v46 ~= nil then
                            v46 = v46.topPlacement
                        end
                        if v46 ~= -1 then
                            local v47 = math
                            local v48 = u26[p28]
                            if v48 ~= nil then
                                v48 = v48.topPlacement
                            end
                            local v49 = v48 == nil and -1 or v48
                            local v50 = u21[u25][p28]
                            local v51 = u21[u25][p28].topPlacement
                            v50.topPlacement = v47.min(v49, v51)
                            return
                        end
                    else
                        if p28 == "survival" then
                            local v52 = math
                            local v53 = u26[p28]
                            if v53 ~= nil then
                                v53 = v53.maxWaveReached
                            end
                            local v54 = v53 == nil and 0 or v53
                            local v55 = u21[u25][p28]
                            local v56 = u21[u25][p28].maxWaveReached
                            v55.maxWaveReached = v52.max(v54, v56)
                            return
                        end
                        if p28 == "halloween" then
                            local v57 = u26[p28]
                            if v57 ~= nil then
                                v57 = v57.bestCompletionTime
                            end
                            if v57 == nil then
                                v57 = u21[u25][p28].bestCompletionTime > 9999
                            end
                            if v57 ~= 0 and (v57 == v57 and v57) then
                                local v58 = u26[p28]
                                if v58 ~= nil then
                                    v58 = v58.bestCompletionTime
                                end
                                local v59 = v58 == nil and 9999 or v58
                                u21[u25][p28].bestCompletionTime = v59
                            end
                            local v60 = u26[p28]
                            if v60 ~= nil then
                                v60 = v60.minPlayersCompleted
                            end
                            if v60 == nil then
                                v60 = u21[u25][p28].minPlayersCompleted > 9999
                            end
                            if v60 ~= 0 and (v60 == v60 and v60) then
                                local v61 = u26[p28]
                                if v61 ~= nil then
                                    v61 = v61.minPlayersCompleted
                                end
                                local v62 = v61 == nil and 9999 or v61
                                u21[u25][p28].minPlayersCompleted = v62
                            end
                        end
                    end
                end
                for v64, v65 in v27 do
                    v63(v65, v64 - 1, v27)
                end
            else
                local v66 = u23[u25]
                if v66 == 0 or (v66 ~= v66 or not v66) then
                    return nil
                end
                if table.find(u7, u25) ~= nil then
                    if u21[u25] < v66 then
                        u21[u25] = v66
                    end
                    return nil
                end
                local v67 = v66 == nil and 0 or v66
                local v68 = u21
                v68[u25] = v68[u25] + v67
            end
        end
        for v70, v71 in v24 do
            v69(v71, v70 - 1, v24)
        end
        return 0
    end
    local v73 = table.create(#v10)
    for v74, v75 in v10 do
        v73[v74] = v72(v75, v74 - 1, v10)
    end
    return u21
end
return {
    ["StatTrackingUtil"] = v6
}
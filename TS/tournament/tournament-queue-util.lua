local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ResetTime
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").RegionValues
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-type").ConfigType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-util").getConfig
local u7 = {
    ["ActiveQueue"] = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType.TOURNAMENT,
    ["TotalMatchesForBracket"] = 3,
    ["PlayersOverMaxQueue"] = 3
}
local u8 = {
    [u3.SEA] = {
        ["startResetTime"] = v2.new(1727517600),
        ["endResetTime"] = v2.new(1727524800)
    },
    [u3.EU] = {
        ["startResetTime"] = v2.new(1727528400),
        ["endResetTime"] = v2.new(1727535600)
    },
    [u3.NA] = {
        ["startResetTime"] = v2.new(1727557200),
        ["endResetTime"] = v2.new(1727564400)
    }
}
local u9 = nil
function u7.isTournamentQueueOpen(p10) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
    --]]
    if u9() then
        return false
    else
        local v11 = u8[p10]
        if v11 then
            return v11.startResetTime:getNextResetTime(1209600) > v11.endResetTime:getNextResetTime(1209600)
        else
            return false
        end
    end
end
function u7.getNextQueueOpenTime(p12) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
    --]]
    return u9() and 0 or u8[p12].startResetTime:getNextResetTime(1209600)
end
local function u17(p13) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
    --]]
    if u9() then
        return nil
    end
    local v14 = u8[p13]
    if not v14 then
        return nil
    end
    local v15 = v14.startResetTime:getNextResetTime(1209600)
    local v16 = v14.endResetTime:getNextResetTime(1209600)
    if v16 < v15 then
        v15 = v15 - 1209600
    end
    return { v15, v16 }
end
u7.getTournamentUTCTimeRange = u17
function u7.getTournamentTimeRangesFormatted(p18) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u17
    --]]
    if u9() then
        return ""
    end
    local v19 = u17(p18)
    return not v19 and "" or os.date("%x %I:%M %p %Z", v19[1]) .. " - " .. os.date("%x %I:%M %p %Z", v19[2])
end
u9 = function() --[[ Line: 93 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    return u6(u5.DisableTournaments)
end
u7.areTournamentsDisabled = u9
function u7.convertRegionToText(p20) --[[ Line: 97 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if p20 == u3.SEA then
        return "SEA"
    end
    if p20 == u3.EU then
        return "EU"
    end
    if p20 == u3.NA then
        return "NA"
    end
end
function u7.isTournamentQueueOverOneHour(p21) --[[ Line: 112 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u9
        [3] = u8
        [4] = u4
    --]]
    if u7.areTournamentsDisabled() then
        return true
    end
    local v22
    if u9() then
        v22 = false
    else
        local v23 = u8[p21]
        if v23 then
            v22 = v23.startResetTime:getNextResetTime(1209600) > v23.endResetTime:getNextResetTime(1209600)
        else
            v22 = false
        end
    end
    if v22 then
        return false
    end
    local v24 = u4:GetServerTimeNow()
    local v25 = u7.getTournamentUTCTimeRange(p21)
    if not v25 then
        return true
    end
    local _ = v25[1]
    return v25[2] - 1209600 + 3600 < v24
end
function u7.getFormattedTournamentDate(p26) --[[ Line: 136 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    if u7.areTournamentsDisabled() then
        return ""
    end
    local v27 = u7.getTournamentUTCTimeRange(p26)
    if not v27 then
        return ""
    end
    local v28 = v27[1]
    return os.date("%B %d, %Y", v28)
end
function u7.getRewardExpirationTime() --[[ Line: 150 ]]
    return os.time() + 1209600
end
return {
    ["TournamentQueueUtil"] = u7
}
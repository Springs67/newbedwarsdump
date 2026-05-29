local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ResetTime
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-type").ConfigType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-util").getConfig
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war-medals")
local u10 = v9.ClanWarMedal
local u11 = v9.getClanWarMedalMetadata
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war-profile-dto").ClanWarDivision
local u13 = {
    ["activeQueue"] = v7.BEDWARS_CLAN_WAR_TO4,
    ["CLAN_WAR_POINT_ICON"] = v8.TROPHY_ICON,
    ["CLAN_WAR_LOGO"] = v8.CLAN_CASTLE_ICON,
    ["maxMatchesPerClan"] = 3,
    ["maxClanWarsSaves"] = 7,
    ["firstClanWarEpochTime"] = 1716588000
}
local u14 = u3.new(1716588000)
u13.clanWarResetTime = u14
u13.ignoreRewardsBeforeEndTime = 1752919260
local u15 = {
    {
        ["startHour"] = 22,
        ["durationMinutes"] = 90,
        ["daysOfTheWeek"] = { 7 }
    },
    {
        ["startHour"] = 16,
        ["durationMinutes"] = 90,
        ["daysOfTheWeek"] = { 7 }
    },
    {
        ["startHour"] = 7,
        ["durationMinutes"] = 90,
        ["daysOfTheWeek"] = { 7 }
    }
}
u13.validTimeRanges = u15
local u16 = nil
local u17 = nil
function u13.isClanWarsQueueLive() --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u17
    --]]
    if u16() then
        return false
    end
    local v18 = os.time()
    local v19 = false
    for v20, v21 in u17() do
        local _ = v20 - 1
        local v22 = v21[1]
        local v23 = v21[2]
        local v24
        if v22 <= v18 then
            v24 = v18 <= v23
        else
            v24 = false
        end
        if v24 then
            return true
        end
    end
    return v19
end
function u13.getClanWarId(p25) --[[ Line: 111 ]]
    return "CLAN_WAR_" .. p25
end
function u13.getActiveClanWarId() --[[ Line: 115 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u14
    --]]
    if u16() then
        return nil
    else
        return "CLAN_WAR_" .. u14:getWeeklyResetId()
    end
end
function u13.getPreviousClanWarId() --[[ Line: 122 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    return "CLAN_WAR_" .. u3.new(1717192800):getWeeklyResetId()
end
function u13.recalculateClanWarScore(p26) --[[ Line: 127 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u2
    --]]
    local v27 = u13.getDivisionMultipliers(p26.division)
    local v28 = 0 + p26.stats.generic.wins * 150 * v27.matchScore + p26.stats.generic.losses * 30 * v27.matchScore
    if p26.missionsCompleted then
        local v29 = u2.values(p26.missionsCompleted)
        local v30 = 0
        for v31 = 1, #v29 do
            local v32 = v29[v31]
            local _ = v31 - 1
            v30 = v30 + v32
        end
        v28 = v28 + v30
    end
    return v28
end
function u13.getNextQueueOpenTime() --[[ Line: 152 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u17
    --]]
    if u16() then
        return 0
    end
    local u33 = os.time()
    local v34 = 0
    local v35 = {}
    for v36, v38 in u17() do
        local _ = v36 - 1
        if u33 >= v38[1] then
            local v38 = nil
        end
        if v38 ~= nil then
            v34 = v34 + 1
            v35[v34] = v38
        end
    end
    table.sort(v35, function(p39, p40) --[[ Line: 175 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        return p39[1] - u33 < p40[1] - u33
    end)
    return v35[1][1]
end
u17 = function() --[[ Line: 190 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u15
    --]]
    if u16() then
        return {}
    end
    local u41 = {}
    local function v53(u42) --[[ Line: 195 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        local u43 = os.date("!*t", os.time())
        local v44 = u42.daysOfTheWeek
        local function v50(p45) --[[ Line: 198 ]]
            --[[
            Upvalues:
                [1] = u43
                [2] = u42
                [3] = u41
            --]]
            local v46 = p45 - u43.wday
            if v46 < 0 then
                v46 = v46 + 7
            end
            local v47 = os.time({
                ["min"] = 0,
                ["sec"] = 0,
                ["year"] = u43.year,
                ["month"] = u43.month,
                ["day"] = u43.day + v46,
                ["hour"] = u42.startHour
            })
            local v48 = { v47, v47 + u42.durationMinutes * 60 }
            local v49 = u41
            table.insert(v49, v48)
        end
        for v51, v52 in v44 do
            v50(v52, v51 - 1, v44)
        end
    end
    for v54, v55 in u15 do
        v53(v55, v54 - 1, u15)
    end
    return u41
end
u13.getClanWarUTCTimeRanges = u17
function u13.getClanWarTimeRangesFormatted() --[[ Line: 225 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u17
    --]]
    local v56 = {}
    if u16() then
        return v56
    end
    for v57, v58 in u17() do
        local _ = v57 - 1
        local v59 = os.date("%x %I:%M %p %Z", v58[1]) .. " - " .. os.date("%x %I:%M %p %Z", v58[2])
        table.insert(v56, v59)
    end
    return v56
end
function u13.createStarterClanWarStats() --[[ Line: 243 ]]
    return {
        ["generic"] = {
            ["wins"] = 0,
            ["losses"] = 0,
            ["damageDealt"] = 0,
            ["damageTaken"] = 0,
            ["voidDeaths"] = 0
        },
        ["bedwars"] = {
            ["bedBreaks"] = 0,
            ["emeraldsCollected"] = 0,
            ["diamondsCollected"] = 0,
            ["ironCollected"] = 0,
            ["finalKills"] = 0
        }
    }
end
u16 = function() --[[ Line: 262 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    return u6(u5.DisableClanWars)
end
u13.areClanWarsDisabled = u16
function u13.getDivisionMultipliers(p60) --[[ Line: 266 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    return {
        ["matchScore"] = 1,
        ["contribution"] = p60 == u12.Division_I and 1.2 or (p60 == u12.Division_II and 1.1 or 1),
        ["clanCoins"] = p60 == u12.Division_I and 1.2 or (p60 == u12.Division_II and 1.1 or 1)
    }
end
function u13.calculateMedalsScore(p61) --[[ Line: 282 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v62 = 0
    local v63 = v62
    for v64, v65 in p61 do
        v62 = v63 + v65 * u11(v64).points
        v63 = v62
    end
    return v63
end
function u13.convertToMedalCount(p66) --[[ Line: 295 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v67 = u4.values(p66)
    local v68 = {}
    for v69 = 1, #v67 do
        local v70 = v67[v69]
        local _ = v69 - 1
        local v71 = v68[v70]
        v68[v70] = (v71 == nil and 0 or v71) + 1
    end
    return v68
end
function u13.calculateClanWarCoinsEarned(p72) --[[ Line: 321 ]]
    return p72.score * 10
end
function u13.isClanWarMedal(p73) --[[ Line: 325 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u10
    --]]
    local v74 = u4.values(u10)
    return table.find(v74, p73) ~= nil
end
return {
    ["ClanWarUtils"] = u13
}
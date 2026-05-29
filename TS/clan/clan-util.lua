local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v3 = v2.ColorUtil
local v4 = v2.ResetTime
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vip", "vip-util").VIPUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank
local v10 = {
    ["DEFAULT_CLAN_TAG_COLOR"] = v3.hexColor(15658734),
    ["CLAN_NAME_CHAR_LIMIT"] = 20,
    ["CLAN_INTRO_CHAR_LIMIT"] = 160,
    ["ANNOUNCEMENT_INTRO_CHAR_LIMIT"] = 160,
    ["CLAN_TAG_MIN_CHAR_LIMIT"] = 2,
    ["CLAN_TAG_MAX_CHAR_LIMIT"] = 5,
    ["CLAN_CHAT"] = {
        ["CLAN_CHAT_DISABLED"] = false,
        ["MAX_CHAT_MESSAGES"] = 20,
        ["MAX_CHAR_LIMIT"] = 60,
        ["CHAT_TTL"] = v7.isStaging() and 1800 or 604800
    }
}
local u11 = v7.isStaging() and 120 or 86400
v10.NEW_CLAN_MARKED_DELETE_GRACE_PERIOD = u11
local u12 = v7.isStaging() and 120 or 604800
v10.CLAN_MARKED_DELETE_GRACE_PERIOD = u12
function v10.getClanDeleteGracePeriod(p13) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u11
        [3] = u12
    --]]
    if u5:GetServerTimeNow() - p13 < 604800 then
        return u11
    else
        return u12
    end
end
v10.FALLBACK_CLAN_ICON = v6.CLAN
v10.CONTRIBUTION_AFTER_CAP_MULT = 0.1
v10.CLAN_DAILY_LIMIT_MULT = 1
v10.MAX_DAILY_CONTRIBUTION = 1000
v10.DAILY_RESET_HOUR = 23
local u14 = v4.new(os.time({
    ["year"] = 2022,
    ["month"] = 2,
    ["day"] = 18,
    ["hour"] = 23
}))
v10.resetTime = u14
function v10.getContributionDayId() --[[ Line: 81 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = tonumber(v15:getDailyResetId()) % 7
    return tostring(v16)
end
function v10.getWeekId() --[[ Line: 94 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v17 = os.date("!*t", os.time())
    local v18 = u14
    local v19 = tonumber(v18:getWeeklyResetId())
    local v20 = v17.year
    return tostring(v20) .. "_" .. tostring(v19)
end
local u21 = nil
function v10.calcXPMultiplier(p22, p23) --[[ Line: 109 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v24 = p22 / 1000
    local v25 = math.ceil(v24)
    local v26 = math.clamp(v25, 1, p23)
    return (u21(v26) - u21(v26 - 1)) / 1000
end
u21 = function(p27) --[[ Name: calcClanMaxDailyCoins, Line 121 ]]
    if p27 <= 0 then
        return 0
    end
    local v28 = p27 - 100
    return (math.pow(v28, 2) * -0.009182736455463728 + 100) * 1000 * 1
end
v10.calcClanMaxDailyCoins = u21
function v10.hasClanRank(p29, p30) --[[ Line: 131 ]]
    return p30 <= p29.rank
end
function v10.setClanPassPaid(p31, p32) --[[ Line: 135 ]]
    p31:SetAttribute("ClanPassPaid", p32)
end
function v10.hasClanPass(p33) --[[ Line: 139 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return p33:GetAttribute("ClanPassPaid") or u8.isPlayerVIP(p33)
end
function v10.getClanMemberRankColor(p34) --[[ Line: 145 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if p34 == u9.LEADER then
        return Color3.fromRGB(255, 240, 94)
    elseif p34 == u9.ADMIN then
        return Color3.fromRGB(255, 79, 79)
    elseif p34 == u9.OFFICER then
        return Color3.fromRGB(54, 138, 255)
    else
        return Color3.fromRGB(255, 255, 255)
    end
end
return {
    ["ClanUtil"] = v10
}
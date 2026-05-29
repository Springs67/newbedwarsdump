local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitServer
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "MapSaveUtil"
    end
})
u7.__index = u7
function u7.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(_) --[[ Line: 20 ]] end
function u7.canBypassCopylock(_, p10, p11) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u4
    --]]
    local v12 = false
    if u5:IsClient() then
        v12 = u3.Controllers.PermissionController:hasAnyPermissions({ "artist", "admin" })
    elseif u5:IsServer() then
        v12 = u4.Services.BedwarsPermissionService:playerHasAnyPermissions(p10, { "artist", "admin" })
    end
    return v12 or p10.UserId == p11
end
u7.MAX_MAP_SAVES = 5
u7.MAP_DESCRIPTION_MAX_CHARS = 160
u7.MAP_NAME_MAX_CHARS = 20
u7.MAP_MAX_TAGS = 3
u7.OFFICIAL_THUMBNAILS = {
    v6.STAR_COLLECTOR_FUN,
    v6.ARSON,
    v6.LUCKY_GIFT,
    v6.DUCK_CELEBRATION,
    v6.LASSY_CELEBRATION
}
return {
    ["MapSaveUtil"] = u7
}
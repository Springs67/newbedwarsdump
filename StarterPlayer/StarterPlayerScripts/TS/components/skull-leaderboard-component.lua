local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local u4 = v1.import(script, script.Parent.Parent, "controllers", "global", "event", "weekly-events", "skull-drops", "ui", "skull-leaderboard-core").SkullLeaderboardUIWrapper
local u5 = v1.import(script, script.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "roblox-leaderboards").RobloxLeaderboardEnum
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes")
local v8 = v7.Attribute
local u9 = v7.GetAttribute
local u10 = v8.new("LeaderboardName", v3.optional(v3.string))
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "LeaderboardComponent"
    end
})
u11.__index = u11
function u11.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14, p15) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u5
        [4] = u4
        [5] = u6
    --]]
    u9(p15, u10)
    p14.roactTree = u5("SkullLeaderboardApp", u4, {
        ["Leaderboards"] = { u6.MARROWS_MADNESS },
        ["DefaultLeaderboard"] = u6.MARROWS_MADNESS
    }, {}, {
        ["Parent"] = p15
    })
end
function u11.Destroy(p16) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.unmount(p16.roactTree)
end
u11.Tag = "crypt-Leaderboard"
return u11
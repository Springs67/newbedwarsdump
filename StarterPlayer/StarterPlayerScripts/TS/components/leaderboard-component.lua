local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local u4 = v1.import(script, script.Parent.Parent, "controllers", "lobby", "leaderboard", "ui", "leaderboard-core").LeaderboardUIWrapper
local u5 = v1.import(script, script.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-meta")
local u7 = v6.DEFAULT_LEADERBOARD_TO_DISPLAY
local u8 = v6.getLeaderboardsToDisplay
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes")
local v10 = v9.Attribute
local u11 = v9.GetAttribute
local u12 = v10.new("LeaderboardName", v3.optional(v3.string))
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "LeaderboardComponent"
    end
})
u13.__index = u13
function u13.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16, p17) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
        [3] = u5
        [4] = u4
        [5] = u8
        [6] = u7
    --]]
    u11(p17, u12)
    p16.roactTree = u5("LeaderboardApp", u4, {
        ["Leaderboards"] = u8(),
        ["DefaultLeaderboard"] = u7
    }, {}, {
        ["Parent"] = p17
    })
end
function u13.Destroy(p18) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.unmount(p18.roactTree)
end
u13.Tag = "Leaderboard"
return u13
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u6 = v1.import(script, script.Parent.Parent.Parent, "match-end-screen-controller").MatchEndScreenController
local u7 = v1.import(script, script.Parent, "ui", "match-end-stats").MatchEndStatsWrapper
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "StatsScreenController"
    end,
    ["__index"] = u6
})
u8.__index = u8
function u8.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v9 = u8
    local v10 = setmetatable({}, v9)
    return v10:constructor(...) or v10
end
function u8.constructor(p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p11, 5)
    p11.Name = "StatsScreenController"
end
function u8.KnitStart(u12) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    u6.KnitStart(u12)
    u5.Client:OnEvent("MatchEndEvent", function(_) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u5
        --]]
        u12.trackedStats = u5.Client:Get("GetMatchStats"):CallServer()
    end)
end
function u8.renderScreen(p13) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
    --]]
    if not p13.matchEndEvent then
        return nil
    end
    if not p13.tree then
        p13.tree = u4("MatchEndStats", u7, {
            ["PreviousLeaderboardPosition"] = p13.matchEndEvent.previousLeaderboardPosition,
            ["NewLeaderboardPosition"] = p13.matchEndEvent.newLeaderboardPosition,
            ["TrackedStats"] = p13.trackedStats,
            ["WinningTeamId"] = p13.matchEndEvent.winningTeamId
        })
    end
end
function u8.unmountScreen(p14) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if p14.tree then
        u3.unmount(p14.tree)
        p14.tree = nil
    end
end
v2.CreateController(u8.new())
return nil
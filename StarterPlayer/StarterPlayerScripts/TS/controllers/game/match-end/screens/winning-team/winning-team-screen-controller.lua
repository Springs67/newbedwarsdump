local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, script.Parent.Parent.Parent, "match-end-screen-controller").MatchEndScreenController
local u6 = v1.import(script, script.Parent, "ui", "winning-team").WinningTeamWrapper
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "WinningTeamScreenController"
    end,
    ["__index"] = u5
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p10, 1)
    p10.Name = "WinningTeamScreenController"
end
function u7.KnitStart(p11) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.KnitStart(p11)
end
function u7.renderScreen(p12) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
    --]]
    if not p12.matchEndEvent then
        return nil
    end
    p12.tree = u4("WinningTeam", u6, {
        ["WinningTeamId"] = p12.matchEndEvent.winningTeamId,
        ["NewLeaderboardPos"] = p12.matchEndEvent.newLeaderboardPosition,
        ["PreviousLeaderboardPos"] = p12.matchEndEvent.previousLeaderboardPosition,
        ["CustomTitleMessage"] = p12.matchEndEvent.customTitleMessage
    })
end
function u7.unmountScreen(p13) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if not p13.tree then
        return nil
    end
    u3.unmount(p13.tree)
end
v2.CreateController(u7.new())
return nil
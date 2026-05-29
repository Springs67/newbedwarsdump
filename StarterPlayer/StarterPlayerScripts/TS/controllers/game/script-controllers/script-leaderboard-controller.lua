local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent, "ui", "script-leaderboard-container").ScriptLeaderboardContainer
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "ScriptLeaderboardController"
    end,
    ["__index"] = u7
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12, ...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u3
    --]]
    u7.constructor(p12, ...)
    p12.Name = "ScriptLeaderboardController"
    p12.leaderboard = {}
    p12.leaderboardGUIMaid = u3.new()
end
function u9.KnitStart(u13) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
    --]]
    u7.KnitStart(u13)
    u8.Client:OnEvent("CreateScriptLeaderboard", function() --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13:mountLeaderboardGUI()
    end)
    u8.Client:OnEvent("UpdateScriptLeaderboard", function(p14) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13.leaderboard = p14.leaderboard
        u13:mountLeaderboardGUI()
    end)
end
function u9.mountLeaderboardGUI(p15) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u5
    --]]
    p15.leaderboardGUIMaid:DoCleaning()
    local v16 = {
        ["leaderboard"] = p15.leaderboard
    }
    local u17 = u4.mount(u4.createElement(u6, v16), u5.LocalPlayer:WaitForChild("PlayerGui"))
    p15.leaderboardGUIMaid:GiveTask(function() --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u17
        --]]
        u4.unmount(u17)
    end)
end
v2.CreateController(u9.new())
return nil
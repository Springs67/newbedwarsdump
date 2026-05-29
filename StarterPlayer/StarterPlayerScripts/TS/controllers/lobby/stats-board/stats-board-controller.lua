local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u6 = v1.import(script, script.Parent, "ui", "stats-board-app").StatsBoardUIWrapper
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "StatsBoardController"
    end,
    ["__index"] = u4
})
u7.__index = u7
function u7.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p10)
    p10.Name = "StatsBoardController"
end
function u7.KnitStart(u11) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u6
    --]]
    u2("StatsBoard", function(p12) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u5
            [3] = u6
        --]]
        u11.roactTree = u5("StatsBoard", u6, {}, {}, {
            ["Parent"] = p12
        })
    end)
end
v3.CreateController(u7.new())
return nil
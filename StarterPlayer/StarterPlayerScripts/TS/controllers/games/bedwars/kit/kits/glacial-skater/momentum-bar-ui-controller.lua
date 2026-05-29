local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, script.Parent, "momentum-bar-ui").MomentumBarUi
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "MomentumBarUiController"
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
        [2] = u4
    --]]
    u6.constructor(p11)
    p11.Name = "MomentumBarUiController"
    p11.momentumBarUiKey = "MomentumBarUi"
    p11.barMaid = u4.new()
    p11.barMaid = u4.new()
end
function u8.KnitStart(p12) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.KnitStart(p12)
end
function u8.mountMomentumBarUi(p13) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u7
    --]]
    p13.barMaid:DoCleaning()
    p13.barMaid:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u5.createFragment({
        [p13.momentumBarUiKey] = u5.createElement(u7)
    })))
end
function u8.unmountMomentumBarUi(p14) --[[ Line: 39 ]]
    p14.barMaid:DoCleaning()
end
v3.CreateController(u8.new())
return nil
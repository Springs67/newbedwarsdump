local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "TurtleShellController"
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
        [2] = u5
    --]]
    u6.constructor(p11)
    p11.Name = "TurtleShellController"
    p11.maid = u5.new()
end
function u8.KnitStart(p12) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.KnitStart(p12)
end
function u8.adjustStats(p13, p14, p15) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v16 = u4.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["moveSpeedMultiplier"] = p14
    })
    local v17 = u4.Controllers.JumpHeightController:getJumpModifier():addModifier({
        ["jumpHeightMultiplier"] = p15
    })
    p13.maid:GiveTask(v16)
    p13.maid:GiveTask(v17)
end
function u8.isRelevantItem(_, p18) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return p18.itemType == u7.TURTLE_SHELL
end
function u8.onEnable(p19) --[[ Line: 44 ]]
    p19:adjustStats(0.8, 0.8)
end
function u8.onDisable(p20) --[[ Line: 47 ]]
    p20.maid:DoCleaning()
end
v3.CreateController(u8.new())
return nil
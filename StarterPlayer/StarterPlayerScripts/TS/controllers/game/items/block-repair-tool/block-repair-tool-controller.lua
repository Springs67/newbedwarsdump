local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u6 = v1.import(script, script.Parent, "block-repair").BlockRepair
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "BlockRepairToolController"
    end,
    ["__index"] = u4
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
        [1] = u4
        [2] = u3
        [3] = u6
    --]]
    u4.constructor(p10)
    p10.Name = "BlockRepairToolController"
    p10.maid = u3.new()
    p10.blockRepair = u6.new()
    p10.highlightMaid = u3.new()
end
function u7.KnitStart(p11) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.KnitStart(p11)
end
function u7.isRelevantItem(_, p12) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return p12.itemType == u5.BLOCK_REPAIR_TOOL
end
function u7.onEnable(p13, _, _) --[[ Line: 35 ]]
    p13.blockRepair:enable()
end
function u7.onDisable(p14) --[[ Line: 38 ]]
    p14.blockRepair:disable()
end
v2.CreateController(u7.new())
return nil
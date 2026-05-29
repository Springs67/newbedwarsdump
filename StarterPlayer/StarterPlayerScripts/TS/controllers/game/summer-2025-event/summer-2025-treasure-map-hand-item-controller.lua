local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "screen-space")
local _ = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local _ = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u9 = v1.import(script, script.Parent, "summer-2025-treasure-map-gui").Summer2025TreasureMapGUI
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "Summer2025TreasureMapHandItemController"
    end,
    ["__index"] = u6
})
u10.__index = u10
function u10.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
    --]]
    u6.constructor(p13)
    p13.Name = "Summer2025TreasureMapHandItemController"
    p13.maid = u3.new()
end
function u10.isRelevantItem(_, p14) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return p14.itemType == u8.SUMMER_2025_TREASURE_MAP
end
function u10.onEnable(_, _, _) --[[ Line: 36 ]]
    return nil
end
function u10.mountMinimapGui(p15) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u4
        [4] = u9
        [5] = u5
    --]]
    local v16 = u7.ViewSizeX()
    local v17 = u7.ViewSizeY
    local v18 = math.min(v16, v17()) * 0.2
    local v19 = u2.Controllers.Summer2025TreasureMapController.worldSize
    local v20 = u2.Controllers.Summer2025TreasureMapController.centerWorldPosition
    local u21 = u4.mount(u4.createElement(u9, {
        ["WorldSize"] = v19,
        ["CenterWorldPosition"] = v20,
        ["MinimapWidth"] = v18,
        ["TreasureModel"] = u2.Controllers.Summer2025TreasureMapController:getCurrentTreasure()
    }), u5.LocalPlayer:WaitForChild("PlayerGui"), "Summer2025TreasureMapGUI")
    p15.maid:GiveTask(function() --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u21
        --]]
        u4.unmount(u21)
    end)
end
function u10.onDisable(p22) --[[ Line: 72 ]]
    p22.maid:DoCleaning()
end
function u10.KnitStart(p23) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.KnitStart(p23)
end
u2.CreateController(u10.new())
return nil
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "placement", "block-placer").BlockPlacer
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine
local u6 = v1.import(script, script.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "BlockPlacementController"
    end,
    ["__index"] = u6
})
u10.__index = u10
function u10.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p13)
    p13.Name = "BlockPlacementController"
    p13.disabled = false
end
function u10.KnitStart(p14) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.KnitStart(p14)
end
function u10.isRelevantItem(p15, p16) --[[ Line: 34 ]]
    return p15:getPlacedItemType(p16.itemType) ~= nil
end
function u10.onEnable(p17, p18) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u3
        [4] = u7
    --]]
    if p17.disabled then
        return nil
    end
    if p17.blockPlacer then
        p17.blockPlacer:disable()
    end
    p17.blockPlacer = u2.new(u5, p17:getPlacedItemType(p18.itemType))
    p17.blockPlacer:enable()
    p17.blockPlacer.onPlace:Connect(function() --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u7
        --]]
        u3.Controllers.ViewmodelController:playAnimation(u7.FP_USE_ITEM)
    end)
end
function u10.onDisable(p19) --[[ Line: 74 ]]
    if p19.blockPlacer then
        p19.blockPlacer:disable()
        p19.blockPlacer = nil
    end
end
function u10.getBlockPlacer(p20) --[[ Line: 80 ]]
    return p20.blockPlacer
end
function u10.getPlacedItemType(_, p21) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v22 = u9(p21)
    if v22 then
        if v22.block then
            return p21
        end
        if v22.placesBlock then
            return v22.placesBlock.blockType
        end
    end
    return nil
end
function u10.disableBlockPlacer(p23) --[[ Line: 95 ]]
    p23.disabled = true
    p23:onDisable()
end
function u10.enableBlockPlacer(p24) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
    --]]
    p24.disabled = false
    local v25 = u8.getInventory(u4.LocalPlayer).hand
    if v25 and p24:isRelevantItem(v25) then
        p24:onEnable(v25)
    end
end
return {
    ["BlockPlacementController"] = u3.CreateController(u10.new())
}
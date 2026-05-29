local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out")
local v3 = v2.Reflect
local u4 = v2.Flamework
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "InventoryDraggingController"
    end
})
u12.__index = u12
function u12.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 25 ]]
    p15.screenSinks = {}
end
function u12.onStart(u16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
    --]]
    u8.InputBegan:Connect(function(p17, _) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        local v18 = { Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch }
        local v19 = p17.UserInputType
        if table.find(v18, v19) == nil then
            return nil
        end
        local v20 = u16:getActiveScreenSink(p17)
        if v20 ~= nil then
            v20.inputEventOccured("began", p17)
        end
    end)
    u8.InputEnded:Connect(function(p21, _) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u5
        --]]
        if not u16.pickedUpInventoryItem then
            return nil
        end
        local v22 = { Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch }
        local v23 = p21.UserInputType
        if table.find(v22, v23) == nil then
            return nil
        end
        local v24 = u16.pickedUpInventoryItem
        if v24 ~= nil then
            v24 = v24.inputObject
        end
        if p21 == v24 then
            local v25 = u16:getActiveScreenSink(p21)
            if v25 then
                v25.inputEventOccured("ended", p21)
            else
                u5.Controllers.ItemDropController:dropHotbarItem(u16.pickedUpInventoryItem.slotId)
            end
            u16:deselectInventoryItem()
        end
    end)
end
function u12.dragItem(p26, p27, p28, _) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
        [3] = u9
        [4] = u10
        [5] = u4
    --]]
    if u11.isGameServer() and u5.Controllers.SpectateController:isSpectating() then
        return nil
    end
    local v29 = u9:getState().Inventory.observedInventory.hotbar
    if not v29 then
        return nil
    end
    local v30 = v29[p27 + 1]
    if not v30.item then
        return nil
    end
    local v31 = u10(v30.item.itemType).image
    local v32 = v31 == nil and "" or v31
    u4.resolveDependency("client/controllers/global/mouse/mouse-icon-controller@MouseIconController"):setMouseIcon(v32)
    p26.pickedUpInventoryItem = {
        ["slotId"] = p27,
        ["slotData"] = v30.item,
        ["inputObject"] = p28
    }
end
function u12.dragItemOntoSlot(p33, p34, p35, _) --[[ Line: 90 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if not p33.pickedUpInventoryItem then
        return nil
    end
    if p33.pickedUpInventoryItem.inputObject ~= p35 then
        print("[Inventory Dragging Controller]: Error - Wrong input object.")
        return nil
    end
    if p33.pickedUpInventoryItem.slotId ~= p34 then
        u9:dispatch({
            ["type"] = "InventorySwapHotbarSlots",
            ["slotIndex1"] = p34,
            ["slotIndex2"] = p33.pickedUpInventoryItem.slotId
        })
    end
    p33:deselectInventoryItem()
end
function u12.deselectInventoryItem(p36) --[[ Line: 107 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if not p36.pickedUpInventoryItem then
        return nil
    end
    p36.pickedUpInventoryItem = nil
    u4.resolveDependency("client/controllers/global/mouse/mouse-icon-controller@MouseIconController"):clearMouseIcon()
end
function u12.getActiveDragItem(p37) --[[ Line: 114 ]]
    return p37.pickedUpInventoryItem
end
function u12.registerScreenSink(u38, p39, p40, p41) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v42 = u7.new()
    local u43 = {
        ["position"] = p39,
        ["size"] = p40,
        ["inputEventOccured"] = p41,
        ["maid"] = v42
    }
    local v44 = u38.screenSinks
    table.insert(v44, u43)
    v42:GiveTask(function() --[[ Line: 126 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u43
        --]]
        local v45 = (table.find(u38.screenSinks, u43) or 0) - 1
        if v45 >= 0 then
            table.remove(u38.screenSinks, v45 + 1)
        end
    end)
    return u43
end
function u12.getActiveScreenSink(p46, p47) --[[ Line: 134 ]]
    for _, v48 in p46.screenSinks do
        local v49 = v48.position + v48.size
        local v50 = v48.position
        local v51 = Vector2.new
        local v52 = v49.X
        local v53 = v50.X
        local v54 = math.max(v52, v53)
        local v55 = v49.Y
        local v56 = v50.Y
        local v57 = v51(v54, (math.max(v55, v56)))
        local v58 = Vector2.new
        local v59 = v49.X
        local v60 = v50.X
        local v61 = math.min(v59, v60)
        local v62 = v49.Y
        local v63 = v50.Y
        local v64 = v58(v61, (math.min(v62, v63)))
        if p47.Position.Y > v64.Y and (p47.Position.Y < v57.Y and (p47.Position.X > v64.X and p47.Position.X < v57.X)) then
            return v48
        end
    end
    return nil
end
v3.defineMetadata(u12, "identifier", "client/controllers/global/inventory/inventory-dragging-controller@InventoryDraggingController")
v3.defineMetadata(u12, "flamework:implements", { "$:flamework@OnStart" })
v3.decorate(u12, "$:flamework@Controller", v6, {
    {}
})
return {
    ["InventoryDraggingController"] = u12
}
local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = u1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u4 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "InventoryViewmodelController"
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
    p10.Name = "InventoryViewmodelController"
end
function u7.KnitStart(u11) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u1
    --]]
    u5.changed:connect(function(u12, p13) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u11
        --]]
        if u12.Inventory.observedInventory.inventory.hand ~= p13.Inventory.observedInventory.inventory.hand then
            u1.Promise.defer(function() --[[ Line: 30 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u12
                --]]
                u11:handleStore(u12)
            end)
        end
    end)
    u11:handleStore(u5:getState())
end
function u7.handleStore(_, p14) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
        [3] = u3
    --]]
    local v15 = p14.Inventory.observedInventory.inventory.hand
    if v15 ~= nil then
        v15 = v15.itemType
    end
    if v15 then
        local v16 = u6
        local v17 = p14.Inventory.observedInventory.inventory.hand
        if v17 ~= nil then
            v17 = v17.itemSkin
        end
        local v18 = v16.createItemInstance(v15, 1, v17)
        u2.Controllers.ViewmodelController:setHeldItem(v18)
    else
        u2.Controllers.ViewmodelController:setHeldItem(nil)
    end
    u3.FirstPersonItemRendered:fire(v15)
end
return {
    ["InventoryViewmodelController"] = u2.CreateController(u7.new())
}
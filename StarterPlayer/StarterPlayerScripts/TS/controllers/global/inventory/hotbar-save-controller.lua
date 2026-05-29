local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v3 = v2.KnitClient
local u4 = v2.KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "HotbarSaveController"
    end,
    ["__index"] = u6
})
u11.__index = u11
function u11.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p14)
    p14.Name = "HotbarInventoryController"
end
function u11.KnitStart(u15) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u7
        [4] = u5
        [5] = u4
        [6] = u9
        [7] = u8
    --]]
    u6.KnitStart(u15)
    u10.Client:Get("SaveHotBarInventory"):Connect(function() --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u7
        --]]
        u15.savedHotbar = u7:getState().Inventory.observedInventory.hotbar
    end)
    u10.Client:Get("EntityDeathEvent"):Connect(function(p16) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u9
            [4] = u8
            [5] = u15
            [6] = u7
        --]]
        if p16.entityInstance == u5.LocalPlayer.Character then
            local v17 = u4.Controllers.MatchController:getQueueType()
            if v17 and u9(v17).game == u8.PVP_ARENA then
                return nil
            end
            u15.savedHotbar = u7:getState().Inventory.observedInventory.hotbar
        end
    end)
    u10.Client:Get("RestoreHotBarInventory"):Connect(function() --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u7
        --]]
        if not u15.savedHotbar then
            return nil
        end
        u7:dispatch({
            ["type"] = "RestoreHotBar",
            ["savedHotbar"] = u15.savedHotbar
        })
        u7:dispatch({
            ["type"] = "InventorySelectHotbarSlot",
            ["slot"] = 0
        })
    end)
    u10.Client:Get("ForceSwapHotbar"):Connect(function(p18) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u7
        --]]
        if not u15.savedHotbar then
            return nil
        end
        local v19 = false
        local v20 = 0
        while true do
            if v19 then
                v20 = v20 + 1
            else
                v19 = true
            end
            if v20 >= #u15.savedHotbar or not u15.savedHotbar[v20 + 1].item then
                local v21 = u15:getItemFromInventory(p18.fromSlotItem, u7:getState().Inventory.observedInventory.inventory.items)
                if not v21 then
                    return nil
                end
                u7:dispatch({
                    ["type"] = "InventoryAddToHotbar",
                    ["item"] = v21,
                    ["slot"] = v20
                })
                return
            end
        end
    end)
end
function u11.getItemSlot(_, p22, p23) --[[ Line: 103 ]]
    local v24 = false
    local v25 = 0
    while true do
        if v24 then
            v25 = v25 + 1
        else
            v24 = true
        end
        if v25 >= #p23 then
            return
        end
        local v26 = p23[v25 + 1].item
        if v26 ~= nil then
            v26 = v26.itemType
        end
        if v26 == p22 then
            return v25
        end
    end
end
function u11.getItemFromInventory(_, p27, p28) --[[ Line: 126 ]]
    local v29 = false
    local v30 = 0
    while true do
        if v29 then
            v30 = v30 + 1
        else
            v29 = true
        end
        if v30 >= #p28 then
            return
        end
        if p28[v30 + 1].itemType == p27 then
            return p28[v30 + 1]
        end
    end
end
v3.CreateController(u11.new())
return nil
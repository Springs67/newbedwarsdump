local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v9.StarterGui
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u16 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "inventory-entity").InventoryEntity
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "InventoryController"
    end,
    ["__index"] = u14
})
u22.__index = u22
function u22.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(u25) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u8
        [3] = u12
        [4] = u1
        [5] = u11
        [6] = u7
    --]]
    u14.constructor(u25)
    u25.Name = "InventoryController"
    u25.playerMaid = u8.new()
    task.spawn(function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        u12:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
    end)
    u1.Promise.retryWithDelay(function() --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u25
            [3] = u11
        --]]
        return u1.Promise.new(function(p26, p27) --[[ Line: 46 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u11
            --]]
            u25.cachedInventoryFolder = u11:WaitForChild("CachedInvItems", 3)
            if u25.cachedInventoryFolder == nil then
                return p27()
            else
                return p26()
            end
        end)
    end, 3, 7):finally(function() --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u7
        --]]
        if u25.cachedInventoryFolder == nil then
            u7.Error("Failed to retrieve cached inventory folder on client")
        end
    end)
end
function u22.KnitStart(u28) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u10
        [3] = u2
        [4] = u21
        [5] = u16
        [6] = u5
        [7] = u20
    --]]
    u15.changed:connect(function(p29, p30) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u10
        --]]
        if p29.Inventory.observedPlayer and p29.Inventory.observedPlayer ~= p30.Inventory.observedPlayer then
            local u31 = p29.Inventory.observedPlayer
            task.spawn(function() --[[ Line: 60 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u10
                    [3] = u31
                --]]
                u28:hookObservedPlayer(u10.LocalPlayer, u31)
            end)
        end
    end)
    local v32 = u15:getState().Inventory.observedPlayer
    if v32 then
        u28:hookObservedPlayer(u10.LocalPlayer, v32)
    end
    local v36 = {
        ["actionId"] = "inventory-toggle",
        ["action"] = "Inventory",
        ["priority"] = -1,
        ["boundFunction"] = function(_, p33, _) --[[ Name: boundFunction, Line 73 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u2
                [3] = u16
                [4] = u5
            --]]
            if p33 == Enum.UserInputState.Begin then
                if u21.isLobbyServer() then
                    local v34 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
                    if v34:isAppOpen(u16.INVENTORY) then
                        v34:closeApp(u16.INVENTORY)
                    else
                        v34:openApp(u16.INVENTORY, {})
                    end
                end
                if u21.isGameServer() then
                    if u5.Controllers.GamemodeController:isLocalPlayerInCreativeMode() then
                        u5.Controllers.GamemodeController:toggleCreativeInventory()
                        return
                    end
                    local v35 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
                    if v35:isAppOpen(u16.INVENTORY) then
                        v35:closeApp(u16.INVENTORY)
                        return
                    end
                    v35:openApp(u16.INVENTORY, {})
                end
            end
        end
    }
    u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction(v36)
    local v37 = u15:getState().Inventory.observedInventory.inventory.items
    local v38 = false
    local v39 = 0
    while true do
        if v38 then
            v39 = v39 + 1
        else
            v38 = true
        end
        if v39 >= 9 or v39 >= #v37 then
            for _, v40 in u15:getState().Inventory.observedInventory.inventory.items do
                local v41 = u20(v40.itemType)
                if v41.armor and u15:getState().Inventory.observedInventory.inventory.armor[v41.armor.slot + 1] == "empty" then
                    u15:dispatch({
                        ["type"] = "InventorySetArmorItem",
                        ["armorSlot"] = v41.armor.slot,
                        ["item"] = v40
                    })
                end
                if v41.backpack and u15:getState().Inventory.observedInventory.inventory.backpack == nil then
                    u15:dispatch({
                        ["type"] = "InventorySetBackpack",
                        ["item"] = v40
                    })
                end
            end
            u28:inventoryReplication()
            return
        end
        u15:dispatch({
            ["type"] = "InventoryAddToHotbar",
            ["item"] = v37[v39 + 1],
            ["slot"] = v39
        })
    end
end
function u22.inventoryReplication(u42) --[[ Line: 142 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u10
        [3] = u8
        [4] = u18
        [5] = u6
        [6] = u19
    --]]
    u17("inventory-entity", function(p43) --[[ Line: 143 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u8
            [3] = u18
            [4] = u6
            [5] = u19
            [6] = u42
        --]]
        if u10.LocalPlayer.Name == p43.Name then
            return nil
        end
        local u44 = u8.new()
        local u45 = u18.new(p43)
        if not u45 then
            error("Failed to find entity during client entity replication.")
        end
        p43:WaitForChild("HandInvItem")
        local v46 = p43.HandInvItem.Value
        if v46 then
            u45:equipItem(v46)
        else
            u45:unequipItemInHand()
        end
        u44:GiveTask(p43.HandInvItem.Changed:Connect(function(p47) --[[ Line: 166 ]]
            --[[
            Upvalues:
                [1] = u45
            --]]
            if p47 then
                u45:equipItem(p47)
            else
                u45:unequipItemInHand()
            end
        end))
        local u48 = 0
        local v49 = false
        while true do
            if v49 then
                u48 = u48 + 1
            else
                v49 = true
            end
            if u48 >= #u6.values(u19) then
                local u50 = p43:WaitForChild("BedWarsBackpackSlot", 3)
                local v51 = u50.Value
                if v51 then
                    u45:equipBackpack(v51)
                else
                    u45:unequipBackpackSlot()
                end
                u44:GiveTask(u50.Changed:Connect(function(_) --[[ Line: 229 ]]
                    --[[
                    Upvalues:
                        [1] = u50
                        [2] = u45
                    --]]
                    local v52 = u50.Value
                    if v52 then
                        u45:equipBackpack(v52)
                    else
                        u45:unequipBackpackSlot()
                    end
                end))
                u44:GiveTask(p43.AncestryChanged:Connect(function(_, p53) --[[ Line: 232 ]]
                    --[[
                    Upvalues:
                        [1] = u42
                        [2] = u44
                    --]]
                    if p53 == nil or p53 == u42.cachedInventoryFolder then
                        u44:DoCleaning()
                    end
                end))
                return
            end
            local v54 = p43:WaitForChild("ArmorInvItem_" .. tostring(u48))
            local function u60(p55, p56) --[[ Line: 187 ]]
                --[[
                Upvalues:
                    [1] = u45
                --]]
                if p56 then
                    local v57 = u45:getPlayer()
                    if v57 ~= nil then
                        v57 = v57:GetAttribute("ArmorTrimType")
                    end
                    local v58 = u45:getPlayer()
                    if v58 ~= nil then
                        v58 = v58:GetAttribute("ArmorTrimColor")
                    end
                    local v59 = u45:getPlayer()
                    if v59 ~= nil then
                        v59 = v59:GetAttribute("ArmorTrimEffectRank")
                    end
                    u45:equipArmorItem(p56, p55, v57 and (v58 ~= nil and v59 ~= nil) and {
                        ["type"] = v57,
                        ["color"] = v58,
                        ["effectRank"] = v59
                    } or nil)
                else
                    u45:unequipArmorSlot(p55)
                end
            end
            u60(u48, v54.Value)
            u44:GiveTask(v54.Changed:Connect(function(p61) --[[ Line: 214 ]]
                --[[
                Upvalues:
                    [1] = u60
                    [2] = u48
                --]]
                return u60(u48, p61)
            end))
        end
    end)
end
function u22.hookObservedPlayer(u62, _, p63) --[[ Line: 239 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u15
        [3] = u13
        [4] = u18
    --]]
    u62.playerMaid:DoCleaning()
    local u64 = {}
    local u65 = u8.new()
    local function u69(u66) --[[ Line: 243 ]]
        --[[
        Upvalues:
            [1] = u64
            [2] = u8
            [3] = u65
            [4] = u15
            [5] = u62
            [6] = u13
        --]]
        u64[u66] = true
        local u67 = u8.new()
        u65:GiveTask(u67)
        u67:GiveTask(u66:GetAttributeChangedSignal("Amount"):Connect(function() --[[ Line: 248 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u66
            --]]
            u15:dispatch({
                ["type"] = "InventorySetItemAmount",
                ["tool"] = u66,
                ["amount"] = u66:GetAttribute("Amount")
            })
        end))
        u67:GiveTask(u66.AncestryChanged:Connect(function(_, p68) --[[ Line: 255 ]]
            --[[
            Upvalues:
                [1] = u62
                [2] = u13
                [3] = u66
                [4] = u67
            --]]
            if p68 == nil or p68 == u62.cachedInventoryFolder then
                u13.ItemRemoved:fire(u66.Name)
                u67:DoCleaning()
            end
        end))
        u67:GiveTask(function() --[[ Line: 261 ]]
            --[[
            Upvalues:
                [1] = u66
                [2] = u64
                [3] = u15
            --]]
            u64[u66] = nil
            u15:dispatch({
                ["type"] = "InventoryRemoveItem",
                ["tool"] = u66
            })
        end)
        task.spawn(function() --[[ Line: 271 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u66
            --]]
            u13.ItemAdded:fire(u66)
        end)
        return u67
    end
    local function u89(p70) --[[ Line: 276 ]]
        --[[
        Upvalues:
            [1] = u65
            [2] = u18
            [3] = u64
            [4] = u15
            [5] = u69
            [6] = u62
            [7] = u8
        --]]
        u65:DoCleaning()
        local v71 = u18.new(p70)
        if not v71 then
            error("character not found!")
        end
        local function u75(p72) --[[ Line: 283 ]]
            --[[
            Upvalues:
                [1] = u64
                [2] = u15
                [3] = u69
                [4] = u65
            --]]
            for _, v73 in p72:GetChildren() do
                if u64[v73] == nil then
                    u15:dispatch({
                        ["type"] = "InventoryAddItem",
                        ["tool"] = v73
                    })
                    u69(v73)
                end
            end
            u65:GiveTask(p72.ChildAdded:Connect(function(p74) --[[ Line: 293 ]]
                --[[
                Upvalues:
                    [1] = u64
                    [2] = u15
                    [3] = u69
                --]]
                if u64[p74] == nil then
                    u15:dispatch({
                        ["type"] = "InventoryAddItem",
                        ["tool"] = p74
                    })
                    u69(p74)
                end
            end))
        end
        local v76 = v71:getInventoryFolder()
        if v76 then
            u75(v76)
        end
        u65:GiveTask(v71:inventoryFolderAddedEvent(function(p77) --[[ Line: 308 ]]
            --[[
            Upvalues:
                [1] = u75
            --]]
            u75(p77)
        end))
        u65:GiveTask(p70.AncestryChanged:Connect(function(_, p78) --[[ Line: 311 ]]
            --[[
            Upvalues:
                [1] = u62
                [2] = u65
            --]]
            if p78 == nil or p78 == u62.cachedInventoryFolder then
                u65:DoCleaning()
            end
        end))
        u65:GiveTask(function() --[[ Line: 316 ]] end)
        local u79 = u8.new()
        local function u84(p80) --[[ Line: 322 ]]
            --[[
            Upvalues:
                [1] = u79
                [2] = u15
            --]]
            for _, u81 in p80:GetChildren() do
                if u81:IsA("Accessory") then
                    u15:dispatch({
                        ["type"] = "ChestAddItem",
                        ["itemInstance"] = u81
                    })
                    u79:GiveTask(u81:GetAttributeChangedSignal("Amount"):Connect(function() --[[ Line: 324 ]]
                        --[[
                        Upvalues:
                            [1] = u15
                            [2] = u81
                        --]]
                        u15:dispatch({
                            ["type"] = "ChestItemSetAmount",
                            ["itemInstance"] = u81,
                            ["amount"] = u81:GetAttribute("Amount")
                        })
                    end))
                end
            end
            u79:GiveTask(p80.ChildAdded:Connect(function(u82) --[[ Line: 341 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u79
                --]]
                if u82:IsA("Accessory") then
                    u15:dispatch({
                        ["type"] = "ChestAddItem",
                        ["itemInstance"] = u82
                    })
                    u79:GiveTask(u82:GetAttributeChangedSignal("Amount"):Connect(function() --[[ Line: 324 ]]
                        --[[
                        Upvalues:
                            [1] = u15
                            [2] = u82
                        --]]
                        u15:dispatch({
                            ["type"] = "ChestItemSetAmount",
                            ["itemInstance"] = u82,
                            ["amount"] = u82:GetAttribute("Amount")
                        })
                    end))
                end
            end))
            u79:GiveTask(p80.ChildRemoved:Connect(function(p83) --[[ Line: 350 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15:dispatch({
                    ["type"] = "ChestRemoveItem",
                    ["itemInstance"] = p83
                })
            end))
        end
        u65:GiveTask(function() --[[ Line: 363 ]]
            --[[
            Upvalues:
                [1] = u79
                [2] = u15
            --]]
            u79:DoCleaning()
            u15:dispatch({
                ["type"] = "ChestClear"
            })
        end)
        if p70:FindFirstChild("ObservedChestFolder") then
            local v85 = p70:FindFirstChild("ObservedChestFolder")
            if v85.Value then
                u84(v85.Value)
            end
            u65:GiveTask(v85.Changed:Connect(function(p86) --[[ Line: 370 ]]
                --[[
                Upvalues:
                    [1] = u84
                    [2] = u79
                    [3] = u15
                --]]
                if p86 then
                    u84(p86)
                else
                    u79:DoCleaning()
                    u15:dispatch({
                        ["type"] = "ChestClear"
                    })
                end
            end))
        else
            u65:GiveTask(p70.ChildAdded:Connect(function(p87) --[[ Line: 382 ]]
                --[[
                Upvalues:
                    [1] = u84
                    [2] = u65
                    [3] = u79
                    [4] = u15
                --]]
                if p87.Name == "ObservedChestFolder" then
                    if p87.Value then
                        u84(p87.Value)
                    end
                    u65:GiveTask(p87.Changed:Connect(function(p88) --[[ Line: 370 ]]
                        --[[
                        Upvalues:
                            [1] = u84
                            [2] = u79
                            [3] = u15
                        --]]
                        if p88 then
                            u84(p88)
                        else
                            u79:DoCleaning()
                            u15:dispatch({
                                ["type"] = "ChestClear"
                            })
                        end
                    end))
                end
            end))
        end
    end
    u62.playerMaid:GiveTask(p63.CharacterAdded:Connect(function(p90) --[[ Line: 389 ]]
        --[[
        Upvalues:
            [1] = u89
        --]]
        u89(p90)
    end))
    if p63.Character then
        u89(p63.Character)
    end
    u62.playerMaid:GiveTask(function() --[[ Line: 395 ]]
        --[[
        Upvalues:
            [1] = u65
        --]]
        u65:DoCleaning()
    end)
end
function u22.setObservedPlayer(_, p91) --[[ Line: 399 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15:dispatch({
        ["type"] = "SetObservedPlayer",
        ["observedPlayer"] = p91
    })
end
function u22.getEquippedArmor(_, p92) --[[ Line: 405 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u20
    --]]
    local v93 = p92 or u15:getState().Inventory.observedInventory.inventory.armor
    local v94 = {}
    for v95 = 1, #v93 do
        local v96 = v93[v95]
        local _ = v95 - 1
        if v96 ~= "empty" then
            local v97 = u20(v96.itemType)
            if v97.armor then
                v94[v97.armor.slot] = v96.itemType
            end
        end
    end
    return v94
end
return {
    ["InventoryController"] = v4.CreateController(u22.new())
}
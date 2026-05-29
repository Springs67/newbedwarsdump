local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ComponentUtil
local u5 = v3.DeviceUtil
local u6 = v3.GameCoreClientSyncEvents
local u7 = v3.SoundManager
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u12 = v1.import(script, script.Parent.Parent, "interaction", "interaction-registry-controller").InteractionCategory
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "shop-component").default
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-meta").BedwarsShopCategoryMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shop", "shop-item-lock-cause-meta").ShopItemLockCauseMeta
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shop", "shop-util").ShopUtil
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 35 ]]
        return "BedwarsShopController"
    end,
    ["__index"] = u13
})
u29.__index = u29
function u29.new(...) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p32)
    p32.Name = "BedwarsShopController"
    p32.alreadyPurchasedMap = {}
    p32.registeredShopItems = {}
    p32.randomlySelectedItems = {}
end
function u29.KnitStart(u33) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u14
        [3] = u9
        [4] = u5
        [5] = u12
        [6] = u4
        [7] = u16
        [8] = u10
        [9] = u2
        [10] = u15
        [11] = u6
    --]]
    u24.Client:Get("RegisterShopItems"):Connect(function(p34) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33.registeredShopItems = p34.items
    end)
    u24.Client:Get("BulkSendPurchasedItems"):Connect(function(p35) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u14
        --]]
        for v36, v37 in p35.purchasedItems do
            local _ = v36 - 1
            u33.alreadyPurchasedMap[v37] = true
        end
        u14:dispatch({
            ["type"] = "BedwarsBulkAddItemPurchased",
            ["itemTypes"] = p35.purchasedItems
        })
    end)
    u9.Controllers.InteractionRegistryController:RegisterInteraction({
        ["interactionLabel"] = "Item Shop",
        ["interactionObjectText"] = "Open",
        ["interactionTag"] = "BedwarsItemShop",
        ["instantActivation"] = true,
        ["clickablePrompt"] = u5.isMobileControls(),
        ["category"] = u12.OTHER,
        ["onInteracted"] = function(p38, p39) --[[ Name: onInteracted, Line 78 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u16
                [3] = u10
                [4] = u24
                [5] = u33
                [6] = u2
                [7] = u15
            --]]
            local v40 = nil
            for v41, v42 in u4:getAllComponents(u16) do
                local _ = v41 - 1
                if v42.instance == p39 == true then
                    v40 = v42
                    break
                end
            end
            local v43 = p39:GetAttribute("TeamId")
            local v44 = u10.Controllers.TeamController:getPlayerTeam(p38)
            if v44 ~= nil then
                v44 = v44.id
            end
            local v45
            if v44 == "" or (not v44 or v44 ~= v43) then
                v45 = false
            else
                v45 = true
                local v46 = u10.Controllers.ChestItemDisplayController:getTeamCrate()
                if v46 ~= nil then
                    v46 = v46:FindFirstChild("ChestFolderValue")
                end
                if v46 then
                    local v47 = v46.Value
                    if v47 then
                        u24.Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(v47)
                    end
                end
            end
            u33:closeAllShopApps()
            local v48 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
            local v49 = u15.BEDWARS_ITEM_SHOP
            local v50 = {}
            if v40 ~= nil then
                v40 = v40.attributes.Id
            end
            v50.shopId = v40
            v50.IsHomeBase = v45
            v48:openApp(v49, v50)
        end
    })
    u6.AppClose:connect(function(p51) --[[ Line: 134 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u33
            [3] = u24
        --]]
        if p51.appId ~= u15.BEDWARS_ITEM_SHOP then
            return nil
        end
        u33:closeAllShopApps()
        u24.Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(nil)
    end)
    u24.Client:Get("BedwarsShopItemsUpdate"):Connect(function(u52) --[[ Line: 141 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u4
            [3] = u16
        --]]
        local v53 = u33:getShopComponent(u52.shopId)
        if v53 then
            v53:setShopItems(u52.shopItems)
        else
            local u55 = u4:componentAdded(u16, function(p54) --[[ Line: 148 ]]
                --[[
                Upvalues:
                    [1] = u52
                --]]
                if p54.attributes.Id == u52.shopId then
                    p54:setShopItems(u52.shopItems)
                end
            end)
            task.delay(3, function() --[[ Line: 153 ]]
                --[[
                Upvalues:
                    [1] = u55
                --]]
                return u55
            end)
        end
    end)
    u24.Client:Get("BedwarsShopCategoriesUpdate"):Connect(function(p56) --[[ Line: 158 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        u14:dispatch({
            ["type"] = "GameSetUnlockedShopCategories",
            ["unlockedShopCategories"] = p56.unlockedShopCategories
        })
    end)
    u24.Client:Get("BedwarsShopRequestRandomlySelectedItems"):CallServerAsync():andThen(function(p57) --[[ Line: 166 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33.randomlySelectedItems = p57
    end)
end
function u29.getRegisteredShopItems(p58) --[[ Line: 171 ]]
    return p58.registeredShopItems
end
function u29.purchaseShopCategory(_, p59) --[[ Line: 174 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u7
        [3] = u27
    --]]
    u24.Client:Get("BedwarsPurchaseShopCategoryUnlock"):CallServerAsync({
        ["category"] = p59
    }):andThen(function(p60) --[[ Line: 178 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u27
        --]]
        if p60 then
            u7:playSound(u27.BEDWARS_UPGRADE_SUCCESS)
        end
    end)
end
function u29.getShopComponent(_, p61) --[[ Line: 185 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u16
    --]]
    local v62 = nil
    for v63, v64 in u4:getAllComponents(u16) do
        local _ = v63 - 1
        if v64.attributes.Id == p61 == true then
            return v64
        end
    end
    return v62
end
function u29.isInLockedCategory(_, p65) --[[ Line: 201 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u14
    --]]
    if u19[p65.category].unlockable then
        return u14:getState().Game.unlockedShopCategories[p65.category] == nil
    else
        return false
    end
end
function u29.getDisabledStatus(p66, p67, p68) --[[ Line: 213 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u26
        [3] = u25
        [4] = u21
        [5] = u20
        [6] = u28
    --]]
    if p68 == nil then
        p68 = false
    end
    if not u11.LocalPlayer then
        return nil
    end
    if p66:isInLockedCategory(p67) then
        return {
            ["reason"] = "Locked"
        }
    end
    local v69 = u26:isItemLocked(u11.LocalPlayer, p67)
    if v69 then
        local v70 = u25[v69]
        local v71 = {}
        local v72 = v70.purchaseButtonTitle
        v71.reason = v72 == nil and "Locked" or v72
        v71.buttonColor = v70.purchaseButtonColor
        v71.disabledIcon = v70.lockIcon
        v71.lockCause = v69
        return v71
    end
    u21(p67.itemType)
    local v73 = u26:getMaxStackForPlayer(u11.LocalPlayer, p67.itemType)
    if v73 ~= nil then
        local v74 = u20.getToolFromInventory(u11.LocalPlayer, p67.itemType)
        local v75
        if v74 == nil then
            v75 = v74
        else
            v75 = v74.amount
        end
        if v75 ~= nil and v73 <= v74.amount then
            return {
                ["reason"] = "Max Amount"
            }
        end
    end
    if p67.lockAfterPurchase or p67.tiered then
        p68 = u11.LocalPlayer and u20.hasEnough(u11.LocalPlayer, p67.itemType, 1) and true or p68
    end
    local v76 = p67.lockIfAttribute
    if v76 ~= "" and v76 then
        local v77 = u11.LocalPlayer:GetAttribute(p67.lockIfAttribute)
        p68 = v77 ~= 0 and (v77 == v77 and (v77 ~= "" and v77)) and true or p68
    end
    if p68 then
        return {
            ["reason"] = "Purchased",
            ["buttonColor"] = u28.backgroundPrimary
        }
    end
    if not u20.hasEnough(u11.LocalPlayer, p67.currency, p67.price) then
        return {
            ["reason"] = "Not Enough"
        }
    end
end
function u29.closeAllShopApps(_) --[[ Line: 288 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v78 = u11.LocalPlayer:FindFirstChild("PlayerGui")
    if v78 ~= nil then
        local v79 = 0
        v78 = {}
        for v80, v81 in v78:GetChildren() do
            local _ = v80 - 1
            if v81.Name == "ItemShop" == true then
                v79 = v79 + 1
                v78[v79] = v81
            end
        end
    end
    if v78 and #v78 > 0 then
        for v82, v83 in v78 do
            local _ = v82 - 1
            v83:Destroy()
        end
    end
end
function u29.getRandomlySelectedItems(p84) --[[ Line: 317 ]]
    return p84.randomlySelectedItems
end
function u29.getRandomlySelectedItemsAsShopItems(p85) --[[ Line: 320 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u11
    --]]
    local v86 = {}
    for v87, v88 in p85.randomlySelectedItems do
        local _ = v87 - 1
        local v89 = u18.getShopItem(v88, u11.LocalPlayer)
        if v89 then
            table.insert(v86, v89)
        end
    end
    return v86
end
function u29.getRecommendedItems(_) --[[ Line: 334 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u17
        [3] = u20
        [4] = u11
        [5] = u22
        [6] = u18
        [7] = u23
    --]]
    local v90 = {}
    local v91 = u10.Controllers.MatchController:getQueueMeta()
    if v91 ~= nil then
        v91 = v91.game
    end
    if v91 == u17.BEDWARS then
        local v92 = u20.hasEnough(u11.LocalPlayer, u22.EMERALD_CHESTPLATE, 1) and {} or {
            u22.LEATHER_CHESTPLATE,
            u22.IRON_CHESTPLATE,
            u22.DIAMOND_CHESTPLATE,
            u22.EMERALD_CHESTPLATE
        }
        local v93 = {}
        local v94 = #v93
        local v95 = #v90
        table.move(v90, 1, v95, v94 + 1, v93)
        local v96 = v94 + v95
        table.move(v92, 1, #v92, v96 + 1, v93)
        local v97 = u20.hasEnough(u11.LocalPlayer, u22.EMERALD_SWORD, 1) and {} or {
            u22.STONE_SWORD,
            u22.IRON_SWORD,
            u22.DIAMOND_SWORD,
            u22.EMERALD_SWORD
        }
        v90 = {}
        local v98 = #v90
        local v99 = #v93
        table.move(v93, 1, v99, v98 + 1, v90)
        local v100 = v98 + v99
        table.move(v97, 1, #v97, v100 + 1, v90)
        local v101 = u18
        local v102 = u23.getGamePlayer(u11.LocalPlayer):getTeamId()
        local v103 = v102 == nil and "0" or v102
        local v104 = v101.getTeamWoolById(v103)
        if not u20.hasEnough(u11.LocalPlayer, v104, 16) then
            local v105 = u22.WOOL_WHITE
            table.insert(v90, v105)
        end
        if not u20.hasEnough(u11.LocalPlayer, u22.WOOD_BOW, 1) then
            local v106 = u22.WOOD_BOW
            table.insert(v90, v106)
        end
        if u20.hasEnough(u11.LocalPlayer, u22.WOOD_BOW, 1) and not u20.hasEnough(u11.LocalPlayer, u22.ARROW, 8) then
            local v107 = u22.ARROW
            table.insert(v90, v107)
        end
    end
    return v90
end
return {
    ["BedwarsShopController"] = u9.CreateController(u29.new())
}
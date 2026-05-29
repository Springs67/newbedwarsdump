local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "farmer-cletus", "farmer-cletus-util").FarmerCletusUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-meta").BedwarsShopCategoryMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shop", "shop-util").ShopUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u22 = v1.import(script, script.Parent, "shop-category-default").ShopCategoryDefault
local u23 = v1.import(script, script.Parent, "shop-category-unlockable-list").ShopCategoryUnlockableList
local v24 = u8.Component:extend("ShopItemList")
function v24.init(_, _) --[[ Line: 28 ]] end
function v24.didMount(u25) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u19
        [3] = u4
        [4] = u13
        [5] = u9
        [6] = u18
        [7] = u12
    --]]
    u25:setState({
        ["showRecommendedShop"] = u10:getState().Settings[u19.SHOW_RECOMMENDED_SHOP]
    })
    if u4.isHoarceKat() then
        u25:setState({
            ["baseShop"] = u13.getShop(nil, u25.props.ShopID, true)
        })
    else
        u25:setState({
            ["baseShop"] = u13.getShop(u9.LocalPlayer, u25.props.ShopID, true)
        })
        u25.connection = u18.Client:Get("BedwarsShopItemsUpdate"):Connect(function(p26) --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u13
                [3] = u9
            --]]
            if p26.shopId ~= u25.props.ShopID then
                return nil
            end
            u25:setState({
                ["baseShop"] = u13.getShop(u9.LocalPlayer, u25.props.ShopID, true, p26.shopItems)
            })
        end)
        u25.attributeConnection = u9.LocalPlayer.AttributeChanged:Connect(function(p27) --[[ Line: 48 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u13
                [3] = u9
                [4] = u25
            --]]
            if p27 ~= u12.MelonSeedsPurchasedAttribute then
                return nil
            end
            u25:setState({
                ["baseShop"] = u13.getShop(u9.LocalPlayer, u25.props.ShopID, true)
            })
        end)
        u25.storeSignal = u10.changed:connect(function(p28, p29) --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u25
                [3] = u10
            --]]
            if p28.Settings[u19.SHOW_RECOMMENDED_SHOP] ~= p29.Settings[u19.SHOW_RECOMMENDED_SHOP] then
                u25:setState({
                    ["showRecommendedShop"] = u10:getState().Settings[u19.SHOW_RECOMMENDED_SHOP]
                })
            end
        end)
    end
end
function v24.willUnmount(p30) --[[ Line: 71 ]]
    local v31 = p30.connection
    if v31 ~= nil then
        v31:Disconnect()
    end
    local v32 = p30.attributeConnection
    if v32 ~= nil then
        v32:Disconnect()
    end
    local v33 = p30.storeSignal
    if v33 ~= nil then
        v33:disconnect()
    end
end
function v24.render(u34) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u9
        [4] = u13
        [5] = u10
        [6] = u16
        [7] = u20
        [8] = u17
        [9] = u21
        [10] = u8
        [11] = u7
        [12] = u15
        [13] = u14
        [14] = u11
        [15] = u22
        [16] = u5
        [17] = u23
        [18] = u3
    --]]
    local v35 = u34.state.baseShop
    if not v35 then
        return nil
    end
    local u36 = u34.state.showRecommendedShop
    local u37 = {}
    for v38, v39 in v35 do
        local _ = v38 - 1
        u37[v39.itemType] = v39
    end
    local v40 = 0
    local v41 = {}
    for v42, v43 in v35 do
        local _ = v42 - 1
        if not v43.tiered == true then
            v40 = v40 + 1
            v41[v40] = v43
        end
    end
    if u34.props.ShopID ~= nil and not u4.isHoarceKat() then
        local v44 = u6.Controllers.BedwarsShopController:getShopComponent(u34.props.ShopID)
        local v45
        if v44 == nil then
            v45 = v44
        else
            v45 = v44.attributes.ShopOwner
        end
        if v45 ~= nil then
            local v46 = 0
            v41 = {}
            for v47, v48 in v41 do
                local _ = v47 - 1
                local v49
                if v48.onlyShowForOwner then
                    local v50
                    if v44 == nil then
                        v50 = v44
                    else
                        v50 = v44.attributes.ShopOwner
                    end
                    v49 = v50 == u9.LocalPlayer.UserId
                else
                    v49 = true
                end
                if v49 == true then
                    v46 = v46 + 1
                    v41[v46] = v48
                end
            end
        end
    end
    local function v56(p51) --[[ Line: 149 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u9
            [3] = u34
            [4] = u10
            [5] = u4
            [6] = u16
            [7] = u20
        --]]
        while true do
            local v52 = p51 and p51.nextTier and u13.getShopItem(p51.nextTier, u9.LocalPlayer, {
                ["shopId"] = u34.props.ShopID
            })
            if not v52 then
                break
            end
            local v53 = u10:getState().Bedwars.itemTiersPurchased
            local v54 = p51.itemType
            local v55 = table.find(v53, v54) ~= nil
            if p51.requireInInventoryToTierUp and (not u4.isHoarceKat() and (u16.getAmount(u9.LocalPlayer, p51.itemType) < 1 and not u20:ownsSuperiorItem(u9.LocalPlayer, p51))) or not v55 then
                break
            end
            p51 = v52
        end
        return p51
    end
    local v57 = 0
    local v58 = {}
    for v59, v60 in v41 do
        local v61 = v56(v60, v59 - 1, v41)
        if v61 ~= nil then
            v57 = v57 + 1
            v58[v57] = v61
        end
    end
    local v62 = table.create(#v58)
    local u63 = {}
    for v64, v65 in v58 do
        local _ = v64 - 1
        v62[v64] = v65.itemType
    end
    for _, v66 in v62 do
        u63[v66] = true
    end
    local u67 = {}
    local function v71(p68) --[[ Line: 205 ]]
        --[[
        Upvalues:
            [1] = u67
            [2] = u17
            [3] = u10
            [4] = u37
            [5] = u63
        --]]
        if u67[p68.itemType] ~= nil then
            return false
        end
        u67[p68.itemType] = true
        while p68.nextTier do
            if p68.itemType == u17.VOID_CHESTPLATE then
                local v69 = u10:getState().Bedwars.itemTiersPurchased
                local v70 = p68.itemType
                if table.find(v69, v70) == nil then
                    break
                end
            end
            p68 = u37[p68.nextTier]
            if not p68 then
                return true
            end
            if u63[p68.itemType] ~= nil then
                return false
            end
        end
        return true
    end
    local v72 = 0
    local u73 = {}
    for v74, v75 in v58 do
        if v71(v75, v74 - 1, v58) == true then
            v72 = v72 + 1
            u73[v72] = v75
        end
    end
    local v76 = {
        ["WaitForAbsoluteSize"] = true,
        ["AdditionalSpace"] = u4.isSmallScreen() and 10 or 20,
        ["ScrollingFrameProps"] = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["Size"] = u34.props.Size or UDim2.fromScale(1, 1),
            ["Position"] = u34.props.Position,
            ["BackgroundColor3"] = u21.backgroundPrimary
        }
    }
    local v77 = {
        ["ScrollingFramePadding"] = u8.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, u4.isSmallScreen() and 10 or 20),
            ["PaddingLeft"] = UDim.new(0.03, 0),
            ["PaddingRight"] = UDim.new(0.03, 0)
        }),
        ["ScrollingFrameListLayout"] = u8.createElement("UIListLayout", {
            ["VerticalAlignment"] = "Top",
            ["HorizontalAlignment"] = "Left",
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, u4.isSmallScreen() and 9 or 18)
        })
    }
    local v78 = #v77
    local v79 = u7.values(u15)
    local function v108(p80) --[[ Line: 272 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u73
            [3] = u34
            [4] = u15
            [5] = u36
            [6] = u4
            [7] = u17
            [8] = u6
            [9] = u11
            [10] = u8
            [11] = u22
        --]]
        local v81 = u14[p80]
        if v81.disabled or v81.unlockable then
            return nil
        end
        local v82 = 0
        local v83 = {}
        for v84, v85 in u73 do
            local _ = v84 - 1
            if v85.category == p80 == true then
                v82 = v82 + 1
                v83[v82] = v85
            end
        end
        local v86 = u34.props.QueueType
        if v86 then
            if p80 == u15.Recommended then
                if not u36 then
                    return nil
                end
                local v87
                if u4.isHoarceKat() then
                    v87 = { u17.LEATHER_CHESTPLATE, u17.STONE_SWORD }
                else
                    v87 = u6.Controllers.BedwarsShopController:getRecommendedItems()
                end
                local v88 = 0
                v83 = {}
                for v89, v90 in u73 do
                    local _ = v89 - 1
                    local v91
                    if v90.requiresKit then
                        v91 = true
                    else
                        local v92 = v90.itemType
                        v91 = table.find(v87, v92) ~= nil
                        if v91 then
                            v91 = v90.category ~= u15.Recommended
                        end
                    end
                    if v91 == true then
                        v88 = v88 + 1
                        v83[v88] = v90
                    end
                end
            end
            if not u4.isHoarceKat() then
                if p80 == u15.Random then
                    v83 = u6.Controllers.BedwarsShopController:getRandomlySelectedItemsAsShopItems()
                else
                    local v93 = 0
                    v83 = {}
                    for v94, v95 in v83 do
                        local _ = v94 - 1
                        local v96 = u6.Controllers.BedwarsShopController:getRandomlySelectedItems()
                        local v97 = v95.itemType
                        if table.find(v96, v97) == nil == true then
                            v93 = v93 + 1
                            v83[v93] = v95
                        end
                    end
                end
                if p80 ~= u15.Random then
                    local v98 = false
                    for v99, v100 in v83 do
                        local _ = v99 - 1
                        local v101 = v100.disabledInQueue
                        if v101 ~= nil then
                            v101 = table.find(v101, v86) ~= nil
                        end
                        local v102 = v100.disabled
                        local v103
                        if u4.isHoarceKat() then
                            v103 = nil
                        else
                            v103 = not v101
                            if v103 then
                                v103 = not v102
                            end
                        end
                        if v103 then
                            v98 = true
                            break
                        end
                    end
                    if not v98 then
                        return nil
                    end
                end
            end
            local v104 = u11(v86)
            if v104.rankCategory or v104.disableLimitedTimeItems then
                local v105 = false
                for v106, v107 in v83 do
                    local _ = v106 - 1
                    if not v107.limitedTimeItem then
                        v105 = true
                        break
                    end
                end
                if not v105 then
                    return nil
                end
            end
        end
        if #v83 == 0 then
            return u8.createFragment()
        else
            return u8.createElement(u22, {
                ["LayoutOrder"] = 1,
                ["Category"] = p80,
                ["ShopItems"] = v83,
                ["SelectedItem"] = u34.props.SelectedItem,
                ["SetSelectedShopItem"] = u34.props.SetSelectedShopItem,
                ["ShopID"] = u34.props.ShopID
            })
        end
    end
    local v109 = 0
    local v110 = {}
    for v111, v112 in v79 do
        local v113 = v108(v112, v111 - 1, v79)
        if v113 ~= nil then
            v109 = v109 + 1
            v110[v109] = v113
        end
    end
    local v114 = {
        ["AutomaticSize"] = "Y",
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(1, 0)
    }
    local v115 = { u8.createElement("UIListLayout", {
            ["VerticalAlignment"] = "Top",
            ["HorizontalAlignment"] = "Left",
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 18)
        }) }
    local v116 = #v115
    for v117, v118 in v110 do
        v115[v116 + v117] = v118
    end
    v77[v78 + 1] = u8.createElement(u5, v114, v115)
    v77[v78 + 2] = u8.createElement(u23, {
        ["LayoutOrder"] = 2,
        ["ShopItems"] = u73,
        ["SelectedItem"] = u34.props.SelectedItem,
        ["SetSelectedShopItem"] = u34.props.SetSelectedShopItem,
        ["ShopID"] = u34.props.ShopID,
        ["ObservedInventory"] = u34.props.ObservedInventory,
        ["IsHomeBase"] = u34.props.IsHomeBase,
        ["QueueType"] = u34.props.QueueType
    })
    return u8.createElement(u3, v76, v77)
end
return {
    ["ShopItemList"] = v24
}
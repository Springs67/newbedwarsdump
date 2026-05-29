local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-meta").BedwarsShopCategoryMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").items
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u17 = v1.import(script, script.Parent.Parent.Parent, "api", "purchase-item").shopPurchaseItem
local u18 = v1.import(script, script.Parent, "shop-item-card").BedwarsShopItemCard
local v89 = v9.new(u8)(function(u19, p20) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u5
        [3] = u15
        [4] = u8
        [5] = u16
        [6] = u4
        [7] = u6
        [8] = u3
        [9] = u14
        [10] = u7
        [11] = u17
        [12] = u12
        [13] = u11
        [14] = u18
    --]]
    local v21, u22 = p20.useState(Vector2.new(347, 261))
    local v23 = u13[u19.Category]
    local v24 = u5.isSmallScreen() and 8 or 14
    local u25 = true
    local v26 = v23.unlockable
    if v26 ~= nil then
        v26 = v26.purchaseReq
    end
    if v26 then
        v26 = not u5.isHoarceKat()
    end
    if v26 then
        local v27 = nil
        for v28, v29 in u19.ObservedInventory.inventory.items do
            local _ = v28 - 1
            local v30 = v29.itemType
            local v31 = v23.unlockable
            if v31 ~= nil then
                v31 = v31.purchaseReq
                if v31 ~= nil then
                    v31 = v31.currency
                end
            end
            if v30 == v31 == true then
                v27 = v29
                break
            end
        end
        if v27 ~= nil then
            v27 = v27.amount
        end
        local v32 = v27 == nil and 0 or v27
        local v33 = 0
        local v34 = v23.unlockable
        if v34 ~= nil then
            v34 = v34.purchaseReq
            if v34 ~= nil then
                v34 = v34.currency
            end
        end
        if v34 == u15.DIAMOND and u19.IsHomeBase then
            local v35 = u19.ObservedInventory.observedChest
            if v35 ~= nil then
                v35 = v35.items
                if v35 ~= nil then
                    v35 = nil
                    for v36, v37 in v35 do
                        local _ = v36 - 1
                        local v38
                        if v37 == "empty" then
                            v38 = false
                        else
                            local v39 = v37.itemType
                            local v40 = v23.unlockable
                            if v40 ~= nil then
                                v40 = v40.purchaseReq
                                if v40 ~= nil then
                                    v40 = v40.currency
                                end
                            end
                            v38 = v39 == v40
                        end
                        if v38 == true then
                            v35 = v37
                            break
                        end
                    end
                end
            end
            if v35 ~= nil then
                v35 = v35.amount
            end
            v33 = v35 == nil and 0 or v35
        end
        local v41 = v32 + v33
        local v42 = v23.unlockable
        if v42 ~= nil then
            v42 = v42.purchaseReq
            if v42 ~= nil then
                v42 = v42.price
            end
        end
        if v42 <= v41 then
            u25 = true
        else
            u25 = false
        end
    end
    local v43 = (u5.isSmallScreen() and 79 or 69) / 347
    local v44 = v21.X * v43
    local v45 = math.floor(v44)
    local v46 = v21.X * 0.01488095238095238
    local v47 = math.floor(v46)
    local u48
    if v23.unlockable then
        local v49 = u19.UnlockedShopCategories[u19.Category] ~= nil
        u48 = not v49
    else
        u48 = false
    end
    local v51 = {
        ["Size"] = u19.Size or UDim2.new(0.5, -0.02, 0, 0),
        ["AutomaticSize"] = "Y",
        ["LayoutOrder"] = u19.LayoutOrder,
        [u8.Change.AbsoluteSize] = function(p50) --[[ Line: 150 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            u22(p50.AbsoluteSize)
        end
    }
    local v52 = {
        ["TitleLayout"] = u8.createElement("UIListLayout", {
            ["VerticalAlignment"] = "Top",
            ["HorizontalAlignment"] = "Left",
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, u5.isSmallScreen() and 4 or 8)
        })
    }
    local v53 = #v52
    local v54 = {
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.new(1, 0, 0, u5.isSmallScreen() and 35 or 50),
        ["BackgroundColor3"] = u16.backgroundSecondary
    }
    local v55 = { u8.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 5)
        }), u8.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0.03, 0),
            ["PaddingRight"] = UDim.new(0.03, 0)
        }) }
    local v56 = #v55
    local v57 = {
        ["Size"] = UDim2.fromScale(0.57, 0.8),
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["Position"] = UDim2.fromScale(0, 0.5)
    }
    local v58 = { u8.createElement("UIListLayout", {
            ["VerticalAlignment"] = "Center",
            ["HorizontalAlignment"] = "Left",
            ["FillDirection"] = "Horizontal",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.07, 0)
        }) }
    local v59 = #v58
    local v60
    if v23.icon == nil then
        v60 = false
    else
        v60 = u8.createElement("ImageLabel", {
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.15, 1),
            ["Image"] = v23.icon
        }, { u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }) })
    end
    if v60 then
        v58[v59 + 1] = v60
    end
    local v61 = #v58
    local v62 = {
        ["Size"] = UDim2.fromScale(0.78, 1)
    }
    local v63 = { u8.createElement("UIListLayout", {
            ["VerticalAlignment"] = "Center",
            ["HorizontalAlignment"] = "Left",
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 0)
        }), u8.createElement("TextLabel", {
            ["TextXAlignment"] = "Left",
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.55),
            ["TextColor3"] = u4.WHITE,
            ["Text"] = v23.name,
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
        }, { u8.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = v24
            }) }) }
    local v64 = #v63
    local v65 = {
        ["TextXAlignment"] = "Left",
        ["Size"] = UDim2.fromScale(1, 0.45),
        ["TextColor3"] = u4.WHITE
    }
    local v66 = v23.unlockable
    if v66 ~= nil then
        v66 = v66.teamUnlock
    end
    v65.Text = v66 and "TEAM" or "PERSONAL"
    v65.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
    v65.TextScaled = true
    v65.TextTransparency = 0.5
    v65.BackgroundTransparency = 1
    v65.LayoutOrder = 2
    v63[v64 + 1] = u8.createElement("TextLabel", v65, { u8.createElement("UITextSizeConstraint", {
            ["MaxTextSize"] = v24 - 2
        }) })
    v58[v61 + 1] = u8.createElement(u6, v62, v63)
    v55[v56 + 1] = u8.createElement(u6, v57, v58)
    local v67
    if u48 then
        v67 = v23.unlockable
        if v67 ~= nil then
            v67 = v67.purchaseReq
        end
        if v67 then
            local v68 = u8.createElement
            local v69 = u3
            local v70 = {
                ["Size"] = UDim2.fromScale(0.38, 0.8),
                ["Position"] = UDim2.fromScale(1, 0.5),
                ["AnchorPoint"] = Vector2.new(1, 0.5)
            }
            local v71 = v23.unlockable.purchaseReq.price
            v70.Text = "<b>" .. tostring(v71) .. " " .. u14[v23.unlockable.purchaseReq.currency].displayName .. "</b>"
            v70.CornerRadius = UDim.new(0, 3)
            local v72
            if u25 then
                v72 = u16.backgroundSuccess
            else
                v72 = u16.backgroundError
            end
            v70.BackgroundColor3 = v72
            function v70.OnClick() --[[ Line: 272 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u7
                    [3] = u19
                --]]
                if not u25 then
                    return nil
                end
                u7.Controllers.BedwarsShopController:purchaseShopCategory(u19.Category)
            end
            v67 = v68(v69, v70)
        end
    else
        v67 = u48
    end
    if v67 then
        v55[v56 + 2] = v67
    end
    v52[v53 + 1] = u8.createElement("Frame", v54, v55)
    local v73 = u19.ShopItems
    local function v80(u74, p75) --[[ Line: 286 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u17
            [3] = u12
            [4] = u11
            [5] = u7
            [6] = u48
            [7] = u8
            [8] = u18
        --]]
        local v76 = {
            ["ShopItem"] = u74,
            ["LayoutOrder"] = p75
        }
        local v77 = u19.SelectedItem
        if v77 ~= nil then
            v77 = v77.itemType
        end
        v76.Selected = v77 == u74.itemType
        function v76.OnClick() --[[ Line: 296 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u74
            --]]
            u19.SetSelectedShopItem(u74)
        end
        function v76.OnRightClick() --[[ Line: 299 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u74
                [3] = u19
                [4] = u12
                [5] = u11
                [6] = u7
            --]]
            u17(u74, u19.ShopID):andThen(function(p78) --[[ Line: 301 ]]
                --[[
                Upvalues:
                    [1] = u74
                    [2] = u19
                    [3] = u12
                    [4] = u11
                    [5] = u7
                --]]
                if p78 then
                    if u74.nextTier then
                        u19.SetSelectedShopItem(u12.getShopItem(u74.nextTier, u11.LocalPlayer, {
                            ["shopId"] = u19.ShopID
                        }))
                    elseif u74.tiered then
                        u7.Controllers.BedwarsShopController.alreadyPurchasedMap[u74.itemType] = true
                    end
                    local v79
                    if u74.nextTier then
                        v79 = u12.getShopItem(u74.nextTier, u11.LocalPlayer)
                    else
                        v79 = u74
                    end
                    u19.SetSelectedShopItem(v79)
                else
                    u19.SetSelectedShopItem(u74)
                end
            end)
        end
        v76.Locked = u48
        return u8.createElement(u18, v76)
    end
    local v81 = table.create(#v73)
    for v82, v83 in v73 do
        v81[v82] = v80(v83, v82 - 1, v73)
    end
    local v84 = {
        ["AutomaticSize"] = "Y",
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.new(1, 0, 0, 0)
    }
    local v85 = { u8.createElement("UIGridLayout", {
            ["HorizontalAlignment"] = "Left",
            ["VerticalAlignment"] = "Top",
            ["SortOrder"] = "LayoutOrder",
            ["FillDirectionMaxCells"] = 4,
            ["CellSize"] = UDim2.fromOffset(v45, v45),
            ["CellPadding"] = UDim2.fromOffset(v47, v47)
        }) }
    local v86 = #v85
    for v87, v88 in v81 do
        v85[v86 + v87] = v88
    end
    v52[v53 + 2] = u8.createElement(u6, v84, v85)
    return u8.createElement(u6, v51, v52)
end)
return {
    ["ShopCategoryUnlockable"] = v10.connect(function(p90, p91) --[[ Line: 352 ]]
        local v92 = {}
        for v93, v94 in p91 do
            v92[v93] = v94
        end
        v92.UnlockedShopCategories = p90.Game.unlockedShopCategories
        return v92
    end)(v89)
}
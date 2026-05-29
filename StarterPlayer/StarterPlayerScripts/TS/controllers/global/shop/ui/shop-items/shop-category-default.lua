local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-meta").BedwarsShopCategoryMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "shop-category", "bedwars-shop-category-types").BedwarsShopCategory
local u13 = v1.import(script, script.Parent.Parent.Parent, "api", "purchase-item").shopPurchaseItem
local u14 = v1.import(script, script.Parent, "shop-item-card").BedwarsShopItemCard
return {
    ["ShopCategoryDefault"] = v8.new(u7)(function(u15, p16) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u4
            [3] = u12
            [4] = u7
            [5] = u3
            [6] = u13
            [7] = u10
            [8] = u9
            [9] = u6
            [10] = u14
            [11] = u5
        --]]
        local v17 = p16.useState
        local _ = p16.useEffect
        local v18, u19 = v17(Vector2.new(694, 523))
        local v20 = u11[u15.Category]
        local v21 = (u4.isSmallScreen() and 10 or 20) + 2
        local v22 = (u4.isSmallScreen() and 93 or 69) / 694
        local v23 = v18.X * v22
        local v24 = math.floor(v23) * (u15.Category == u12.Recommended and 1.1 or 1)
        local v25 = v18.X * 0.01488095238095238
        local v26 = math.floor(v25)
        local v28 = {
            ["Size"] = UDim2.fromScale(1, 0),
            ["AutomaticSize"] = "Y",
            [u7.Change.AbsoluteSize] = function(p27) --[[ Line: 29 ]]
                --[[
                Upvalues:
                    [1] = u19
                --]]
                u19(p27.AbsoluteSize)
            end
        }
        local v29 = v20.displayLayoutOrder
        v28.LayoutOrder = v29 == nil and 0 or v29
        local v30 = {
            ["TitleLayout"] = u7.createElement("UIListLayout", {
                ["VerticalAlignment"] = "Top",
                ["HorizontalAlignment"] = "Left",
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, u4.isSmallScreen() and 4 or 8)
            }),
            ["CategoryTitle"] = u7.createElement("TextLabel", {
                ["TextXAlignment"] = "Left",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0, v21),
                ["TextColor3"] = u3.WHITE,
                ["Text"] = v20.name,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
            }, { u7.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 22
                }) })
        }
        local v31 = #v30
        local v32 = u15.ShopItems
        local function v42(u33, p34) --[[ Line: 63 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u13
                [3] = u10
                [4] = u9
                [5] = u6
                [6] = u7
                [7] = u14
            --]]
            local v35 = {
                ["ShopItem"] = u33,
                ["LayoutOrder"] = p34
            }
            local v36 = u15.SelectedItem
            if v36 ~= nil then
                v36 = v36.itemType
            end
            v35.Selected = v36 == u33.itemType
            function v35.OnClick() --[[ Line: 73 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u33
                --]]
                u15.SetSelectedShopItem(u33)
            end
            function v35.OnRightClick() --[[ Line: 76 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u33
                    [3] = u15
                    [4] = u10
                    [5] = u9
                    [6] = u6
                --]]
                u13(u33, u15.ShopID):andThen(function(p37) --[[ Line: 78 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                        [2] = u10
                        [3] = u9
                        [4] = u15
                        [5] = u6
                    --]]
                    if not p37 then
                        u15.SetSelectedShopItem(u33)
                        return
                    end
                    if u33.nextTier then
                        local v38 = u10.getShopItem(u33.nextTier, u9.LocalPlayer, {
                            ["shopId"] = u15.ShopID
                        })
                        u15.SetSelectedShopItem(v38)
                    elseif u33.tiered then
                        u6.Controllers.BedwarsShopController.alreadyPurchasedMap[u33.itemType] = true
                    end
                    local v39
                    if u33.nextTier then
                        v39 = nil
                        for v40, v41 in u15.ShopItems do
                            local _ = v40 - 1
                            if v41.itemType == u33.nextTier == true then
                                v39 = v41
                                break
                            end
                        end
                    else
                        v39 = u33
                    end
                    u15.SetSelectedShopItem(v39)
                end)
            end
            return u7.createElement(u14, v35)
        end
        local v43 = table.create(#v32)
        for v44, v45 in v32 do
            v43[v44] = v42(v45, v44 - 1, v32)
        end
        local v46 = {
            ["AutomaticSize"] = "Y",
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0)
        }
        local v47 = { u7.createElement("UIGridLayout", {
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Top",
                ["SortOrder"] = "LayoutOrder",
                ["FillDirectionMaxCells"] = 8,
                ["CellSize"] = UDim2.new(0, v24, 0, v24),
                ["CellPadding"] = UDim2.fromOffset(v26, v26)
            }) }
        local v48 = #v47
        for v49, v50 in v43 do
            v47[v48 + v49] = v50
        end
        v30[v31 + 1] = u7.createElement(u5, v46, v47)
        local v51
        if u15.Category == u12.Recommended then
            v51 = u7.createFragment({
                ["ShopCategoryBorder"] = u7.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 0.3,
                    ["LayoutOrder"] = 9,
                    ["Size"] = UDim2.new(1, 0, 0, 1),
                    ["BackgroundColor3"] = u3.WHITE
                })
            })
        else
            v51 = false
        end
        if v51 then
            v30[v31 + 2] = v51
        end
        return u7.createElement(u5, v28, v30)
    end)
}
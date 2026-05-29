local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u10 = v1.import(script, script.Parent.Parent.Parent, "api", "purchase-item").shopPurchaseItem
local u11 = v1.import(script, script.Parent, "shop-item-card").BedwarsShopItemCard
return {
    ["ShopWeaponSelect"] = v8.new(u7)(function(u12, p13) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u7
            [3] = u3
            [4] = u10
            [5] = u6
            [6] = u9
            [7] = u11
            [8] = u5
        --]]
        local v14 = p13.useState
        local _ = p13.useEffect
        local v15, u16 = v14(Vector2.new(694, 523))
        local v17 = (u4.isSmallScreen() and 8 or 14) + 2
        local v18 = (u4.isSmallScreen() and 79 or 69) / 694
        local v19 = v15.X * v18
        local v20 = math.floor(v19)
        local v21 = v15.X * 0.01488095238095238
        local v22 = math.floor(v21)
        local u23 = u12.SelectedItem
        local v25 = {
            ["Size"] = UDim2.fromScale(1, 0),
            ["AutomaticSize"] = "Y",
            [u7.Change.AbsoluteSize] = function(p24) --[[ Line: 28 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                u16(p24.AbsoluteSize)
            end
        }
        local v26 = {
            ["TitleLayout"] = u7.createElement("UIListLayout", {
                ["VerticalAlignment"] = "Top",
                ["HorizontalAlignment"] = "Left",
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, u4.isSmallScreen() and 4 or 8)
            }),
            ["Weapon Select Section"] = u7.createElement("TextLabel", {
                ["TextXAlignment"] = "Left",
                ["Text"] = "<b>Base Weapons</b>",
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0, v17),
                ["TextColor3"] = u3.WHITE,
                ["TextSize"] = v17 - 2
            })
        }
        local v27 = #v26
        local v28 = u12.WeaponChoices
        local function v37(u29, p30) --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u23
                [3] = u10
                [4] = u6
                [5] = u9
                [6] = u7
                [7] = u11
            --]]
            local v31 = {
                ["ShopItem"] = u29,
                ["LayoutOrder"] = p30
            }
            local v32 = u12.SelectedItem
            if v32 ~= nil then
                v32 = v32.itemType
            end
            v31.Selected = v32 == u29.itemType
            function v31.OnClick() --[[ Line: 63 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u29
                    [3] = u23
                --]]
                u12.SetSelectedShopItem(u29)
                u23 = u29
            end
            function v31.OnRightClick() --[[ Line: 67 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u29
                    [3] = u12
                    [4] = u6
                    [5] = u23
                    [6] = u9
                --]]
                u10(u29, u12.ShopID):andThen(function(p33) --[[ Line: 69 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                        [2] = u6
                        [3] = u12
                        [4] = u23
                        [5] = u9
                    --]]
                    if p33 then
                        if u29.tiered then
                            u6.Controllers.BedwarsShopController.alreadyPurchasedMap[u29.itemType] = true
                        end
                        local v34
                        if u29.nextTier then
                            v34 = nil
                            for v35, v36 in u12.WeaponChoices do
                                local _ = v35 - 1
                                if v36.itemType == u29.nextTier == true then
                                    v34 = v36
                                    break
                                end
                            end
                        else
                            v34 = u29
                        end
                        u12.SetSelectedShopItem(v34)
                    else
                        u12.SetSelectedShopItem(u29)
                    end
                    u23 = u29
                    u9.LocalPlayer:SetAttribute("HasWeaponChosen", true)
                end)
            end
            return u7.createElement(u11, v31)
        end
        local v38 = table.create(#v28)
        for v39, v40 in v28 do
            v38[v39] = v37(v40, v39 - 1, v28)
        end
        local v41 = {
            ["AutomaticSize"] = "Y",
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0)
        }
        local v42 = { u7.createElement("UIGridLayout", {
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Top",
                ["SortOrder"] = "LayoutOrder",
                ["FillDirectionMaxCells"] = 8,
                ["CellSize"] = UDim2.new(0, v20, 0, v20),
                ["CellPadding"] = UDim2.fromOffset(v22, v22)
            }) }
        local v43 = #v42
        for v44, v45 in v38 do
            v42[v43 + v44] = v45
        end
        v26[v27 + 1] = u7.createElement(u5, v41, v42)
        return u7.createElement(u5, v25, v26)
    end)
}
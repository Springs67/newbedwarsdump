local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.UserInputService
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "inventory", "ui", "item-viewport").ItemViewport
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shop", "shop-tax-util").TaxTheme
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u18 = v1.import(script, script.Parent.Parent.Parent, "api", "purchase-item").shopPurchaseItem
local u19 = v1.import(script, script.Parent, "shop-disruption-price").ShopDisruptionPrice
local v20 = u8.Component:extend("BedwarsItemShopLeft")
function v20.init(p21, p22) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    p21.maid = u7.new()
    local v23 = {}
    local v24
    if p22.SelectedItem == nil then
        v24 = false
    else
        v24 = p21:hasAlreadyPurchased(p22.SelectedItem.itemType)
    end
    v23.alreadyPurchased = v24
    p21:setState(v23)
end
function v20.didUpdate(p25, p26, _) --[[ Line: 30 ]]
    if p26.SelectedItem ~= p25.props.SelectedItem then
        local v27 = {}
        local v28
        if p25.props.SelectedItem == nil then
            v28 = false
        else
            v28 = p25:hasAlreadyPurchased(p25.props.SelectedItem.itemType)
        end
        v27.alreadyPurchased = v28
        p25:setState(v27)
    end
end
function v20.didMount(u29) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    if u11.GamepadEnabled and not u11.MouseEnabled then
        u29.maid:GiveTask(u11.InputBegan:Connect(function(p30, _) --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            if p30.KeyCode == Enum.KeyCode.ButtonA then
                u29:purchase()
            end
        end))
    end
end
function v20.willUnmount(p31) --[[ Line: 46 ]]
    p31.maid:DoCleaning()
end
function v20.hasAlreadyPurchased(_, p32) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
    --]]
    if u5.isHoarceKat() then
        return false
    else
        return u6.Controllers.BedwarsShopController.alreadyPurchasedMap[p32] ~= nil
    end
end
function v20.purchase(u33) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u13
        [3] = u10
        [4] = u5
        [5] = u6
    --]]
    local u34 = u33.props.SelectedItem
    u18(u34, u33.props.ShopID):andThen(function(p35) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u33
            [3] = u13
            [4] = u10
            [5] = u5
            [6] = u6
        --]]
        if p35 then
            if u34.nextTier then
                u33.props.SetSelectedShopItem(u13.getShopItem(u34.nextTier, u10.LocalPlayer, {
                    ["shopId"] = u33.props.ShopID
                }))
                return
            end
            if u34.tiered then
                u33:setState({
                    ["alreadyPurchased"] = true
                })
                if not u5.isHoarceKat() then
                    u6.Controllers.BedwarsShopController.alreadyPurchasedMap[u34.itemType] = true
                end
            end
        end
    end)
end
function v20.render(u36) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u5
        [3] = u6
        [4] = u10
        [5] = u8
        [6] = u12
        [7] = u15
        [8] = u19
        [9] = u13
        [10] = u16
        [11] = u11
        [12] = u4
        [13] = u17
        [14] = u3
    --]]
    local v37
    if u36.props.SelectedItem then
        local v38 = u14(u36.props.SelectedItem.itemType).description
        v37 = (v38 == nil or #v38 == 0) and " " or v38
    else
        v37 = nil
    end
    local v39 = u36.props.SelectedItem
    if v39 ~= nil then
        v39 = v39.price
    end
    local v40 = v39 == 0 and "Free" or "Purchase"
    local v41 = u36.props.SelectedItem
    if v41 ~= nil then
        v41 = v41.sell
    end
    local v42 = v41 and "Sell" or v40
    local v43 = Color3.fromRGB(255, 255, 255)
    local v44
    if u36.props.SelectedItem then
        v43 = u14(u36.props.SelectedItem.currency).displayNameColor or v43
        if u5.isHoarceKat() then
            v44 = false
        else
            local v45 = u6.Controllers.ShopTaxController:getTaxedItems()
            local v46 = u36.props.SelectedItem.itemType
            v44 = table.find(v45, v46) ~= nil
        end
    else
        v44 = false
    end
    local v47 = u36.props.SelectedItem
    if v47 ~= nil then
        v47 = v47.priceMultiplier
    end
    local v48 = v47 == nil and 1 or v47
    if not v44 then
        if u5.isHoarceKat() then
            v44 = false
        else
            v44 = u10.LocalPlayer:GetAttribute("DisruptionPriceIncrease")
        end
        if v44 == 0 or (v44 ~= v44 or (v44 == "" or not v44)) then
            v44 = v48 < 1 and true or v48 > 1
        end
    end
    local v49
    if u36.props.SelectedItem and not u5.isHoarceKat() then
        v49 = u6.Controllers.BedwarsShopController:getDisabledStatus(u36.props.SelectedItem, u36.state.alreadyPurchased)
    else
        v49 = nil
    end
    local v50
    if v49 == nil then
        v50 = v49
    else
        v50 = v49.reason
    end
    local v51 = u36.props.SelectedItem ~= nil
    if v51 then
        local v52 = { u8.createElement(u12, {
                ["SizeConstraint"] = "RelativeYY",
                ["ShowCooldownBar"] = false,
                ["ItemType"] = u36.props.SelectedItem.itemType,
                ["Size"] = UDim2.fromScale(0.32, 0.32),
                ["Position"] = UDim2.fromScale(0.5, 0.073),
                ["AnchorPoint"] = Vector2.new(0.5, 0)
            }) }
        local v53 = #v52
        local v54 = {}
        local v55 = u36.props.SelectedItem.customDisplayName
        if v55 == nil then
            v55 = u15.getDisplayName(u36.props.SelectedItem.itemType)
        end
        v54.Text = v55
        v54.Size = UDim2.fromScale(0.9, 0.063)
        v54.Position = UDim2.fromScale(0.5, 0.42)
        v54.AnchorPoint = Vector2.new(0.5, 0)
        v54.BackgroundTransparency = 1
        v54.BorderSizePixel = 0
        v54.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        v54.TextScaled = true
        v54.TextColor3 = Color3.fromRGB(255, 255, 255)
        v52[v53 + 1] = u8.createElement("TextLabel", v54)
        local v56
        if u36.props.SelectedItem.amount > 1 then
            local v57 = u8.createElement
            local v58 = {
                ["BackgroundTransparency"] = 0.4,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true
            }
            local v59 = u36.props.SelectedItem.amount
            v58.Text = "x" .. tostring(v59)
            v58.Size = UDim2.fromScale(0.392, 0.063)
            v58.Position = UDim2.fromScale(0.5, 0.5)
            v58.AnchorPoint = Vector2.new(0.5, 0)
            v58.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            v58.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            v58.TextColor3 = Color3.fromRGB(255, 255, 255)
            v56 = v57("TextLabel", v58, { u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                }), u8.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.2),
                    ["PaddingBottom"] = UDim.new(0.2, 0)
                }) })
        else
            v56 = false
        end
        if v56 then
            v52[v53 + 2] = v56
        end
        local v60 = #v52
        if v37 ~= "" and v37 then
            if v37 == " " then
                v37 = false
            else
                v37 = u8.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 0.9,
                    ["BorderSizePixel"] = 0,
                    ["TextScaled"] = true,
                    ["Text"] = v37,
                    ["Size"] = UDim2.fromScale(0.85, 0.16),
                    ["Position"] = UDim2.fromScale(0.5, 0.59),
                    ["AnchorPoint"] = Vector2.new(0.5, 0),
                    ["BackgroundColor3"] = Color3.fromRGB(191, 192, 217),
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                }, { u8.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0.1, 0)
                    }), u8.createElement("UIPadding", {
                        ["PaddingTop"] = UDim.new(0.1),
                        ["PaddingBottom"] = UDim.new(0.1, 0),
                        ["PaddingLeft"] = UDim.new(0.1, 0),
                        ["PaddingRight"] = UDim.new(0.1, 0)
                    }) })
            end
        end
        if v37 then
            v52[v60 + 1] = v37
        end
        local v61 = #v52
        local v62 = u36.props.SelectedItem
        if v62 ~= nil then
            v62 = v62.price
        end
        local v63 = v62 ~= 0
        if v63 then
            local v64
            if v44 == 0 or (v44 ~= v44 or (v44 == "" or not v44)) then
                local v65 = {
                    ["Size"] = UDim2.fromScale(0.9, 0.06),
                    ["Position"] = UDim2.fromScale(0.5, 0.895),
                    ["AnchorPoint"] = Vector2.new(0.5, 1)
                }
                local v66 = u13.getShopItem(u36.props.SelectedItem.itemType, u10.LocalPlayer, {
                    ["shopId"] = u36.props.ShopID
                })
                if v66 ~= nil then
                    v66 = v66.price
                end
                if v66 == nil then
                    v66 = u36.props.SelectedItem.price
                end
                local v67 = u15
                local v68 = u13.getShopItem(u36.props.SelectedItem.itemType, u10.LocalPlayer, {
                    ["shopId"] = u36.props.ShopID
                })
                if v68 ~= nil then
                    v68 = v68.currency
                end
                if v68 == nil then
                    v68 = u36.props.SelectedItem.currency
                end
                v65.Text = tostring(v66) .. " " .. v67.getDisplayName(v68)
                v65.BackgroundTransparency = 1
                v65.BorderSizePixel = 0
                v65.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
                v65.TextScaled = true
                v65.TextColor3 = v43
                v64 = u8.createElement("TextLabel", v65)
            else
                v64 = u8.createElement(u19, {
                    ["SelectedItem"] = u36.props.SelectedItem,
                    ["ShopID"] = u36.props.ShopID
                })
            end
            local v69 = {
                [#v69 + 1] = v64
            }
            local v70 = #v69
            if v44 ~= 0 and (v44 == v44 and (v44 ~= "" and v44)) then
                v44 = u8.createFragment({
                    ["TaxWarningIconLeft"] = u8.createElement("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["BorderSizePixel"] = 0,
                        ["ImageTransparency"] = 0,
                        ["Image"] = u16.WarningImage,
                        ["Size"] = UDim2.fromScale(0.2, 0.055),
                        ["Position"] = UDim2.fromScale(0.75, 0.867),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["ScaleType"] = Enum.ScaleType.Fit
                    })
                })
            end
            if v44 then
                v69[v70 + 1] = v44
            end
            v63 = u8.createFragment(v69)
        end
        if v63 then
            v52[v61 + 1] = v63
        end
        local v71 = #v52
        local v72
        if v49 then
            v72 = u8.createElement(u3, {
                ["Selectable"] = false,
                ["Text"] = "<b>" .. tostring(v50) .. "</b>",
                ["Size"] = UDim2.fromScale(0.9, 0.08),
                ["Position"] = UDim2.fromScale(0.5, 0.98),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["BackgroundColor3"] = v49.buttonColor or u17.backgroundError,
                ["OnClick"] = function() --[[ Name: OnClick, Line 325 ]] end
            })
        else
            local v73 = {
                ["Text"] = "<b>" .. v42 .. (u11.GamepadEnabled and not u11.MouseEnabled and " (A)" or "") .. "</b>",
                ["Size"] = UDim2.fromScale(0.9, 0.08),
                ["Position"] = UDim2.fromScale(0.5, 0.98),
                ["AnchorPoint"] = Vector2.new(0.5, 1)
            }
            local v74 = u36.props.SelectedItem
            if v74 ~= nil then
                v74 = v74.price
            end
            local v75
            if v74 == 0 then
                v75 = u4.hexColor(15374848)
            else
                v75 = u17.backgroundSuccess
            end
            v73.BackgroundColor3 = v75
            v73.Selectable = false
            function v73.OnClick() --[[ Line: 313 ]]
                --[[
                Upvalues:
                    [1] = u36
                --]]
                u36:purchase()
            end
            v72 = u8.createElement(u3, v73)
        end
        v52[v71 + 1] = v72
        v51 = u8.createFragment(v52)
    end
    local v76 = {
        ["BorderSizePixel"] = 0,
        ["Size"] = u36.props.Size,
        ["Position"] = u36.props.Position,
        ["BackgroundColor3"] = u17.backgroundSecondary
    }
    local v77 = {}
    local v78 = #v77
    if v51 then
        v77[v78 + 1] = v51
    end
    return u8.createElement("Frame", v76, v77)
end
return {
    ["BedwarsItemShopLeft"] = v20
}
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.SoundManager
local u7 = v2.UIUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "inventory", "ui", "item-viewport").ItemViewport
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "merchant", "merchant-types")
local u15 = v14.discountColor
local u16 = v14.discountImage
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shop", "shop-item-lock-cause").ShopItemLockCause
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shop", "shop-tax-util").TaxTheme
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local v22 = u9.Component:extend("BedwarsShopItemCard")
function v22.init(p23) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    p23.ref = u9.createRef()
end
function v22.didMount(u24) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u6
        [3] = u19
        [4] = u7
    --]]
    local v25 = u10.GamepadEnabled and (not u10.MouseEnabled and u24.ref:getValue())
    if v25 then
        v25.SelectionGained:Connect(function() --[[ Line: 33 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u19
                [3] = u24
            --]]
            u6:playSound(u19.UI_CLICK)
            u24.props.OnClick()
        end)
        if u24.props.Selected then
            u7:selectGui(v25)
        end
    end
end
function v22.getMerchantKitDiscountedItems(_) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u21
        [3] = u8
    --]]
    return (u4.isHoarceKat() or not u21.isGameServer()) and {} or u8.Controllers.MerchantKitController.discountedItems
end
function v22.render(u26) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u16
        [3] = u4
        [4] = u8
        [5] = u18
        [6] = u15
        [7] = u12
        [8] = u17
        [9] = u9
        [10] = u3
        [11] = u6
        [12] = u19
        [13] = u11
        [14] = u5
        [15] = u13
    --]]
    local v27 = u20.textPrimary
    local v28 = nil
    for v29, v30 in u26:getMerchantKitDiscountedItems() do
        local _ = v29 - 1
        if v30.item.itemType == u26.props.ShopItem.itemType == true then
            v28 = v30
            break
        end
    end
    local v31
    if v28 == nil then
        v31 = v28
    else
        v31 = v28.tier
    end
    local v32
    if v31 == nil then
        v32 = nil
    else
        v32 = u16[v31]
    end
    local v33 = u26.props.ShopItem.priceMultiplier
    if v33 ~= nil then
        if v33 > 1 then
            v27 = Color3.fromRGB(212, 56, 56)
        elseif v33 < 1 then
            v27 = Color3.fromRGB(212, 175, 55)
        end
    end
    local v34 = u4.isHoarceKat() and {} or u8.Controllers.ShopTaxController:getTaxedItems()
    local v35 = u26.props.ShopItem.itemType
    local v36 = table.find(v34, v35) ~= nil
    if v36 then
        v27 = u18.Outline
    else
        local v37
        if v28 then
            v37 = v28.tier
        else
            v37 = v28
        end
        if v37 ~= 0 and (v37 == v37 and v37) then
            v27 = u15[v28.tier]
        end
    end
    local v38 = v28 and 2 or 1
    local v39
    if u4.isHoarceKat() then
        v39 = math.random() > 0.5 and {
            ["reason"] = "",
            ["buttonColor"] = Color3.fromRGB(255, 255, 255),
            ["disabledIcon"] = u12.LOCK_ART,
            ["lockCause"] = u17.LOCKED
        } or nil
    else
        v39 = nil
    end
    if u26.props.ShopItem and not u4.isHoarceKat() then
        v39 = u8.Controllers.BedwarsShopController:getDisabledStatus(u26.props.ShopItem)
    end
    local v40
    if v39 == nil then
        v40 = v39
    else
        v40 = v39.lockCause
    end
    if v40 then
        v36 = false
    end
    local v41
    if v39 == nil then
        v41 = v39
    else
        v41 = v39.disabledIcon
    end
    local v42, v43
    if v39 then
        v27 = Color3.fromRGB(217, 217, 217)
        v42 = 0.5
        v43 = 0.7
    else
        v42 = nil
        v43 = nil
    end
    local v44 = {
        [u9.Ref] = u26.ref,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v45
    if v36 then
        v45 = u18.Background
    else
        v45 = u3.BLACK
    end
    v44.BackgroundColor3 = v45
    local v46 = nil
    v44.BackgroundTransparency = v46 == nil and 0.6 or v46
    v44.LayoutOrder = u26.props.LayoutOrder
    v44[u9.Event.Activated] = function() --[[ Line: 152 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u6
            [3] = u19
        --]]
        if u26.props.Selected then
            u26.props.OnRightClick()
            return nil
        end
        u6:playSound(u19.UI_CLICK)
        u26.props.OnClick()
    end
    v44[u9.Event.MouseButton2Click] = function() --[[ Line: 160 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        if u26.props.Locked then
            return nil
        end
        u26.props.OnRightClick()
    end
    v44[u9.Event.MouseEnter] = function() --[[ Line: 166 ]] end
    v44[u9.Event.MouseLeave] = function() --[[ Line: 167 ]] end
    local v47 = {}
    local v48 = #v47
    local v49 = {
        ["Color"] = v27,
        ["Thickness"] = v38
    }
    local v50 = math
    local v51 = v42 == nil and 0 or v42
    local v52 = u26.props.Locked and 0.6 or 0
    v49.Transparency = v50.max(v51, v52)
    v47[v48 + 1] = u9.createElement("UIStroke", v49)
    local v53 = u26.props.ShopItem ~= nil
    if v53 then
        local v54 = {
            ["ItemType"] = u26.props.ShopItem.itemType
        }
        local v55 = math
        local v56 = v43 == nil and 0 or v43
        local v57 = u26.props.Locked and 0.6 or 0
        v54.ImageTransparency = v55.max(v56, v57)
        v54.Amount = 1
        v54.Size = UDim2.fromScale(0.8, 0.8)
        v54.Position = UDim2.fromScale(0.5, 0.5)
        v54.AnchorPoint = Vector2.new(0.5, 0.5)
        v54.IgnoreInitialPop = true
        v54.ShowCooldownBar = false
        v54.ZIndex = 2
        v53 = u9.createElement(u11, v54)
    end
    if v53 then
        v47[v48 + 2] = v53
    end
    local _ = #v47
    local v58 = {
        ["ZIndex"] = 2,
        ["Size"] = UDim2.fromScale(1, 0.35),
        ["Position"] = UDim2.fromScale(-0.08, 1.08),
        ["AnchorPoint"] = Vector2.new(0, 1)
    }
    local v59 = { u9.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal"
        }) }
    local v60 = #v59
    local v61
    if v41 == nil then
        v61 = false
    else
        v61 = u9.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(0.35, 1),
            ["Image"] = v41
        }, { u9.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
    end
    if v61 then
        v59[v60 + 1] = v61
    end
    local v62 = #v59
    local v63
    if u26.props.ShopItem == nil then
        v63 = false
    else
        v63 = u26.props.ShopItem.mechanicItem
    end
    if v63 then
        local v64 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.35, 1)
        }
        local v65 = u26.props.ShopItem.mechanicItemIconOverride
        v64.Image = v65 == nil and "rbxassetid://7121706441" or v65
        v64.BorderSizePixel = 0
        v64.ZIndex = 2
        v63 = u9.createElement("ImageLabel", v64, { u9.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 0.7517241379310344
            }) })
    end
    if v63 then
        v59[v62 + 1] = v63
    end
    local v66 = #v59
    local v67
    if u26.props.ShopItem == nil then
        v67 = false
    else
        v67 = u26.props.ShopItem.limitedTimeItem
    end
    if v67 then
        local v68 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.35, 1)
        }
        local v69 = u26.props.ShopItem.limitedTimeItemIconOverride
        v68.Image = v69 == nil and "rbxassetid://7121706441" or v69
        v68.BorderSizePixel = 0
        v68.ZIndex = 2
        v67 = u9.createElement("ImageLabel", v68, { u9.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 0.7517241379310344
            }) })
    end
    if v67 then
        v59[v66 + 1] = v67
    end
    local v70 = #v59
    if v28 then
        if v32 == nil then
            v28 = false
        else
            v28 = u9.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 2,
                ["Size"] = UDim2.fromScale(0.35, 1),
                ["Image"] = v32
            }, { u9.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 0.7517241379310344
                }) })
        end
    end
    if v28 then
        v59[v70 + 1] = v28
    end
    v47.ShopIcons = u9.createElement(u5, v58, v59)
    v47.BackgroundGradient = u9.createElement("Frame", {
        ["BorderSizePixel"] = 0,
        ["ZIndex"] = 1,
        ["Size"] = UDim2.fromScale(1, 1),
        ["BackgroundColor3"] = u3.WHITE
    }, { u9.createElement("UIGradient", {
            ["Rotation"] = -90,
            ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(23, 23, 23)), ColorSequenceKeypoint.new(1, Color3.fromRGB(23, 23, 23)) }),
            ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.45), NumberSequenceKeypoint.new(0.3, 1), NumberSequenceKeypoint.new(1, 1) })
        }) })
    local v71 = u9.createElement
    local v72 = u5
    local v73 = {
        ["ZIndex"] = 2,
        ["Size"] = UDim2.fromScale(0.925, 0.25),
        ["Position"] = UDim2.fromScale(0.5, 1),
        ["AnchorPoint"] = Vector2.new(0.5, 1)
    }
    local v74 = {}
    local v75 = u9.createElement("UIListLayout", {
        ["FillDirection"] = "Horizontal",
        ["HorizontalAlignment"] = "Right",
        ["Padding"] = UDim.new(0, 4)
    })
    local v76 = u9.createElement(u5, {
        ["SizeConstraint"] = "RelativeYY",
        ["ZIndex"] = 2,
        ["Size"] = UDim2.fromScale(1, 1)
    }, { u9.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["SizeConstraint"] = "RelativeYY",
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(1.5, 1.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.45),
            ["ImageTransparency"] = v43,
            ["Image"] = u13(u26.props.ShopItem.currency).image
        }) })
    local v77 = u9.createElement
    local v78 = {
        ["AutomaticSize"] = "X",
        ["TextScaled"] = true,
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 2,
        ["ZIndex"] = 2,
        ["Size"] = UDim2.fromScale(0, 0.9)
    }
    local v79 = u26.props.ShopItem.price
    v78.Text = tostring(v79)
    v78.TextColor3 = u3.WHITE
    v78.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
    v78.TextTransparency = v43
    __set_list(v74, 1, {v75, v76, v77("TextLabel", v78)})
    v47.Price = v71(v72, v73, v74)
    local v80 = u26.props.ShopItem
    if v80 ~= nil then
        v80 = v80.itemType
    end
    local v81 = v80 == nil and "" or v80
    return u9.createFragment({
        [v81 .. "_ShopItemCard"] = u9.createElement("ImageButton", v44, v47)
    })
end
return {
    ["BedwarsShopItemCard"] = v22
}
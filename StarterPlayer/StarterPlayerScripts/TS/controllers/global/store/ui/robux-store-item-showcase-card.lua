local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.SoundManager
local u7 = v2.UIUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.MarketplaceService
local u12 = v10.Players
local u13 = v10.TweenService
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "badge").Badge
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "base-purchase-button").BasePurchaseButton
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "gift-purchase-button").GiftPurchaseButton
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "gradient").Gradient
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "store-consts").RobuxProductType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ugc", "ugc-meta").UgcMeta
return {
    ["RobuxStoreItemShowcaseCard"] = v9.new(u8)(function(u23, p24) --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u21
            [3] = u11
            [4] = u12
            [5] = u19
            [6] = u22
            [7] = u13
            [8] = u6
            [9] = u20
            [10] = u4
            [11] = u7
            [12] = u14
            [13] = u18
            [14] = u3
            [15] = u17
            [16] = u16
            [17] = u15
            [18] = u5
        --]]
        local v25 = p24.useState
        local v26 = p24.useValue
        local v27 = p24.useEffect
        local u28 = u8.createRef()
        local u29, u30 = v25(false)
        local u31 = v26(u8.createRef())
        local u32 = u8.createRef()
        local v33 = u23.AspectRatio
        local v34 = v33 == nil and 0.8043478260869565 or v33
        local u35 = UDim2.fromScale(1.45, 1.45)
        local function v36() --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u21
                [3] = u11
                [4] = u12
                [5] = u19
            --]]
            if u23.Product.ProductType == u21.GamePass then
                u11:PromptGamePassPurchase(u12.LocalPlayer, u23.Product.ProductId)
                return
            elseif u23.Product.ProductType == u21.DevProduct then
                u11:PromptProductPurchase(u12.LocalPlayer, u23.Product.ProductId)
            elseif u23.Product.ProductType == u21.BedwarsUGC then
                u19.Client:Get("PurchaseUGCRequest"):SendToServer({
                    ["ugcType"] = u23.Product.UgcType
                })
            end
        end
        v27(function() --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u32
                [3] = u29
                [4] = u13
                [5] = u6
                [6] = u20
                [7] = u35
            --]]
            local v37 = u31.value:getValue()
            if v37 then
                local v38 = u32:getValue()
                if v38 then
                    if u29 then
                        u13:Create(v37, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                            ["ImageTransparency"] = 0.4,
                            ["Size"] = UDim2.fromScale(1.6, 1.6)
                        }):Play()
                        u13:Create(v38, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                            ["ImageTransparency"] = 0.2
                        }):Play()
                        u6:playSound(u20.UI_HOVER)
                    else
                        local v39 = {
                            ["ImageTransparency"] = 0,
                            ["Size"] = u35
                        }
                        u13:Create(v37, TweenInfo.new(0.3, Enum.EasingStyle.Quad), v39):Play()
                        u13:Create(v38, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                            ["ImageTransparency"] = 1
                        }):Play()
                    end
                else
                    return nil
                end
            else
                return nil
            end
        end, { u29 })
        v27(function() --[[ Line: 90 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u4
                [3] = u28
                [4] = u7
            --]]
            if u23.GamepadShouldAutoSelect and (u4.isGamepadControls() and not u4.isHoarceKat()) then
                u7:selectGui((u28:getValue()))
            end
        end, {})
        local v40 = {
            ["Size"] = u23.Size or UDim2.fromScale(1, 1)
        }
        local v41 = {}
        local v42 = #v41
        local v43 = u23.New
        if v43 then
            v43 = u8.createElement(u14, {
                ["Text"] = "NEW",
                ["Size"] = UDim2.fromScale(0.2, 0.2),
                ["FrameProps"] = {
                    ["Position"] = UDim2.fromScale(0, 0),
                    ["AnchorPoint"] = Vector2.new(0.4, 0.25)
                }
            })
        end
        if v43 then
            v41[v42 + 1] = v43
        end
        local v44 = #v41
        local v45 = u23.OnClick
        if v45 then
            v45 = u8.createFragment({
                ["PreviewIndicator"] = u8.createElement("ImageLabel", {
                    [u8.Ref] = u32,
                    ["Size"] = UDim2.fromScale(0.4, 0.4),
                    ["ScaleType"] = Enum.ScaleType.Fit,
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Image"] = u18.EYE_SOLID,
                    ["ImageColor3"] = u3.WHITE,
                    ["ImageTransparency"] = 1,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["ZIndex"] = 10
                })
            })
        end
        if v45 then
            v41[v44 + 1] = v45
        end
        local _ = #v41
        local v47 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
            ["BorderSizePixel"] = 0,
            ["ClipsDescendants"] = true,
            [u8.Event.Activated] = function() --[[ Line: 137 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                local v46 = u23.OnClick
                if v46 ~= nil then
                    v46()
                end
            end,
            [u8.Event.MouseEnter] = function() --[[ Line: 143 ]]
                --[[
                Upvalues:
                    [1] = u30
                --]]
                u30(true)
            end,
            [u8.Event.MouseLeave] = function() --[[ Line: 146 ]]
                --[[
                Upvalues:
                    [1] = u30
                --]]
                u30(false)
            end,
            ["Selectable"] = false
        }
        local v48 = { u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = v34
            }), u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }), (u8.createElement(u17, {
                ["Rotation"] = 90,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 33, 33)), ColorSequenceKeypoint.new(1, Color3.fromRGB(41, 44, 59)) })
            })) }
        local v49 = u8.createElement
        local v50 = "Frame"
        local v51 = {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        }
        local v52 = {}
        local v53 = u8.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        })
        local v54 = u8.createElement
        local v55 = u17
        local v56 = {
            ["Rotation"] = 90
        }
        local v57 = ColorSequence.new
        local v58 = {}
        local v59 = ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 33, 33))
        local v60 = ColorSequenceKeypoint.new
        local v61 = 1
        local v62
        if u23.IsOwned then
            v62 = Color3.fromRGB(33, 33, 33)
        else
            v62 = Color3.fromRGB(176, 160, 84)
        end
        __set_list(v58, 1, {v59, v60(v61, v62)})
        v56.Color = v57(v58)
        v56.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, u23.IsOwned and 0.75 or 1), NumberSequenceKeypoint.new(0.6, u23.IsOwned and 0.75 or 1), NumberSequenceKeypoint.new(1, 0.75) })
        __set_list(v52, 1, {v53, v54(v55, v56)})
        v48.BottomGlow = v49(v50, v51, v52)
        local v63 = #v48
        local v64
        if u23.Title == nil then
            v64 = false
        else
            v64 = u8.createFragment({
                ["Title"] = u8.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextXAlignment"] = "Center",
                    ["TextScaled"] = true,
                    ["LayoutOrder"] = 1,
                    ["ZIndex"] = 2,
                    ["Size"] = UDim2.fromScale(0.88, 0.18),
                    ["Position"] = UDim2.fromScale(0.5, 0.05),
                    ["AnchorPoint"] = Vector2.new(0.5, 0),
                    ["Text"] = u23.Title,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }, {
                    ["UIGradientTest"] = u8.createElement(u17, {
                        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 231, 159)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 200, 63)) })
                    }),
                    u8.createElement("UIStroke", {
                        ["Transparency"] = 0.2,
                        ["Color"] = Color3.fromRGB(25, 25, 25)
                    })
                })
            })
        end
        if v64 then
            v48[v63 + 1] = v64
        end
        local v65 = #v48
        local v66 = {
            ["Image"] = u23.Image,
            ["Size"] = u35,
            ["Position"] = UDim2.fromScale(0.5, 0.58),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["ScaleType"] = Enum.ScaleType.Fit,
            ["BackgroundTransparency"] = 1,
            [u8.Ref] = u31.value
        }
        local v67 = u23.ProductImageProps
        if v67 then
            for v68, v69 in v67 do
                v66[v68] = v69
            end
        end
        v66.ZIndex = 1
        v48.ProductImage = u8.createElement("ImageLabel", v66)
        local v70 = not u23.DisablePurchase
        if v70 then
            local v71 = {
                ["LayoutOrder"] = 10,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(0.85, u23.IsOwned and 0.145 or 0.18),
                ["Position"] = UDim2.fromScale(0.5, u23.IsOwned and 0.95 or 0.98),
                ["AnchorPoint"] = Vector2.new(0.5, 1)
            }
            local v72 = { u8.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["HorizontalAlignment"] = "Right",
                    ["VerticalAlignment"] = "Bottom",
                    ["SortOrder"] = "LayoutOrder",
                    ["VerticalFlex"] = "Fill",
                    ["HorizontalFlex"] = "Fill",
                    ["Padding"] = UDim.new(0, v34 / 2.5 * 16)
                }) }
            local v73 = #v72
            local v74 = u23.Product.ProductType ~= u21.BedwarsUGC and u23.Product.GiftType
            if v74 then
                local v75 = u8.createElement
                local v76 = u16
                local v77 = {
                    ["ZIndex"] = 3,
                    ["GiftType"] = u23.Product.GiftType
                }
                local v78
                if u23.IsOwned then
                    v78 = u23.GamepadShouldAutoSelect
                else
                    v78 = false
                end
                v77.GamepadShouldAutoSelect = v78
                v74 = v75(v76, v77)
            end
            if v74 then
                v72[v73 + 1] = v74
            end
            local v79 = #v72
            local v80
            if u23.IsOwned then
                v80 = u8.createElement("TextLabel", {
                    ["Text"] = "OWNED",
                    ["TextXAlignment"] = "Center",
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["ZIndex"] = 3,
                    ["Size"] = UDim2.fromScale(0.3, 0.3),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                })
            else
                local v81 = {
                    ["Size"] = UDim2.fromScale(0.6, 1)
                }
                local v82
                if u23.Product.ProductType == u21.GamePass or u23.Product.ProductType == u21.DevProduct then
                    v82 = u23.Product.Price
                elseif u23.Product.ProductType == u21.BedwarsUGC then
                    v82 = u23.Product.Price
                    if v82 == nil then
                        v82 = u22[u23.Product.UgcType].basePrice
                    end
                else
                    v82 = 0
                end
                v81.Price = v82
                v81.OnClick = v36
                local v83
                if u23.Discount then
                    v83 = {}
                    local v84 = u23.Discount
                    if v84 ~= nil then
                        v84 = v84.OriginalPrice
                    end
                    v83.OriginalPrice = v84
                else
                    v83 = nil
                end
                v81.Discount = v83
                v81.GamepadShouldAutoSelect = u23.GamepadShouldAutoSelect
                v81.ZIndex = 3
                v80 = u8.createElement(u15, v81)
            end
            v72[v79 + 1] = v80
            v70 = u8.createFragment({
                ["PurchaseButtons"] = u8.createElement(u5, v71, v72)
            })
        end
        if v70 then
            v48[v65 + 1] = v70
        end
        v41.Card = u8.createElement("ImageButton", v47, v48)
        return u8.createFragment({
            ["RobuxStoreItemCard"] = u8.createElement(u5, v40, v41)
        })
    end)
}
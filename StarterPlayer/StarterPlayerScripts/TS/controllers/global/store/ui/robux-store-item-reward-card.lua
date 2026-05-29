local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local u4 = v2.SoundManager
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.TweenService
local u10 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "base-purchase-button").BasePurchaseButton
local u11 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "bedcoin-purchase-button").BedcoinPurchaseButton
local u12 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "gift-purchase-button").GiftPurchaseButton
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "gradient").Gradient
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "reward-tile").RewardTile
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "store-consts")
local u18 = v17.RobuxProductType
local u19 = v17.StoreCurrency
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "marketplace-util").MarketplaceUtil
return {
    ["RobuxStoreItemRewardCard"] = v6.new(u5)(function(u21, p22) --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u9
            [3] = u4
            [4] = u16
            [5] = u18
            [6] = u20
            [7] = u1
            [8] = u15
            [9] = u8
            [10] = u13
            [11] = u14
            [12] = u12
            [13] = u19
            [14] = u10
            [15] = u11
            [16] = u3
        --]]
        local v23 = p22.useState
        local v24 = p22.useValue
        local v25 = p22.useEffect
        local v26, u27 = v23(0)
        local u28, u29 = v23(false)
        local v30, u31 = v23(false)
        local u32 = v24(u5.createRef())
        local v33 = u21.AspectRatio
        local v34 = v33 == nil and 0.8043478260869565 or v33
        local u35 = UDim2.fromScale(1.45, 1.45)
        v25(function() --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u28
                [3] = u9
                [4] = u4
                [5] = u16
                [6] = u35
            --]]
            local v36 = u32.value:getValue()
            if v36 then
                if u28 then
                    u9:Create(v36, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                        ["Size"] = UDim2.fromScale(1.6, 1.6)
                    }):Play()
                    u4:playSound(u16.UI_HOVER)
                else
                    local v37 = {
                        ["Size"] = u35
                    }
                    u9:Create(v36, TweenInfo.new(0.3, Enum.EasingStyle.Quad), v37):Play()
                end
            else
                return nil
            end
        end, { u28 })
        v25(function() --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u31
            --]]
            local v38 = u21.IsOwned
            if v38 == nil then
                v38 = false
            end
            u31(v38)
            return function() --[[ Line: 59 ]] end
        end, { u21.IsOwned })
        v25(function() --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u18
                [3] = u20
                [4] = u27
                [5] = u1
                [6] = u15
                [7] = u8
                [8] = u31
            --]]
            local v39 = u21.RobuxProduct
            if v39 ~= nil then
                v39 = v39.ProductType
            end
            if v39 == u18.DevProduct then
                u20.getDevProductInfoAsync(u21.RobuxProduct.ProductId):andThen(function(p40) --[[ Line: 69 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                    --]]
                    local v41
                    if p40 == nil then
                        v41 = p40
                    else
                        v41 = p40.PriceInRobux
                    end
                    if v41 ~= 0 and (v41 == v41 and v41) then
                        u27(p40.PriceInRobux)
                    end
                end)
            else
                local v42 = u21.RobuxProduct
                if v42 ~= nil then
                    v42 = v42.ProductType
                end
                if v42 == u18.GamePass then
                    u20.getGamePassProductInfoAsync(u21.RobuxProduct.ProductId):andThen(function(p43) --[[ Line: 86 ]]
                        --[[
                        Upvalues:
                            [1] = u27
                        --]]
                        local v44
                        if p43 == nil then
                            v44 = p43
                        else
                            v44 = p43.PriceInRobux
                        end
                        if v44 ~= 0 and (v44 == v44 and v44) then
                            u27(p43.PriceInRobux)
                        end
                    end)
                end
            end
            local u49 = u1.Promise.new(function(p45, p46) --[[ Line: 98 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u15
                    [3] = u8
                --]]
                if u21.IsOwned then
                    p46()
                    return nil
                end
                p45((u15.playerOwnsReward(u8.LocalPlayer, u21.Reward)))
            end):andThen(function(p47) --[[ Line: 106 ]]
                --[[
                Upvalues:
                    [1] = u31
                --]]
                u31(p47)
            end):catch(function(p48) --[[ Line: 109 ]]
                print(p48)
            end)
            return function() --[[ Line: 112 ]]
                --[[
                Upvalues:
                    [1] = u49
                --]]
                u49:cancel()
            end
        end, { u21.Reward })
        local v50 = {
            ["Size"] = u21.Size or UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
            ["BorderSizePixel"] = 0,
            ["ClipsDescendants"] = true,
            [u5.Event.MouseEnter] = function() --[[ Line: 121 ]]
                --[[
                Upvalues:
                    [1] = u29
                --]]
                u29(true)
            end,
            [u5.Event.MouseLeave] = function() --[[ Line: 124 ]]
                --[[
                Upvalues:
                    [1] = u29
                --]]
                u29(false)
            end,
            ["LayoutOrder"] = u21.LayoutOrder,
            ["Selectable"] = false
        }
        local v51 = {}
        local v52 = u5.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = v34
        })
        local v53 = u5.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        })
        local v54 = u5.createElement
        local v55 = u13
        local v56 = {
            ["Rotation"] = 90
        }
        local v57 = ColorSequence.new
        local v58 = {}
        local v59 = ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 33, 33))
        local v60 = ColorSequenceKeypoint.new
        local v61 = 1
        local v62
        if u21.Highlight then
            v62 = u15.getRewardColors(u21.Reward).borderColor
        else
            v62 = Color3.fromRGB(41, 44, 59)
        end
        __set_list(v58, 1, {v59, v60(v61, v62)})
        v56.Color = v57(v58)
        __set_list(v51, 1, {v52, v53, (v54(v55, v56))})
        local v63 = u5.createElement
        local v64 = "Frame"
        local v65 = {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        }
        local v66 = {}
        local v67 = u5.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        })
        local v68 = u5.createElement
        local v69 = u13
        local v70 = {
            ["Rotation"] = 90
        }
        local v71 = ColorSequence.new
        local v72 = {}
        local v73 = ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 33, 33))
        local v74 = ColorSequenceKeypoint.new
        local v75 = 1
        local v76
        if v30 then
            v76 = Color3.fromRGB(33, 33, 33)
        else
            v76 = u15.getRewardColors(u21.Reward).backgroundColor
        end
        __set_list(v72, 1, {v73, v74(v75, v76)})
        v70.Color = v71(v72)
        v70.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, v30 and 0.75 or 1), NumberSequenceKeypoint.new(0.6, v30 and 0.75 or 1), NumberSequenceKeypoint.new(1, 0.75) })
        __set_list(v66, 1, {v67, v68(v69, v70)})
        v51.BottomGlow = v63(v64, v65, v66)
        local v77 = #v51
        local v78
        if u21.Reward == nil then
            v78 = false
        else
            v78 = u5.createFragment({
                ["RewardType"] = u5.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextXAlignment"] = "Right",
                    ["TextScaled"] = true,
                    ["LayoutOrder"] = 1,
                    ["TextTransparency"] = 0.3,
                    ["ZIndex"] = 2,
                    ["Size"] = UDim2.fromScale(0.88, 0.085),
                    ["Position"] = UDim2.fromScale(0.5, 0.05),
                    ["AnchorPoint"] = Vector2.new(0.5, 0),
                    ["Text"] = u15.getRewardType(u21.Reward),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }, { u5.createElement("UIStroke", {
                        ["Transparency"] = 0.2,
                        ["Color"] = Color3.fromRGB(25, 25, 25)
                    }) })
            })
        end
        if v78 then
            v51[v77 + 1] = v78
        end
        v51[#v51 + 1] = u5.createElement(u14, {
            ["ZIndex"] = 3,
            ["Reward"] = u21.Reward,
            ["ImageButtonProps"] = {
                ["Size"] = UDim2.new(0.85, 0, 0.45, 0),
                ["Position"] = UDim2.fromScale(0.5, 0.44),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }
        })
        local v79 = {
            ["LayoutOrder"] = 10,
            ["ZIndex"] = 3,
            ["Size"] = UDim2.fromScale(0.85, v30 and 0.145 or 0.18)
        }
        local v80 = UDim2.fromScale
        local v81 = 0.5
        local v82 = 0.94
        v79.Position = v80(v81, v82)
        v79.AnchorPoint = Vector2.new(0.5, 1)
        local v83 = {}
        local v84 = #v83
        local v85 = {
            ["FillDirection"] = "Horizontal",
            ["SortOrder"] = "LayoutOrder",
            ["VerticalFlex"] = "Fill"
        }
        local v86 = u21.RobuxProduct
        if v86 ~= nil then
            v86 = v86.GiftType
        end
        v85.HorizontalFlex = v86 and "Fill" or "SpaceEvenly"
        v85.Padding = UDim.new(0, v34 / 2.5 * 16)
        v83[v84 + 1] = u5.createElement("UIListLayout", v85)
        local v87 = u21.RobuxProduct
        if v87 ~= nil then
            v87 = v87.GiftType
        end
        if v87 then
            v87 = u5.createElement(u12, {
                ["ZIndex"] = 3,
                ["GiftType"] = u21.RobuxProduct.GiftType,
                ["GamepadShouldAutoSelect"] = u21.GamepadShouldAutoSelect and v30
            })
        end
        if v87 then
            v83[v84 + 2] = v87
        end
        local v88 = #v83
        local v89
        if v30 then
            v89 = u5.createElement("TextLabel", {
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
            v89 = v30
        end
        if v89 then
            v83[v88 + 1] = v89
        end
        local v90 = #v83
        local v91 = not v30
        if v91 then
            v91 = u21.RobuxProduct or u21.IsFree
        end
        if v91 then
            local v92 = {}
            local v93 = UDim2
            local v94 = u21.RobuxProduct
            if v94 ~= nil then
                v94 = v94.GiftType
            end
            v92.Size = v93.fromScale(v94 and 0.6 or 1, 1)
            v92.Price = u21.IsFree and -1 or v26
            function v92.OnClick() --[[ Line: 254 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u19
                --]]
                u21.OnAttemptPuchase(u19.Robux)
            end
            local v95
            if u21.Discount then
                v95 = {}
                local v96 = u21.Discount
                if v96 ~= nil then
                    v96 = v96.OriginalPrice
                end
                v95.OriginalPrice = v96
            else
                v95 = nil
            end
            v92.Discount = v95
            v92.Effects = {
                ["Shine"] = u21.IsFree
            }
            v92.ZIndex = 3
            local v97 = u21.BedcoinProductId
            v92.AspectRatio = (v97 == 0 or (v97 ~= v97 or not v97)) and 3.1666666666666665 or 2.8333333333333335
            v92.GamepadShouldAutoSelect = u21.GamepadShouldAutoSelect
            v91 = u5.createElement(u10, v92)
        end
        if v91 then
            v83[v90 + 1] = v91
        end
        local v98 = #v83
        local v99 = not v30
        if v99 then
            v99 = u21.BedcoinProductId ~= nil
        end
        if v99 then
            local v100 = {
                ["BedcoinProductId"] = u21.BedcoinProductId
            }
            local v101 = {
                ["ZIndex"] = 3,
                ["OnClick"] = function() --[[ Name: OnClick, Line 290 ]]
                    --[[
                    Upvalues:
                        [1] = u21
                        [2] = u19
                    --]]
                    u21.OnAttemptPuchase(u19.BedCoin)
                end,
                ["Size"] = UDim2.fromScale(u21.RobuxProduct and 0.45 or 0.6, 1)
            }
            local v102 = u21.RobuxProduct
            if v102 ~= nil then
                v102 = v102.ProductId
            end
            v101.AspectRatio = (v102 == 0 or (v102 ~= v102 or not v102)) and 3.1666666666666665 or 2.8333333333333335
            v100.PurchaseButtonProps = v101
            local v103 = u21.GamepadShouldAutoSelect
            if v103 then
                local v104 = u21.RobuxProduct
                if v104 ~= nil then
                    v104 = v104.ProductId
                end
                v103 = v104 == nil
            end
            v100.GamepadShouldAutoSelect = v103
            v99 = u5.createElement(u11, v100)
        end
        if v99 then
            v83[v98 + 1] = v99
        end
        v51.PurchaseButtons = u5.createElement(u3, v79, v83)
        return u5.createFragment({
            ["Card"] = u5.createElement("ImageButton", v50, v51)
        })
    end)
}
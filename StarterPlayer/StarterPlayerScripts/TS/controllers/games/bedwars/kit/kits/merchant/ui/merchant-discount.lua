local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "merchant", "merchant-types")
local u7 = v6.discountColor
local u8 = v6.discountImage
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["MerchantDiscount"] = v4.new(u3)(function(p10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u2
            [4] = u9
            [5] = u7
            [6] = u8
        --]]
        local _ = p11.useState
        local v12 = p11.useEffect
        local u13 = u3.createRef()
        v12(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u5
            --]]
            local u14 = u13:getValue()
            local v22 = (function() --[[ Line: 17 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u5
                --]]
                if u14 then
                    local u15 = TweenInfo.new(0.3, Enum.EasingStyle.Exponential)
                    local v16 = u5:Create(u14, u15, {
                        ["Position"] = UDim2.fromScale(0, 0)
                    })
                    local v17 = u14:GetDescendants()
                    local function v19(p18) --[[ Line: 26 ]]
                        --[[
                        Upvalues:
                            [1] = u5
                            [2] = u15
                        --]]
                        if p18:IsA("TextLabel") then
                            u5:Create(p18, u15, {
                                ["TextTransparency"] = 0
                            }):Play()
                            return
                        elseif p18:IsA("ImageLabel") then
                            u5:Create(p18, u15, {
                                ["ImageTransparency"] = 0
                            }):Play()
                        elseif p18:IsA("UIStroke") then
                            u5:Create(p18, u15, {
                                ["Transparency"] = 0
                            }):Play()
                        end
                    end
                    for v20, v21 in v17 do
                        v19(v21, v20 - 1, v17)
                    end
                    return v16
                end
            end)()
            if v22 ~= nil then
                v22:Play()
            end
            return function() --[[ Line: 51 ]] end
        end, {})
        local v23 = u3.createFragment
        local v24 = {}
        local v25 = u3.createElement
        local v26 = u2
        local v27 = {
            ["ZIndex"] = 100,
            ["Size"] = UDim2.fromOffset(225, 40),
            ["Position"] = UDim2.fromScale(0.025, 0)
        }
        local v28 = {}
        local v29 = u3.createElement
        local v30 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(-1, 0),
            ["ZIndex"] = 100,
            ["BackgroundColor3"] = u9.backgroundPrimary,
            ["BorderSizePixel"] = 3,
            ["BorderColor3"] = u7[p10.item.tier],
            [u3.Ref] = u13
        }
        local v31 = {}
        local v32 = u3.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 102,
            ["Image"] = u8[p10.item.tier],
            ["Size"] = UDim2.fromOffset(32, 32),
            ["Position"] = UDim2.fromScale(0.075, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        })
        local v33 = u3.createElement
        local v34 = {
            ["TextSize"] = 22,
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 101,
            ["Font"] = Enum.Font.Roboto
        }
        local v35 = p10.refund
        v34.Text = tostring(v35) .. " " .. p10.item.item.currency .. " refunded"
        v34.TextColor3 = Color3.fromRGB(255, 255, 255)
        v34.Position = UDim2.fromScale(0.5, 0.5)
        v34.AnchorPoint = Vector2.new(0.5, 0.5)
        __set_list(v31, 1, {v32, v33("TextLabel", v34)})
        v28.DiscountElement = v29("Frame", v30, v31)
        v24.DiscountElementWrapper = v25(v26, v27, v28)
        return v23(v24)
    end)
}
local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.SlideIn
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u11 = u1.import(script, script.Parent.Parent.Parent.Parent, "game", "enchant-table", "ui", "enchant-table-right", "enchant-rune-wheel").EnchantRuneWheel
return {
    ["RewardPopUp"] = v9.new(u8)(function(p12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u1
            [3] = u10
            [4] = u4
            [5] = u7
            [6] = u6
            [7] = u5
            [8] = u11
            [9] = u3
        --]]
        local v14 = p13.useEffect
        local u15 = u8.createRef()
        local u16 = p12.image
        local v17 = Color3.fromRGB(255, 255, 255)
        local v18 = p12.tier
        if v18 == 0 then
            v17 = Color3.fromRGB(255, 255, 255)
        elseif v18 == 1 then
            v17 = Color3.fromRGB(71, 255, 0)
        elseif v18 == 2 then
            v17 = Color3.fromRGB(0, 110, 255)
        elseif v18 == 3 then
            v17 = Color3.fromRGB(255, 82, 0)
        end
        v14(function() --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u1
                [3] = u10
                [4] = u4
                [5] = u7
            --]]
            local u19 = u15:getValue()
            local u20 = nil
            local u21 = true
            if u19 then
                u1.Promise.delay(1):andThen(function() --[[ Line: 43 ]]
                    --[[
                    Upvalues:
                        [1] = u21
                        [2] = u10
                        [3] = u19
                        [4] = u20
                        [5] = u4
                        [6] = u7
                    --]]
                    if not u21 then
                        return nil
                    end
                    local v22 = u10:Create(u19, TweenInfo.new(0.35), {
                        ["Position"] = UDim2.fromScale(0.5, -0.2)
                    })
                    v22:Play()
                    u20 = v22.Completed:Connect(function() --[[ Line: 51 ]]
                        --[[
                        Upvalues:
                            [1] = u4
                            [2] = u7
                        --]]
                        if not u4.isHoarceKat() then
                            u7.Controllers.MysteriousBoxController:unmountItemPopup()
                        end
                    end)
                end)
            end
            return function() --[[ Line: 59 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u20
                --]]
                u21 = false
                if u20 then
                    u20:Disconnect()
                end
            end
        end, {})
        local function v23() --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u16
            --]]
            return u8.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 2,
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = u16
            })
        end
        return u8.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u8.createElement(u6, {}, { u8.createElement(u5, {
                    ["Position"] = UDim2.fromScale(0.5, 0.2),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.25, 0.25),
                    [u8.Ref] = u15
                }, {
                    u8.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }),
                    u8.createElement(u11, {
                        ["RuneTransparency"] = 0,
                        ["Color"] = v17,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5)
                    }),
                    v23(),
                    u8.createElement("Frame", {
                        ["AutomaticSize"] = "X",
                        ["BackgroundTransparency"] = 0.3,
                        ["ZIndex"] = 3,
                        ["Size"] = UDim2.fromScale(0.75, 0.18),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.85),
                        ["BackgroundColor3"] = u3.BLACK
                    }, { u8.createElement("UIPadding", {
                            ["PaddingLeft"] = UDim.new(0.005, 0),
                            ["PaddingRight"] = UDim.new(0.005, 0)
                        }), u8.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(0, 6)
                        }), u8.createElement("TextLabel", {
                            ["TextScaled"] = true,
                            ["RichText"] = true,
                            ["TextXAlignment"] = "Center",
                            ["TextYAlignment"] = "Center",
                            ["BackgroundTransparency"] = 1,
                            ["ZIndex"] = 4,
                            ["Size"] = UDim2.fromScale(1, 0.65),
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                            ["Position"] = UDim2.fromScale(0.5, 0.5),
                            ["Text"] = "<b>" .. p12.name .. "</b>",
                            ["TextColor3"] = u3.WHITE
                        }, { u8.createElement("UITextSizeConstraint", {
                                ["MaxTextSize"] = 16
                            }) }) })
                }) }) })
    end)
}
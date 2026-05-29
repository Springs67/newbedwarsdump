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
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
return {
    ["ItemPopUp"] = v9.new(u8)(function(p13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u12
            [3] = u1
            [4] = u10
            [5] = u4
            [6] = u7
            [7] = u6
            [8] = u5
            [9] = u11
            [10] = u3
        --]]
        local v15 = p14.useEffect
        local u16 = u8.createRef()
        local v17 = u12(p13.item)
        local u18 = v17.image
        local v19 = Color3.fromRGB(255, 255, 255)
        local v20 = p13.tier
        if v20 == 1 then
            v19 = Color3.fromRGB(61, 255, 0)
        elseif v20 == 2 then
            v19 = Color3.fromRGB(0, 204, 255)
        elseif v20 == 3 then
            v19 = Color3.fromRGB(173, 0, 255)
        elseif v20 == 3 then
            v19 = Color3.fromRGB(255, 82, 0)
        end
        v15(function() --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u1
                [3] = u10
                [4] = u4
                [5] = u7
            --]]
            local u21 = u16:getValue()
            local u22 = nil
            local u23 = true
            if u21 then
                u1.Promise.delay(1):andThen(function() --[[ Line: 45 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                        [2] = u10
                        [3] = u21
                        [4] = u22
                        [5] = u4
                        [6] = u7
                    --]]
                    if not u23 then
                        return nil
                    end
                    local v24 = u10:Create(u21, TweenInfo.new(0.35), {
                        ["Position"] = UDim2.fromScale(0.5, -0.2)
                    })
                    v24:Play()
                    u22 = v24.Completed:Connect(function() --[[ Line: 53 ]]
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
            return function() --[[ Line: 61 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u22
                --]]
                u23 = false
                if u22 then
                    u22:Disconnect()
                end
            end
        end, {})
        local function v25() --[[ Line: 68 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u18
            --]]
            return u8.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 2,
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = u18
            })
        end
        return u8.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u8.createElement(u6, {}, { u8.createElement(u5, {
                    ["Position"] = UDim2.fromScale(0.5, 0.2),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.25, 0.25),
                    [u8.Ref] = u16
                }, {
                    u8.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }),
                    u8.createElement(u11, {
                        ["RuneTransparency"] = 0,
                        ["Color"] = v19,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5)
                    }),
                    v25(),
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
                            ["Text"] = "<b>" .. v17.displayName .. "</b>",
                            ["TextColor3"] = u3.WHITE
                        }, { u8.createElement("UITextSizeConstraint", {
                                ["MaxTextSize"] = 16
                            }) }) })
                }) }) })
    end)
}
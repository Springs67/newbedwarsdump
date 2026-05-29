local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.Button
local u6 = v3.DeviceUtil
local u7 = v3.TooltipContainer
local u8 = v3.UILayers
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, script.Parent.Parent.Parent, "types", "app-config").BedwarsAppIds
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-meta").GiftMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["GiftPurchaseButton"] = v10.new(u9)(function(u14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u11
            [3] = u8
            [4] = u9
            [5] = u6
            [6] = u13
            [7] = u4
            [8] = u12
            [9] = u7
            [10] = u5
        --]]
        local _ = p15.useState
        local v16 = {
            ["BorderSizePixel"] = 0,
            ["Selectable"] = true,
            ["AutoButtonColor"] = true,
            ["Size"] = u14.Size or UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
            ["OnClick"] = function() --[[ Name: OnClick, Line 23 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u11
                    [3] = u14
                    [4] = u8
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u11.GIFTING, {
                    ["GiftType"] = u14.GiftType
                }, u8.OVERLAY)
            end,
            ["LayoutOrder"] = u14.LayoutOrder
        }
        local v17 = u14.ZIndex
        v16.ZIndex = (v17 == nil and 1 or v17) + 1
        local v18 = {
            u9.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }),
            u9.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1000, 0)
            }),
            u9.createElement("UIStroke", {
                ["Transparency"] = 0.65,
                ["Color"] = Color3.fromRGB(49, 252, 255),
                ["Thickness"] = u6.isSmallScreen() and 1 or 2
            }),
            u9.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(84, 203, 198)), ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 136, 142)) })
            })
        }
        local v19 = #v18
        local v20 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ScaleType"] = "Fit",
            ["SizeConstraint"] = "RelativeYY",
            ["Image"] = u13.GIFT_SOLID,
            ["ImageColor3"] = Color3.fromRGB(255, 255, 255),
            ["Size"] = UDim2.fromScale(0.65, 0.65),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v21 = u14.ZIndex
        v20.ZIndex = (v21 == nil and 1 or v21) + 1
        v18[v19 + 1] = u9.createElement("ImageLabel", v20)
        local v22 = { u9.createElement(u4, {
                ["Text"] = "Gift Item",
                ["TextSize"] = 16,
                ["Font"] = Enum.Font.SourceSansBold,
                ["Limits"] = Vector2.new(300, 60)
            }) }
        local v23 = #v22
        local v24 = {}
        local v25 = u12[u14.GiftType]
        if v25 ~= nil then
            v25 = v25.name
        end
        v24.Text = v25
        v24.Font = Enum.Font.SourceSansSemibold
        v24.TextSize = 14
        v24.Limits = Vector2.new(300, 500)
        v22[v23 + 1] = u9.createElement(u4, v24)
        v18[v19 + 2] = u9.createElement(u7, {}, v22)
        return u9.createFragment({
            ["GiftKitButton"] = u9.createElement(u5, v16, v18)
        })
    end)
}
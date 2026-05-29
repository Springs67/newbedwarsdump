local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.TooltipContainer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-meta").EnchantMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["EnchantItemFrame"] = v7.new(u6)(function(p12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u4
            [3] = u6
            [4] = u10
            [5] = u8
            [6] = u11
            [7] = u5
            [8] = u3
        --]]
        local _ = p13.useState
        local u14 = u9[p12.Enchant]
        local v15 = u4.BLACK
        local function v16() --[[ Line: 17 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u14
            --]]
            return u6.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 10,
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Image"] = u14.image
            })
        end
        local v17 = u6.createElement
        local v18 = "ImageButton"
        local v21 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Image"] = u10.STATUS_EFFECT_FRAME_2,
            ["ImageColor3"] = v15,
            ["ImageTransparency"] = 0.3,
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["SizeConstraint"] = "RelativeYY",
            ["ZIndex"] = 10,
            [u6.Event.MouseEnter] = function(p19) --[[ Line: 37 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u11
                --]]
                u8:Create(p19, TweenInfo.new(0.15), {
                    ["ImageColor3"] = u11.textPrimary
                }):Play()
            end,
            [u6.Event.MouseLeave] = function(p20) --[[ Line: 42 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u4
                --]]
                u8:Create(p20, TweenInfo.new(0.15), {
                    ["ImageColor3"] = u4.BLACK
                }):Play()
            end
        }
        local v22 = {}
        local v23
        if u14 then
            v23 = v16()
        else
            v23 = u14
        end
        __set_list(v22, 1, {v23, u6.createElement(u5, {}, { u6.createElement(u3, {
        ["TextSize"] = 26,
        ["Text"] = u14.name,
        ["Font"] = Enum.Font.SourceSansBold,
        ["Limits"] = Vector2.new(300, 60)
    }), u6.createElement(u3, {
        ["TextSize"] = 24,
        ["Text"] = u14.description,
        ["Font"] = Enum.Font.SourceSans,
        ["TextColor3"] = Color3.fromRGB(191, 191, 191),
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["Limits"] = Vector2.new(300, 150)
    }) })})
        return v17(v18, v21, v22)
    end)
}
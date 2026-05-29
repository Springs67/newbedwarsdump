local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "news", "news-types").NewsMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["Issue2Reader"] = v6.new(u5)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u4
            [3] = u9
            [4] = u5
            [5] = u3
            [6] = u7
        --]]
        local v12 = p11.useState
        local _ = p11.useEffect
        local v13 = u8[u10.SelectedNews]
        local u14, u15 = v12(0)
        local function v16() --[[ Line: 17 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u9
                [3] = u10
            --]]
            u4:playSound(u9.UI_CLICK_2)
            u10.SetSelectedNews(nil)
        end
        local function v17() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u14
            --]]
            u15((u14 + 1) % 2)
        end
        local v18 = u5.createFragment
        local v19 = {}
        local v20 = u5.createElement
        local v21 = u3
        local v22 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v23 = {}
        local v24 = u5.createElement
        local v25 = {
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Image"] = v13.pageAssetIds[u14 + 1],
            ["Size"] = UDim2.fromScale(1, 1),
            ["ScaleType"] = Enum.ScaleType.Fit,
            ["BackgroundTransparency"] = 1,
            [u5.Event.MouseButton1Click] = v17
        }
        local v26 = {}
        local v27 = u5.createElement
        local v28 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.05),
            ["Position"] = UDim2.fromScale(0, 0.03)
        }
        local v29 = {
            ["GoBackIcon"] = u5.createElement("ImageButton", {
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0.05, 0.5),
                ["Image"] = u7.HOME,
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["ImageTransparency"] = 0.2,
                ["BackgroundTransparency"] = 1,
                [u5.Event.Activated] = v16
            })
        }
        __set_list(v26, 1, {(v27("Frame", v28, v29))})
        v26.NextPageIcon = u5.createElement("ImageButton", {
            ["Size"] = UDim2.fromScale(0.05, 0.1),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(1, 0.5),
            ["Image"] = u7.TRIANGLE_ARROW_RIGHT,
            ["ScaleType"] = Enum.ScaleType.Fit,
            ["ImageTransparency"] = 0.2,
            ["BackgroundTransparency"] = 1,
            [u5.Event.Activated] = v17
        })
        __set_list(v26, 2, {u5.createElement("UIAspectRatioConstraint", {
    ["AspectRatio"] = 1.2828752642706132
})})
        __set_list(v23, 1, {v24("ImageButton", v25, v26)})
        v19.NewsReader = v20(v21, v22, v23)
        return v18(v19)
    end)
}
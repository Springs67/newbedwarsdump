local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.Empty
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "news", "news-types").NewsMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["NewsReader"] = v8.new(u7)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u5
            [3] = u11
            [4] = u7
            [5] = u4
            [6] = u9
            [7] = u6
            [8] = u3
        --]]
        local _ = p13.useState
        local v14 = u10[u12.SelectedNews]
        local function v15() --[[ Line: 17 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u11
                [3] = u12
            --]]
            u5:playSound(u11.UI_CLICK_2)
            u12.SetSelectedNews(nil)
        end
        local v16 = {
            ["AutomaticSize"] = "Y",
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0)
        }
        local v17 = {}
        local v18 = u7.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["VerticalAlignment"] = "Top",
            ["HorizontalAlignment"] = "Left",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.05, 0)
        })
        local v19 = u7.createElement
        local v20 = u4
        local v21 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.05)
        }
        local v22 = {
            ["Title"] = u7.createElement("TextLabel", {
                ["Font"] = "GothamBold",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.7, 1),
                ["Text"] = v14.title,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            }),
            ["GoBackIcon"] = u7.createElement("ImageButton", {
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["Image"] = u9.ARROW_LEFT,
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["ImageTransparency"] = 0.2,
                ["BackgroundTransparency"] = 1,
                [u7.Event.Activated] = v15
            })
        }
        __set_list(v17, 1, {v18, v19(v20, v21, v22)})
        local _ = #v17
        local v23 = u6.values(v14.pageAssetIds)
        local function v28(p24, p25) --[[ Line: 63 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            local v26 = u7.createFragment
            local v27 = {
                ["Page:" .. tostring(p25)] = u7.createElement("ImageLabel", {
                    ["AutomaticSize"] = "Y",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.new(1, 0, 1, 0),
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
                    ["Image"] = p24,
                    ["ScaleType"] = Enum.ScaleType.Fit
                })
            }
            return v26(v27)
        end
        local v29 = table.create(#v23)
        for v30, v31 in v23 do
            v29[v30] = v28(v31, v30 - 1, v23)
        end
        local v32 = {
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.9)
            }
        }
        local v33 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 8)
            }) }
        local v34 = #v33
        for v35, v36 in v29 do
            v33[v34 + v35] = v36
        end
        v17.PagesList = u7.createElement(u3, v32, v33)
        return u7.createFragment({
            ["NewsReader"] = u7.createElement(u4, v16, v17)
        })
    end)
}
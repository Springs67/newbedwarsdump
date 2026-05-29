local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.SlideIn
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["RankDecayNotification"] = function(u10) --[[ Name: RankDecayNotification, Line 11 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u8
            [3] = u9
            [4] = u7
            [5] = u5
            [6] = u3
            [7] = u6
        --]]
        local v11 = u4.isSmallScreen()
        local v12 = v11 and 0.85 or 0.6
        local v13 = v11 and 0.7 or 0.6
        local v14
        if u10.rankDivision == nil then
            v14 = nil
        else
            v14 = u8[u10.rankDivision].image
        end
        local v15 = {
            ["DisplayOrder"] = 1600,
            ["ResetOnSpawn"] = false,
            ["IgnoreGuiInset"] = u4.isSmallScreen()
        }
        local v16 = {}
        local v17 = #v16
        local v18 = {}
        local v19 = #v18
        local v20 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["Size"] = UDim2.fromScale(v12, v13),
            ["Position"] = UDim2.fromScale(0.5, 0.46),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundColor3"] = u9.backgroundSecondary
        }
        local v21 = { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }) }
        local v22 = #v21
        local v23 = {
            ["Size"] = UDim2.fromScale(1, 0.9),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v24 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.015, 0),
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
            }) }
        local v25 = #v24
        local v26 = {
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.38, 0.42)
        }
        local v27 = {}
        local v28 = #v27
        local v29
        if v14 == "" or not v14 then
            v29 = nil
        else
            v29 = u7.createFragment({
                ["RankImage"] = u7.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = v14,
                    ["ScaleType"] = Enum.ScaleType.Fit
                })
            })
        end
        if v29 then
            v27[v28 + 1] = v29
        end
        v24.ImageWrapper = u7.createElement("Frame", v26, v27)
        v24.Textbox = u7.createElement("Frame", {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.8, 0.25),
            ["BackgroundColor3"] = u9.backgroundPrimary
        }, {
            u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }),
            ["TextWrapper"] = u7.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.92, 0.92),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }, { u7.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder",
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center
                }), u7.createElement("TextLabel", {
                    ["RichText"] = true,
                    ["LineHeight"] = 1.05,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 0,
                    ["Size"] = UDim2.fromScale(1, 0.4),
                    ["Text"] = u10.title,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Font"] = Enum.Font.Arial,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                }), u7.createElement("TextLabel", {
                    ["RichText"] = true,
                    ["LineHeight"] = 1.05,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.9, 0.4),
                    ["Text"] = u10.body,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Font"] = Enum.Font.Arial,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                }) })
        })
        v24[v25 + 1] = u7.createElement(u5, {
            ["LayoutOrder"] = 3,
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(0.6, 0.1)
        }, {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.015, 0),
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
            }),
            ["CloseRankDecay"] = u7.createElement(u3, {
                ["Text"] = "Close",
                ["ZIndex"] = 3,
                ["LayoutOrder"] = 1,
                ["CornerRadius"] = UDim.new(0.2, 0),
                ["Size"] = UDim2.fromScale(0.5, 0.9),
                ["TextLabel"] = {
                    ["ZIndex"] = 4,
                    ["Font"] = Enum.Font.ArialBold,
                    ["Size"] = UDim2.fromScale(0.9, 0.65),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                },
                ["BackgroundColor3"] = u9.backgroundError,
                ["OnClick"] = function() --[[ Name: OnClick, Line 147 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                    --]]
                    local v30 = u10.onClose
                    if v30 ~= nil then
                        v30 = v30()
                    end
                    return v30
                end
            })
        })
        v21[v22 + 1] = u7.createElement(u5, v23, v24)
        v18[v19 + 1] = u7.createElement("Frame", v20, v21)
        v16[v17 + 1] = u7.createElement(u6, {}, v18)
        return u7.createElement("ScreenGui", v15, v16)
    end
}
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DarkBackground
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.IconButton
local u7 = v2.SlideIn
local u8 = v2.SoundManager
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u15 = v1.import(script, script.Parent, "lobby-performance-popup-page").LobbyPerformancePopupPage
local u16 = UDim2.fromScale(0.55, 0.75)
local u17 = UDim2.fromScale(0.5, 0.46)
local u18 = Vector2.new(0.5, 0.5)
return {
    ["LobbyPerformanceFinalizedPopup"] = v11.new(u10)(function(u19, p20) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u15
            [3] = u4
            [4] = u3
            [5] = u16
            [6] = u17
            [7] = u18
            [8] = u14
            [9] = u5
            [10] = u6
            [11] = u12
            [12] = u9
            [13] = u8
            [14] = u13
            [15] = u7
        --]]
        local v21 = p20.useState
        local v22 = p20.useEffect
        local u23, u24 = v21(0)
        local u25 = #u19.data
        local function v30() --[[ Line: 25 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u23
                [3] = u25
                [4] = u10
                [5] = u15
            --]]
            local v26 = u19.data
            local v27 = u23
            local v28 = u25 - 1
            local v29 = v26[math.clamp(v27, 0, v28) + 1]
            return u10.createElement(u15, {
                ["Earned"] = v29.Earned,
                ["MatchInfo"] = v29.MatchInfo
            })
        end
        v22(function() --[[ Line: 35 ]] end, { u23 })
        local v31 = {
            ["DisplayOrder"] = 20,
            ["IgnoreGuiInset"] = u4.isSmallScreen()
        }
        local v32 = { u10.createElement(u3, {
                ["AppId"] = "MatchPerformancePopup",
                ["BackgroundTransparency"] = 0.4,
                ["IgnoreClickDuration"] = 1,
                ["OnClick"] = function() --[[ Name: OnClick, Line 44 ]]
                    return false
                end
            }) }
        local v33 = #v32
        local v34 = {}
        local v35 = #v34
        local v36 = {
            ["LayoutOrder"] = 1,
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["Size"] = u16,
            ["Position"] = u17,
            ["AnchorPoint"] = u18,
            ["BackgroundColor3"] = u14.backgroundSecondary
        }
        local v37 = { u10.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }) }
        local v38 = #v37
        local v39 = {
            ["Size"] = UDim2.fromScale(0.99, 0.99),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v40 = {
            u10.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 0),
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
            }),
            ["Header"] = u10.createElement(u5, {
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.new(1, 0, 0.05, 0)
            }, { u10.createElement(u6, {
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = u12.X,
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                    ["Position"] = UDim2.fromScale(0.925, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 90 ]]
                        --[[
                        Upvalues:
                            [1] = u9
                            [2] = u8
                            [3] = u13
                        --]]
                        u9.Controllers.LobbyPerformancePopupController:hidePopup()
                        u8:playSound(u13.UI_CLOSE_2)
                    end
                }) }),
            v30()
        }
        local v41 = #v40
        local v42 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.5, 0.05),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v43 = {}
        local v44 = #v43
        local v45
        if #u19.data > 1 then
            local v46 = u10.createElement
            local v47 = u5
            local v48 = {
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5)
            }
            local v55 = {
                u10.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0.015, 0),
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center
                }),
                ["LeftButton"] = u10.createElement(u6, {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = u12.TRIANGLE_ARROW_LEFT,
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 125 ]]
                        --[[
                        Upvalues:
                            [1] = u24
                            [2] = u23
                            [3] = u25
                            [4] = u8
                            [5] = u13
                        --]]
                        local v49 = u24
                        local v50 = u23 + -1
                        local v51 = u25 - 1
                        v49((math.clamp(v50, 0, v51)))
                        u8:playSound(u13.UI_CLICK)
                    end
                }),
                ["PageIndicator"] = u10.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["LayoutOrder"] = 2,
                    ["BackgroundTransparency"] = 0.9,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Text"] = tostring(u23),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Font"] = Enum.Font.ArialBold,
                    ["Position"] = UDim2.fromScale(0.9, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                    ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
                }),
                ["RightButton"] = u10.createElement(u6, {
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = u12.TRIANGLE_ARROW_RIGHT,
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 152 ]]
                        --[[
                        Upvalues:
                            [1] = u24
                            [2] = u23
                            [3] = u25
                            [4] = u8
                            [5] = u13
                        --]]
                        local v52 = u24
                        local v53 = u23 + 1
                        local v54 = u25 - 1
                        v52((math.clamp(v53, 0, v54)))
                        u8:playSound(u13.UI_CLICK)
                    end
                })
            }
            v45 = v46(v47, v48, v55)
        else
            v45 = false
        end
        if v45 then
            v43[v44 + 1] = v45
        end
        v40[v41 + 1] = u10.createElement(u5, v42, v43)
        v37[v38 + 1] = u10.createElement(u5, v39, v40)
        v34[v35 + 1] = u10.createElement("Frame", v36, v37)
        v32[v33 + 1] = u10.createElement(u7, {}, v34)
        return u10.createElement("ScreenGui", v31, v32)
    end)
}
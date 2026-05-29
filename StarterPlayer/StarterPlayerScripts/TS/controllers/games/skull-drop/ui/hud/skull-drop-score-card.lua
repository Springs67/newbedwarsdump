local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.PlayerRender
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["SkullDropScoreCard"] = v8.new(u7)(function(p12, p13) --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u7
            [3] = u4
            [4] = u11
            [5] = u10
            [6] = u6
            [7] = u9
            [8] = u5
        --]]
        local _ = p13.useState
        local _ = p13.useEffect
        local v14 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u3.darken(p12.TeamColor, 0.8),
            ["BackgroundTransparency"] = p12.Eliminated and 0.6 or 0
        }
        local v15 = p12.LayoutOrder
        if v15 == nil then
            v15 = p12.Placement
        end
        v14.LayoutOrder = v15
        local v16 = {}
        local v17 = u7.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 2.24
        })
        local v18 = u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.25, 0)
        })
        local v19 = u7.createElement
        local v20 = "UIStroke"
        local v21 = {}
        local v22
        if p12.IsLocalTeam then
            v22 = u3.WHITE
        else
            v22 = u3.brighten(p12.TeamColor, 0.2)
        end
        v21.Color = v22
        v21.Thickness = u4.isSmallScreen() and 1.5 or (p12.IsLocalTeam and 3 or 2)
        v21.Transparency = p12.Eliminated and 0.6 or 0
        __set_list(v16, 1, {v17, v18, (v19(v20, v21))})
        local v23 = u7.createElement
        local v24 = "TextLabel"
        local v25 = {
            ["AutomaticSize"] = "XY",
            ["BackgroundTransparency"] = 1,
            ["TextStrokeTransparency"] = 0,
            ["Position"] = UDim2.fromScale(p12.Eliminated and 0.5 or 0, 0),
            ["AnchorPoint"] = Vector2.new(p12.Eliminated and 0.5 or 0.25, 0.7)
        }
        local v26
        if u4.isSmallScreen() then
            v26 = Enum.FontSize.Size12
        else
            v26 = Enum.FontSize.Size18
        end
        v25.FontSize = v26
        local v27
        if p12.Placement == 1 then
            v27 = u11.mcYellow
        else
            v27 = Color3.fromRGB(255, 255, 255)
        end
        v25.TextColor3 = v27
        v25.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        v25.TextTransparency = p12.Eliminated and 0.6 or 0
        v25.Font = Enum.Font.GothamBlack
        local v28
        if p12.Eliminated then
            v28 = "Eliminated"
        else
            local v29 = p12.Placement
            v28 = v29 == 1 and "1st" or (v29 == 2 and "2nd" or (v29 == 3 and "3rd" or "" .. tostring(v29) .. "th"))
        end
        v25.Text = v28
        v16.Placement = v23(v24, v25)
        local v30 = #v16
        local v31
        if p12.Placement == 1 then
            v31 = u7.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = -1,
                ["Position"] = UDim2.fromScale(0.5, 0),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Size"] = UDim2.fromScale(0.45, 0.45),
                ["Image"] = u10.CROWN_SOLID,
                ["ImageColor3"] = u11.mcYellow,
                ["ImageTransparency"] = p12.Eliminated and 0.6 or 0
            })
        else
            v31 = false
        end
        if v31 then
            v16[v30 + 1] = v31
        end
        local v32 = #v16
        local v33
        if p12.MainPlayer == nil then
            v33 = false
        else
            local v34 = u7.createElement
            local v35 = u6
            local v36 = {
                ["BackgroundTransparency"] = 1,
                ["Rotation"] = -5,
                ["Position"] = UDim2.fromScale(0, 0.8),
                ["AnchorPoint"] = Vector2.new(0.25, 0.5),
                ["PlayerUserId"] = p12.MainPlayer.UserId
            }
            local v37
            if u4.isSmallScreen() then
                v37 = UDim2.fromScale(0.6, 0.6)
            else
                v37 = UDim2.fromScale(0.5, 0.5)
            end
            v36.Size = v37
            v36.ImageTransparency = p12.Eliminated and 0.6 or 0
            v33 = v34(v35, v36, { u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }), u7.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        end
        if v33 then
            v16[v32 + 1] = v33
        end
        local _ = #v16
        local v38 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v39 = {
            u7.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.1, 0),
                ["PaddingBottom"] = UDim.new(0.1, 0),
                ["PaddingLeft"] = UDim.new(0.1, 0),
                ["PaddingRight"] = UDim.new(0.1, 0)
            }),
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 0)
            }),
            ["Name"] = u7.createElement("TextLabel", {
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["TextColor3"] = Color3.fromRGB(0, 0, 0),
                ["Text"] = "<b>" .. p12.Name .. "</b>",
                ["TextTransparency"] = p12.Eliminated and 0.6 or 0.3,
                ["Font"] = Enum.Font.GothamBold
            })
        }
        local _ = #v39
        local v40 = {
            ["Size"] = UDim2.fromScale(1, 0.65),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        }
        local v41 = p12.Score
        local v42 = p12.MaxScore
        if v42 == nil then
            v42 = u9.HUNTER_WIN_SKULL_COUNT
        end
        v40.Text = "<b>" .. tostring(v41) .. "<font size=\"16\" transparency=\".3\">/" .. tostring(v42) .. "</font></b>"
        v40.TextSize = 24
        v40.TextYAlignment = "Center"
        v40.Font = Enum.Font.Roboto
        v40.BackgroundTransparency = 1
        v40.TextTransparency = p12.Eliminated and 0.6 or 0
        v40.RichText = true
        v40.TextScaled = true
        v40.LayoutOrder = 2
        v39.Score = u7.createElement("TextLabel", v40)
        v16.UserInfo = u7.createElement(u5, v38, v39)
        return u7.createFragment({
            ["ScoreEntry_" .. p12.Name] = u7.createElement("Frame", v14, v16)
        })
    end)
}
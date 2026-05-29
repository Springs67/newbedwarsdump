local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.PlayerRender
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["PlacementScoreCard"] = v8.new(u7)(function(p11, p12) --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u7
            [3] = u4
            [4] = u10
            [5] = u9
            [6] = u6
            [7] = u5
        --]]
        local _ = p12.useState
        local v13 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u3.darken(p11.TeamColor, 0.8),
            ["LayoutOrder"] = p11.Placement
        }
        local v14 = {}
        local v15 = u7.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 2.24
        })
        local v16 = u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.25, 0)
        })
        local v17 = u7.createElement
        local v18 = "UIStroke"
        local v19 = {}
        local v20
        if p11.IsLocalTeam then
            v20 = u3.WHITE
        else
            v20 = u3.brighten(p11.TeamColor, 0.2)
        end
        v19.Color = v20
        v19.Thickness = u4.isSmallScreen() and 1.5 or (p11.IsLocalTeam and 3 or 2)
        __set_list(v14, 1, {v15, v16, (v17(v18, v19))})
        local v21 = u7.createElement
        local v22 = "TextLabel"
        local v23 = {
            ["AutomaticSize"] = "XY",
            ["BackgroundTransparency"] = 1,
            ["TextStrokeTransparency"] = 0,
            ["Position"] = UDim2.fromScale(0, 0),
            ["AnchorPoint"] = Vector2.new(0.25, 0.7)
        }
        local v24
        if u4.isSmallScreen() then
            v24 = Enum.FontSize.Size12
        else
            v24 = Enum.FontSize.Size18
        end
        v23.FontSize = v24
        local v25
        if p11.Placement == 1 then
            v25 = u10.mcYellow
        else
            v25 = Color3.fromRGB(255, 255, 255)
        end
        v23.TextColor3 = v25
        v23.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        v23.Font = Enum.Font.GothamBlack
        local v26 = p11.Placement
        v23.Text = v26 == 1 and "1st" or (v26 == 2 and "2nd" or (v26 == 3 and "3rd" or "" .. tostring(v26) .. "th"))
        v14.Placement = v21(v22, v23)
        local v27 = #v14
        local v28
        if p11.Placement == 1 then
            v28 = u7.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = -1,
                ["Position"] = UDim2.fromScale(0.5, 0),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Size"] = UDim2.fromScale(0.45, 0.45),
                ["Image"] = u9.CROWN_SOLID,
                ["ImageColor3"] = u10.mcYellow
            })
        else
            v28 = false
        end
        if v28 then
            v14[v27 + 1] = v28
        end
        local v29 = #v14
        local v30
        if p11.MainPlayer == nil then
            v30 = false
        else
            local v31 = u7.createElement
            local v32 = u6
            local v33 = {
                ["BackgroundTransparency"] = 1,
                ["Rotation"] = -5,
                ["Position"] = UDim2.fromScale(0, 0.8),
                ["AnchorPoint"] = Vector2.new(0.25, 0.5),
                ["PlayerUserId"] = p11.MainPlayer.UserId
            }
            local v34
            if u4.isSmallScreen() then
                v34 = UDim2.fromScale(0.6, 0.6)
            else
                v34 = UDim2.fromScale(0.5, 0.5)
            end
            v33.Size = v34
            v30 = v31(v32, v33, { u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }), u7.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        end
        if v30 then
            v14[v29 + 1] = v30
        end
        local _ = #v14
        local v35 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v36 = {
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
                ["TextSize"] = 10,
                ["TextYAlignment"] = "Center",
                ["TextTransparency"] = 0,
                ["BackgroundTransparency"] = 1,
                ["TextStrokeTransparency"] = 0,
                ["TextScaled"] = true,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.4),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0),
                ["Text"] = p11.Name,
                ["Font"] = Enum.Font.GothamBlack
            })
        }
        local _ = #v36
        local v37 = {
            ["Size"] = UDim2.fromScale(1, 0.6),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0)
        }
        local v38 = p11.ShowMaxScore
        local v39
        if v38 == 0 or (v38 ~= v38 or not v38) then
            local v40 = p11.Score
            v39 = tostring(v40)
        else
            local v41 = p11.Score
            local v42 = tostring(v41)
            local v43 = p11.ShowMaxScore
            v39 = v42 .. "/" .. tostring(v43)
        end
        v37.Text = v39
        v37.TextSize = 10
        v37.TextYAlignment = "Center"
        v37.Font = Enum.Font.GothamBlack
        v37.BackgroundTransparency = 1
        v37.TextStrokeTransparency = 0
        v37.TextScaled = true
        v37.LayoutOrder = 2
        v36.Score = u7.createElement("TextLabel", v37)
        v14.UserInfo = u7.createElement(u5, v35, v36)
        return u7.createFragment({
            ["ScoreEntry_" .. p11.Name] = u7.createElement("Frame", v13, v14)
        })
    end)
}
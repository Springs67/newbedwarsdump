local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.Empty
local v5 = v3.GetTarmacAsset
local u6 = v3.Padding
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-border-meta").ClanBorderMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war-leaderboard").ClanWarLeaderboardType
local u13 = v1.import(script, script.Parent.Parent, "clan-war-medals-display").ClanWarMedalsDisplay
local u14 = v5("CrownIcon")
return {
    ["ClanWarLeaderboardCard"] = v8.new(u7)(function(u15) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u2
            [3] = u9
            [4] = u14
            [5] = u6
            [6] = u12
            [7] = u13
            [8] = u10
            [9] = u4
            [10] = u11
        --]]
        local v16 = {
            ["Size"] = UDim2.new(0.96, 0, 0, 100),
            ["BackgroundColor3"] = Color3.fromRGB(47, 49, 80),
            [u7.Event.Activated] = function() --[[ Line: 21 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u9
                    [3] = u15
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u9.CLAN_PROFILE)
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u9.CLAN_PROFILE, {
                    ["ClanId"] = u15.ClanId
                })
            end
        }
        local v17 = { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }) }
        local v18 = #v17
        local v19
        if u15.Placement <= 3 then
            local v20 = u7.createFragment
            local v21 = {}
            local v22 = u7.createElement
            local v23 = "ImageLabel"
            local v24 = {
                ["BackgroundTransparency"] = 1,
                ["Rotation"] = -25,
                ["ZIndex"] = 3,
                ["Position"] = UDim2.fromOffset(-10, -12),
                ["Size"] = UDim2.fromOffset(26, 20.8),
                ["Image"] = u14.Image,
                ["ImageRectOffset"] = u14.ImageRectOffset,
                ["ImageRectSize"] = u14.ImageRectSize
            }
            local v25
            if u15.Placement == 1 then
                v25 = Color3.fromRGB(255, 192, 79)
            elseif u15.Placement == 2 then
                v25 = Color3.fromRGB(229, 206, 172)
            else
                v25 = Color3.fromRGB(255, 142, 80)
            end
            v24.ImageColor3 = v25
            v21.CrownIcon = v22(v23, v24)
            v19 = v20(v21)
        else
            v19 = nil
        end
        if v19 then
            v17[v18 + 1] = v19
        end
        local v26 = #v17
        local v27 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0, 0)
        }
        local v28 = { u7.createElement(u6, {
                ["Padding"] = {
                    ["Vertical"] = 6,
                    ["Horizontal"] = 12
                }
            }), (u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.03, 0)
            })) }
        local v29 = u7.createElement
        local v30 = {
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(0.1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(38, 38, 64)
        }
        local v31 = { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }), (u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            })) }
        local v32 = u7.createElement
        local v33 = {
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1
        }
        local v34 = u15.Placement
        v33.Text = tostring(v34)
        v33.Size = UDim2.fromScale(0.45, 0.45)
        v33.Position = UDim2.fromScale(0.5, 0.5)
        v33.AnchorPoint = Vector2.new(0.5, 0.5)
        v33.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v33.TextColor3 = Color3.fromRGB(255, 255, 255)
        v31.PlacementText = v32("TextLabel", v33)
        v28.PlacementSquare = v29("Frame", v30, v31)
        local v35 = #v28
        local v36 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.15, 1)
        }
        local v37 = { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) }
        local _ = #v37
        local v38 = u15.ClanWarLeaderboardType == u12.WEEKLY
        if v38 then
            local v39 = {
                ["Medals"] = u15.Medals
            }
            local v40 = {
                ["Size"] = UDim2.fromScale(0.8, 0.25)
            }
            local v41 = u15.Border
            local v42
            if v41 == 0 or (v41 ~= v41 or not v41) then
                v42 = UDim2.fromScale(1, 0.95)
            else
                v42 = UDim2.fromScale(1.1, 0.85)
            end
            v40.Position = v42
            local v43 = u15.Border
            local v44
            if v43 == 0 or (v43 ~= v43 or not v43) then
                v44 = Vector2.new(1, 1)
            else
                v44 = Vector2.new(1, 0)
            end
            v40.AnchorPoint = v44
            v40.ZIndex = 15
            v39.FrameProps = v40
            v38 = u7.createElement(u13, v39)
        end
        local v45 = {
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 5,
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Image"] = u15.Icon,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v46 = {}
        local v47 = #v46
        if v38 then
            v46[v47 + 1] = v38
        end
        v37.ClanIcon = u7.createElement("ImageLabel", v45, v46)
        local v48 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["ScaleType"] = Enum.ScaleType.Fit
        }
        local v49 = u15.Border
        local v50
        if v49 == 0 or (v49 ~= v49 or not v49) then
            v50 = nil
        else
            v50 = u10[u15.Border].borderImage
        end
        v48.Image = v50
        v48.ZIndex = 10
        v37.ClanEmblemBorder = u7.createElement("ImageLabel", v48)
        v28[v35 + 1] = u7.createElement(u4, v36, v37)
        v28.ClanIdentity = u7.createElement(u4, {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.2, 1)
        }, {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Left",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.1, 0)
            }),
            ["ClanName"] = u7.createElement("TextLabel", {
                ["TextXAlignment"] = "Left",
                ["TextSize"] = 18,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0, 16),
                ["Text"] = u15.Name,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
            }),
            ["ClanTag"] = u7.createElement("TextLabel", {
                ["TextXAlignment"] = "Left",
                ["TextSize"] = 14,
                ["TextTransparency"] = 0.3,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(1, 0, 0, 10),
                ["Text"] = "[" .. u15.Tag .. "]",
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular)
            })
        })
        local v51 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(0.45, 0.6)
        }
        local v52 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Right",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 7)
            }) }
        local v53 = #v52
        local v54
        if u15.Division == nil then
            v54 = false
        else
            local v55 = u7.createFragment
            local v56 = {}
            local v57 = u7.createElement
            local v58 = {
                ["AutomaticSize"] = "X",
                ["SizeConstraint"] = "RelativeYY",
                ["TextXAlignment"] = "Right",
                ["TextSize"] = 14,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0, 1)
            }
            local v59 = u15.Division
            v58.Text = "Division " .. tostring(v59)
            v58.TextColor3 = Color3.fromRGB(255, 255, 255)
            v58.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
            v56.Score = v57("TextLabel", v58)
            v54 = v55(v56)
        end
        if v54 then
            v52[v53 + 1] = v54
        end
        local v60 = #v52 + 1
        local v61
        if u15.ClanWarLeaderboardType == u12.WEEKLY then
            v61 = u7.createFragment({
                ["TrophyIcon"] = u7.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0.5),
                    ["Image"] = u11.CLAN_WAR_POINT_ICON,
                    ["ScaleType"] = Enum.ScaleType.Fit
                })
            })
        else
            v61 = u7.createElement(u13, {
                ["Medals"] = u15.Medals
            })
        end
        v52[v60] = v61
        local _ = #v52
        local v62 = u7.createElement
        local v63 = {
            ["AutomaticSize"] = "X",
            ["SizeConstraint"] = "RelativeYY",
            ["TextXAlignment"] = "Right",
            ["TextSize"] = 14,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 30,
            ["Size"] = UDim2.fromScale(0, 1)
        }
        local v64 = u15.Score
        v63.Text = tostring(v64)
        v63.TextColor3 = Color3.fromRGB(255, 255, 255)
        v63.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v52.Score = v62("TextLabel", v63)
        v28.ClanStats = u7.createElement(u4, v51, v52)
        v17[v26 + 1] = u7.createElement(u4, v27, v28)
        return u7.createFragment({
            ["ClanSearchListingCard"] = u7.createElement("ImageButton", v16, v17)
        })
    end)
}
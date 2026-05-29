local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.ColorUtil
local u5 = v2.Empty
local v6 = v2.GetTarmacAsset
local u7 = v2.StringUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-meta")
local u11 = v10.getLeaderboardMeta
local u12 = v10.LEADERBOARD_DISABLED
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u14 = v1.import(script, script.Parent.Parent, "stats-board", "ui", "section-divider").SectionDivider
local u15 = v1.import(script, script.Parent, "ui", "stat-rank-element").StatRankElement
local u16 = v6("CrownIcon")
return {
    ["LeaderboardList"] = v9.new(u8)(function(p17, p18) --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u8
            [3] = u14
            [4] = u12
            [5] = u5
            [6] = u4
            [7] = u7
            [8] = u16
            [9] = u13
            [10] = u15
            [11] = u3
        --]]
        local _ = p18.useState
        local u19 = u11(p17.LeaderboardType)
        local function u22() --[[ Line: 25 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u14
            --]]
            local v20 = u8.createFragment
            local v21 = {
                ["TopThreeDivider"] = u8.createElement("Frame", {
                    ["BackgroundTransparency"] = 1,
                    ["Position"] = UDim2.fromOffset(0, 48),
                    ["Size"] = UDim2.new(1, 0, 0, 4)
                }, { u8.createElement(u14) })
            }
            return v20(v21)
        end
        local v23 = {
            ["ScrollingDirection"] = Enum.ScrollingDirection.Y
        }
        local v24 = {}
        for v25, v26 in p17.FrameProps do
            v23[v25] = v26
        end
        v24.ScrollingFrameProps = v23
        local v27 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 10)
            }) }
        local v28 = #v27
        local v29
        if u12 == true then
            local v30 = u8.createFragment
            local v31 = {}
            local v32 = u8.createElement
            local v33 = u5
            local v34 = {
                ["Size"] = UDim2.new(0.98, 0, 0, 38)
            }
            local v35 = {}
            local v36 = u8.createElement
            local v37 = {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.new(1, 0, 1, 0),
                ["BackgroundColor3"] = u4.hexColor(7567033)
            }
            local v38 = {}
            local v39 = u8.createElement
            local v40 = u5
            local v41 = {
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v42 = { u8.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 10)
                }), (u8.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0, 10),
                    ["PaddingRight"] = UDim.new(0, 10)
                })) }
            local v43 = u8.createElement
            local v44 = u5
            local v45 = {
                ["Size"] = UDim2.new(0.6, 0, 1, 0)
            }
            local v46 = {
                u8.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 10)
                }),
                ["DisabledIcon"] = u8.createElement("ImageLabel", {
                    ["Image"] = "rbxassetid://7804178661",
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromOffset(24, 24),
                    ["BackgroundColor3"] = Color3.new(0.95, 0.95, 0.95)
                }, { u8.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(1, 0)
                    }) }),
                ["DisabledText"] = u8.createElement("TextLabel", {
                    ["Text"] = "<b><font color=\"rgb(185, 188, 255)\"></font></b>Leaderboard Temporarily Hidden",
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["AutoLocalize"] = false,
                    ["LayoutOrder"] = 3,
                    ["Font"] = Enum.Font.RobotoMono,
                    ["Size"] = UDim2.new(1, -60, 0, 18),
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                })
            }
            v42.DisabledContainer = v43(v44, v45, v46)
            v38.UserLeaderBoardDataContainer = v39(v40, v41, v42)
            v35.LeaderboardElementBody = v36("Frame", v37, v38)
            v31.LeaderboardElementContainer = v32(v33, v34, v35)
            v29 = v30(v31)
        else
            v29 = false
        end
        if v29 then
            v27[v28 + 1] = v29
        end
        local v47 = #v27
        local v48 = p17.LeaderboardData.users
        local function v84(p49, p50) --[[ Line: 119 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u7
                [3] = u4
                [4] = u8
                [5] = u16
                [6] = u5
                [7] = u13
                [8] = u15
                [9] = u22
            --]]
            local v51
            if p49.statRank then
                v51 = p49.statRank.rankStatValue
            else
                v51 = p49.statValue
            end
            local v52 = tostring(v51)
            local v53 = u19
            if v53 ~= nil then
                v53 = v53.statsType
            end
            if v53 == "time" then
                v52 = u7.formatCountdownTime(p49.statValue)
            end
            local v54 = {
                ["Size"] = UDim2.new(0.98, 0, 0, 38),
                ["LayoutOrder"] = p50
            }
            local v55 = {}
            local v56 = #v55
            local v57 = {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.new(1, 0, 1, 0),
                ["BackgroundColor3"] = u4.hexColor(7567033)
            }
            local v58 = { u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 5)
                }) }
            local v59 = #v58
            local v60
            if p50 < 3 then
                local v61 = u8.createFragment
                local v62 = {}
                local v63 = u8.createElement
                local v64 = "ImageLabel"
                local v65 = {
                    ["BackgroundTransparency"] = 1,
                    ["Rotation"] = -25,
                    ["Position"] = UDim2.fromOffset(-10, -12),
                    ["Size"] = UDim2.fromOffset(26, 20.8),
                    ["Image"] = u16.Image,
                    ["ImageRectOffset"] = u16.ImageRectOffset,
                    ["ImageRectSize"] = u16.ImageRectSize
                }
                local v66
                if p50 == 0 then
                    v66 = Color3.fromRGB(255, 192, 79)
                elseif p50 == 1 then
                    v66 = Color3.fromRGB(229, 206, 172)
                else
                    v66 = Color3.fromRGB(255, 142, 80)
                end
                v65.ImageColor3 = v66
                v62.CrownIcon = v63(v64, v65)
                v60 = v61(v62)
            else
                v60 = nil
            end
            if v60 then
                v58[v59 + 1] = v60
            end
            local _ = #v58
            local v67 = {
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v68 = { u8.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 10)
                }), (u8.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0, 10),
                    ["PaddingRight"] = UDim.new(0, 10)
                })) }
            local v69 = u8.createElement
            local v70 = u5
            local v71 = {
                ["Size"] = UDim2.new(0.6, 0, 1, 0)
            }
            local v72 = { (u8.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 10)
                })) }
            local v73 = u8.createElement
            local v74 = {
                ["AutomaticSize"] = "XY",
                ["BackgroundTransparency"] = 1,
                ["TextSize"] = 18,
                ["LayoutOrder"] = 1
            }
            local v75 = p50 + 1
            v74.Text = tostring(v75)
            v74.FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold)
            v74.TextXAlignment = Enum.TextXAlignment.Left
            v74.TextColor3 = u13.textPrimary
            v72.LeaderboardRank = v73("TextLabel", v74)
            v72.PlayerAvatar = u8.createElement("ImageLabel", {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromOffset(24, 24),
                ["BackgroundColor3"] = Color3.new(0.95, 0.95, 0.95),
                ["Image"] = p49.avatarImage
            }, { u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }) })
            v72.PlayerUsername = u8.createElement("TextLabel", {
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["AutoLocalize"] = false,
                ["LayoutOrder"] = 3,
                ["Text"] = "<b><font color=\"rgb(185, 188, 255)\">@</font></b>" .. p49.username,
                ["Font"] = Enum.Font.RobotoMono,
                ["Size"] = UDim2.new(1, -60, 0, 18),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            })
            v68.PlayerContainer = v69(v70, v71, v72)
            local _ = #v68
            local v76 = {
                ["Size"] = UDim2.new(0.4, -10, 1, 0)
            }
            local v77 = { u8.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 10)
                }) }
            local v78 = #v77
            local v79 = p49.statRank
            if v79 then
                v79 = u8.createElement(u15, {
                    ["LayoutOrder"] = 1,
                    ["StatRank"] = p49.statRank
                })
            end
            if v79 then
                v77[v78 + 1] = v79
            end
            local _ = #v77
            local v80 = {}
            local v81 = string.gsub(string.reverse((string.gsub(string.reverse(v52), "%d%d%d", "%1,"))), "^,", "")
            local v82 = u19
            if v82 ~= nil then
                v82 = v82.metric
            end
            v80.Text = v81 .. " " .. tostring(v82)
            v80.AutomaticSize = Enum.AutomaticSize.XY
            v80.BackgroundTransparency = 1
            v80.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            v80.TextSize = 14
            v80.TextXAlignment = Enum.TextXAlignment.Right
            v80.TextColor3 = u13.textPrimary
            v80.LayoutOrder = 2
            v77.StatValue = u8.createElement("TextLabel", v80)
            v68.StatValuesContainer = u8.createElement(u5, v76, v77)
            v58.UserLeaderBoardDataContainer = u8.createElement(u5, v67, v68)
            v55.LeaderboardElementBody = u8.createElement("Frame", v57, v58)
            local v83
            if p50 + 1 == 3 then
                v83 = u8.createElement(u22)
            else
                v83 = nil
            end
            if v83 then
                v55[v56 + 1] = v83
            end
            return u8.createFragment({
                ["LeaderboardElementContainer"] = u8.createElement(u5, v54, v55)
            })
        end
        local v85 = table.create(#v48)
        for v86, v87 in v48 do
            v85[v86] = v84(v87, v86 - 1, v48)
        end
        for v88, v89 in v85 do
            v27[v47 + v88] = v89
        end
        return u8.createElement(u3, v24, v27)
    end)
}
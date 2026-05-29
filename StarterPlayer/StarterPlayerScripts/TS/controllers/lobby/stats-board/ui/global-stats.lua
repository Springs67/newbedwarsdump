local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking").TrackType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking-util").StatTrackingUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u9 = v1.import(script, script.Parent, "advanced-stats").AdvancedStats
local u10 = v1.import(script, script.Parent, "section-title").SectionTitle
return {
    ["GlobalStats"] = v5.new(u4)(function(p11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u3
            [3] = u4
            [4] = u8
            [5] = u10
            [6] = u2
            [7] = u9
            [8] = u6
        --]]
        local v13, u14 = p12.useState(false)
        local v15 = p11.Queues or p11.store.Leaderboard.queues
        local v16 = p11.GlobalStats or p11.store.Leaderboard.globalStats
        local v17 = p11.Honor
        if v17 == nil then
            v17 = p11.store.Lobby.profileData
            if v17 ~= nil then
                v17 = v17.honor
            end
        end
        local v18 = u7.getAccumulatedQueueStats(u3.entries(v15))
        if v16 ~= nil then
            v16 = v16.wins
        end
        local v19
        if v17 == nil then
            v19 = v17
        else
            v19 = v17.honorPointsReceived
        end
        local v20 = v19 == nil and 0 or v19
        if v17 ~= nil then
            v17 = v17.honorPointsGiven
        end
        local _ = v17 == nil and 0 or v17
        local function v24(p21, p22, p23) --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u8
            --]]
            return u4.createElement("Frame", {
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.new(0.24, 0, 0, 0),
                ["AutomaticSize"] = Enum.AutomaticSize.Y,
                ["BackgroundColor3"] = u8.backgroundSecondary,
                ["LayoutOrder"] = p23
            }, {
                u4.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 4)
                }),
                u4.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 3)
                }),
                u4.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0, 8),
                    ["PaddingBottom"] = UDim.new(0, 8),
                    ["PaddingLeft"] = UDim.new(0.075, 0),
                    ["PaddingRight"] = UDim.new(0.075, 0)
                }),
                u4.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextSize"] = 15,
                    ["TextTransparency"] = 0.4,
                    ["Text"] = p21,
                    ["AutomaticSize"] = Enum.AutomaticSize.XY,
                    ["Position"] = UDim2.new(0, 10, 0.5, 0),
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextColor3"] = u8.textPrimary
                }),
                u4.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextSize"] = 19,
                    ["Text"] = tostring(p22),
                    ["AutomaticSize"] = Enum.AutomaticSize.XY,
                    ["Position"] = UDim2.new(0, 10, 0.5, 0),
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                })
            })
        end
        local v25 = {
            ["Wins"] = {
                ["layoutOrder"] = 1,
                ["value"] = v16
            },
            ["Bed Breaks"] = {
                ["layoutOrder"] = 2,
                ["value"] = v18.bedBreaks
            },
            ["Final Kills"] = {
                ["layoutOrder"] = 3,
                ["value"] = v18.finalKills
            },
            ["Honor"] = {
                ["layoutOrder"] = 4,
                ["value"] = v20
            }
        }
        local v26 = {
            ["Size"] = UDim2.new(1, 0, 0, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y
        }
        local v28 = { u4.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 12)
            }), u4.createElement(u10, {
                ["title"] = "Global Totals",
                ["SectionDivider"] = true,
                ["Checkbox"] = {
                    ["Text"] = "Show Advanced Stats",
                    ["Value"] = v13,
                    ["SetValue"] = function(p27) --[[ Name: SetValue, Line 135 ]]
                        --[[
                        Upvalues:
                            [1] = u14
                        --]]
                        u14(p27)
                    end
                }
            }) }
        local v29 = #v28
        local v30 = {
            ["Size"] = UDim2.new(1, 0, 0, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y
        }
        local v31 = { u4.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 8)
            }) }
        local v32 = #v31
        local v33 = u3.entries(v25)
        local v34 = table.create(#v33)
        for v35, v36 in v33 do
            local _ = v35 - 1
            local v37 = v36[1]
            local v38 = v36[2]
            local v39 = v38.value
            v34[v35] = v24(v37, v39 == nil and 0 or v39, v38.layoutOrder)
        end
        local v40 = {
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.new(1, 0, 0, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y
        }
        local v41 = { u4.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 8)
            }) }
        local v42 = #v41
        for v43, v44 in v34 do
            v41[v42 + v43] = v44
        end
        v31[v32 + 1] = u4.createElement(u2, v40, v41)
        v31[v32 + 2] = u4.createElement(u9, {
            ["Global"] = true,
            ["FrameProps"] = {
                ["LayoutOrder"] = 2,
                ["Visible"] = v13
            },
            ["QueueStats"] = v18,
            ["Exclude"] = { u6.FINALKILLS, u6.BEDBREAKS }
        })
        v28[v29 + 1] = u4.createElement(u2, v30, v31)
        return u4.createElement(u2, v26, v28)
    end)
}
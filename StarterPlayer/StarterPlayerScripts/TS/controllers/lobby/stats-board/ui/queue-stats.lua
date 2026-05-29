local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-meta").getGameMeta
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking").TrackType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u11 = v1.import(script, script.Parent, "advanced-stats").AdvancedStats
local u12 = v1.import(script, script.Parent, "section-title").SectionTitle
return {
    ["QueueStatsDisplay"] = v6.new(u5)(function(p13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u7
            [3] = u9
            [4] = u5
            [5] = u10
            [6] = u3
            [7] = u12
            [8] = u4
            [9] = u11
        --]]
        local v15, u16 = p14.useState(false)
        local v17 = p13.Queues or p13.store.Leaderboard.queues
        local v18 = u8(p13.QueueType)
        local v19 = v18.title
        local v20 = v17[p13.QueueType]
        local v21
        if v20 == nil then
            v21 = v20
        else
            v21 = v20.wins
        end
        local v22
        if v20 == nil then
            v22 = v20
        else
            v22 = v20.bedBreaks
        end
        local v23
        if v20 == nil then
            v23 = v20
        else
            v23 = v20.finalKills
        end
        local v24
        if v20 == nil then
            v24 = v20
        else
            v24 = v20.highestWinStreak
        end
        local v25
        if v20 == nil then
            v25 = v20
        else
            v25 = v20.currentWinStreak
        end
        local v26 = u7(v18.game)
        local v27 = {}
        local v28 = #v27
        local v29 = v18.excludedStats or {}
        local v30 = #v29
        table.move(v29, 1, v30, v28 + 1, v27)
        local v31 = v28 + v30
        local v32 = v26.excludedStats or {}
        table.move(v32, 1, #v32, v31 + 1, v27)
        local v33 = u9.BEDBREAKS
        local v34 = table.find(v27, v33) ~= nil
        local v35 = v18.disabledFeatures
        if v35 ~= nil then
            v35 = v35.disableTitan
        end
        if v35 then
            local v36 = u9.TITANKILLS
            table.insert(v27, v36)
        end
        local v37 = v18.disabledFeatures
        if v37 ~= nil then
            v37 = v37.disableDiamondGuardians
        end
        if v37 then
            local v38 = u9.DIAMONDGUARDIANKILLS
            table.insert(v27, v38)
        end
        local v39 = v18.disabledFeatures
        if v39 ~= nil then
            v39 = v39.disableEnchantTable
        end
        if v39 then
            local v40 = u9.ENCHANTS
            table.insert(v27, v40)
        end
        local function v45(p41, p42, p43, p44) --[[ Line: 85 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u10
            --]]
            return u5.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextSize"] = 16,
                ["RichText"] = true,
                ["Text"] = p41 .. "  <b>" .. p42 .. ":</b> <font color=\"" .. u10.textPrimaryRichText .. "\">" .. tostring(p43) .. "</font>",
                ["AutomaticSize"] = Enum.AutomaticSize.XY,
                ["Font"] = Enum.Font.Roboto,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["LayoutOrder"] = p44
            })
        end
        local function v59(p46) --[[ Line: 98 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u5
            --]]
            local v47 = p46.statElements
            local v48 = p46.xSize
            local v49 = p46.layoutOrder
            local v50 = p46.minSize
            local v51 = table.create(#v47)
            for v52, v53 in v47 do
                local _ = v52 - 1
                v51[v52] = v53
            end
            local v54 = {
                ["BackgroundTransparency"] = 0,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.new(v48, 0, 0, 0),
                ["AutomaticSize"] = Enum.AutomaticSize.XY,
                ["BackgroundColor3"] = u3.hexColor(7567033),
                ["LayoutOrder"] = v49
            }
            local v55 = {
                u5.createElement("UISizeConstraint", {
                    ["MinSize"] = v50
                }),
                u5.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 12)
                }),
                u5.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 3)
                }),
                u5.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0, 12),
                    ["PaddingBottom"] = UDim.new(0, 12),
                    ["PaddingLeft"] = UDim.new(0, 16),
                    ["PaddingRight"] = UDim.new(0, 16)
                })
            }
            local v56 = #v55
            for v57, v58 in v51 do
                v55[v56 + v57] = v58
            end
            return u5.createElement("Frame", v54, v55)
        end
        local v60 = {
            ["Size"] = UDim2.new(1, 0, 0, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y,
            ["LayoutOrder"] = p13.LayoutOrder
        }
        local v62 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 8)
            }), u5.createElement(u12, {
                ["title"] = v19,
                ["Checkbox"] = {
                    ["Text"] = "Show Advanced Stats",
                    ["Value"] = v15,
                    ["SetValue"] = function(p61) --[[ Name: SetValue, Line 165 ]]
                        --[[
                        Upvalues:
                            [1] = u16
                        --]]
                        u16(p61)
                    end
                }
            }) }
        local v63 = #v62
        local v64 = {
            ["Size"] = UDim2.new(1, 0, 0, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y
        }
        local v65 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 8)
            }) }
        local v66 = #v65
        local v67 = not v34
        if v67 then
            v67 = u5.createElement(v59, {
                ["xSize"] = 1,
                ["layoutOrder"] = 0,
                ["statElements"] = { v45("\240\159\143\134", "Wins", v21, 1) }
            })
        end
        if v67 then
            v65[v66 + 1] = v67
        end
        local v68 = #v65
        local v69 = v68 + 1
        local v70 = u5.createElement
        local v71 = u4
        local v72 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y
        }
        local v73 = {}
        local v74 = u5.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 8)
        })
        local v75 = u5.createElement
        local v76 = {
            ["xSize"] = 0.491,
            ["layoutOrder"] = 1
        }
        local v77
        if v34 then
            v77 = { v45("\240\159\143\134", "Wins", v21, 1), v45("\240\159\142\150\239\184\143", "Final Kills", v23, 2) }
        else
            v77 = { v45("\240\159\155\143\239\184\143", "Bed Breaks", v22, 1), v45("\240\159\142\150\239\184\143", "Final Kills", v23, 2) }
        end
        v76.statElements = v77
        __set_list(v73, 1, {v74, v75(v59, v76), u5.createElement(v59, {
    ["xSize"] = 0.491,
    ["layoutOrder"] = 1,
    ["statElements"] = { v45("\240\159\148\165", "Highest", v24, 1), v45("\240\159\148\165", "Current", v25, 2) }
})})
        v65[v69] = v70(v71, v72, v73)
        if v20 then
            local v78 = {
                ["FrameProps"] = {
                    ["LayoutOrder"] = 2,
                    ["Visible"] = v15
                },
                ["QueueStats"] = v20,
                ["GameType"] = v18.game
            }
            local v79 = {}
            local v80 = #v79
            local v81 = #v27
            table.move(v27, 1, v81, v80 + 1, v79)
            local v82 = v80 + v81
            v79[v82 + 1] = u9.BEDBREAKS
            v79[v82 + 2] = u9.FINALKILLS
            v78.Exclude = v79
            v20 = u5.createElement(u11, v78)
        end
        if v20 then
            v65[v68 + 2] = v20
        end
        v62[v63 + 1] = u5.createElement(u4, v64, v65)
        return u5.createElement(u4, v60, v62)
    end)
}
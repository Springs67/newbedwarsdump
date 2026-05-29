local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").RegionValues
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-queue-util").TournamentQueueUtil
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-team-util").TournamentTeamUtil
local u12 = u1.import(script, script.Parent, "tournament-app-match-panel").TournamentAppMatchPanel
return {
    ["TournamentAppMatchHistory"] = v6.new(u5)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u9
            [3] = u11
            [4] = u10
            [5] = u4
            [6] = u1
            [7] = u3
            [8] = u5
            [9] = u8
            [10] = u2
            [11] = u12
        --]]
        local v15 = p14.useState
        local v16 = p14.useEffect
        local v17, u18 = v15(true)
        local v19, u20 = v15(false)
        local v21, u22 = v15({})
        local v23 = u7:getState().Tournament.myTeamDivision
        local v24 = u7:getState().Tournament.myTeamRegion
        local v25 = u7:getState().Tournament.myTeamIcon
        local v26 = v25 or u9.AGNI_ANGRY
        local v27 = u7:getState().Tournament.myTeamName
        local v28 = (v27 == "" or not v27) and "" or u11.convertNameToTag(v27)
        local v29 = not v23 and "" or u11.convertDivisionToText(v23)
        local v30 = (not v24 and "" or u10.convertRegionToText(v24)) .. " Tournament Division - " .. v29
        local v31 = not u13.inATeam and "Tournament" or v30
        local v32 = u10.getFormattedTournamentDate(v24 or u4.NA)
        v16(function() --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u18
                [3] = u1
                [4] = u7
                [5] = u3
                [6] = u22
                [7] = u20
            --]]
            if not u13.inATeam then
                u18(false)
            end
            u1.async(function() --[[ Line: 43 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u3
                    [3] = u22
                    [4] = u18
                    [5] = u20
                --]]
                local v33 = u7:getState().Tournament.myTeamId
                if v33 == "" or not v33 then
                    return nil
                else
                    local v34 = { u3.Controllers.TournamentTeamController:requestTournamentTeamData(v33):await() }
                    if v34[1] and v34[2] then
                        u22(v34[2].matches)
                        u18(false)
                    elseif v34[2] == nil then
                        u20(true)
                        u18(false)
                    end
                end
            end)()
        end, {})
        local v35 = #v21 > 0
        local v36 = {
            ["LayoutOrder"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.6, 1),
            ["BackgroundColor3"] = Color3.fromHex("403E74")
        }
        local v37 = {}
        local v38 = u5.createElement
        local v39 = "ImageLabel"
        local v40 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ImageTransparency"] = 0.96,
            ["ZIndex"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v41
        if v25 then
            v41 = u8[v25].image
        else
            v41 = u8[u9.AFK_TEAMMATE].image
        end
        v40.Image = v41
        v40.ScaleType = Enum.ScaleType.Crop
        v37.TeamIconBackground = v38(v39, v40)
        v37.Gradient = u5.createElement("UIGradient", {
            ["Rotation"] = 60,
            ["Transparency"] = NumberSequence.new(0.6, 1),
            ["Color"] = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromHex("585497"))
        })
        __set_list(v37, 1, {(u5.createElement("UICorner", {
    ["CornerRadius"] = UDim.new(0, 6)
}))})
        v37.DivisionInformation = u5.createElement("Frame", {
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.9, 0.18),
            ["Position"] = UDim2.fromScale(0.03, 0)
        }, {
            u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 2)
            }),
            ["MatchHistoryTitle"] = u5.createElement("TextLabel", {
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["Text"] = "<b>Match History</b>",
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.9, 0.35),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            }),
            ["DivisionName"] = u5.createElement("TextLabel", {
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["TextTransparency"] = 0.3,
                ["Size"] = UDim2.fromScale(0.9, 0.2),
                ["Text"] = "<b>" .. v31 .. "</b>",
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            }),
            ["Tournament Date"] = u5.createElement("TextLabel", {
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["Font"] = "Roboto",
                ["TextTransparency"] = 0.3,
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(0.9, 0.15),
                ["Text"] = "<b>" .. v32 .. "</b>",
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            })
        })
        v37.Line = u5.createElement("Frame", {
            ["BackgroundTransparency"] = 0.75,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 2,
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(0.5, 0.18),
            ["Size"] = UDim2.fromScale(0.85, 0.003),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        })
        local _ = #v37
        local v42 = {
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.94, 0.78),
            ["Position"] = UDim2.fromScale(0.03, 0.2)
        }
        local v43 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.03, 0)
            }) }
        local v44 = #v43
        local v45
        if v17 then
            v45 = u5.createFragment({
                ["Loading"] = u5.createElement("Frame", {
                    ["LayoutOrder"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 0.8,
                    ["Size"] = UDim2.fromScale(1, 0.15),
                    ["BackgroundColor3"] = u2.WHITE
                }, {
                    u5.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 2)
                    }),
                    ["NoMatchesText"] = u5.createElement("TextLabel", {
                        ["RichText"] = true,
                        ["TextScaled"] = true,
                        ["Text"] = "<b>Loading Match Data</b>",
                        ["Font"] = "Roboto",
                        ["TextXAlignment"] = "Center",
                        ["TextYAlignment"] = "Center",
                        ["BackgroundTransparency"] = 1,
                        ["TextTransparency"] = 0.2,
                        ["LayoutOrder"] = 1,
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(1, 0.2),
                        ["TextColor3"] = u2.WHITE
                    })
                })
            })
        else
            v45 = v17
        end
        if v45 then
            v43[v44 + 1] = v45
        end
        local v46 = #v43
        local v47 = not u13.inATeam
        if v47 then
            v47 = u5.createFragment({
                ["Loading"] = u5.createElement("Frame", {
                    ["LayoutOrder"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 0.8,
                    ["Size"] = UDim2.fromScale(1, 0.15),
                    ["BackgroundColor3"] = u2.WHITE
                }, {
                    u5.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 2)
                    }),
                    ["NoTeamText"] = u5.createElement("TextLabel", {
                        ["RichText"] = true,
                        ["TextScaled"] = true,
                        ["Text"] = "<b>No Matches To Display\n- Join Or Create A Team -</b>",
                        ["Font"] = "Roboto",
                        ["TextXAlignment"] = "Center",
                        ["TextYAlignment"] = "Center",
                        ["BackgroundTransparency"] = 1,
                        ["TextTransparency"] = 0.2,
                        ["LayoutOrder"] = 1,
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(1, 0.4),
                        ["TextColor3"] = u2.WHITE
                    })
                })
            })
        end
        if v47 then
            v43[v46 + 1] = v47
        end
        local v48 = #v43
        local v49
        if v35 then
            v49 = not v17
        else
            v49 = v35
        end
        if v49 then
            v49 = table.create(#v21)
            for v50, v51 in v21 do
                local v52 = v50 - 1
                v49[v50] = u5.createElement(u12, {
                    ["LayoutOrder"] = v52,
                    ["WonMatch"] = v51.won,
                    ["team1Icon"] = v26,
                    ["team1Tag"] = v28,
                    ["tournamentMatch"] = v51
                })
            end
        end
        if v49 then
            for v53, v54 in v49 do
                v43[v48 + v53] = v54
            end
        end
        local v55 = #v43
        local v56 = not (v35 or v17) and (u13.inATeam and not v19)
        if v56 then
            v56 = u5.createFragment({
                ["NoMatches"] = u5.createElement("Frame", {
                    ["LayoutOrder"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 0.8,
                    ["Size"] = UDim2.fromScale(1, 0.15),
                    ["BackgroundColor3"] = u2.WHITE
                }, {
                    u5.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 2)
                    }),
                    ["NoMatchesText"] = u5.createElement("TextLabel", {
                        ["RichText"] = true,
                        ["TextScaled"] = true,
                        ["Text"] = "<b>No Matches To Display</b>",
                        ["Font"] = "Roboto",
                        ["TextXAlignment"] = "Center",
                        ["TextYAlignment"] = "Center",
                        ["BackgroundTransparency"] = 1,
                        ["TextTransparency"] = 0.2,
                        ["LayoutOrder"] = 1,
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(1, 0.2),
                        ["TextColor3"] = u2.WHITE
                    })
                })
            })
        end
        if v56 then
            v43[v55 + 1] = v56
        end
        local v57 = #v43
        local v58 = v19 and u13.inATeam
        if v58 then
            v58 = u5.createFragment({
                ["NoMatches"] = u5.createElement("Frame", {
                    ["LayoutOrder"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 0.8,
                    ["Size"] = UDim2.fromScale(1, 0.15),
                    ["BackgroundColor3"] = u2.WHITE
                }, {
                    u5.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 2)
                    }),
                    ["NoMatchesText"] = u5.createElement("TextLabel", {
                        ["RichText"] = true,
                        ["TextScaled"] = true,
                        ["Text"] = "<b>No Matches To Display</b>",
                        ["Font"] = "Roboto",
                        ["TextXAlignment"] = "Center",
                        ["TextYAlignment"] = "Center",
                        ["BackgroundTransparency"] = 1,
                        ["TextTransparency"] = 0.2,
                        ["LayoutOrder"] = 1,
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(1, 0.2),
                        ["TextColor3"] = u2.WHITE
                    })
                })
            })
        end
        if v58 then
            v43[v57 + 1] = v58
        end
        v37.MatchHistory = u5.createElement("Frame", v42, v43)
        return u5.createFragment({
            ["Left Side - Match History"] = u5.createElement("Frame", v36, v37)
        })
    end)
}
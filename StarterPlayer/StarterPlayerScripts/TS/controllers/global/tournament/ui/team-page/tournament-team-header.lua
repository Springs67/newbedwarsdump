local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.Empty
local u6 = v3.SoundManager
local u7 = v3.TooltipContainer
local u8 = v3.UILayers
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "creative", "custom-match", "host-panel", "components", "host-panel-textbox").HostPanelTextBox
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-queue-util").TournamentQueueUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-team-util").TournamentTeamUtil
return {
    ["TournamentTeamHeader"] = v11.new(u10)(function(u20, p21) --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u9
            [3] = u6
            [4] = u16
            [5] = u2
            [6] = u13
            [7] = u17
            [8] = u8
            [9] = u10
            [10] = u5
            [11] = u14
            [12] = u7
            [13] = u4
            [14] = u15
            [15] = u12
            [16] = u18
        --]]
        local v22 = p21.useState
        local _ = p21.useEffect
        local v23, u24 = v22(u19.convertNameToTag(u20.TeamName))
        local v25, u26 = v22(u20.TeamName)
        local _, u27 = v22("")
        local function u34(u28) --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u19
                [3] = u9
                [4] = u20
                [5] = u26
                [6] = u24
                [7] = u6
                [8] = u16
            --]]
            if u28 == "" then
                u27("Your tournament team must have a name.")
                return nil
            end
            if #u28 > u19.MAX_TEAM_NAME_LENGTH then
                local v29 = u27
                local v30 = u19.MAX_TEAM_NAME_LENGTH
                v29("Your tournament team name must be less than " .. tostring(v30) .. " characters.")
                return nil
            end
            u27("")
            u9.Controllers.TournamentTeamController:updateTournamentTeamName(u20.TeamId, u28):andThen(function(p31) --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u26
                    [3] = u28
                    [4] = u24
                    [5] = u6
                    [6] = u16
                --]]
                if p31.success then
                    u27("")
                    u26(u28)
                    u24(p31.tag)
                else
                    local v32 = u27
                    local v33 = p31.errorMessage
                    v32("Your team name could not be updated. Error: " .. tostring(v33))
                    u6:createSound(u16.ERROR_NOTIFICATION)
                end
            end)
        end
        local function u38() --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u16
                [3] = u2
                [4] = u13
                [5] = u20
                [6] = u17
                [7] = u9
                [8] = u8
            --]]
            u6:playSound(u16.UI_OPEN)
            local v35 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
            local v36 = u13.CONFIRMATION_MODAL
            local v37 = {
                ["Title"] = "Delete " .. u20.TeamName .. "?",
                ["Body"] = "Are you sure you want to delete your Tournament Team \"" .. u20.TeamName .. "\"? This action cannot be undone.",
                ["PrimaryBtnProps"] = {
                    ["Text"] = "Delete Team",
                    ["BackgroundColor3"] = u17.backgroundError
                },
                ["SecondaryBtnProps"] = {
                    ["Text"] = "Cancel",
                    ["BackgroundColor3"] = u17.Gray
                },
                ["OnPrimaryBtnClick"] = function(_) --[[ Name: OnPrimaryBtnClick, Line 63 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u20
                        [3] = u6
                        [4] = u16
                    --]]
                    if ({ u9.Controllers.TournamentTeamController:requestDisbandTournamentTeam(u20.TeamId):await() })[1] then
                        u6:playSound(u16.UI_CLOSE_2)
                    else
                        u6:playSound(u16.ERROR_NOTIFICATION)
                    end
                end,
                ["OnSecondaryBtnClick"] = function() --[[ Name: OnSecondaryBtnClick, Line 72 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u8
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u8.OVERLAY)
                end
            }
            v35:openApp(v36, v37)
        end
        local function u42() --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u16
                [3] = u2
                [4] = u13
                [5] = u20
                [6] = u17
                [7] = u9
                [8] = u8
            --]]
            u6:playSound(u16.UI_OPEN)
            local v39 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
            local v40 = u13.CONFIRMATION_MODAL
            local v41 = {
                ["Title"] = "Leave " .. u20.TeamName .. "?",
                ["Body"] = "Are you sure you want to leave the Tournament Team \"" .. u20.TeamName .. "\"? You cannot rejoin this team without a new invitation.",
                ["PrimaryBtnProps"] = {
                    ["Text"] = "Leave Team",
                    ["BackgroundColor3"] = u17.backgroundError
                },
                ["SecondaryBtnProps"] = {
                    ["Text"] = "Cancel",
                    ["BackgroundColor3"] = u17.Gray
                },
                ["OnPrimaryBtnClick"] = function(_) --[[ Name: OnPrimaryBtnClick, Line 90 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u20
                        [3] = u6
                        [4] = u16
                    --]]
                    if ({ u9.Controllers.TournamentTeamController:leaveTournamentTeam(u20.TeamId):await() })[1] then
                        u6:playSound(u16.UI_CLOSE_2)
                    else
                        u6:playSound(u16.ERROR_NOTIFICATION)
                    end
                end,
                ["OnSecondaryBtnClick"] = function() --[[ Name: OnSecondaryBtnClick, Line 99 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u8
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u8.OVERLAY)
                end
            }
            v39:openApp(v40, v41)
        end
        local v43 = {}
        local _ = #v43
        local v44 = {
            ["LayoutOrder"] = 2,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.3)
        }
        local v45 = { (u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder"
            })) }
        local v46 = u10.createElement
        local v47 = u5
        local v48 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.08, 0.25)
        }
        local v49 = {}
        local v50 = u10.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center"
        })
        local v51
        if u20.IsLocalLeader then
            v51 = u10.createFragment({
                ["DeleteTeam"] = u10.createElement("ImageButton", {
                    ["Size"] = UDim2.fromScale(1, 0.55),
                    ["Image"] = u14.TRASH_ICON,
                    ["ImageColor3"] = Color3.fromHex("DE4A4A"),
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    [u10.Event.Activated] = function() --[[ Line: 134 ]]
                        --[[
                        Upvalues:
                            [1] = u38
                        --]]
                        u38()
                    end,
                    ["SizeConstraint"] = "RelativeYY",
                    ["ScaleType"] = Enum.ScaleType.Fit
                }, { u10.createElement(u7, {}, { u10.createElement(u4, {
                            ["Text"] = "Delete Team",
                            ["TextSize"] = 16,
                            ["Font"] = Enum.Font.SourceSansBold,
                            ["Limits"] = Vector2.new(300, 60),
                            ["TextColor3"] = u17.mcRed
                        }) }) })
            })
        else
            v51 = u10.createFragment({
                ["LeaveTeam"] = u10.createElement("ImageButton", {
                    ["Size"] = UDim2.fromScale(1, 0.55),
                    ["Image"] = u14.KICK_MEMBER_ICON,
                    ["ImageColor3"] = Color3.fromHex("DE4A4A"),
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    [u10.Event.Activated] = function() --[[ Line: 157 ]]
                        --[[
                        Upvalues:
                            [1] = u42
                        --]]
                        u42()
                    end,
                    ["SizeConstraint"] = "RelativeYY",
                    ["ScaleType"] = Enum.ScaleType.Fit
                }, { u10.createElement(u7, {}, { u10.createElement(u4, {
                            ["Text"] = "Leave Team",
                            ["TextSize"] = 16,
                            ["Font"] = Enum.Font.SourceSansBold,
                            ["Limits"] = Vector2.new(300, 60),
                            ["TextColor3"] = u17.mcRed
                        }) }) })
            })
        end
        __set_list(v49, 1, {v50, v51})
        v45["Right Vertical Bar"] = v46(v47, v48, v49)
        local _ = #v45
        local v52 = {
            ["LayoutOrder"] = 1,
            ["Position"] = UDim2.fromScale(0.025, 0.025),
            ["Size"] = UDim2.fromScale(0.9, 0.95)
        }
        local v53 = {
            u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.01, 0)
            }),
            ["TeamIcon"] = u10.createElement(u5, {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.3, 1)
            }, {
                ["EditTeamIcon"] = u10.createElement("ImageLabel", {
                    ["ImageTransparency"] = 0.5,
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 4,
                    ["Size"] = UDim2.fromScale(0.12, 0.12),
                    ["Position"] = UDim2.fromScale(0, 0),
                    ["Image"] = u14.EDIT_FILLED_ICON,
                    ["ImageColor3"] = Color3.fromRGB(255, 255, 255),
                    ["ScaleType"] = Enum.ScaleType.Fit
                }),
                ["Team Icon Image"] = u10.createElement("ImageButton", {
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = u15[u20.TeamIcon].image,
                    ["BackgroundTransparency"] = 0.75,
                    ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
                    ["BorderSizePixel"] = 0,
                    ["ScaleType"] = Enum.ScaleType.Fit,
                    ["ZIndex"] = 3,
                    ["SizeConstraint"] = "RelativeYY",
                    [u10.Event.Activated] = function() --[[ Line: 213 ]]
                        --[[
                        Upvalues:
                            [1] = u20
                        --]]
                        u20.SetOpenEmoteSelectionScreen()
                    end
                }, { u10.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0.1, 0)
                    }) })
            })
        }
        local _ = #v53
        local v54 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.7, 1)
        }
        local v55 = {
            u10.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.03, 0)
            }),
            ["TeamTag"] = u10.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["Text"] = "<b>#" .. v23 .. "</b>",
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            })
        }
        local _ = #v55
        local v56
        if u20.IsLocalLeader then
            local v57 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(0.9, 1),
                ["MaxCharacters"] = u19.MAX_TEAM_NAME_LENGTH
            }
            local v58 = u20.TeamName
            v57.PlaceholderText = v58 == nil and "Your tournament team name" or v58
            function v57.OnFocusLost(p59) --[[ Line: 266 ]]
                --[[
                Upvalues:
                    [1] = u34
                --]]
                u34(p59)
            end
            v57.LeftPadding = 0.02
            v57.TextXAlignment = "Left"
            v57.Font = Enum.Font.Roboto
            v57.TextYAlignment = "Center"
            v57.MaxTextSize = 36
            v56 = u10.createFragment({
                ["EditTeamName"] = u10.createElement(u12, v57)
            })
        else
            v56 = u10.createFragment({
                ["TeamName"] = u10.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Left",
                    ["TextYAlignment"] = "Center",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["ZIndex"] = 3,
                    ["Size"] = UDim2.fromScale(0.9, 1),
                    ["Text"] = v25,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                }, { u10.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 46
                    }) })
            })
        end
        local v60 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.25)
        }
        local v61 = {
            u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["HorizontalAlignment"] = "Left",
                ["Padding"] = UDim.new(0.01, 0)
            }),
            ["EditTeamNameIcon"] = u10.createElement("ImageLabel", {
                ["ImageTransparency"] = 0.5,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 0,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(0.05, 1),
                ["Image"] = u14.EDIT_FILLED_ICON,
                ["ImageColor3"] = Color3.fromRGB(255, 255, 255),
                ["ScaleType"] = Enum.ScaleType.Fit
            }),
            [#v61 + 1] = v56
        }
        v55["Team Name"] = u10.createElement(u5, v60, v61)
        v55["Team Division and Region"] = u10.createElement(u5, {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(1, 0.15)
        }, {
            u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["HorizontalAlignment"] = "Left",
                ["Padding"] = UDim.new(0.01, 0)
            }),
            ["Division"] = u10.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(0.08, 1),
                ["Image"] = u14.TOURNAMENT_DIVISION_ICON,
                ["ScaleType"] = Enum.ScaleType.Fit
            }),
            ["DivisionText"] = u10.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["LayoutOrder"] = 2,
                ["ZIndex"] = 3,
                ["TextXAlignment"] = "Left",
                ["Size"] = UDim2.fromScale(0.3, 1),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["Text"] = u19.convertDivisionToText(u20.Division)
            }, { u10.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 32
                }) }),
            u10.createElement(u5, {
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(0.1, 0)
            }),
            ["Region"] = u10.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 4,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(0.08, 1),
                ["Image"] = u14.TOURNAMENT_REGION_ICON,
                ["ScaleType"] = Enum.ScaleType.Fit
            }),
            ["RegionText"] = u10.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["LayoutOrder"] = 5,
                ["ZIndex"] = 3,
                ["TextXAlignment"] = "Left",
                ["Size"] = UDim2.fromScale(0.25, 1),
                ["Text"] = u18.convertRegionToText(u20.Region),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            }, { u10.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 32
                }) })
        })
        v53.TeamInfo = u10.createElement(u5, v54, v55)
        v45["Team Info Content"] = u10.createElement(u5, v52, v53)
        v43.TournamentTeamHeader = u10.createFragment({
            ["TournamentTeamHeader"] = u10.createElement("Frame", v44, v45)
        })
        return u10.createFragment(v43)
    end)
}
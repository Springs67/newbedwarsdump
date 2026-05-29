local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.Empty
local u6 = v3.OfflinePlayerUtil
local u7 = v3.SoundManager
local u8 = v3.UILayers
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Players
local u14 = v12.RunService
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["TournamentTeamMembers"] = v11.new(u10)(function(u20, p21) --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u13
            [3] = u6
            [4] = u15
            [5] = u7
            [6] = u18
            [7] = u2
            [8] = u16
            [9] = u19
            [10] = u9
            [11] = u8
            [12] = u10
            [13] = u17
            [14] = u5
            [15] = u4
        --]]
        local v22 = p21.useState
        local v23 = p21.useEffect
        local u24 = u14:IsStudio() and true or u13.LocalPlayer.UserId == u20.TeamLeader
        local v25, u26 = v22(nil)
        local v27, u28 = v22({})
        if u14:IsStudio() then
            local v29 = {}
            for v30, v31 in u6.Dummy.oiogy do
                v29[v30] = v31
            end
            v29.InPartyWithLeader = true
            u26(v29)
            local v32 = {}
            for v33, v34 in u6.Dummy.Midciel do
                v32[v33] = v34
            end
            v32.InPartyWithLeader = false
            local v35 = {}
            for v36, v37 in u6.Dummy.spleenhook do
                v35[v36] = v37
            end
            v35.InPartyWithLeader = false
            u28({ v32, v35 })
        end
        v23(function() --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u20
                [3] = u15
                [4] = u26
            --]]
            u6.getOfflinePlayersByUserIds({ u20.TeamLeader }):andThen(function(p38) --[[ Line: 52 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u20
                    [3] = u26
                --]]
                local v39 = {}
                for v40, v41 in p38[1] do
                    v39[v40] = v41
                end
                v39.InPartyWithLeader = u15:getState().Party.leader.userId == u20.TeamLeader
                u26(v39)
            end)
        end, { u20.TeamLeader })
        v23(function() --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u6
                [3] = u15
                [4] = u28
            --]]
            if u20.TeamMembers and #u20.TeamMembers ~= 0 then
                u6.getOfflinePlayersByUserIds(u20.TeamMembers):andThen(function(p42) --[[ Line: 64 ]]
                    --[[
                    Upvalues:
                        [1] = u15
                        [2] = u28
                    --]]
                    local function v49(p43) --[[ Line: 66 ]]
                        --[[
                        Upvalues:
                            [1] = u15
                        --]]
                        local v44 = {}
                        for v45, v46 in p43 do
                            v44[v45] = v46
                        end
                        local v47 = u15:getState().Tournament.leaderPartyMembers
                        local v48 = p43.userId
                        v44.InPartyWithLeader = table.find(v47, v48) ~= nil
                        return v44
                    end
                    local v50 = table.create(#p42)
                    for v51, v52 in p42 do
                        v50[v51] = v49(v52, v51 - 1, p42)
                    end
                    u28(v50)
                end)
            end
        end, { u20.TeamMembers })
        local function u58(p53, u54) --[[ Line: 88 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u18
                [3] = u2
                [4] = u16
                [5] = u19
                [6] = u9
                [7] = u20
                [8] = u8
            --]]
            u7:playSound(u18.UI_OPEN)
            local v55 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
            local v56 = u16.CONFIRMATION_MODAL
            local v57 = {
                ["Title"] = "Kick " .. p53 .. "?",
                ["Body"] = "Are you sure you want to kick " .. p53 .. " from your tournament team? They cannot rejoin this team without a new invitation.",
                ["PrimaryBtnProps"] = {
                    ["Text"] = "Kick Member",
                    ["BackgroundColor3"] = u19.backgroundError
                },
                ["SecondaryBtnProps"] = {
                    ["Text"] = "Cancel",
                    ["BackgroundColor3"] = u19.Gray
                },
                ["OnPrimaryBtnClick"] = function(_) --[[ Name: OnPrimaryBtnClick, Line 101 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u20
                        [3] = u54
                        [4] = u7
                        [5] = u18
                    --]]
                    if ({ u9.Controllers.TournamentTeamController:requestKickTournamentTeamMember(u20.TeamId, u54):await() })[1] then
                        u7:playSound(u18.UI_CLOSE_2)
                    else
                        u7:playSound(u18.ERROR_NOTIFICATION)
                    end
                end,
                ["OnSecondaryBtnClick"] = function() --[[ Name: OnSecondaryBtnClick, Line 110 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u8
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u8.OVERLAY)
                end
            }
            v55:openApp(v56, v57)
        end
        local function v82(u59, p60, p61) --[[ Line: 115 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u10
                [3] = u17
                [4] = u58
                [5] = u5
                [6] = u13
                [7] = u2
            --]]
            local v62, v63
            if u24 and not u59.InPartyWithLeader then
                v62 = "A86464"
                v63 = "NOT IN PARTY"
            else
                v62 = "CFB15A"
                v63 = "IN PARTY"
            end
            local v64 = {
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(0.74, 0.17),
                ["LayoutOrder"] = p60
            }
            local v65 = { u10.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0.015, 0)
                }) }
            local v66 = #v65
            local v67 = not p61 and u24
            if v67 then
                v67 = u10.createFragment({
                    ["KickMember"] = u10.createElement("ImageButton", {
                        ["Image"] = u17.KICK_MEMBER_ICON,
                        ["ImageColor3"] = Color3.fromHex("DE4A4A"),
                        ["ImageTransparency"] = 0,
                        ["Size"] = UDim2.fromScale(0.55, 0.6),
                        ["BackgroundTransparency"] = 1,
                        ["BorderSizePixel"] = 0,
                        ["ZIndex"] = 3,
                        ["LayoutOrder"] = 2,
                        ["ScaleType"] = Enum.ScaleType.Fit,
                        ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                        [u10.Event.Activated] = function() --[[ Line: 152 ]]
                            --[[
                            Upvalues:
                                [1] = u58
                                [2] = u59
                            --]]
                            u58(u59.name, u59.userId)
                        end
                    })
                })
            end
            if v67 then
                v65[v66 + 1] = v67
            end
            local _ = #v65
            local v68 = {
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 3,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            }
            local v69 = { u10.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.45, 0)
                }), u10.createElement("UIGradient", {
                    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("6467A7")), ColorSequenceKeypoint.new(0.38, Color3.fromHex("6467A7")), ColorSequenceKeypoint.new(1, Color3.fromHex(v62)) })
                }) }
            local v70 = #v69
            local v71 = {
                ["Size"] = UDim2.fromScale(0.95, 1),
                ["Position"] = UDim2.fromScale(0.025, 0)
            }
            local v72 = { u10.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["Padding"] = UDim.new(0.03, 0)
                }) }
            local v73 = #v72
            local v74 = {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.1, 1)
            }
            local v75 = {}
            local v76 = #v75
            if p61 then
                p61 = u10.createFragment({
                    ["LeaderCrownIcon"] = u10.createElement("ImageLabel", {
                        ["Rotation"] = -15,
                        ["BackgroundTransparency"] = 1,
                        ["BorderSizePixel"] = 0,
                        ["ZIndex"] = 4,
                        ["Size"] = UDim2.fromScale(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(-0.2, -0.15),
                        ["Image"] = u17.LEADER_CROWN_ICON,
                        ["ImageColor3"] = Color3.fromHex("#FFA800"),
                        ["ScaleType"] = Enum.ScaleType.Fit,
                        ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
                    })
                })
            end
            if p61 then
                v75[v76 + 1] = p61
            end
            local _ = #v75
            local v77 = u10.createElement
            local v78 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v79 = u59.userId
            v78.Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v79) .. "&w=150&h=150"
            v78.ScaleType = Enum.ScaleType.Fit
            v75.MemberImage = v77("ImageLabel", v78)
            v72["Member Image and Name"] = u10.createElement(u5, v74, v75)
            v72["Member Name and Status"] = u10.createElement(u5, {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.6, 0.95)
            }, {
                u10.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["HorizontalAlignment"] = "Left",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0.01, 0)
                }),
                ["Member Name"] = u10.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["LayoutOrder"] = 2,
                    ["ZIndex"] = 3,
                    ["BorderSizePixel"] = 0,
                    ["Text"] = "<b>" .. u59.name .. "</b>",
                    ["Size"] = UDim2.fromScale(1, 0.6),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["TextXAlignment"] = Enum.TextXAlignment.Left
                }, { u10.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 24
                    }) }),
                ["Member Status"] = u10.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["LayoutOrder"] = 2,
                    ["ZIndex"] = 3,
                    ["BorderSizePixel"] = 0,
                    ["Text"] = v63,
                    ["Size"] = UDim2.fromScale(1, 0.4),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["TextXAlignment"] = Enum.TextXAlignment.Left
                }, { u10.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 20
                    }) })
            })
            local v80 = v63 == "NOT IN PARTY" and u24
            if v80 then
                v80 = u10.createFragment({
                    ["Add to Party Button"] = u10.createElement("TextButton", {
                        ["Text"] = "<b>ADD TO PARTY</b>",
                        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                        ["Size"] = UDim2.fromScale(0.23, 0.7),
                        ["BackgroundColor3"] = Color3.fromHex("8C90F1"),
                        ["BorderSizePixel"] = 0,
                        ["LayoutOrder"] = 3,
                        ["ZIndex"] = 4,
                        ["RichText"] = true,
                        [u10.Event.Activated] = function() --[[ Line: 278 ]]
                            --[[
                            Upvalues:
                                [1] = u13
                                [2] = u59
                                [3] = u2
                            --]]
                            local v81 = u13:GetPlayerByUserId(u59.userId)
                            if v81 then
                                u2.resolveDependency("@easy-games/lobby:client/controllers/party-controller@PartyController"):invitePlayer(v81)
                                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                                    ["message"] = "Invited " .. u59.name .. " to your party."
                                })
                            end
                        end
                    }, { u10.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(0.5, 0)
                        }) })
                })
            end
            if v80 then
                v72[v73 + 1] = v80
            end
            v69[v70 + 1] = u10.createElement(u5, v71, v72)
            v65[u59.userId] = u10.createElement("Frame", v68, v69)
            return u10.createFragment({
                [u59.userId] = u10.createElement(u5, v64, v65)
            })
        end
        local v83 = {
            ["ZIndex"] = 3,
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.fromScale(0.95, 0.55),
            ["Position"] = UDim2.fromScale(0.025, 0)
        }
        local v84 = {
            u10.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["Padding"] = UDim.new(0.03, 0)
            }),
            ["Section Title"] = u10.createElement("TextLabel", {
                ["Text"] = "<b>TEAM MEMBERS</b>",
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(1, 0.06),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextXAlignment"] = Enum.TextXAlignment.Left
            }, { u10.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 24
                }) })
        }
        local v85 = #v84
        local v86 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.8)
        }
        local v87 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["Padding"] = UDim.new(0.03, 0)
            }) }
        local _ = #v87
        local v88 = {
            ["ScrollingFrameProps"] = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["CanvasSize"] = UDim2.fromScale(1, 0),
                ["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
            }
        }
        local v89 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["Padding"] = UDim.new(0.03, 0)
            }) }
        local v90 = #v89
        if v25 then
            v25 = v82(v25, 0, true)
        end
        if v25 then
            v89[v90 + 1] = v25
        end
        local v91 = #v89
        local v92 = table.create(#v27)
        for v93, v94 in v27 do
            v92[v93] = v82(v94, v93 - 1 + 1)
        end
        for v95, v96 in v92 do
            v89[v91 + v95] = v96
        end
        v87.MembersList = u10.createElement(u4, v88, v89)
        v84[v85 + 1] = u10.createElement(u5, v86, v87)
        return u10.createFragment({
            ["Team Members"] = u10.createElement(u5, v83, v84)
        })
    end)
}
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.Empty
local u5 = v3.OfflinePlayerUtil
local u6 = v3.SoundManager
local u7 = v3.UILayers
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-team-util").TournamentTeamUtil
return {
    ["TournamentAppIncomingInviteRow"] = v10.new(u9)(function(u18, p19) --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u15
            [3] = u2
            [4] = u12
            [5] = u16
            [6] = u8
            [7] = u7
            [8] = u5
            [9] = u9
            [10] = u4
            [11] = u13
            [12] = u11
            [13] = u14
            [14] = u17
        --]]
        local v20 = p19.useState
        local v21 = p19.useEffect
        local v22, u23 = v20(nil)
        local function u28(u24) --[[ Line: 25 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u15
                [3] = u2
                [4] = u12
                [5] = u16
                [6] = u8
                [7] = u7
            --]]
            u6:playSound(u15.UI_OPEN)
            local v25 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
            local v26 = u12.CONFIRMATION_MODAL
            local v27 = {
                ["Title"] = "Delete invite to " .. u24.teamName .. "?",
                ["Body"] = "Are you sure you want to delete your invitation to the Tournament Team \"" .. u24.teamName .. "\"?",
                ["PrimaryBtnProps"] = {
                    ["Text"] = "Delete Invite",
                    ["BackgroundColor3"] = u16.backgroundError
                },
                ["SecondaryBtnProps"] = {
                    ["Text"] = "Cancel",
                    ["BackgroundColor3"] = u16.Gray
                },
                ["OnPrimaryBtnClick"] = function(_) --[[ Name: OnPrimaryBtnClick, Line 40 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u24
                        [3] = u6
                        [4] = u15
                    --]]
                    if ({ u8.Controllers.TournamentTeamController:declineTournamentTeamInvitation(u24.teamId):await() })[1] then
                        u6:playSound(u15.UI_CLOSE_2)
                    else
                        u6:playSound(u15.ERROR_NOTIFICATION)
                    end
                end,
                ["OnSecondaryBtnClick"] = function() --[[ Name: OnSecondaryBtnClick, Line 49 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u7
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u7.OVERLAY)
                end
            }
            v25:openApp(v26, v27)
        end
        local function u33(u29) --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u15
                [3] = u2
                [4] = u12
                [5] = u16
                [6] = u8
                [7] = u7
            --]]
            u6:playSound(u15.UI_OPEN)
            local v30 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
            local v31 = u12.CONFIRMATION_MODAL
            local v32 = {
                ["Title"] = "Accept invite to " .. u29.teamName .. "?",
                ["Body"] = "Are you sure you want to accept the invitation to the Tournament Team \"" .. u29.teamName .. "\"?",
                ["PrimaryBtnProps"] = {
                    ["Text"] = "Accept Invite",
                    ["BackgroundColor3"] = u16.backgroundSuccess
                },
                ["SecondaryBtnProps"] = {
                    ["Text"] = "Cancel",
                    ["BackgroundColor3"] = u16.Gray
                },
                ["OnPrimaryBtnClick"] = function(_) --[[ Name: OnPrimaryBtnClick, Line 68 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u29
                        [3] = u6
                        [4] = u15
                    --]]
                    if ({ u8.Controllers.TournamentTeamController:acceptTournamentTeamInvitation(u29.teamId):await() })[1] then
                        u6:playSound(u15.UI_CLOSE_2)
                    else
                        u6:playSound(u15.ERROR_NOTIFICATION)
                    end
                end,
                ["OnSecondaryBtnClick"] = function() --[[ Name: OnSecondaryBtnClick, Line 77 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u7
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u7.OVERLAY)
                end
            }
            v30:openApp(v31, v32)
        end
        v21(function() --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u18
                [3] = u23
            --]]
            u5.getOfflinePlayersByUserIds({ u18.Invite.invitingPlayer }):andThen(function(p34) --[[ Line: 84 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                u23(p34[1])
            end)
        end, { u18.Invite })
        local v35 = {
            ["ZIndex"] = 3,
            ["Size"] = UDim2.fromScale(0.9, 0.2),
            ["LayoutOrder"] = u18.Index
        }
        local v36 = { (u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.01, 0)
            })) }
        local v37 = u9.createElement
        local v38 = u4
        local v39 = {
            ["ZIndex"] = 3,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.08, 0.9)
        }
        local v44 = {
            u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Left",
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.05, 0)
            }),
            ["AcceptInviteButton"] = u9.createElement("ImageButton", {
                ["Image"] = u13.ACCEPT_TOURNAMENT_INVITE_ICON,
                ["ImageColor3"] = u16.backgroundSuccess,
                ["Size"] = UDim2.fromScale(0.75, 0.75),
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 4,
                ["LayoutOrder"] = 1,
                [u9.Event.Activated] = function(_) --[[ Line: 123 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                        [2] = u18
                    --]]
                    u33(u18.Invite)
                end,
                [u9.Event.MouseEnter] = function(p40) --[[ Line: 126 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                    --]]
                    u11:Create(p40, TweenInfo.new(0.15), {
                        ["ImageColor3"] = Color3.fromHex("2be067")
                    }):Play()
                end,
                [u9.Event.MouseLeave] = function(p41) --[[ Line: 131 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u16
                    --]]
                    u11:Create(p41, TweenInfo.new(0.15), {
                        ["ImageColor3"] = u16.backgroundSuccess
                    }):Play()
                end
            }),
            ["DenyInviteButton"] = u9.createElement("ImageButton", {
                ["Image"] = u13.DECLINE_TOURNAMENT_INVITE_ICON,
                ["ImageColor3"] = u16.backgroundError,
                ["Size"] = UDim2.fromScale(0.75, 0.75),
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 4,
                ["LayoutOrder"] = 2,
                [u9.Event.Activated] = function(_) --[[ Line: 147 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                        [2] = u18
                    --]]
                    u28(u18.Invite)
                end,
                [u9.Event.MouseEnter] = function(p42) --[[ Line: 150 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                    --]]
                    u11:Create(p42, TweenInfo.new(0.15), {
                        ["ImageColor3"] = Color3.fromHex("f03322")
                    }):Play()
                end,
                [u9.Event.MouseLeave] = function(p43) --[[ Line: 155 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u16
                    --]]
                    u11:Create(p43, TweenInfo.new(0.15), {
                        ["ImageColor3"] = u16.backgroundError
                    }):Play()
                end
            })
        }
        v36.InviteActions = v37(v38, v39, v44)
        local _ = #v36
        local v45 = {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 3,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.9, 1),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        }
        local v46 = {}
        local v47 = u9.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["HorizontalAlignment"] = "Left",
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 0)
        })
        local v48 = u9.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.2, 0)
        })
        local v49 = u9.createElement("UIGradient", {
            ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("6467A7")), ColorSequenceKeypoint.new(0.38, Color3.fromHex("6467A7")), ColorSequenceKeypoint.new(1, Color3.fromHex("CFB15A")) })
        })
        local v50 = u9.createElement
        local v51 = u4
        local v52 = {
            ["Size"] = UDim2.fromScale(0.7, 0.95),
            ["Position"] = UDim2.fromScale(0.025, 0)
        }
        local v53 = { (u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0.03, 0)
            })) }
        local v54 = u9.createElement
        local v55 = u4
        local v56 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.3, 1)
        }
        local v57 = {
            ["TeamIcon"] = u9.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = u14[u18.Invite.teamIcon].image,
                ["ScaleType"] = Enum.ScaleType.Fit
            })
        }
        v53["Team Icon"] = v54(v55, v56, v57)
        local v58 = u9.createElement
        local v59 = u4
        local v60 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.7, 0.95)
        }
        local v61 = {
            u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Top",
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.01, 0)
            }),
            ["Team Tag"] = u9.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["LayoutOrder"] = 2,
                ["ZIndex"] = 3,
                ["BorderSizePixel"] = 0,
                ["Text"] = "<b>#" .. u18.Invite.teamTag .. "</b>",
                ["Size"] = UDim2.fromScale(1, 0.4),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextXAlignment"] = Enum.TextXAlignment.Left
            }, { u9.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 24
                }) }),
            ["Team Name"] = u9.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["LayoutOrder"] = 2,
                ["ZIndex"] = 3,
                ["BorderSizePixel"] = 0,
                ["Text"] = u18.Invite.teamName,
                ["Size"] = UDim2.fromScale(1, 0.25),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextXAlignment"] = Enum.TextXAlignment.Left
            }, { u9.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 20
                }) })
        }
        v53["Team Tag and Name"] = v58(v59, v60, v61)
        __set_list(v46, 1, {v47, v48, v49, v50(v51, v52, v53)})
        local _ = #v46
        local v62 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.3, 0.9),
            ["Position"] = UDim2.fromScale(0.65, 0)
        }
        local v63 = { (u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Top",
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.3, 0)
            })) }
        local v64 = u9.createElement
        local v65 = u4
        local v66 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.25)
        }
        local v67 = {
            u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.01, 0)
            }),
            ["DivisionIcon"] = u9.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(0.2, 1),
                ["Image"] = u13.TOURNAMENT_DIVISION_ICON,
                ["ScaleType"] = Enum.ScaleType.Fit
            }),
            ["Division"] = u9.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["LayoutOrder"] = 2,
                ["ZIndex"] = 3,
                ["BorderSizePixel"] = 0,
                ["Text"] = u17.convertDivisionToText(u18.Invite.division),
                ["Size"] = UDim2.fromScale(0.8, 1),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextXAlignment"] = Enum.TextXAlignment.Left
            })
        }
        v63["Division Info"] = v64(v65, v66, v67)
        local _ = #v63
        local v68 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.4)
        }
        local v69 = { (u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.01, 0)
            })) }
        local v70 = u9.createElement
        local v71 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["ZIndex"] = 3
        }
        local v72 = u18.Invite.invitingPlayer
        v71.Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v72) .. "&w=150&h=150"
        v71.Size = UDim2.fromScale(0.2, 1)
        v71.ScaleType = Enum.ScaleType.Fit
        v69.InvitingPlayerIcon = v70("ImageLabel", v71)
        local _ = #v69
        local v73 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.8, 1)
        }
        local v74 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.01, 0)
            }) }
        local _ = #v74
        local v75 = {}
        if v22 ~= nil then
            v22 = v22.name
        end
        v75.Text = "<b>" .. tostring(v22) .. "</b>"
        v75.Size = UDim2.fromScale(1, 0.6)
        v75.TextColor3 = Color3.fromRGB(255, 255, 255)
        v75.BackgroundTransparency = 1
        v75.TextScaled = true
        v75.TextXAlignment = Enum.TextXAlignment.Left
        v75.RichText = true
        v75.LayoutOrder = 2
        v75.ZIndex = 3
        v75.BorderSizePixel = 0
        v74.InvitingPlayerName = u9.createElement("TextLabel", v75)
        v74.InvitingPlayerStatus = u9.createElement("TextLabel", {
            ["Text"] = "INVITED YOU",
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["LayoutOrder"] = 2,
            ["ZIndex"] = 3,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.4),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["TextXAlignment"] = Enum.TextXAlignment.Left
        })
        v69["Inviting Player Name"] = u9.createElement(u4, v73, v74)
        v63["Inviting player info"] = u9.createElement(u4, v68, v69)
        v46["Team Division and inviting player info"] = u9.createElement(u4, v62, v63)
        v36[u18.Invite.teamId] = u9.createElement("Frame", v45, v46)
        return u9.createFragment({
            [u18.Invite.teamId] = u9.createElement(u4, v35, v36)
        })
    end)
}
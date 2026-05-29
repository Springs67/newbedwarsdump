local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.CalcTotalUIScale
local u6 = v3.ColorUtil
local u7 = v3.DeviceUtil
local u8 = v3.Empty
local u9 = v3.GetUIScaleAncestors
local u10 = v3.PlayerRender
local u11 = v3.TextInputComponent
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u18 = v1.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout
local u19 = v1.import(script, script.Parent, "clan-chat-hoarcekat-messages").ClanChatHoarcekatMessages
return {
    ["ClanProfileChatTab"] = v13.new(u12)(function(_, p20) --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u7
            [3] = u19
            [4] = u2
            [5] = u9
            [6] = u5
            [7] = u14
            [8] = u10
            [9] = u8
            [10] = u6
            [11] = u15
            [12] = u16
            [13] = u4
            [14] = u11
            [15] = u17
            [16] = u18
        --]]
        local v21 = p20.useState
        local v22 = p20.useEffect
        local u23, u24 = v21(true)
        local v25, u26 = v21({})
        local u27, u28 = v21("")
        local u29 = u12.createRef()
        local u30 = u12.createRef()
        v22(function() --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u26
                [3] = u19
                [4] = u29
                [5] = u30
                [6] = u2
                [7] = u9
                [8] = u5
                [9] = u24
            --]]
            if u7.isHoarceKat() then
                u26(u19)
                return nil
            end
            local u31 = u29:getValue()
            if not (u31 and u30:getValue()) then
                return nil
            end
            task.spawn(function() --[[ Line: 41 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u26
                --]]
                local v32 = u2.resolveDependency("client/controllers/lobby/clan/ui/profile/chat-tab/clan-chat-controller@ClanChatController"):getClanChatMessages()
                if v32 then
                    u26(v32)
                end
            end)
            local function u35() --[[ Line: 47 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u31
                    [3] = u5
                    [4] = u24
                --]]
                local v33 = u5((u9(u31)))
                local v34 = (u31.AbsoluteCanvasSize.Y - u31.AbsoluteSize.Y) / v33 - u31.CanvasPosition.Y / v33
                if math.abs(v34) < 1 then
                    u24(true)
                else
                    u24(false)
                end
            end
            local u37 = u2.resolveDependency("client/controllers/lobby/clan/ui/profile/chat-tab/clan-chat-controller@ClanChatController"):clanChatFetchedEvent():Connect(function(p36) --[[ Line: 62 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u26
                --]]
                if not p36 or #p36 == 0 then
                    return nil
                end
                u35()
                u26(p36)
            end)
            local u39 = u2.resolveDependency("client/controllers/lobby/clan/ui/profile/chat-tab/clan-chat-controller@ClanChatController"):clanChatNewMessageEvent():Connect(function(_) --[[ Line: 70 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u26
                --]]
                u35()
                u26(function(p38) --[[ Line: 73 ]]
                    return p38
                end)
            end)
            return function() --[[ Line: 77 ]]
                --[[
                Upvalues:
                    [1] = u37
                    [2] = u39
                --]]
                u37:Disconnect()
                u39:Disconnect()
            end
        end, {})
        local v40 = {
            ["Title"] = "CLAN CHAT",
            ["PaddingBottom"] = true
        }
        local v41 = {}
        local v42 = #v41
        local v43 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v44 = { u12.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 10)
            }) }
        local v45 = #v44
        local v46
        if v25 == nil then
            v46 = v25
        else
            local function v65(p47) --[[ Line: 109 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u12
                    [3] = u10
                    [4] = u8
                    [5] = u6
                    [6] = u15
                    [7] = u16
                --]]
                local v48 = not p47
                if not v48 then
                    local v49
                    if p47 == nil then
                        v49 = p47
                    else
                        v49 = p47.message
                    end
                    if v49 == "" then
                        v49 = false
                    end
                    v48 = not v49
                end
                if v48 then
                    return nil
                end
                local v50 = u14:getState().Clans.myClan
                if v50 ~= nil then
                    local v51 = v50.members
                    local v52 = p47.userId
                    v50 = v51[tostring(v52)]
                    if v50 ~= nil then
                        v50 = v50.rank
                    end
                end
                local v53 = {
                    ["AutomaticSize"] = "Y",
                    ["Size"] = UDim2.new(1, 0, 0, 32)
                }
                local v54 = {
                    u12.createElement("UIListLayout", {
                        ["FillDirection"] = "Horizontal",
                        ["HorizontalAlignment"] = "Left",
                        ["VerticalAlignment"] = "Top",
                        ["SortOrder"] = "LayoutOrder",
                        ["Padding"] = UDim.new(0, 10)
                    }),
                    ["MessageUserAvatar"] = u12.createElement(u10, {
                        ["LayoutOrder"] = 1,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.new(0, 24, 0, 24),
                        ["PlayerUserId"] = p47.userId
                    }, { u12.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(1, 0)
                        }) })
                }
                local _ = #v54
                local v55 = {
                    ["AutomaticSize"] = "Y",
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.new(0.8, 0, 0, 32)
                }
                local v56 = {
                    u12.createElement("UIListLayout", {
                        ["FillDirection"] = "Vertical",
                        ["HorizontalAlignment"] = "Left",
                        ["VerticalAlignment"] = "Top",
                        ["SortOrder"] = "LayoutOrder"
                    }),
                    ["MessageHeader"] = u12.createElement(u8, {
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.new(1, 0, 0, 16)
                    }, {
                        u12.createElement("UIListLayout", {
                            ["FillDirection"] = "Horizontal",
                            ["HorizontalAlignment"] = "Left",
                            ["VerticalAlignment"] = "Bottom",
                            ["SortOrder"] = "LayoutOrder",
                            ["Padding"] = UDim.new(0, 3)
                        }),
                        ["SenderName"] = u12.createElement("TextLabel", {
                            ["AutomaticSize"] = "X",
                            ["TextXAlignment"] = "Left",
                            ["TextScaled"] = true,
                            ["BackgroundTransparency"] = 1,
                            ["LayoutOrder"] = 1,
                            ["Size"] = UDim2.fromScale(0, 1),
                            ["Text"] = p47.displayName,
                            ["TextColor3"] = u6.WHITE,
                            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
                        }, { u12.createElement("UITextSizeConstraint", {
                                ["MaxTextSize"] = 16
                            }) }),
                        ["TimeSent"] = u12.createElement("TextLabel", {
                            ["TextXAlignment"] = "Left",
                            ["TextScaled"] = true,
                            ["TextTransparency"] = 0.3,
                            ["BackgroundTransparency"] = 1,
                            ["LayoutOrder"] = 3,
                            ["Size"] = UDim2.fromScale(0.5, 1),
                            ["Text"] = DateTime.fromUnixTimestamp(p47.time):FormatLocalTime("L LT", "en-us"),
                            ["TextColor3"] = u6.WHITE,
                            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular)
                        }, { u12.createElement("UITextSizeConstraint", {
                                ["MaxTextSize"] = 14
                            }) })
                    })
                }
                local v57 = #v56
                local v58
                if v50 == nil then
                    v58 = false
                else
                    local v59 = u12.createFragment
                    local v60 = {}
                    local v61 = u12.createElement
                    local v62 = {
                        ["AutomaticSize"] = "Y",
                        ["TextXAlignment"] = "Left",
                        ["TextYAlignment"] = "Top",
                        ["TextScaled"] = true,
                        ["TextTransparency"] = 0.3,
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 2,
                        ["Size"] = UDim2.fromScale(1, 0)
                    }
                    local v63 = string.upper
                    local v64 = u15[v50]
                    v62.Text = v63((tostring(v64)))
                    v62.TextColor3 = u16.getClanMemberRankColor(v50) or u6.WHITE
                    v62.FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
                    v60.ClanRank = v61("TextLabel", v62, { u12.createElement("UITextSizeConstraint", {
                            ["MaxTextSize"] = 12
                        }) })
                    v58 = v59(v60)
                end
                if v58 then
                    v56[v57 + 1] = v58
                end
                local _ = #v56
                v56.MessageText = u12.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Left",
                    ["TextYAlignment"] = "Center",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["Text"] = p47.message,
                    ["TextColor3"] = u6.WHITE
                }, { u12.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 16
                    }) })
                v54.MessageWrapper = u12.createElement(u8, v55, v56)
                return u12.createFragment({
                    ["MessageContainer"] = u12.createElement(u8, v53, v54)
                })
            end
            local v66 = 0
            v46 = {}
            for v67, v68 in v25 do
                local v69 = v65(v68, v67 - 1, v25)
                if v69 ~= nil then
                    v66 = v66 + 1
                    v46[v66] = v69
                end
            end
        end
        local v71 = {
            ["AdditionalSpace"] = 6,
            ["ScrollingFrameRef"] = u29,
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0.9, -10)
            },
            ["OnCalc"] = function(p70) --[[ Name: OnCalc, Line 276 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                if u23 then
                    p70.CanvasPosition = Vector2.new(0, p70.AbsoluteCanvasSize.Y)
                end
            end
        }
        local v72 = { u12.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["Padding"] = UDim.new(0, 6),
                [u12.Ref] = u30
            }) }
        local v73 = #v72
        for v74, v75 in v46 do
            v72[v73 + v74] = v75
        end
        v44[v45 + 1] = u12.createElement(u4, v71, v72)
        local v76 = v45 + 2
        local v77 = u12.createElement
        local v78 = u11
        local v81 = {
            ["ClearTextOnEnter"] = true,
            ["MaxCharacters"] = 60,
            ["OnEnter"] = function(p79) --[[ Name: OnEnter, Line 295 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u28
                    [3] = u27
                --]]
                local v80 = u2.resolveDependency("client/controllers/lobby/clan/ui/profile/chat-tab/clan-chat-controller@ClanChatController"):sendMessage(p79)
                if v80.success then
                    if v80.success and u27 ~= "" then
                        u28("")
                    end
                else
                    u28(v80.errorMessage)
                end
            end,
            ["TextBox"] = {
                ["PlaceholderText"] = "Send a message",
                ["LayoutOrder"] = 2,
                ["ClearTextOnFocus"] = false,
                ["Size"] = UDim2.fromScale(1, 0.1),
                ["TextXAlignment"] = Enum.TextXAlignment.Left
            }
        }
        v44[v76] = v77(v78, v81, { u12.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.05, 0),
                ["PaddingBottom"] = UDim.new(0.05, 0),
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0)
            }) })
        v41[v42 + 1] = u12.createElement(u8, v43, v44)
        local v82
        if u27 == "" then
            v82 = false
        else
            local v83 = u12.createFragment
            local v84 = {
                ["ErrorMessage"] = u12.createElement("TextLabel", {
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Left",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 3,
                    ["Position"] = UDim2.fromScale(0, 1.01),
                    ["Size"] = UDim2.new(1, 0, 0, 16),
                    ["Text"] = u27,
                    ["TextColor3"] = u17.mcRed
                }, { u12.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 16
                    }) })
            }
            v82 = v83(v84)
        end
        if v82 then
            v41[v42 + 2] = v82
        end
        return u12.createElement(u18, v40, v41)
    end)
}
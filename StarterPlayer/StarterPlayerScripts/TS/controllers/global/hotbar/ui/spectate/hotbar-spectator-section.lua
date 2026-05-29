local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.Button
local u5 = v3.ColorUtil
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.Padding
local u9 = v3.ShineEffect
local u10 = v3.ShineEffectVariation
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").QueueState
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u17 = v16.Players
local u18 = v16.RunService
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent, "creative", "custom-match", "custom-match-team-button").CustomMatchTeamButton
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u26 = v1.import(script, script.Parent.Parent, "kit", "hotbar-kit-viewport").HotbarKitViewport
local v68 = v14.new(u13)(function(u27, p28) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u22
        [3] = u17
        [4] = u12
        [5] = u6
        [6] = u11
        [7] = u25
        [8] = u13
        [9] = u5
        [10] = u2
        [11] = u9
        [12] = u10
        [13] = u7
        [14] = u8
        [15] = u4
        [16] = u24
        [17] = u23
        [18] = u21
        [19] = u20
        [20] = u26
        [21] = u19
    --]]
    local v29 = p28.useState
    local v30 = p28.useEffect
    local v31, u32 = v29(true)
    local v33, u34 = v29(false)
    local v35, u36 = v29(u18:IsStudio() and true or false)
    local v37
    if u27.QueueType then
        v37 = u22[u27.QueueType]
    else
        v37 = nil
    end
    local v38
    if u17.LocalPlayer then
        v38 = u27.QueueType ~= nil
        if u27.PartyQueueState ~= u12.NONE then
            v38 = false
        end
        local v39 = u27.QueueType
        if v39 then
            if v37 == nil then
                v39 = v37
            else
                v39 = v37.disabled
            end
        end
        if v39 then
            v38 = false
        end
    else
        v38 = true
    end
    local v40
    if u6.isHoarceKat() then
        v40 = nil
    else
        v40 = u11.Controllers.MatchController:getCustomMatchConfig()
    end
    local v41
    if v40 then
        v41 = u17.LocalPlayer.UserId == v40.hostUserId
    else
        v41 = v40
    end
    local v42 = (u18:IsStudio() or u25.isStaging()) and true or not v40
    v30(function() --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u32
            [3] = u11
            [4] = u17
            [5] = u34
            [6] = u36
        --]]
        if u6.isHoarceKat() then
            return nil
        end
        u32(u11.Controllers.SpectateUIController:getButtonsVisibility())
        local u44 = u11.Controllers.SpectateUIController.buttonVisibilityUpdate:Connect(function(p43) --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u32
            --]]
            u32(p43)
        end)
        u34(u17.LocalPlayer:GetAttribute("SpectatorAllowPickTeam") == true)
        u17.LocalPlayer:GetAttributeChangedSignal("SpectatorAllowPickTeam"):Connect(function() --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u34
            --]]
            u34(u17.LocalPlayer:GetAttribute("SpectatorAllowPickTeam") == true)
        end)
        u36(u17.LocalPlayer:GetAttribute("Eliminated") == true)
        u17.LocalPlayer:GetAttributeChangedSignal("Eliminated"):Connect(function() --[[ Line: 88 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u36
            --]]
            u36(u17.LocalPlayer:GetAttribute("Eliminated") == true)
        end)
        return function() --[[ Line: 92 ]]
            --[[
            Upvalues:
                [1] = u44
            --]]
            u44:Disconnect()
        end
    end, {})
    local v45 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Modal"] = true,
        ["Size"] = UDim2.fromScale(1, u6.isSmallScreen() and 0.7 or 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v46 = { u13.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 3)
        }) }
    local v47 = #v46
    local v48 = {
        ["LayoutOrder"] = 0,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v49 = { u13.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["HorizontalFlex"] = "SpaceBetween",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.01, 0)
        }) }
    local v50 = #v49
    if v31 then
        if v38 then
            if v40 == nil then
                v38 = u13.createFragment({ u13.createElement("ImageButton", {
                        ["Size"] = UDim2.fromScale(0.344, 1.4),
                        ["BackgroundColor3"] = u5.WHITE,
                        ["BorderSizePixel"] = 0,
                        ["LayoutOrder"] = 6,
                        [u13.Event.Activated] = function() --[[ Line: 135 ]]
                            --[[
                            Upvalues:
                                [1] = u27
                                [2] = u17
                                [3] = u2
                                [4] = u11
                            --]]
                            if u27.PartyLeaderUserId ~= u17.LocalPlayer.UserId then
                                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                                    ["message"] = "Only the Party Leader can enter the queue."
                                })
                                return nil
                            end
                            u11.Controllers.QueueController:joinQueue(u27.QueueType)
                        end
                    }, {
                        u13.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 4.65,
                            ["DominantAxis"] = "Height"
                        }),
                        u13.createElement(u9, {
                            ["Loop"] = false,
                            ["OnHover"] = true,
                            ["Color"] = u5.WHITE,
                            ["Variation"] = u10.solid
                        }),
                        u13.createElement("UIStroke", {
                            ["Thickness"] = 2,
                            ["Color"] = Color3.fromRGB(114, 255, 120)
                        }, { u13.createElement("UIGradient", {
                                ["Rotation"] = -90,
                                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
                            }) }),
                        u13.createElement("UIGradient", {
                            ["Rotation"] = 90,
                            ["Color"] = ColorSequence.new(Color3.fromRGB(35, 218, 53), Color3.fromRGB(54, 235, 94))
                        }),
                        ["Content"] = u13.createElement(u7, {
                            ["Size"] = UDim2.fromScale(1, 1)
                        }, { u13.createElement("UIListLayout", {
                                ["FillDirection"] = "Horizontal",
                                ["VerticalAlignment"] = "Center",
                                ["HorizontalAlignment"] = "Center"
                            }), u13.createElement(u8, {
                                ["Padding"] = UDim.new(0, 6)
                            }), u13.createElement("TextLabel", {
                                ["Text"] = "<b>PLAY AGAIN</b>",
                                ["Font"] = "Roboto",
                                ["TextSize"] = 18,
                                ["TextScaled"] = true,
                                ["BackgroundTransparency"] = 1,
                                ["RichText"] = true,
                                ["Size"] = UDim2.fromScale(0.7, 0.75),
                                ["TextColor3"] = u5.WHITE
                            }) })
                    }) })
            else
                v38 = false
            end
        end
    else
        v38 = v31
    end
    if v38 then
        v49[v50 + 1] = v38
    end
    local v51 = #v49
    if v31 then
        if v41 then
            v41 = u13.createFragment({ u13.createElement(u4, {
                    ["Text"] = "<b>RESTART</b>",
                    ["LayoutOrder"] = 8,
                    ["Size"] = UDim2.fromScale(0.28, 1),
                    ["BackgroundColor3"] = u24.backgroundSuccess,
                    ["OnClick"] = function() --[[ Name: OnClick, Line 201 ]]
                        --[[
                        Upvalues:
                            [1] = u23
                            [2] = u2
                        --]]
                        u23.Client:GetNamespace("CustomMatches"):Get("RestartCustomMatch"):CallServerAsync():expect()
                        u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                            ["message"] = "Restarting match..."
                        })
                    end
                }, { u13.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 3.795918367346939,
                        ["DominantAxis"] = "Height"
                    }) }) })
        end
    else
        v41 = v31
    end
    if v41 then
        v49[v51 + 1] = v41
    end
    local v52 = #v49
    local v53
    if v31 then
        v53 = u13.createFragment({ u13.createElement(u4, {
                ["Text"] = "<b>LOBBY</b>",
                ["LayoutOrder"] = 2,
                ["BackgroundColor3"] = u24.mcRed,
                ["Size"] = UDim2.fromScale(0.28, 1),
                ["OnClick"] = function() --[[ Name: OnClick, Line 224 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                    --]]
                    u23.Client:Get("TeleportToLobby"):SendToServer()
                end
            }, { u13.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 3.795918367346939,
                    ["DominantAxis"] = "Height"
                }) }) })
    else
        v53 = v31
    end
    if v53 then
        v49[v52 + 1] = v53
    end
    local v54 = #v49
    local v55
    if v31 then
        v55 = u13.createElement(u4, {
            ["Text"] = "<b>KITS</b>",
            ["LayoutOrder"] = 10,
            ["OnClick"] = function() --[[ Name: OnClick, Line 241 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u21
                    [3] = u20
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u21.KIT_SHOP_APP, {
                    ["SelectedKit"] = u20:getState().Bedwars.kit
                })
            end,
            ["Size"] = UDim2.fromScale(0.28, 1)
        }, { u13.createElement(u26, {
                ["store"] = u27.store,
                ["Size"] = UDim2.fromScale(1.5, 1.5),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0.02, 0.48)
            }), u13.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.795918367346939,
                ["DominantAxis"] = "Height"
            }) })
    else
        v55 = v31
    end
    if v55 then
        v49[v54 + 1] = v55
    end
    local v56 = #v49
    if v31 then
        if v35 then
            if v42 then
                v42 = u13.createFragment({ u13.createElement(u4, {
                        ["Text"] = "<b>HONOR</b>",
                        ["LayoutOrder"] = 11,
                        ["Size"] = UDim2.fromScale(0.28, 1),
                        ["BackgroundColor3"] = u24.backgroundSuccess,
                        ["OnClick"] = function() --[[ Name: OnClick, Line 269 ]]
                            --[[
                            Upvalues:
                                [1] = u11
                            --]]
                            u11.Controllers.HonorController:toggleGui(true)
                        end
                    }, { u13.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 3.795918367346939,
                            ["DominantAxis"] = "Height"
                        }) }) })
            end
        else
            v42 = v35
        end
    else
        v42 = v31
    end
    if v42 then
        v49[v56 + 1] = v42
    end
    v46.SpectatorBar = u13.createElement(u7, v48, v49)
    local v57 = v33 and v37
    if v57 then
        local v58 = u27.Teams
        local v59 = table.create(#v58)
        for v60, v61 in v58 do
            local v62 = v60 - 1
            v59[v60] = u13.createElement(u19, {
                ["AppId"] = "CustomMatchTeamButton_" .. v61.id,
                ["Team"] = v61,
                ["QueueMeta"] = v37,
                ["LayoutOrder"] = v62
            })
        end
        local v63 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v64 = { u13.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.02, 0)
            }) }
        local v65 = #v64
        for v66, v67 in v59 do
            v64[v65 + v66] = v67
        end
        v57 = u13.createFragment({
            ["Team Selection Bar"] = u13.createElement(u7, v63, v64)
        })
    end
    if v57 then
        v46[v47 + 1] = v57
    end
    return u13.createElement("ImageButton", v45, v46)
end)
return {
    ["HotbarSpectatorSection"] = v15.connect(function(p69, p70) --[[ Line: 328 ]]
        local v71 = {}
        for v72, v73 in p70 do
            v71[v72] = v73
        end
        v71.store = p69
        v71.PartyLeaderUserId = p69.Party.leader.userId
        v71.PartyQueueState = p69.Party.queueState
        v71.QueueType = p69.Game.queueType
        v71.Teams = p69.Game.teams
        return v71
    end)(v68)
}
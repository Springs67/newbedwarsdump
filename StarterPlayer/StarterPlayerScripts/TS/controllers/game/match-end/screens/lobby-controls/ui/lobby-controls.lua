local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.Button
local u5 = v3.ColorUtil
local u6 = v3.DeviceUtil
local u7 = v3.ShineEffect
local u8 = v3.ShineEffectVariation
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u10 = v9.KnitClient
local u11 = v9.KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.Players
local u16 = v14.RunService
local u17 = v14.TweenService
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent, "match-end-screen-meta").MatchEndScreensMeta
local u24 = nil
local function v61(p25, p26) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u6
        [3] = u11
        [4] = u16
        [5] = u22
        [6] = u23
        [7] = u24
        [8] = u18
        [9] = u17
        [10] = u5
        [11] = u21
        [12] = u4
        [13] = u19
        [14] = u10
        [15] = u15
        [16] = u20
        [17] = u2
        [18] = u7
        [19] = u8
    --]]
    local v27 = p26.useState
    local v28 = p26.useEffect
    local u29, u30 = v27(false)
    local u31, u32 = v27(false)
    local v33, u34 = v27(false)
    local u35, u36 = v27(false)
    local u37 = p25.store.Party.leader.userId
    local u38 = p25.store.Game.queueType
    local u39 = u12.createRef()
    local u40 = u12.createRef()
    local v41 = u6.isSmallScreen() and 30 or 10
    local v42 = u6.isSmallScreen() and 18 or 20
    local v43 = u6.isSmallScreen() and 50 or 65
    local v44
    if u6.isHoarceKat() then
        v44 = nil
    else
        v44 = u11.Controllers.MatchController:getCustomMatchConfig()
    end
    local v45 = (u16:IsStudio() or u22.isStaging()) and true or not v44
    v28(function() --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u40
            [3] = u23
            [4] = u24
            [5] = u36
            [6] = u34
            [7] = u18
            [8] = u30
            [9] = u6
            [10] = u17
        --]]
        local u46 = u39:getValue()
        local u47 = u40:getValue()
        local u48 = nil
        local function u51(p49) --[[ Line: 55 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u48
                [3] = u24
                [4] = u47
                [5] = u36
            --]]
            local v50 = u23[p49].displaySecs
            u48 = u24(v50 == nil and 0 or v50, u47)
            u36(false)
            task.delay(0.1, function() --[[ Line: 62 ]]
                --[[
                Upvalues:
                    [1] = u36
                --]]
                u36(true)
            end)
        end
        u51(1)
        u34(true)
        u18.MatchEndScreenEnd:connect(function(_) --[[ Line: 70 ]]
            --[[
            Upvalues:
                [1] = u48
                [2] = u34
            --]]
            local v52 = u48
            if v52 ~= nil then
                v52:Cancel()
            end
            u34(false)
        end)
        u18.MatchEndScreenStart:connect(function(p53) --[[ Line: 78 ]]
            --[[
            Upvalues:
                [1] = u51
                [2] = u34
            --]]
            u51(p53.matchEndScreenType)
            u34(true)
        end)
        u18.MatchEndScreenStart:connect(function(p54) --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            if p54.matchEndScreenType ~= 6 then
                return nil
            end
            u30(true)
        end)
        task.spawn(function() --[[ Line: 90 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u17
                [3] = u46
            --]]
            if u6.isHoarceKat() then
                task.wait(0.5)
            end
            u17:Create(u46, TweenInfo.new(0.25, Enum.EasingStyle.Cubic), {
                ["Position"] = UDim2.fromScale(0.5, 1)
            }):Play()
        end)
    end, {})
    local v55 = {
        ["Size"] = UDim2.new(1, 0, 0, v43),
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["Position"] = UDim2.fromScale(0.5, 1) + UDim2.fromOffset(0, v43),
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 0,
        ["BackgroundColor3"] = u5.hexColor(1710618),
        [u12.Ref] = u39
    }
    local v56 = {
        ["DisplayTimer"] = u12.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 5)
        }, {
            ["DisplayTimerProgress"] = u12.createElement("Frame", {
                [u12.Ref] = u40,
                ["Size"] = UDim2.fromScale(0, 1),
                ["BorderSizePixel"] = 0,
                ["BackgroundColor3"] = u21.backgroundPrimary,
                ["ZIndex"] = 101,
                ["Visible"] = not u29
            })
        })
    }
    local _ = #v56
    local v57 = {
        ["BackgroundTransparency"] = 1,
        ["ZIndex"] = 100,
        ["Size"] = UDim2.new(1, 0, 1, -20),
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["Position"] = UDim2.new(0, v41, 0.5, 0)
    }
    local v58 = {
        u12.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 10)
        }),
        ["NextButton"] = u12.createElement(u4, {
            ["LayoutOrder"] = 1,
            ["Text"] = "<b>" .. (u29 and (u31 and "HIDE SUMMARY" or "VIEW SUMMARY") or "NEXT") .. "</b>",
            ["BackgroundColor3"] = u21.Gray,
            ["Size"] = UDim2.fromScale(0.28, 1),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["OnClick"] = function() --[[ Name: OnClick, Line 148 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u31
                    [3] = u19
                    [4] = u32
                    [5] = u35
                    [6] = u10
                --]]
                if u29 then
                    if u31 then
                        u19:dispatch({
                            ["type"] = "SetMatchEndSummaryVisible",
                            ["visible"] = false
                        })
                        u32(false)
                    else
                        u19:dispatch({
                            ["type"] = "SetMatchEndSummaryVisible",
                            ["visible"] = true
                        })
                        u32(true)
                    end
                else
                    if u35 then
                        u10.Controllers.MatchEndController:skipCurrDisplay()
                    end
                    return
                end
            end,
            ["TextLabel"] = {
                ["TextScaled"] = false,
                ["TextSize"] = v42
            },
            ["CornerRadius"] = UDim.new(0, 6),
            ["Visible"] = v33 or u29
        }, { u12.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.795918367346939,
                ["DominantAxis"] = "Height"
            }) })
    }
    local v59 = #v58
    local v60 = v45 and (u6.isHoarceKat() and true or not u10.Controllers.SpectateController:isObserver(u15.LocalPlayer))
    if v60 then
        v60 = u12.createFragment({
            ["HonorButton"] = u12.createElement(u4, {
                ["Text"] = "<b>HONOR</b>",
                ["LayoutOrder"] = 2,
                ["BackgroundColor3"] = u21.Gray,
                ["Size"] = UDim2.fromScale(0.28, 1),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["OnClick"] = function() --[[ Name: OnClick, Line 191 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                    --]]
                    u10.Controllers.HonorController:toggleGui(true)
                end,
                ["TextLabel"] = {
                    ["TextScaled"] = false,
                    ["TextSize"] = v42
                },
                ["CornerRadius"] = UDim.new(0, 6),
                ["Visible"] = v33 or u29
            }, { u12.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 3.795918367346939,
                    ["DominantAxis"] = "Height"
                }) })
        })
    end
    if v60 then
        v58[v59 + 1] = v60
    end
    v56.LeftButtons = u12.createElement("Frame", v57, v58)
    v56.RightButtons = u12.createElement("Frame", {
        ["BackgroundTransparency"] = 1,
        ["ZIndex"] = 100,
        ["Size"] = UDim2.new(1, 0, 1, -20),
        ["AnchorPoint"] = Vector2.new(1, 0.5),
        ["Position"] = UDim2.new(1, -v41, 0.5, 0)
    }, {
        u12.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 10)
        }),
        ["LobbyButton"] = u12.createElement(u4, {
            ["Text"] = "<b>LOBBY</b>",
            ["LayoutOrder"] = 1,
            ["BackgroundColor3"] = u21.backgroundSecondary,
            ["Size"] = UDim2.fromScale(0.28, 1),
            ["OnClick"] = function() --[[ Name: OnClick, Line 230 ]]
                --[[
                Upvalues:
                    [1] = u20
                --]]
                u20.Client:Get("TeleportToLobby"):SendToServer()
            end,
            ["TextLabel"] = {
                ["TextScaled"] = false,
                ["TextSize"] = v42
            },
            ["CornerRadius"] = UDim.new(0, 6)
        }, { u12.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.795918367346939,
                ["DominantAxis"] = "Height"
            }) }),
        ["PlayAgainButton"] = u12.createElement("ImageButton", {
            ["Size"] = UDim2.fromScale(0.344, 1),
            ["BackgroundColor3"] = u5.WHITE,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 0,
            [u12.Event.Activated] = function() --[[ Line: 250 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u37
                    [3] = u15
                    [4] = u2
                    [5] = u11
                    [6] = u38
                --]]
                if u6.isHoarceKat() then
                    return nil
                end
                if u37 ~= u15.LocalPlayer.UserId then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        ["message"] = "Only the Party Leader can enter the queue."
                    })
                    return nil
                end
                u11.Controllers.QueueController:joinQueue(u38)
            end
        }, {
            u12.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }),
            u12.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 4.65,
                ["DominantAxis"] = "Height"
            }),
            u12.createElement(u7, {
                ["Loop"] = false,
                ["OnHover"] = true,
                ["Color"] = u5.WHITE,
                ["Variation"] = u8.solid
            }),
            u12.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = ColorSequence.new(Color3.fromRGB(54, 235, 94), Color3.fromRGB(0, 186, 99))
            }),
            u12.createElement("TextLabel", {
                ["Text"] = "<b>PLAY AGAIN</b>",
                ["Font"] = "Roboto",
                ["BackgroundTransparency"] = 1,
                ["RichText"] = true,
                ["Size"] = UDim2.fromScale(0.7, 0.75),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["TextColor3"] = u5.WHITE,
                ["TextSize"] = v42
            })
        })
    })
    return u12.createElement("Frame", v55, v56)
end
u24 = function(p62, u63) --[[ Name: tweenDisplayTimer, Line 295 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v64 = u17:Create(u63, TweenInfo.new(p62 - 0.01, Enum.EasingStyle.Linear), {
        ["Size"] = UDim2.fromScale(1, 1)
    })
    v64:Play()
    v64.Completed:Connect(function() --[[ Line: 300 ]]
        --[[
        Upvalues:
            [1] = u63
        --]]
        u63.Size = UDim2.fromScale(0, 1)
    end)
    return v64
end
local u65 = nil
local function v67(p66) --[[ Line: 306 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u65
    --]]
    return u12.createElement("ScreenGui", {
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = true,
        ["DisplayOrder"] = 150,
        ["ScreenInsets"] = Enum.ScreenInsets.None
    }, { u12.createElement(u65, {
            ["store"] = p66.store,
            ["DisableViewSummary"] = p66.DisableViewSummary
        }) })
end
u65 = v13.new(u12)(v61)
return {
    ["LobbyControlsWrapper"] = v67,
    ["LobbyControls"] = u65
}
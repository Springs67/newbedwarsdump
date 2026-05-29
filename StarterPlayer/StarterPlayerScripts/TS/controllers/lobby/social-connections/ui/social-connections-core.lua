local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DarkBackground
local u6 = v3.DeviceUtil
local u7 = v3.DividerComponent
local u8 = v3.ImageId
local u9 = v3.ScaleComponent
local u10 = v3.SlideIn
local u11 = v3.WidgetComponent
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u16 = v1.import(script, script.Parent, "rewards", "social-connections-reward-section").SocialConnectionsRewardSection
local u17 = v1.import(script, script.Parent, "social-connections-connect-info-card").SocialConnectionsConnectInfoCard
local u18 = v1.import(script, script.Parent, "social-connections-section-title").SocialConnectionsSectionTitle
local u19 = v1.import(script, script.Parent, "verify-discord", "social-connections-discord").SocialConnectionsDiscord
local u20 = v1.import(script, script.Parent, "verify-group", "social-connections-group").SocialConnectionsGroup
return {
    ["SocialConnectionsCore"] = v15.new(u14)(function(u21, p22) --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u2
            [3] = u6
            [4] = u12
            [5] = u14
            [6] = u16
            [7] = u18
            [8] = u19
            [9] = u5
            [10] = u10
            [11] = u9
            [12] = u11
            [13] = u8
            [14] = u17
            [15] = u4
            [16] = u20
            [17] = u7
        --]]
        local _ = p22.useState
        local v23 = p22.useMemo
        local _ = p22.useEffect
        local u24 = true
        for v25, v26 in u13.values(u21.store.SocialConnections.supportTasks) do
            local _ = v25 - 1
            if v26 ~= true then
                u24 = false
                break
            end
        end
        local u27 = true
        for v28, v29 in u13.values(u21.store.SocialConnections.connections) do
            local _ = v28 - 1
            if v29.validated ~= true then
                u27 = false
                break
            end
        end
        local function v30() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u21
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u21.AppId)
        end
        local v35 = v23(function() --[[ Line: 65 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u16
                [3] = u6
                [4] = u12
                [5] = u24
                [6] = u27
            --]]
            local v31 = u14.createElement
            local v32 = u16
            local v33 = {
                ["LayoutOrder"] = 4
            }
            local v34
            if u6.isHoarceKat() or u12.Controllers.SocialConnectionsController.policyDiscordAllowed then
                v34 = (u24 and 1 or 0) + (u27 and 1 or 0)
            else
                v34 = u24 and 1 or 0
            end
            v33.CompletedCount = v34
            return v31(v32, v33)
        end, {
            u24,
            u27,
            u21.store.SocialConnections.connections.discord.verificationCode,
            u21.store.SocialConnections.connections.discord.validated
        })
        local v45 = v23(function() --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u12
                [3] = u14
                [4] = u18
                [5] = u27
                [6] = u19
                [7] = u21
            --]]
            local v36 = {}
            local v37 = #v36
            local v38 = u6.isHoarceKat() and true or u12.Controllers.SocialConnectionsController.policyDiscordAllowed
            if v38 then
                local v39 = u14.createFragment
                local v40 = {}
                local v41 = u14.createElement
                local v42 = {
                    ["AutomaticSize"] = "Y",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.new(1, 0, 0, 0)
                }
                local v43 = {}
                local v44 = {
                    ["Title"] = "<b>2. Verify Discord</b>",
                    ["LayoutOrder"] = 1,
                    ["Completed"] = u27
                }
                __set_list(v43, 1, {u14.createElement("UIListLayout", {
    ["FillDirection"] = Enum.FillDirection.Vertical,
    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
    ["Padding"] = UDim.new(0, 10)
}), u14.createElement(u18, v44), u14.createElement(u19, {
    ["LayoutOrder"] = 2,
    ["store"] = u21.store
})})
                v40.ExternalConnections = v41("Frame", v42, v43)
                v38 = v39(v40)
            end
            if v38 then
                v36[v37 + 1] = v38
            end
            return u14.createFragment(v36)
        end, { u21.store.SocialConnections.connections.discord.verificationCode, u21.store.SocialConnections.connections.discord.validated })
        local v46 = u14.createFragment
        local v47 = {}
        local v48 = u14.createElement(u5, {
            ["AppId"] = u21.AppId
        })
        local v49 = u14.createElement
        local v50 = u10
        local v51 = {}
        local v52 = u14.createElement
        local v53 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromOffset(440, 510)
        }
        local v54 = {}
        local v55 = u14.createElement(u9, {
            ["MaximumSize"] = Vector2.new(550, 630),
            ["ScreenPadding"] = Vector2.new(24, 24)
        })
        local v56 = u14.createElement
        local v57 = u11
        local v58 = {
            ["ClipsDescendents"] = false,
            ["Title"] = "Connections",
            ["AppId"] = u21.AppId,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(1, 1),
            ["TitleIcon"] = u8.SATELITE,
            ["SubTitle"] = u6.isHoarceKat() and "Complete support & verify Discord for a reward" or (u12.Controllers.SocialConnectionsController.policyDiscordAllowed and "Complete support & verify Discord for a reward" or "Complete support section for a reward"),
            ["OnClose"] = v30
        }
        local v59 = {
            u14.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 10)
            }),
            ["SupportConnections"] = u14.createElement("Frame", {
                ["AutomaticSize"] = "Y",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0, 0)
            }, {
                u14.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 8)
                }),
                u14.createElement(u18, {
                    ["Title"] = "<b>1. Support The Game</b>",
                    ["LayoutOrder"] = 1,
                    ["Completed"] = u24
                }),
                u14.createElement(u17, {
                    ["Text"] = "<b>Like</b>, \226\173\144 <b>favorite</b>, and ",
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.new(1, 0, 0, 46),
                    ["ImageId"] = u8.THUMBS_UP_SOLID,
                    ["store"] = u21.store,
                    ["MiddleElementEmbed"] = {
                        ["rightText"] = "<b>follow</b> the game",
                        ["element"] = u14.createElement("Frame", {
                            ["BackgroundTransparency"] = 1,
                            ["Size"] = UDim2.fromOffset(18, 12.65625)
                        }, { u14.createElement("ImageLabel", {
                                ["Rotation"] = 47,
                                ["ScaleType"] = "Fit",
                                ["SizeConstraint"] = "RelativeYY",
                                ["BackgroundTransparency"] = 1,
                                ["Size"] = UDim2.fromOffset(18, 12.65625),
                                ["Image"] = u8.WIFI_SOLID,
                                ["ImageColor3"] = u4.hexColor(16752398)
                            }) })
                    }
                }),
                u14.createElement(u20, {
                    ["store"] = u21.store
                }),
                u14.createElement(u17, {
                    ["Text"] = "<b>Follow</b> us on Twitter <font color=\"#1EA1F2\">@RobloxBedWars</font>",
                    ["LayoutOrder"] = 4,
                    ["Size"] = UDim2.new(1, 0, 0, 46),
                    ["ImageId"] = u8.TWITTER_SOLID
                })
            }),
            v45,
            u14.createElement(u7, {
                ["Margin"] = 2,
                ["LayoutOrder"] = 3
            }),
            v35
        }
        __set_list(v54, 1, {v55, v56(v57, v58, v59)})
        __set_list(v51, 1, {v52("Frame", v53, v54)})
        __set_list(v47, 1, {v48, v49(v50, {}, v51)})
        return v46(v47)
    end)
}
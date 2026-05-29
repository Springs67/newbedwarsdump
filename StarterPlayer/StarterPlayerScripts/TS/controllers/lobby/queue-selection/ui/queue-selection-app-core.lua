local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.ColorUtil
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.ScaleComponent
local u9 = v3.SlideIn
local u10 = v3.WidgetComponent
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").QueueState
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-group-meta").getQueueGroupMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u21 = v1.import(script, script.Parent, "queue-selection-queue-button").QueueSelectionQueueButton
return {
    ["QueueSelectionAppCore"] = v14.new(u13)(function(p22, p23) --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u16
            [3] = u19
            [4] = u12
            [5] = u2
            [6] = u17
            [7] = u15
            [8] = u11
            [9] = u13
            [10] = u8
            [11] = u21
            [12] = u4
            [13] = u7
            [14] = u20
            [15] = u5
            [16] = u6
            [17] = u10
            [18] = u9
        --]]
        local _ = p23.useEffect
        local v24 = u18(p22.QueueSelectionType)
        local function v28(p25) --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u19
                [3] = u12
                [4] = u2
                [5] = u17
                [6] = u15
                [7] = u11
            --]]
            local v26 = u16:getState().Party
            local v27 = u19[p25]
            if v26.queueState ~= u12.NONE then
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = "You are already in another queue. Leave to join " .. v27.title .. "."
                })
                return nil
            end
            u2.resolveDependency("@easy-games/lobby:client/controllers/lobby-queue-controller@LobbyQueueController"):joinQueue(p25)
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u17.QUEUE_SELECTION)
            if u15.LocalPlayer:GetAttribute("GamesPlayed") == 0 then
                u11.Controllers.AnalyticsController:sendFunnelEvent("Onboarding Funnel", nil, 3, "First Queued")
            end
        end
        local v29 = {}
        local v30 = #v29
        local v31 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromOffset(500, 380)
        }
        local v32 = { u13.createElement(u8, {
                ["MaximumSize"] = Vector2.new(789, 543),
                ["ScreenPadding"] = Vector2.new(24, 24)
            }) }
        local v33 = #v32
        local v34 = {
            ["AppId"] = p22.AppId,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(1, 1),
            ["Title"] = v24.title
        }
        local v35 = { u13.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.025, 0)
            }) }
        local v36 = #v35
        local v37 = 0
        local v38 = {}
        for v39, v40 in v24.queues do
            local _ = v39 - 1
            local v41
            if u19[v40].disabled then
                v41 = nil
            else
                v41 = u13.createElement(u21, {
                    ["QueueType"] = v40,
                    ["OnClick"] = v28
                })
            end
            if v41 ~= nil then
                v37 = v37 + 1
                v38[v37] = v41
            end
        end
        local v42 = {
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 1,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Selectable"] = false,
                ["Size"] = UDim2.fromScale(0.55, 1)
            }
        }
        local v43 = { u13.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 6)
            }), u13.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.025, 0)
            }) }
        local v44 = #v43
        for v45, v46 in v38 do
            v43[v44 + v45] = v46
        end
        v35[v36 + 1] = u13.createElement(u4, v42, v43)
        v35[v36 + 2] = u13.createElement(u7, {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.425, 1)
        }, { u13.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["Padding"] = UDim.new(0.025, 0)
            }), u13.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u20.backgroundTertiary
            }, {
                u13.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }),
                u13.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.05, 0),
                    ["PaddingLeft"] = UDim.new(0.06, 0),
                    ["PaddingRight"] = UDim.new(0.06, 0)
                }),
                u13.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["Padding"] = UDim.new(0.025, 0)
                }),
                u13.createElement("TextLabel", {
                    ["SizeConstraint"] = "RelativeXX",
                    ["AutomaticSize"] = "Y",
                    ["BackgroundTransparency"] = 1,
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["TextYAlignment"] = "Top",
                    ["TextXAlignment"] = "Left",
                    ["Text"] = "<b>Description</b>",
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["Font"] = Enum.Font.Roboto,
                    ["TextColor3"] = u5.WHITE
                }, { u13.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = u6.isSmallScreen() and 14 or 18
                    }) }),
                u13.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["TextYAlignment"] = "Top",
                    ["TextXAlignment"] = "Left",
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0.8),
                    ["Font"] = Enum.Font.Roboto,
                    ["TextColor3"] = u5.WHITE,
                    ["Text"] = v24.description
                }, { u13.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = u6.isSmallScreen() and 14 or 18
                    }) })
            }) })
        v32[v33 + 1] = u13.createElement(u10, v34, v35)
        v29[v30 + 1] = u13.createElement("Frame", v31, v32)
        return u13.createElement(u9, {}, v29)
    end)
}
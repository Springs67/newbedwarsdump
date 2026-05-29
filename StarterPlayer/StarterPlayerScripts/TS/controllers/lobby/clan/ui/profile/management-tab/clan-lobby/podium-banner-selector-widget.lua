local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.ColorUtil
local u6 = v3.DividerComponent
local u7 = v3.Empty
local u8 = v3.ScaleComponent
local u9 = v3.WidgetComponent
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "lobby", "clan-podium-banner-meta").getClanPodiumBannerMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "lobby", "clan-podium-banner-types").ClanPodiumBannerType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["PodiumBannerSelectorWidget"] = v12.new(u11)(function(u16) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u15
            [3] = u11
            [4] = u8
            [5] = u2
            [6] = u5
            [7] = u7
            [8] = u6
            [9] = u13
            [10] = u10
            [11] = u4
            [12] = u9
        --]]
        local v17 = u16.store.Clans.myClan
        if v17 ~= nil then
            v17 = v17.clanLobby
            if v17 ~= nil then
                v17 = v17.allPodiumBanners
            end
        end
        local v18 = (v17 == nil or #v17 <= 0) and { u14.DEFAULT } or v17
        local v19 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = u15.widgetSize
        }
        local v20 = { u11.createElement(u8, {
                ["MaximumSize"] = Vector2.new(u15.widgetSize.X.Offset * 1.3, u15.widgetSize.Y.Offset * 1.3),
                ["ScreenPadding"] = Vector2.new(24, 24)
            }) }
        local v21 = #v20
        local v22 = {
            ["ClipsDescendents"] = false,
            ["Title"] = "Clan Profile",
            ["AppId"] = u16.AppId,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(1, 1),
            ["OnClose"] = function() --[[ Name: OnClose, Line 61 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u16
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u16.AppId)
            end,
            ["ContentUIPadding"] = u11.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 0),
                ["PaddingBottom"] = UDim.new(0, 0),
                ["PaddingLeft"] = UDim.new(0, 0),
                ["PaddingRight"] = UDim.new(0, 0)
            })
        }
        local v23 = { u11.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }), u11.createElement("TextLabel", {
                ["Text"] = "Select Lobby Podium Banner",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.1),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family),
                ["TextColor3"] = u5.WHITE
            }, { u11.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) }), u11.createElement(u7, {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(0.85, 0, 0, 6)
            }, { u11.createElement(u6, {
                    ["Position"] = UDim2.fromOffset(0, -10)
                }) }) }
        local v24 = #v23
        local function v38(u25) --[[ Line: 103 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u16
                [3] = u14
                [4] = u5
                [5] = u15
                [6] = u11
                [7] = u10
                [8] = u2
            --]]
            local v26 = u13(u25)
            local v27 = {
                ["BorderSizePixel"] = 0
            }
            local v28 = u16.store.Clans.myClan
            if v28 ~= nil then
                v28 = v28.clanLobby
                if v28 ~= nil then
                    v28 = v28.selectedPodiumBanner
                end
            end
            if v28 == nil then
                v28 = u14.DEFAULT
            end
            local v29
            if v28 == u25 then
                v29 = u5.brighten(u15.backgroundTertiary, 0.1)
            else
                v29 = u15.backgroundTertiary
            end
            v27.BackgroundColor3 = v29
            v27.Image = v26.iconId
            v27[u11.Event.MouseButton1Click] = function() --[[ Line: 109 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u10
                    [3] = u25
                    [4] = u2
                --]]
                if u16.store.Clans.myClanId == nil then
                    return nil
                end
                u10.Controllers.ClanController:selectClanPodiumBanner(u16.store.Clans.myClanId, u25):andThen(function(p30) --[[ Line: 114 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                    --]]
                    if not p30.success then
                        local v31 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
                        local v32 = {}
                        local v33 = p30.errorMessage
                        v32.message = v33 == nil and "An unknown error occurred" or v33
                        v31:sendErrorNotification(v32)
                    end
                end)
            end
            v27.ClipsDescendants = true
            local v34 = { u11.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 5)
                }) }
            local v35 = #v34
            local v36 = false
            local v37 = u16.store.Clans.myClan
            if v37 ~= nil then
                v37 = v37.clanLobby
                if v37 ~= nil then
                    v37 = v37.selectedPodiumBanner
                end
            end
            if v37 == nil then
                v37 = u14.DEFAULT
            end
            if v37 == u25 then
                v36 = u11.createElement("UIStroke", {
                    ["Thickness"] = 3,
                    ["Color"] = u5.WHITE
                })
            end
            if v36 then
                v34[v35 + 1] = v36
            end
            v34[#v34 + 1] = u11.createElement("Frame", {
                ["BackgroundTransparency"] = 0.5,
                ["BorderSizePixel"] = 0,
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Position"] = UDim2.fromScale(0.5, 1),
                ["Size"] = UDim2.fromScale(1, 0.2),
                ["BackgroundColor3"] = u5.BLACK
            }, { u11.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 5)
                }), u11.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["TextColor3"] = u5.WHITE,
                    ["Text"] = v26.title,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center,
                    ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family)
                }, { u11.createElement("UITextSizeConstraint", {
                        ["MinTextSize"] = 8,
                        ["MaxTextSize"] = 16
                    }) }) })
            return u11.createElement("ImageButton", v27, v34)
        end
        local v39 = table.create(#v18)
        for v40, v41 in v18 do
            v39[v40] = v38(v41, v40 - 1, v18)
        end
        local v42 = {
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(0.9, 0.75)
            }
        }
        local v43 = { u11.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 4)
            }), u11.createElement("UIGridLayout", {
                ["FillDirection"] = "Horizontal",
                ["FillDirectionMaxCells"] = 10,
                ["HorizontalAlignment"] = "Center",
                ["CellSize"] = UDim2.new(0.2, 0, 0, 128),
                ["CellPadding"] = UDim2.new(0, 10, 0, 10)
            }) }
        local v44 = #v43
        for v45, v46 in v39 do
            v43[v44 + v45] = v46
        end
        v23[v24 + 1] = u11.createElement(u4, v42, v43)
        v20[v21 + 1] = u11.createElement(u9, v22, v23)
        return u11.createElement("Frame", v19, v20)
    end)
}
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
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-skybox-meta").getClanHqSkyboxMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-types").ClanHqSkyboxType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["SkyboxSelectorWidget"] = v12.new(u11)(function(u16, p17) --[[ Line: 17 ]]
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
        local _ = p17.useState
        local v18 = u16.store.Clans.myClan
        if v18 ~= nil then
            v18 = v18.clanHq
            if v18 ~= nil then
                v18 = v18.allSkyboxes
            end
        end
        local v19 = v18 == nil and { u14.DEFAULT } or v18
        local v20 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = u15.widgetSize
        }
        local v21 = { u11.createElement(u8, {
                ["MaximumSize"] = Vector2.new(u15.widgetSize.X.Offset * 1.3, u15.widgetSize.Y.Offset * 1.3),
                ["ScreenPadding"] = Vector2.new(24, 24)
            }) }
        local v22 = #v21
        local v23 = {
            ["ClipsDescendents"] = false,
            ["Title"] = "Clan Profile",
            ["AppId"] = u16.AppId,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(1, 1),
            ["OnClose"] = function() --[[ Name: OnClose, Line 65 ]]
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
        local v24 = { u11.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }), u11.createElement("TextLabel", {
                ["Text"] = "Select Skybox",
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
        local v25 = #v24
        local function v37(u26) --[[ Line: 107 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u11
                [3] = u16
                [4] = u10
                [5] = u2
                [6] = u14
                [7] = u5
            --]]
            local v27 = u13(u26)
            local v32 = {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["Image"] = v27.iconId,
                [u11.Event.MouseButton1Click] = function() --[[ Line: 113 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                        [2] = u10
                        [3] = u26
                        [4] = u2
                    --]]
                    if u16.store.Clans.myClanId == nil then
                        return nil
                    end
                    u10.Controllers.ClanController:selectClanHqSkybox(u16.store.Clans.myClanId, u26):andThen(function(p28) --[[ Line: 118 ]]
                        --[[
                        Upvalues:
                            [1] = u2
                        --]]
                        if not p28.success then
                            local v29 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
                            local v30 = {}
                            local v31 = p28.errorMessage
                            v30.message = v31 == nil and "An unknown error occurred" or v31
                            v29:sendErrorNotification(v30)
                        end
                    end)
                end,
                ["ClipsDescendants"] = true
            }
            local v33 = { u11.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 5)
                }) }
            local v34 = #v33
            local v35 = false
            local v36 = u16.store.Clans.myClan
            if v36 ~= nil then
                v36 = v36.clanHq
                if v36 ~= nil then
                    v36 = v36.selectedSykbox
                end
            end
            if v36 == nil then
                v36 = u14.DEFAULT
            end
            if v36 == u26 then
                v35 = u11.createElement("UIStroke", {
                    ["Thickness"] = 3,
                    ["Color"] = u5.WHITE
                })
            end
            if v35 then
                v33[v34 + 1] = v35
            end
            v33[#v33 + 1] = u11.createElement("Frame", {
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
                    ["Text"] = v27.title,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center,
                    ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family)
                }, { u11.createElement("UITextSizeConstraint", {
                        ["MinTextSize"] = 8,
                        ["MaxTextSize"] = 16
                    }) }) })
            return u11.createElement("ImageButton", v32, v33)
        end
        local v38 = table.create(#v19)
        for v39, v40 in v19 do
            v38[v39] = v37(v40, v39 - 1, v19)
        end
        local v41 = {
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(0.9, 0.75)
            }
        }
        local v42 = { u11.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 4)
            }), u11.createElement("UIGridLayout", {
                ["FillDirection"] = "Horizontal",
                ["FillDirectionMaxCells"] = 10,
                ["HorizontalAlignment"] = "Center",
                ["CellSize"] = UDim2.new(0.2, 0, 0, 80),
                ["CellPadding"] = UDim2.new(0, 10, 0, 10)
            }) }
        local v43 = #v42
        for v44, v45 in v38 do
            v42[v43 + v44] = v45
        end
        v24[v25 + 1] = u11.createElement(u4, v41, v42)
        v21[v22 + 1] = u11.createElement(u9, v23, v24)
        return u11.createElement("Frame", v20, v21)
    end)
}
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.ColorUtil
local u6 = v3.DeviceUtil
local u7 = v3.DividerComponent
local u8 = v3.Empty
local u9 = v3.ScaleComponent
local u10 = v3.StringUtil
local u11 = v3.WidgetComponent
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-background-music-meta").getClanHqBackgroundMusicMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-types").ClanHqBackgroundMusicType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["BackgroundMusicSelectorWidget"] = v15.new(u14)(function(u19, p20) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u6
            [3] = u12
            [4] = u13
            [5] = u18
            [6] = u14
            [7] = u9
            [8] = u2
            [9] = u5
            [10] = u8
            [11] = u7
            [12] = u16
            [13] = u4
            [14] = u10
            [15] = u11
        --]]
        local v21 = p20.useState
        local v22 = p20.useEffect
        local v23, u24 = v21(0)
        local v25, u26 = v21(0)
        local v27, u28 = v21("")
        local v29 = u19.store.Clans.myClan
        if v29 ~= nil then
            v29 = v29.clanHq
            if v29 ~= nil then
                v29 = v29.allLobbyMusic
            end
        end
        local v30 = v29 == nil and { u17.DEFAULT } or v29
        local function v35() --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u12
                [3] = u13
                [4] = u26
                [5] = u28
                [6] = u24
            --]]
            local u31
            if u6.isHoarceKat() then
                u31 = nil
            else
                u31 = u12.Controllers.BackgroundMusicController:getActiveTrack()
            end
            if not u31 then
                return nil
            end
            local u32 = u13.new()
            task.defer(function() --[[ Line: 58 ]]
                --[[
                Upvalues:
                    [1] = u31
                    [2] = u26
                    [3] = u28
                    [4] = u32
                    [5] = u24
                --]]
                if not u31.IsLoaded then
                    u31.Loaded:Wait()
                end
                u26(u31.TimeLength)
                u28(u31.Name)
                u32:GiveTask(task.spawn(function() --[[ Line: 64 ]]
                    --[[
                    Upvalues:
                        [1] = u32
                        [2] = u31
                        [3] = u24
                    --]]
                    local u33 = true
                    u32:GiveTask(function() --[[ Line: 66 ]]
                        --[[
                        Upvalues:
                            [1] = u33
                        --]]
                        u33 = false
                    end)
                    while true do
                        local v34 = u33
                        if v34 then
                            v34 = task.wait(1)
                        end
                        if v34 == 0 or (v34 ~= v34 or not v34) then
                            return
                        end
                        if u31.IsPlaying then
                            u24(u31.TimePosition)
                        end
                    end
                end))
            end)
            return function() --[[ Line: 81 ]]
                --[[
                Upvalues:
                    [1] = u32
                --]]
                u32:DoCleaning()
            end
        end
        local v36 = u19.store.Clans.myClan
        if v36 ~= nil then
            v36 = v36.clanHq
            if v36 ~= nil then
                v36 = v36.selectedLobbyMusic
            end
        end
        v22(v35, { v36 })
        local v37 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromOffset(u18.widgetSize.X.Offset / 2, u18.widgetSize.Y.Offset)
        }
        local v38 = { u14.createElement(u9, {
                ["MaximumSize"] = Vector2.new(u18.widgetSize.X.Offset * 1.3 / 2, u18.widgetSize.Y.Offset * 1.3),
                ["ScreenPadding"] = Vector2.new(24, 24)
            }) }
        local v39 = #v38
        local v40 = {
            ["ClipsDescendents"] = false,
            ["Title"] = "Clan Profile",
            ["AppId"] = u19.AppId,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(1, 1),
            ["OnClose"] = function() --[[ Name: OnClose, Line 113 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u19
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u19.AppId)
            end,
            ["ContentUIPadding"] = u14.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 0),
                ["PaddingBottom"] = UDim.new(0, 0),
                ["PaddingLeft"] = UDim.new(0, 0),
                ["PaddingRight"] = UDim.new(0, 0)
            })
        }
        local v41 = { u14.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }), u14.createElement("TextLabel", {
                ["Text"] = "Select Background Music",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.1),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family),
                ["TextColor3"] = u5.WHITE
            }, { u14.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) }), u14.createElement(u8, {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(0.85, 0, 0, 6)
            }, { u14.createElement(u7, {
                    ["Position"] = UDim2.fromOffset(0, -10)
                }) }) }
        local v42 = #v41
        local function v56(u43) --[[ Line: 155 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u19
                [3] = u17
                [4] = u5
                [5] = u18
                [6] = u14
                [7] = u12
                [8] = u2
            --]]
            local v44 = u16(u43)
            local v45 = {
                ["BorderSizePixel"] = 0
            }
            local v46 = u19.store.Clans.myClan
            if v46 ~= nil then
                v46 = v46.clanHq
                if v46 ~= nil then
                    v46 = v46.selectedLobbyMusic
                end
            end
            if v46 == nil then
                v46 = u17.DEFAULT
            end
            local v47
            if v46 == u43 then
                v47 = u5.brighten(u18.backgroundTertiary, 0.1)
            else
                v47 = u18.backgroundTertiary
            end
            v45.BackgroundColor3 = v47
            v45[u14.Event.MouseButton1Click] = function() --[[ Line: 160 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u12
                    [3] = u43
                    [4] = u2
                --]]
                if u19.store.Clans.myClanId == nil then
                    return nil
                end
                u12.Controllers.ClanController:selectClanHqBackgroundMusic(u19.store.Clans.myClanId, u43):andThen(function(p48) --[[ Line: 165 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                    --]]
                    if not p48.success then
                        local v49 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
                        local v50 = {}
                        local v51 = p48.errorMessage
                        v50.message = v51 == nil and "An unknown error occurred" or v51
                        v49:sendErrorNotification(v50)
                    end
                end)
            end
            local v52 = { u14.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.25, 0)
                }) }
            local v53 = #v52
            local v54 = false
            local v55 = u19.store.Clans.myClan
            if v55 ~= nil then
                v55 = v55.clanHq
                if v55 ~= nil then
                    v55 = v55.selectedLobbyMusic
                end
            end
            if v55 == nil then
                v55 = u17.DEFAULT
            end
            if v55 == u43 then
                v54 = u14.createElement("UIStroke", {
                    ["Thickness"] = 3,
                    ["Color"] = u5.WHITE
                })
            end
            if v54 then
                v52[v53 + 1] = v54
            end
            v52[#v52 + 1] = u14.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 1),
                ["TextColor3"] = u5.WHITE,
                ["Text"] = v44.title,
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family)
            }, { u14.createElement("UITextSizeConstraint", {
                    ["MinTextSize"] = 8,
                    ["MaxTextSize"] = 16
                }) })
            return u14.createElement("ImageButton", v45, v52)
        end
        local v57 = table.create(#v30)
        for v58, v59 in v30 do
            v57[v58] = v56(v59, v58 - 1, v30)
        end
        local v60 = {
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(0.9, 0.75)
            }
        }
        local v61 = { u14.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 4)
            }), u14.createElement("UIGridLayout", {
                ["FillDirection"] = "Horizontal",
                ["FillDirectionMaxCells"] = 10,
                ["HorizontalAlignment"] = "Center",
                ["CellSize"] = UDim2.new(0.6, 0, 0, 30),
                ["CellPadding"] = UDim2.new(0, 0, 0, 3)
            }) }
        local v62 = #v61
        for v63, v64 in v57 do
            v61[v62 + v63] = v64
        end
        v41[v42 + 1] = u14.createElement(u4, v60, v61)
        v41[v42 + 2] = u14.createElement(u8, {
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.new(0.85, 0, 0, 6)
        }, { u14.createElement(u7) })
        v41[v42 + 3] = u14.createElement(u8, {
            ["LayoutOrder"] = 5,
            ["Size"] = UDim2.fromScale(0.8, 0.125)
        }, { u14.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.2, 0)
            }), u14.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Position"] = UDim2.fromScale(0.5, 0),
                ["Text"] = "Playing " .. v27,
                ["TextYAlignment"] = Enum.TextYAlignment.Top,
                ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family),
                ["TextColor3"] = u5.WHITE
            }, { u14.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 14
                }) }), u14.createElement(u8, {
                ["Size"] = UDim2.new(1, 0, 0, 3),
                ["Position"] = UDim2.fromScale(0.5, 0.6),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }, { u14.createElement(u8, {
                    ["Size"] = UDim2.new(0.825, 0, 0, 3)
                }, { u14.createElement("Frame", {
                        ["BorderSizePixel"] = 0,
                        ["Size"] = UDim2.new(v23 / v25, 0, 0, 3),
                        ["Position"] = UDim2.fromScale(0, 0.5),
                        ["AnchorPoint"] = Vector2.new(0, 0.5),
                        ["BackgroundColor3"] = u5.WHITE
                    }, { u14.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(1, 0)
                        }) }), u14.createElement("Frame", {
                        ["BorderSizePixel"] = 0,
                        ["Size"] = UDim2.new(1, 0, 0, 1),
                        ["Position"] = UDim2.fromScale(0, 0.5),
                        ["AnchorPoint"] = Vector2.new(0, 0.5),
                        ["BackgroundColor3"] = u5.WHITE
                    }, { u14.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(1, 0)
                        }) }), u14.createElement("Frame", {
                        ["BorderSizePixel"] = 0,
                        ["Size"] = UDim2.new(0, 5, 0, 10),
                        ["Position"] = UDim2.fromScale(v23 / v25, 0.5),
                        ["AnchorPoint"] = Vector2.new(0, 0.5),
                        ["BackgroundColor3"] = u5.WHITE
                    }, { u14.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(1, 0)
                        }) }) }), u14.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Position"] = UDim2.new(0.85, 0, 0.5, 0),
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["Size"] = UDim2.new(0.15, 0, 0, 15),
                    ["TextColor3"] = u5.WHITE,
                    ["Text"] = u10.formatCountdownTime(v23) .. " / " .. u10.formatCountdownTime(v25),
                    ["TextYAlignment"] = Enum.TextYAlignment.Center,
                    ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family)
                }, { u14.createElement("UITextSizeConstraint", {
                        ["MinTextSize"] = 8,
                        ["MaxTextSize"] = 10
                    }) }) }) })
        v38[v39 + 1] = u14.createElement(u11, v40, v41)
        return u14.createElement("Frame", v37, v38)
    end)
}
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
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-chat-tag-color")
local u14 = v13.ChatTagColorDefinition
local u15 = v13.ClanChatTagColorOptions
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ClanTagSelectorWidget"] = v12.new(u11)(function(u17, p18) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u14
            [3] = u16
            [4] = u11
            [5] = u8
            [6] = u2
            [7] = u5
            [8] = u7
            [9] = u6
            [10] = u10
            [11] = u4
            [12] = u9
        --]]
        local v19 = p18.useState
        local v20 = p18.useEffect
        local v21 = u17.store.Clans.myClan
        if v21 ~= nil then
            v21 = v21.tag
        end
        local u22, u23 = v19(v21 == nil and "CLAN" or v21)
        local function v25() --[[ Line: 30 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u23
            --]]
            local v24 = u17.store.Clans.myClan
            if v24 ~= nil then
                v24 = v24.tag
            end
            u23(v24 == nil and "CLAN" or v24)
        end
        local v26 = u17.store.Clans.myClan
        if v26 ~= nil then
            v26 = v26.tag
        end
        v20(v25, { v26 })
        local v27 = u17.store.Clans.myClan
        if v27 ~= nil then
            v27 = v27.chatTagColors
        end
        local v28 = v27 == nil and {} or v27
        local u29 = {}
        for _, v30 in v28 do
            local v31 = u29[v30.chatTagColorOption]
            if v31 == nil or v31 < v30.expiresAt then
                u29[v30.chatTagColorOption] = v30.expiresAt
            end
        end
        local v32 = { u15.Default }
        for _, v33 in v28 do
            local v34 = v33.chatTagColorOption ~= u15.Default
            if v34 then
                local v35 = v33.chatTagColorOption
                local v36 = table.find(v32, v35) ~= nil
                v34 = not v36
            end
            if v34 then
                local v37 = v33.chatTagColorOption
                table.insert(v32, v37)
            end
        end
        local function u44(p38) --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u15
                [3] = u29
            --]]
            local v39 = u14[p38].name
            if p38 == u15.Default then
                return v39
            end
            local v40 = u29[p38]
            if v40 == nil then
                return v39
            end
            local v41 = v40 - os.time()
            if v41 <= 0 then
                return v39 .. " (expired)"
            end
            local v42 = v41 / 86400
            local v43 = math.round(v42)
            return v39 .. "\n(" .. (tostring(v43) .. "d") .. " left)"
        end
        local v45 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = u16.widgetSize
        }
        local v46 = { u11.createElement(u8, {
                ["MaximumSize"] = Vector2.new(u16.widgetSize.X.Offset * 1.3, u16.widgetSize.Y.Offset * 1.3),
                ["ScreenPadding"] = Vector2.new(24, 24)
            }) }
        local v47 = #v46
        local v48 = {
            ["ClipsDescendents"] = false,
            ["Title"] = "Clan Profile",
            ["AppId"] = u17.AppId,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(1, 1),
            ["OnClose"] = function() --[[ Name: OnClose, Line 130 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u17
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u17.AppId)
            end,
            ["ContentUIPadding"] = u11.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 0),
                ["PaddingBottom"] = UDim.new(0, 0),
                ["PaddingLeft"] = UDim.new(0, 0),
                ["PaddingRight"] = UDim.new(0, 0)
            })
        }
        local v49 = { u11.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }), u11.createElement("TextLabel", {
                ["Text"] = "Select Clan Tag Color",
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
        local v50 = #v49
        local function v83(u51) --[[ Line: 172 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u17
                [3] = u15
                [4] = u5
                [5] = u11
                [6] = u10
                [7] = u2
                [8] = u22
                [9] = u44
            --]]
            local v52 = u14[u51]
            local v53 = {
                ["AutoButtonColor"] = false,
                ["BorderSizePixel"] = 0
            }
            local v54 = u17.store.Clans.myClan
            if v54 ~= nil then
                v54 = v54.selectedChatTagColor
            end
            local v55
            if v54 and os.time() < v54.expiresAt then
                v55 = v54.chatTagColorOption
            else
                v55 = u15.Default
            end
            local v56
            if v55 == u51 then
                v56 = u5.brighten(Color3.fromRGB(35, 35, 40), 0.1)
            else
                v56 = Color3.fromRGB(35, 35, 40)
            end
            v53.BackgroundColor3 = v56
            v53[u11.Event.MouseButton1Click] = function() --[[ Line: 178 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u10
                    [3] = u51
                    [4] = u2
                --]]
                if u17.store.Clans.myClanId == nil then
                    return nil
                end
                u10.Controllers.ClanController:selectClanChatTagColor(u17.store.Clans.myClanId, u51):andThen(function(p57) --[[ Line: 183 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                    --]]
                    if not p57.success then
                        local v58 = u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController")
                        local v59 = {}
                        local v60 = p57.errorMessage
                        v59.message = v60 == nil and "An unknown error occurred" or v60
                        v58:sendErrorNotification(v59)
                    end
                end)
            end
            v53.ClipsDescendants = true
            local v61 = { u11.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 5)
                }) }
            local v62 = #v61
            local v63 = false
            local v64 = u17.store.Clans.myClan
            if v64 ~= nil then
                v64 = v64.selectedChatTagColor
            end
            local v65
            if v64 and os.time() < v64.expiresAt then
                v65 = v64.chatTagColorOption
            else
                v65 = u15.Default
            end
            if v65 == u51 then
                v63 = u11.createElement("UIStroke", {
                    ["Thickness"] = 3,
                    ["Color"] = u5.WHITE
                })
            end
            if v63 then
                v61[v62 + 1] = v63
            end
            local v66 = #v61
            local v67 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v68 = { u11.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 4)
                }) }
            local v69 = #v68
            local v70 = {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0.5, 0)
            }
            local v71 = {}
            local v72 = #v71
            local v73 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.64),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }
            local v74 = { u11.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 4)
                }) }
            local v75 = #v74
            local v76 = v52.kind == "Gradient"
            if v76 then
                local v77 = {
                    ["Color"] = v52.gradient
                }
                local v78 = v52.rotation
                v77.Rotation = v78 == nil and 0 or v78
                v76 = u11.createElement("UIGradient", v77)
            end
            local v79 = {
                ["BackgroundTransparency"] = 1,
                ["TextSize"] = 20,
                ["LayoutOrder"] = 1,
                ["AutomaticSize"] = Enum.AutomaticSize.X,
                ["Size"] = UDim2.new(0, 0, 1, 0),
                ["Text"] = "[" .. u22 .. "]",
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
            }
            local v80
            if v52.kind == "Color" then
                v80 = v52.color
            else
                v80 = Color3.fromRGB(255, 255, 255)
            end
            v79.TextColor3 = v80
            v79.TextXAlignment = Enum.TextXAlignment.Center
            v79.TextYAlignment = Enum.TextYAlignment.Center
            local v81 = {}
            local v82 = #v81
            if v76 then
                v81[v82 + 1] = v76
            end
            v74[v75 + 1] = u11.createElement("TextLabel", v79, v81)
            v71[v72 + 1] = u11.createElement("Frame", v73, v74)
            v68[v69 + 1] = u11.createElement("Frame", v70, v71)
            v68[v69 + 2] = u11.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(1, -8, 0.35, 0),
                ["Text"] = u44(u51),
                ["TextYAlignment"] = Enum.TextYAlignment.Top,
                ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family),
                ["TextColor3"] = u5.WHITE
            }, { u11.createElement("UITextSizeConstraint", {
                    ["MinTextSize"] = 8,
                    ["MaxTextSize"] = 14
                }) })
            v61[v66 + 1] = u11.createElement("Frame", v67, v68)
            return u11.createElement("ImageButton", v53, v61)
        end
        local v84 = table.create(#v32)
        for v85, v86 in v32 do
            v84[v85] = v83(v86, v85 - 1, v32)
        end
        local v87 = {
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(0.9, 0.75)
            }
        }
        local v88 = { u11.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 4)
            }), u11.createElement("UIGridLayout", {
                ["FillDirection"] = "Horizontal",
                ["FillDirectionMaxCells"] = 10,
                ["HorizontalAlignment"] = "Center",
                ["CellSize"] = UDim2.new(0.2, 0, 0, 80),
                ["CellPadding"] = UDim2.new(0, 10, 0, 10)
            }) }
        local v89 = #v88
        for v90, v91 in v84 do
            v88[v89 + v90] = v91
        end
        v49[v50 + 1] = u11.createElement(u4, v87, v88)
        v46[v47 + 1] = u11.createElement(u9, v48, v49)
        return u11.createElement("Frame", v45, v46)
    end)
}
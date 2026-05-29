local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.OfflinePlayerUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u14 = v1.import(script, script.Parent, "host-panel-player-row").HostPanelPlayerRow
local u15 = {
    [u7.Dummy.oiogy.userId] = "Red",
    [u7.Dummy.spleenhook.userId] = "Blue",
    [u7.Dummy.SnickTrix.userId] = "Blue"
}
return {
    ["HostPanelPlayersTab"] = v10.new(u9)(function(p16, p17) --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u11
            [3] = u7
            [4] = u15
            [5] = u8
            [6] = u9
            [7] = u13
            [8] = u12
            [9] = u6
            [10] = u4
            [11] = u14
            [12] = u3
        --]]
        local v18 = p17.useState
        local v19 = p17.useEffect
        local u20
        if u5.isHoarceKat() then
            u20 = { u7.Dummy.oiogy, u7.Dummy.spleenhook, u7.Dummy.SnickTrix }
        else
            local v21 = u11:GetPlayers()
            u20 = table.create(#v21)
            for v22, v23 in v21 do
                local _ = v22 - 1
                u20[v22] = u7.getOfflinePlayer(v23)
            end
        end
        local v24, u25 = v18(u20)
        local v26, u27 = v18(not u5.isHoarceKat() and {} or u15)
        local v28, u29 = v18(false)
        v19(function() --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u8
                [3] = u27
                [4] = u29
            --]]
            if u5.isHoarceKat() then
                return nil
            end
            local v30 = u8.Controllers.TeamController:getTeams()
            local function v34(p31, p32) --[[ Line: 49 ]]
                for _, v33 in p32.members do
                    p31[v33.userId] = p32.name
                end
                return p31
            end
            local v35 = {}
            for v36 = 1, #v30 do
                v35 = v34(v35, v30[v36], v36 - 1, v30)
            end
            if v35 then
                u27(v35)
            end
            if not u5.isHoarceKat() and u8.Controllers.PermissionController:hasAnyPermissions({
                "anticheat_mod",
                "admin",
                "artist",
                "director"
            }) then
                u29(true)
            end
        end, {})
        local v37 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 10)
            }), u9.createElement("TextLabel", {
                ["AutomaticSize"] = "Y",
                ["SizeConstraint"] = "RelativeXX",
                ["Text"] = "<b>PLAYERS</b>",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Bottom",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0),
                ["TextColor3"] = u13.textPrimary
            }, { u9.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 20
                }) }) }
        local v38 = #v37
        local v39 = {
            ["Size"] = UDim2.new(1, 0, 0, 30)
        }
        local v40 = {}
        local function v50(p41, p42) --[[ Line: 81 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u20
            --]]
            if p41 == "" then
                return u25(u20)
            end
            local v43 = 0
            local v44 = {}
            for v45, v46 in u20 do
                local _ = v45 - 1
                local v47 = v46.displayName
                local v48 = table.find(p42, v47) ~= nil
                if not v48 then
                    local v49 = v46.name
                    v48 = table.find(p42, v49) ~= nil
                end
                if v48 == true then
                    v43 = v43 + 1
                    v44[v43] = v46
                end
            end
            u25(v44)
        end
        for v51 = 1, #u20 do
            local v52 = u20[v51]
            local _ = v51 - 1
            local v53 = {
                ["key"] = v52.displayName,
                ["aliases"] = { v52.name }
            }
            table.insert(v40, v53)
        end
        v39.Items = v40
        v39.InputText = ""
        v39.OnTextChange = v50
        v39.PlaceHolderText = "Search User"
        v39.LayoutOrder = 2
        v37[v38 + 1] = u9.createElement(u12, v39)
        v37.ColumnHeaders = u9.createFragment({
            ["ColumnHeaders"] = u9.createElement(u6, {
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.new(1, 0, 0, 20)
            }, {
                u9.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 12)
                }),
                u9.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0.03, 0),
                    ["PaddingRight"] = UDim.new(0.03, 0)
                }),
                u9.createElement("TextLabel", {
                    ["Text"] = "<b>Player</b>",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Left",
                    ["TextYAlignment"] = "Bottom",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.4, 1),
                    ["TextColor3"] = u4.WHITE
                }, { u9.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) }),
                u9.createElement(u6, {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.new(0.6, -12, 1, 0)
                }, {
                    u9.createElement("UIListLayout", {
                        ["FillDirection"] = "Horizontal",
                        ["HorizontalAlignment"] = "Right",
                        ["VerticalAlignment"] = "Bottom",
                        ["SortOrder"] = "LayoutOrder",
                        ["Padding"] = UDim.new(0, 8)
                    }),
                    u9.createElement("TextLabel", {
                        ["Text"] = "<b>Max Health</b>",
                        ["TextScaled"] = true,
                        ["RichText"] = true,
                        ["Font"] = "Roboto",
                        ["TextXAlignment"] = "Left",
                        ["TextYAlignment"] = "Bottom",
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 2,
                        ["Size"] = UDim2.fromScale(0.25, 1),
                        ["TextColor3"] = u4.WHITE
                    }, { u9.createElement("UITextSizeConstraint", {
                            ["MaxTextSize"] = 18
                        }) }),
                    u9.createElement("TextLabel", {
                        ["Text"] = "<b>Team</b>",
                        ["TextScaled"] = true,
                        ["RichText"] = true,
                        ["Font"] = "Roboto",
                        ["TextXAlignment"] = "Left",
                        ["TextYAlignment"] = "Bottom",
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 3,
                        ["Size"] = UDim2.new(0.25, -8, 1, 0),
                        ["TextColor3"] = u4.WHITE
                    }, { u9.createElement("UITextSizeConstraint", {
                            ["MaxTextSize"] = 18
                        }) }),
                    u9.createElement("TextLabel", {
                        ["Text"] = "<b>Actions</b>",
                        ["TextScaled"] = true,
                        ["RichText"] = true,
                        ["Font"] = "Roboto",
                        ["TextXAlignment"] = "Left",
                        ["TextYAlignment"] = "Bottom",
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 4,
                        ["Size"] = UDim2.new(0.25, -8, 1, 0),
                        ["TextColor3"] = u4.WHITE
                    }, { u9.createElement("UITextSizeConstraint", {
                            ["MaxTextSize"] = 18
                        }) })
                })
            })
        })
        local v54 = next(v26) ~= nil
        if v54 then
            table.sort(v24, function(p55, p56) --[[ Line: 255 ]]
                return string.lower(p55.displayName) < string.lower(p56.displayName)
            end)
            v54 = table.create(#v24)
            for v57, v58 in v24 do
                local v59 = {
                    ["OfflinePlayer"] = v58,
                    ["Index"] = v57 - 1,
                    ["Team"] = v26[v58.userId],
                    ["HasGameBanPermission"] = v28,
                    ["store"] = p16.store
                }
                v54[v57] = u9.createElement(u14, v59)
            end
        end
        local v60 = {
            ["AdditionalSpace"] = 40,
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 4,
                ["Size"] = UDim2.new(1, 0, 1, -100)
            }
        }
        local v61 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["Padding"] = UDim.new(0, 4)
            }) }
        local v62 = #v61
        if v54 then
            for v63, v64 in v54 do
                v61[v62 + v63] = v64
            end
        end
        v37[v38 + 2] = u9.createElement(u3, v60, v61)
        return u9.createFragment(v37)
    end)
}
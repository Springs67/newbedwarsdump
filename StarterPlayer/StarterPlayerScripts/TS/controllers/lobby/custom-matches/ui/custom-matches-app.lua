local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.Empty
local u6 = v3.SlideIn
local u7 = v3.SoundManager
local u8 = v3.UILayers
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, script.Parent, "custom-match-tab-button").CustomMatchTabButton
local u17 = v1.import(script, script.Parent, "custom-match-tabs").CustomMatchAppTab
local u18 = v1.import(script, script.Parent, "tabs", "create-match", "create-match-tab").CreateMatchTab
local u19 = v1.import(script, script.Parent, "tabs", "home", "custom-matches-home-tab").CustomMatchesHomeTab
local u20 = v1.import(script, script.Parent, "tabs", "map-browser", "custom-maps-browser").CustomMapsBrowser
local u21 = v1.import(script, script.Parent, "tabs", "server-browser", "server-browser").ServerBrowser
local u22 = {
    {
        ["text"] = "HOME",
        ["layoutOrder"] = 1,
        ["value"] = u17.HOME
    },
    {
        ["text"] = "LIVE GAMES",
        ["layoutOrder"] = 2,
        ["value"] = u17.GAME_BROWSER
    },
    {
        ["text"] = "BROWSE MAPS",
        ["layoutOrder"] = 3,
        ["value"] = u17.MAP_BROWSER
    }
}
local v73 = v10.new(u9)(function(u23, p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u2
        [3] = u14
        [4] = u7
        [5] = u15
        [6] = u13
        [7] = u8
        [8] = u9
        [9] = u22
        [10] = u4
        [11] = u16
        [12] = u5
        [13] = u19
        [14] = u20
        [15] = u21
        [16] = u18
        [17] = u6
        [18] = u12
    --]]
    local v25 = p24.useState
    local _ = p24.useEffect
    local u26, u27 = v25(u17.HOME)
    local v28, u29 = v25(false)
    local function v30() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u14
            [3] = u7
            [4] = u15
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u14.CUSTOM_MATCHES)
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.LOBBY_PLAY_MENU_APP, {})
        u7:playSound(u15.UI_CLOSE_2)
    end
    local v31 = {}
    local v32 = {}
    for v33, v34 in u13.BACKGROUND_BLUR_PRESET do
        v31[v33] = v34
    end
    v31.OnClick = v30
    v32.Background = v31
    v32.BackButton = {
        ["OnClick"] = v30
    }
    v32.ExitButton = {
        ["OnClick"] = function() --[[ Name: OnClick, Line 57 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u8
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u8.MAIN)
        end
    }
    local v35 = {}
    local v36 = #v35
    local v37 = {}
    local _ = #v37
    local v38 = {
        ["Size"] = UDim2.fromScale(1, 0.125),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["Position"] = UDim2.fromScale(0.5, 0.075),
        ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
    }
    local v39 = {}
    local _ = #v39
    local v40 = {
        ["Size"] = UDim2.fromScale(1, 1),
        ["Position"] = UDim2.fromScale(0.5, 0),
        ["AnchorPoint"] = Vector2.new(0.5, 0)
    }
    local v41 = { u9.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0.05, 0),
            ["PaddingRight"] = UDim.new(0.05, 0)
        }) }
    local v42 = #v41
    local v43 = {
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["Position"] = UDim2.new(0, 0, 0.5, 0),
        ["Size"] = UDim2.fromScale(0.225, 0.5)
    }
    local v44
    if u26 == u17.HOME then
        v44 = "CUSTOM MATCH"
    else
        local v45 = nil
        for v46, v47 in u22 do
            local _ = v46 - 1
            if v47.value == u26 == true then
                v45 = v47
                break
            end
        end
        if v45 ~= nil then
            v45 = v45.text
        end
        v44 = v45 == nil and "CREATE A GAME" or v45
    end
    v43.Text = v44
    v43.TextColor3 = u4.WHITE
    v43.TextXAlignment = Enum.TextXAlignment.Left
    v43.TextYAlignment = Enum.TextYAlignment.Center
    v43.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
    v43.TextScaled = true
    v43.BackgroundTransparency = 1
    v43.TextTransparency = 0
    v41.HeaderTitle = u9.createElement("TextLabel", v43, { u9.createElement("UIGradient", {
            ["Rotation"] = 90,
            ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0.75) })
        }) })
    local v48 = {
        ["Size"] = UDim2.fromScale(0.5, 0.8),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v49 = { u9.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.new(0, 3, 0.9, 0),
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundColor3"] = u4.WHITE
        }, { u9.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0.6), NumberSequenceKeypoint.new(1, 1) })
            }) }) }
    local v50 = #v49
    local function v52(u51) --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u16
            [3] = u22
            [4] = u4
            [5] = u26
            [6] = u7
            [7] = u15
            [8] = u27
            [9] = u29
        --]]
        return u9.createElement(u16, {
            ["Size"] = UDim2.fromScale(1 / (#u22 / 3) * 0.265, 0.6),
            ["Text"] = u51.text,
            ["TextColor3"] = u4.WHITE,
            ["BackgroundColor3"] = u4.BLACK,
            ["Selected"] = u51.value == u26,
            ["LayoutOrder"] = u51.layoutOrder,
            ["OnClick"] = function() --[[ Name: OnClick, Line 158 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u15
                    [3] = u27
                    [4] = u51
                    [5] = u29
                --]]
                u7:playSound(u15.UI_CLICK)
                u27(u51.value)
                u29(false)
            end
        })
    end
    local v53 = table.create(#u22)
    for v54, v55 in u22 do
        v53[v54] = v52(v55, v54 - 1, u22)
    end
    local v56 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v57 = { u9.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["HorizontalFlex"] = Enum.UIFlexAlignment.SpaceEvenly
        }) }
    local v58 = #v57
    for v59, v60 in v53 do
        v57[v58 + v59] = v60
    end
    v49[v50 + 1] = u9.createElement(u5, v56, v57)
    v49[v50 + 2] = u9.createElement("Frame", {
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.new(0, 3, 0.9, 0),
        ["Position"] = UDim2.fromScale(1, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["BackgroundColor3"] = u4.WHITE
    }, { u9.createElement("UIGradient", {
            ["Rotation"] = 90,
            ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0.6), NumberSequenceKeypoint.new(1, 1) })
        }) })
    v41[v42 + 1] = u9.createElement(u5, v48, v49)
    v41[v42 + 2] = u9.createElement(u5, {
        ["AnchorPoint"] = Vector2.new(1, 0.5),
        ["Position"] = UDim2.new(1, -25, 0.5, 0),
        ["Size"] = UDim2.fromScale(0.2, 0.8)
    }, { u9.createElement(u16, {
            ["Text"] = "CREATE A GAME",
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(1, 0.65),
            ["BackgroundColor3"] = Color3.fromRGB(99, 255, 143),
            ["TextColor3"] = Color3.fromRGB(99, 255, 143),
            ["OnClick"] = function() --[[ Name: OnClick, Line 213 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u15
                    [3] = u29
                    [4] = u27
                --]]
                u7:playSound(u15.UI_CLICK)
                u29(true)
                u27(nil)
            end
        }) })
    v39.HeaderContainer = u9.createElement(u5, v40, v41)
    v37.Header = u9.createElement(u5, v38, v39)
    local v61 = not v28
    if v61 then
        local v62 = {}
        local v63 = #v62
        local v64
        if u26 == u17.HOME then
            v64 = u9.createElement(u19, {
                ["SetTab"] = u27,
                ["OnCreateMatch"] = function(...) --[[ Name: OnCreateMatch, Line 228 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                    --]]
                    return u23.OnCreateMatch(unpack({ ... }))
                end,
                ["OnJoinMatch"] = u23.OnJoinMatch
            })
        else
            v64 = false
        end
        if v64 then
            v62[v63 + 1] = v64
        end
        local v65 = #v62
        local v66
        if u26 == u17.MAP_BROWSER then
            v66 = u9.createElement(u20)
        else
            v66 = false
        end
        if v66 then
            v62[v65 + 1] = v66
        end
        local v67 = #v62
        local v68
        if u26 == u17.GAME_BROWSER then
            v68 = u9.createElement(u21)
        else
            v68 = false
        end
        if v68 then
            v62[v67 + 1] = v68
        end
        v61 = u9.createFragment(v62)
    end
    local v69 = {
        ["Size"] = UDim2.fromScale(0.9, 0.73),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["Position"] = UDim2.fromScale(0.5, 0.195)
    }
    local v70 = {}
    local v71 = #v70
    if v61 then
        v70[v71 + 1] = v61
    end
    local v72 = #v70
    if v28 then
        v28 = u9.createElement(u18, {
            ["OnCreateMatch"] = function(...) --[[ Name: OnCreateMatch, Line 261 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                return u23.OnCreateMatch(unpack({ ... }))
            end,
            ["MapSaves"] = u23.mapSaves
        })
    end
    if v28 then
        v70[v72 + 1] = v28
    end
    v37.Body = u9.createElement(u5, v69, v70)
    v35[v36 + 1] = u9.createElement(u6, {}, v37)
    return u9.createElement(u12, v32, v35)
end)
return {
    ["CustomMatchesApp"] = v11.connect(function(p74, p75) --[[ Line: 275 ]]
        local v76 = {}
        for v77, v78 in p75 do
            v76[v77] = v78
        end
        v76.mapSaves = p74.CustomMatch.mapSaves
        return v76
    end)(v73)
}
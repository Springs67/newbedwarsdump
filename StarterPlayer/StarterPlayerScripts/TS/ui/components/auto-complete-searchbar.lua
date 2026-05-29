local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.ImageId
local u6 = v2.StringUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v13 = {}
local u14 = setmetatable({}, {
    ["__index"] = v13
})
u14.ROBLOX_AVATAR = 0
v13[0] = "ROBLOX_AVATAR"
u14.MANUAL = 1
v13[1] = "MANUAL"
local function v127(u15, p16) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u14
        [3] = u11
        [4] = u6
        [5] = u10
        [6] = u7
        [7] = u12
        [8] = u3
        [9] = u4
        [10] = u5
    --]]
    local v17 = p16.useState
    local v18 = p16.useEffect
    local v19 = p16.useValue
    local u20, u21 = v17("")
    local v22, u23 = v17("")
    local v24, u25 = v17("")
    local v26, u27 = v17(false)
    local v28 = {}
    for v29, v30 in u15 do
        v28[v29] = v30
    end
    local v31 = v28.MaxCharLength
    local u32 = v31 == nil and 20 or v31
    local u33 = v19(u8.createRef())
    local u34 = v19({})
    local u35 = v19({})
    local u36 = v19({})
    v18(function() --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u35
            [3] = u34
            [4] = u15
        --]]
        table.clear(u36.value)
        table.clear(u35.value)
        table.clear(u34.value)
        for _, v37 in u15.Items do
            u36.value[v37.key] = v37
            u35.value[v37.key] = v37.key
            local v38 = u34.value
            local v39 = v37.key
            table.insert(v38, v39)
            if v37.aliases then
                for _, v40 in v37.aliases do
                    u35.value[v40] = v37.key
                    local v41 = u34.value
                    table.insert(v41, v40)
                end
            end
        end
        table.sort(u34.value)
    end, { u15.Items })
    v18(function() --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u33
        --]]
        if not u15.AutoFocus then
            return nil
        end
        task.delay(0, function() --[[ Line: 78 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            local v42 = u33.value:getValue()
            if v42 ~= nil then
                v42:CaptureFocus()
            end
        end)
    end, {})
    local function u51(p43) --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u35
        --]]
        local v44 = nil
        for v45, v46 in u34.value do
            local _ = v45 - 1
            local v47 = string.lower(v46)
            local v48 = #p43
            if string.sub(v47, 1, v48) == string.lower(p43) == true then
                v44 = v46
                break
            end
        end
        if v44 == "" or not v44 then
            return nil
        end
        local v49 = {}
        local v50 = u35.value[v44]
        if v50 == nil then
            v50 = v44
        end
        v49.itemKey = v50
        v49.usedAlias = v44
        return v49
    end
    local u52 = nil
    local function u63(p53, p54) --[[ Line: 125 ]]
        --[[
        Upvalues:
            [1] = u52
            [2] = u21
            [3] = u23
            [4] = u15
            [5] = u14
            [6] = u51
            [7] = u36
            [8] = u25
            [9] = u20
            [10] = u11
        --]]
        local v55 = p53.Text
        local v56 = #p53.Text + 1
        local v57 = v55 .. string.sub(p54, v56)
        u52(p54, p53)
        u21(p54)
        u23(v57)
        if u15.ShowImage == u14.MANUAL then
            local v58 = u51(p54)
            if v58 then
                local v59 = v58.itemKey
                local v60 = u36.value[v59]
                local v61
                if v60 == nil then
                    v61 = v60
                else
                    v61 = v60.image
                end
                if v61 ~= "" and v61 then
                    u25(v60.image)
                    return
                end
            end
        elseif u15.ShowImage == u14.ROBLOX_AVATAR and u20 ~= p54 then
            u11.loadUserAvatarFromName(p54):andThen(function(p62) --[[ Line: 149 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                u25(p62)
            end)
        end
    end
    local function v81(u64) --[[ Line: 161 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u51
            [3] = u63
            [4] = u21
            [5] = u25
            [6] = u23
            [7] = u6
            [8] = u34
            [9] = u35
            [10] = u15
        --]]
        if u32 < #u64.Text then
            local v65 = u64.Text
            u64.Text = string.sub(v65, 0, 20)
            return nil
        elseif #u64.Text > 0 then
            local v66 = u51(u64.Text)
            if v66 then
                u63(u64, v66.usedAlias)
            else
                u21("")
                u25("")
                u23("")
            end
            u6.fuzzySearch(u64.Text, u34.value):andThen(function(p67) --[[ Line: 176 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u15
                    [3] = u64
                --]]
                if p67 then
                    local v68 = 0
                    local v69 = false
                    local v70 = {}
                    while true do
                        if true then
                            if v69 then
                                v68 = v68 + 1
                            else
                                v69 = true
                            end
                        end
                        if v68 >= #p67 then
                            break
                        end
                        local v71 = p67[v68 + 1]
                        local v72 = u35.value[v71]
                        local v73
                        if v72 == "" or not v72 then
                            v73 = v72
                        else
                            v73 = v70[v72] ~= nil
                        end
                        if v73 == "" or not v73 then
                            local v74
                            if v72 == "" or not v72 then
                                v74 = v72
                            else
                                v74 = v72 ~= v71
                            end
                            if v74 ~= "" and v74 then
                                p67[v68 + 1] = v72
                            end
                            if v72 ~= nil then
                                v71 = v72
                            end
                            v70[v71] = true
                        else
                            table.remove(p67, v68 + 1)
                            v68 = v68 - 1
                        end
                    end
                    u15.OnTextChange(u64.Text, p67)
                end
            end)
        else
            u21("")
            u25("")
            u23("")
            local v75 = u15
            local v76 = u64.Text
            local v77 = u15.Items
            local v78 = table.create(#v77)
            for v79, v80 in v77 do
                local _ = v79 - 1
                v78[v79] = v80.key
            end
            v75.OnTextChange(v76, v78)
        end
    end
    u52 = function(p82, p83) --[[ Line: 244 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        if string.lower(p83.Text) == string.lower(p82) then
            u27(true)
        else
            u27(false)
        end
    end
    local function v90(u84, u85, _) --[[ Line: 251 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u20
            [3] = u21
            [4] = u15
            [5] = u14
            [6] = u11
            [7] = u25
            [8] = u36
            [9] = u27
        --]]
        if not u33.value:getValue() then
            return nil
        end
        if u85 and u20 ~= "" then
            u33.value:getValue().Text = u20
            u21(u20)
        elseif u84.Text ~= "" and u15.ShowImage == u14.ROBLOX_AVATAR then
            u11.loadUserAvatarFromName(u84.Text):andThen(function(p86) --[[ Line: 263 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                u25(p86)
            end)
        end
        task.spawn(function() --[[ Line: 269 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u36
                [3] = u15
                [4] = u85
                [5] = u84
                [6] = u33
            --]]
            local v87
            if u20 == "" then
                v87 = nil
            else
                local v88 = u20
                v87 = u36.value[v88]
            end
            local v89 = u15.OnFocusLost
            if v89 ~= nil then
                v89(u85, u84, {
                    ["item"] = v87,
                    ["exactMatch"] = string.lower(u33.value:getValue().Text) == string.lower(u20)
                })
            end
        end)
        u27(true)
    end
    v18(function() --[[ Line: 284 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u15
            [3] = u21
            [4] = u27
        --]]
        local v91 = u33.value:getValue().Text
        if u15.InputText ~= nil and v91 ~= u15.InputText then
            u33.value:getValue().Text = u15.InputText
            u21(u15.InputText)
            u27(true)
        end
    end, { u15.InputText })
    v18(function() --[[ Line: 292 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u33
            [3] = u10
            [4] = u63
            [5] = u25
            [6] = u23
        --]]
        local v92 = u15.PredictionTarget
        if v92 == "" or not v92 then
            return nil
        else
            local v93 = u33.value:getValue()
            if v93 then
                if u10.startsWith(u15.PredictionTarget, v93.Text) then
                    u63(v93, u15.PredictionTarget)
                else
                    u25("")
                    u23("")
                end
            else
                return nil
            end
        end
    end, { u15.PredictionTarget })
    u8.createRef()
    local v94 = {}
    for v95, v96 in u15 do
        v94[v95] = v96
    end
    v94.MaxCharLength = nil
    v94.Items = nil
    v94.InputText = nil
    v94.OnTextChange = nil
    v94.ShowImage = nil
    v94.PlaceHolderText = nil
    v94.HideSearchIcon = nil
    v94.PredictionTarget = nil
    v94.OnFocusLost = nil
    v94.OnFocused = nil
    v94.AutoFocus = nil
    v94.PlaceHolderColor3 = nil
    v94.TextColor3 = nil
    v94.CustomSearchIcon = nil
    v94.BarColor = nil
    v94.BarTransparency = nil
    v94.CornerRadius = nil
    v94[u8.Children] = nil
    local v97
    if u15[u8.Children] then
        v97 = u7.values(u15[u8.Children])
    else
        v97 = nil
    end
    local v98 = {
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.new(1, 0, 1, -26),
        ["BackgroundColor3"] = u15.BarColor or u12.backgroundTertiary
    }
    local v99 = u15.BarTransparency
    v98.Transparency = v99 == nil and 0 or v99
    v98.LayoutOrder = 1
    for v100, v101 in v94 do
        v98[v100] = v101
    end
    if v97 ~= nil then
        v97 = nil
        for v102, v103 in v97 do
            local _ = v102 - 1
            if string.lower(v103.component) == "uipadding" == true then
                v97 = v103
                break
            end
        end
    end
    local v104 = not v97
    if v104 then
        v104 = u8.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 5),
            ["PaddingBottom"] = UDim.new(0, 5),
            ["PaddingLeft"] = UDim.new(0, 10),
            ["PaddingRight"] = UDim.new(0, 10)
        })
    end
    local v105 = { u8.createElement("UICorner", {
            ["CornerRadius"] = u15.CornerRadius or UDim.new(0, 5)
        }), u8.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 8)
        }) }
    local v106 = #v105
    if v104 then
        v105[v106 + 1] = v104
    end
    local v107 = #v105
    local v108
    if u15.ShowImage == nil then
        v108 = false
    else
        local v109 = u8.createFragment
        local v110 = {}
        local v111 = u8.createElement
        local v112 = "ImageLabel"
        local v113 = {
            ["ScaleType"] = "Fit",
            ["SizeConstraint"] = "RelativeYY",
            ["BackgroundTransparency"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Image"] = v24,
            ["ImageTransparency"] = v26 and 0 or 0.6
        }
        local v114
        if u15.BackgroundColor3 then
            v114 = u3.darken(u15.BackgroundColor3, 0.2)
        else
            v114 = u12.interactionPrimary
        end
        v113.BackgroundColor3 = v114
        v110.UserAvatar = v111(v112, v113, { u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 5)
            }) })
        v108 = v109(v110)
    end
    if v108 then
        v105[v107 + 1] = v108
    end
    local v115 = #v105
    local v116 = u15.HideSearchIcon ~= true
    if v116 then
        local v117 = {
            ["Size"] = UDim2.fromScale(1, u4.isSmallScreen() and 0.85 or 0.75)
        }
        local v118 = u15.CustomSearchIcon
        if v118 == nil then
            v118 = u5.SEARCH_SOLID
        end
        v117.Image = v118
        v117.ScaleType = "Fit"
        v117.SizeConstraint = "RelativeYY"
        v117.ImageTransparency = 0.1
        v117.BackgroundTransparency = 1
        v117.LayoutOrder = 2
        v116 = u8.createElement("ImageLabel", v117)
    end
    if v116 then
        v105[v115 + 1] = v116
    end
    local v119 = #v105
    local v120 = {}
    local v121 = UDim2
    local v122 = 0.95 - (u15.HideSearchIcon and -0.05 or 0)
    local v123 = u15.ShowImage
    v120.Size = v121.fromScale(v122 - ((v123 == 0 or (v123 ~= v123 or not v123)) and 0 or -0.05), 1)
    v120.BackgroundTransparency = 1
    v120.LayoutOrder = 3
    v105[v119 + 1] = u8.createElement("Frame", v120, { u8.createElement("TextBox", {
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["Size"] = UDim2.fromScale(1, 1),
            ["Text"] = "",
            ["PlaceholderText"] = u15.PlaceHolderText,
            ["BackgroundTransparency"] = 1,
            ["BackgroundColor3"] = u3.WHITE,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Center,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["PlaceholderColor3"] = Color3.fromRGB(161, 161, 161),
            ["TextScaled"] = true,
            ["Font"] = Enum.Font.Roboto,
            ["ClearTextOnFocus"] = false,
            [u8.Ref] = u33.value,
            ["AutoLocalize"] = false,
            [u8.Change.Text] = v81,
            [u8.Event.FocusLost] = v90,
            [u8.Event.Focused] = u15.OnFocused
        }), u8.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["TextTransparency"] = 0.7,
            ["RichText"] = true,
            ["AutoLocalize"] = false,
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["Size"] = UDim2.fromScale(1, 1),
            ["Text"] = v22,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Center,
            ["Font"] = Enum.Font.Roboto,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        }) })
    local v124 = u15[u8.Children]
    if v124 then
        for v125, v126 in v124 do
            if type(v125) == "number" then
                v105[v119 + 1 + v125] = v126
            else
                v105[v125] = v126
            end
        end
    end
    return u8.createFragment({
        ["AutoCompleteSearchbar"] = u8.createElement("Frame", v98, v105)
    })
end
return {
    ["SearchbarShowImageFunc"] = u14,
    ["AutoCompleteSearchbar"] = v9.new(u8)(v127)
}
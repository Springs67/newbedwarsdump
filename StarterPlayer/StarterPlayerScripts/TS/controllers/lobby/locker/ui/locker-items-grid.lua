local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.ElementGrid
local u6 = v2.Empty
local u7 = v2.GridElement
local u8 = v2.SoundManager
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "achievements", "ui", "achievement-icon").AchievementIcon
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "battle-pass", "ui", "RewardShowcase", "emote-showcase").EmoteShowcase
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-showcase").RewardShowcase
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "screen-space")
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u26 = v1.import(script, script.Parent.Parent, "locker-constants").LockerConstants
local u27 = v1.import(script, script.Parent, "locker-util").LockerUtil
return {
    ["LockerItemsGrid"] = v12.new(u11)(function(u28, p29) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u26
            [3] = u27
            [4] = u16
            [5] = u22
            [6] = u19
            [7] = u18
            [8] = u9
            [9] = u10
            [10] = u21
            [11] = u3
            [12] = u8
            [13] = u24
            [14] = u11
            [15] = u14
            [16] = u15
            [17] = u13
            [18] = u20
            [19] = u6
            [20] = u25
            [21] = u7
            [22] = u5
            [23] = u23
            [24] = u17
        --]]
        local v30 = p29.useState
        local v31 = p29.useEffect
        local v32 = p29.useMemo
        local _ = p29.useValue
        local u33, u34 = v30(u28.Elements)
        local v35, u36 = v30("")
        v31(function() --[[ Line: 36 ]]
            --[[
            Upvalues:
                [1] = u34
                [2] = u28
                [3] = u36
            --]]
            u34(u28.Elements)
            u36("")
        end, { u28.Elements })
        local u37
        if u4.isSmallScreen() then
            u37 = u26.SEARCH_BAR_HEIGHT_SMALL
        else
            u37 = u26.SEARCH_BAR_HEIGHT
        end
        local v38 = u28.SearchBarPadding
        local u39 = v38 == nil and 13 or v38
        local u40 = u27.isPreviewTab(u28.Tab)
        local u41
        if u4.isSmallScreen() then
            u41 = 70
        elseif u40 then
            u41 = u16.ViewSizeX() * 0.55 / 5.5
        else
            u41 = u16.ViewSizeX() * 0.75 / 5.5
        end
        if u28.Tab == u22.TITLES then
            u41 = u41 / 2
        end
        local u42 = {}
        local v133 = v32(function() --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u22
                [3] = u19
                [4] = u33
                [5] = u42
                [6] = u4
                [7] = u18
                [8] = u9
                [9] = u10
                [10] = u21
                [11] = u3
                [12] = u26
                [13] = u8
                [14] = u24
                [15] = u11
                [16] = u14
                [17] = u15
                [18] = u13
                [19] = u20
                [20] = u6
                [21] = u25
                [22] = u7
                [23] = u40
                [24] = u41
                [25] = u37
                [26] = u39
                [27] = u5
            --]]
            if u28.Tab == u22.CONSUMABLES then
                local function v54(p43, p44) --[[ Line: 55 ]]
                    --[[
                    Upvalues:
                        [1] = u19
                    --]]
                    local v45 = p44.itemEnum
                    local v46 = u19(v45).displayInLocker
                    if v46 ~= nil then
                        v46 = v46.merge
                    end
                    local v47 = v46 and true or false
                    local v48 = nil
                    for v49, v50 in p43 do
                        local _ = v49 - 1
                        if v50.id == v45 == true then
                            v48 = v50
                            break
                        end
                    end
                    if v48 and v47 then
                        local v51 = v48.amount
                        v48.amount = (v51 == nil and 0 or v51) + 1
                        return p43
                    end
                    local v52 = {}
                    if not v47 then
                        v45 = p44.consumableId
                    end
                    v52.id = v45
                    v52.imageId = p44.imageId
                    v52.alt = p44.name
                    v52.altFont = Enum.Font.Roboto
                    v52.altFontWeight = Enum.FontWeight.Bold
                    v52.altColor = Color3.fromRGB(255, 255, 255)
                    local v53 = p44.amount
                    v52.amount = v53 == nil and 1 or v53
                    v52.expireTime = p44.expireTime
                    table.insert(p43, v52)
                    return p43
                end
                local v55 = {}
                for v56 = 1, #u33 do
                    v55 = v54(v55, u33[v56], v56 - 1, u33)
                end
                u42 = v55
            else
                local v57 = table.create(#u33)
                local function v59(p58) --[[ Line: 113 ]]
                    return {
                        ["id"] = p58.itemEnum,
                        ["imageId"] = p58.imageId,
                        ["alt"] = p58.name,
                        ["altFont"] = Enum.Font.Roboto,
                        ["altFontWeight"] = Enum.FontWeight.Bold,
                        ["altColor"] = Color3.fromRGB(255, 255, 255)
                    }
                end
                for v60, v61 in u33 do
                    v57[v60] = v59(v61, v60 - 1, u33)
                end
                u42 = v57
            end
            local function u74(p62) --[[ Line: 131 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u22
                    [3] = u4
                    [4] = u18
                    [5] = u9
                    [6] = u10
                    [7] = u19
                --]]
                if u28.Tab == u22.KILL_EFFECTS then
                    if u4.isHoarceKat() then
                        u18:dispatch({
                            ["type"] = "LockerSetKillEffect",
                            ["killEffect"] = p62
                        })
                    else
                        u9.Controllers.LockerController:setKillEffect(p62)
                    end
                end
                if u28.Tab == u22.WIN_EFFECTS then
                    if u4.isHoarceKat() then
                        u18:dispatch({
                            ["type"] = "LockerSetWinEffect",
                            ["winEffect"] = p62
                        })
                    else
                        u9.Controllers.LockerController:setWinEffect(p62)
                    end
                end
                if u28.Tab == u22.TITLES then
                    if u4.isHoarceKat() then
                        u18:dispatch({
                            ["type"] = "LockerSetTitle",
                            ["title"] = p62
                        })
                    else
                        u9.Controllers.LockerController:setTitle(p62)
                    end
                end
                if u28.Tab == u22.LOBBY_GADGETS then
                    if u4.isHoarceKat() then
                        u18:dispatch({
                            ["type"] = "LockerSetLobbyGadget",
                            ["lobbyGadget"] = p62
                        })
                    else
                        u9.Controllers.LockerController:setLobbyGadget(p62)
                    end
                end
                if u28.Tab == u22.CONSUMABLES then
                    local v63 = nil
                    for v64, v65 in u10.entries(u28.ConsumableInventory) do
                        local _ = v64 - 1
                        local _ = v65[1]
                        local v66 = v65[2]
                        if (v66.consumable == p62 and true or v66.id == p62) == true then
                            v63 = v65
                            break
                        end
                    end
                    if v63 == nil then
                        return nil
                    end
                    local _ = v63[1]
                    local v67 = u19(v63[2].consumable)
                    if not v67 then
                        return nil
                    end
                    local v68 = nil
                    for v69, v70 in u28.Elements do
                        local _ = v69 - 1
                        local v71 = v67.displayInLocker
                        if v71 ~= nil then
                            v71 = v71.merge
                        end
                        local v72
                        if v71 or v67.mergeInventory then
                            v72 = v70.itemEnum == p62
                        else
                            v72 = v70.consumableId == p62
                        end
                        if v72 == true then
                            v68 = v70
                            break
                        end
                    end
                    if v68 then
                        u28.SetElement(v68)
                        return
                    end
                else
                    if u28.Tab == u22.BREAK_BED_EFFECTS then
                        if u4.isHoarceKat() then
                            u18:dispatch({
                                ["type"] = "LockerSetBreakBedEffect",
                                ["breakBedEffect"] = p62
                            })
                        else
                            u9.Controllers.LockerController:setBreakBedEffect(p62)
                        end
                    end
                    if u28.Tab == u22.BADGES then
                        if u4.isHoarceKat() then
                            u18:dispatch({
                                ["type"] = "LockerSetFeaturedBadge",
                                ["badge"] = p62
                            })
                        else
                            u9.Controllers.LockerController:setFeaturedBadge(p62)
                        end
                    end
                    if u28.Tab == u22.BED_SKIN then
                        local v73
                        if p62 == "none" then
                            v73 = nil
                        else
                            v73 = p62
                        end
                        if u4.isHoarceKat() then
                            u18:dispatch({
                                ["type"] = "LockerSetBedSkin",
                                ["bedSkin"] = p62
                            })
                            return
                        end
                        u9.Controllers.LockerController:setBedSkin(v73)
                    end
                end
            end
            local u75 = u28.Elements
            if u75 ~= nil then
                u75 = -1
                for v76, v77 in u75 do
                    local _ = v76 - 1
                    local v78 = v77.itemEnum
                    local v79 = u28.EquippedElement
                    if v79 ~= nil then
                        v79 = v79.itemEnum
                    end
                    if v78 == v79 == true then
                        u75 = v76 - 1
                        break
                    end
                end
            end
            local v80 = u42
            local function v124(u81, p82) --[[ Line: 276 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u22
                    [3] = u21
                    [4] = u75
                    [5] = u3
                    [6] = u4
                    [7] = u26
                    [8] = u74
                    [9] = u8
                    [10] = u24
                    [11] = u11
                    [12] = u14
                    [13] = u15
                    [14] = u13
                    [15] = u20
                    [16] = u6
                    [17] = u25
                    [18] = u7
                --]]
                local v83
                if u28.Tab == u22.EMOTES then
                    v83 = u21[u81.id].animation ~= nil
                else
                    v83 = false
                end
                local v84 = u81.expireTime
                local v85 = (v84 == nil and 0 or v84) - os.time()
                local v86 = v85 / 3600
                local v87 = math.floor(v86)
                local v88 = v85 / 86400
                local v89 = math.floor(v88)
                local v90
                if v85 <= 0 then
                    v90 = nil
                elseif v87 < 1 then
                    v90 = "Expires SOON"
                elseif v89 < 1 then
                    v90 = "Expires in " .. tostring(v87) .. " hour" .. (v87 > 1 and "s" or "")
                else
                    local v91 = v85 / 86400
                    local v92 = math.floor(v91)
                    v90 = "Expires in " .. tostring(v92) .. " day" .. (v89 > 1 and "s" or "")
                end
                local v93 = {
                    ["Index"] = p82,
                    ["CurrentIndex"] = u75,
                    ["Image"] = u81.imageId
                }
                local v94 = {
                    ["ZIndex"] = 5,
                    ["Text"] = u28.Tab == u22.TITLES and u81.alt ~= "None" and "" or u81.alt,
                    ["TextColor3"] = u81.altColor
                }
                local v95
                if u81.altFont then
                    v95 = Font.new(Font.fromEnum(u81.altFont).Family, u81.altFontWeight or Enum.FontWeight.Regular)
                else
                    v95 = nil
                end
                v94.FontFace = v95
                v94.TextStrokeTransparency = u81.altStrokeColor == nil and 0.5 or 0
                v94.TextStrokeColor3 = u81.altStrokeColor or u3.BLACK
                local v96
                if u4.isSmallScreen() then
                    v96 = u26.ELEMENT_TEXT_SIZE_SMALL
                else
                    v96 = u26.ELEMENT_TEXT_SIZE
                end
                v94.TextSize = v96
                v93.TextElement = v94
                function v93.OnClick() --[[ Line: 303 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                        [2] = u81
                        [3] = u74
                        [4] = u8
                        [5] = u24
                    --]]
                    if u28.ViewOnly then
                        return nil
                    end
                    local v97 = u81.id
                    if v97 ~= "" and v97 then
                        local v98 = u28.EquippedElement
                        if v98 ~= nil then
                            v98 = v98.itemEnum
                        end
                        if v98 == u81.id then
                            return nil
                        end
                        u74(u81.id)
                        u8:playSound(u24.ARMOR_EQUIP)
                    end
                end
                v93.ViewOnly = u28.ViewOnly
                local v99
                if string.lower(u81.alt) == "none" or not u28.EquippedElement then
                    v99 = p82 == 1
                else
                    local v100 = u28.EquippedElement
                    if v100 ~= nil then
                        v100 = v100.itemEnum
                    end
                    v99 = v100 == u81.id
                end
                v93.GamepadShouldAutoSelect = v99
                local v101 = {}
                local v102 = #v101
                if v83 then
                    v83 = u11.createElement(u14, {
                        ["Emote"] = u81.id
                    })
                end
                if v83 then
                    v101[v102 + 1] = v83
                end
                local v103 = #v101
                local v104
                if u28.Tab == u22.TITLES then
                    v104 = u11.createElement(u15, {
                        ["Size"] = UDim2.fromScale(0.7, 0.7),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.6),
                        ["Reward"] = {
                            ["paid"] = false,
                            ["title"] = u81.id
                        }
                    })
                else
                    v104 = false
                end
                if v104 then
                    v101[v103 + 1] = v104
                end
                local v105 = #v101
                local v106
                if u28.Tab == u22.BADGES then
                    local v107 = u11.createElement
                    local v108 = u13
                    local v109 = {
                        ["Darkened"] = false,
                        ["Simple"] = true
                    }
                    local v110
                    if u81.id == u20.NONE then
                        v110 = nil
                    else
                        v110 = u81.id
                    end
                    v109.Id = v110
                    v109.FrameProps = {
                        ["ZIndex"] = -1,
                        ["Size"] = UDim2.fromScale(0.8, 0.8),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5)
                    }
                    v106 = v107(v108, v109)
                else
                    v106 = false
                end
                if v106 then
                    v101[v105 + 1] = v106
                end
                local v111 = #v101
                local v112
                if u81.amount == nil then
                    v112 = false
                else
                    local v113 = u11.createElement
                    local v114 = u6
                    local v115 = {
                        ["BorderSizePixel"] = 0,
                        ["Size"] = UDim2.fromScale(0.2, 0.2),
                        ["AnchorPoint"] = Vector2.new(1, 0),
                        ["Position"] = UDim2.fromScale(0.95, 0.05)
                    }
                    local v116 = {}
                    local v117 = u11.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    })
                    local v118 = u11.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(1, 0)
                    })
                    local v119 = u11.createElement
                    local v120 = {
                        ["Font"] = "GothamBold",
                        ["TextScaled"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5)
                    }
                    local v121 = u81.amount
                    v120.Text = "x" .. tostring(v121)
                    v120.TextColor3 = Color3.fromRGB(255, 255, 255)
                    __set_list(v116, 1, {v117, v118, v119("TextLabel", v120, { u11.createElement("UIStroke", {
        ["Thickness"] = 1,
        ["Color"] = Color3.fromRGB(0, 0, 0)
    }) })})
                    v112 = v113(v114, v115, v116)
                end
                if v112 then
                    v101[v111 + 1] = v112
                end
                local v122 = #v101
                local v123
                if v90 == nil then
                    v123 = false
                else
                    v123 = u11.createFragment({
                        ["ExpireText"] = u11.createElement(u6, {
                            ["BorderSizePixel"] = 0,
                            ["Interactable"] = false,
                            ["Size"] = UDim2.fromScale(0.8, 0.2),
                            ["AnchorPoint"] = Vector2.new(0.5, 0),
                            ["Position"] = UDim2.fromScale(0.5, 0.65)
                        }, { u11.createElement("TextLabel", {
                                ["Font"] = "GothamBold",
                                ["TextScaled"] = true,
                                ["BackgroundTransparency"] = 1,
                                ["Size"] = UDim2.fromScale(1, 1),
                                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                                ["Position"] = UDim2.fromScale(0.5, 0.5),
                                ["Text"] = v90,
                                ["TextColor3"] = u25.textPrimary
                            }, { u11.createElement("UIStroke", {
                                    ["Thickness"] = 1,
                                    ["Color"] = Color3.fromRGB(0, 0, 0)
                                }) }) })
                    })
                end
                if v123 then
                    v101[v122 + 1] = v123
                end
                return u11.createElement(u7, v93, v101)
            end
            local v125 = table.create(#v80)
            for v126, v127 in v80 do
                v125[v126] = v124(v127, v126 - 1, v80)
            end
            local v128 = {
                ["ElementSize"] = UDim2.new(u4.isSmallScreen() and (u40 and 0.31 or 0.23) or 0.187, 0, 0, u41),
                ["DefaultElement"] = u75,
                ["ScrollingFrameProps"] = {
                    ["ScrollBarThickness"] = 2,
                    ["Size"] = UDim2.new(1, 0, 1, -40),
                    ["Position"] = UDim2.fromOffset(0, u37 + u39),
                    ["ScrollBarImageColor3"] = Color3.fromRGB(255, 255, 255),
                    ["VerticalScrollBarPosition"] = Enum.VerticalScrollBarPosition.Left
                },
                ["UIPaddingProps"] = {
                    ["PaddingLeft"] = UDim.new(0, 10),
                    ["PaddingTop"] = UDim.new(0, 2),
                    ["PaddingBottom"] = UDim.new(0, 65)
                },
                ["UIGridLayoutProps"] = {}
            }
            local v129 = {}
            local v130 = #v129
            for v131, v132 in v125 do
                v129[v130 + v131] = v132
            end
            return u11.createFragment({
                [u28.Tab .. "List"] = u11.createElement(u5, v128, v129)
            })
        end, { u33 })
        local function u141(p134, p135) --[[ Line: 464 ]]
            --[[
            Upvalues:
                [1] = u28
            --]]
            if p134 == "" then
                return u28.Elements
            end
            local v136 = 0
            local v137 = {}
            for v138, v139 in u28.Elements do
                local _ = v138 - 1
                local v140 = v139.name
                if table.find(p135, v140) ~= nil == true then
                    v136 = v136 + 1
                    v137[v136] = v139
                end
            end
            return v137
        end
        local v142 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = u28.Size or UDim2.fromScale(1, 1),
            ["LayoutOrder"] = u28.LayoutOrder
        }
        local v143 = u28.FrameProps
        local v144
        if v143 then
            v144 = u42
            for v145, v146 in v143 do
                v142[v145] = v146
            end
        else
            v144 = u42
        end
        v142.ClipsDescendants = true
        local v147 = { u11.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 14)
            }), u11.createElement("UISizeConstraint", {
                ["MinSize"] = u28.MinSize,
                ["MaxSize"] = u28.MaxSize
            }) }
        local v148 = #v147
        local v149 = {
            ["Size"] = UDim2.new(1, 0, 0, u37)
        }
        local v150 = { u11.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v151 = #v150
        local v152 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(0.4, 0, 0, 16)
        }
        local v153
        if u28.Tab == u22.CONSUMABLES then
            v153 = ""
        else
            local v154 = u28.EquippedElement
            if v154 ~= nil then
                v154 = v154.name
            end
            v153 = "<b>Equipped:</b> " .. "<font transparency=\".3\">(" .. (v154 == nil and "" or v154) .. ")</font>"
        end
        v152.Text = v153
        v152.TextXAlignment = Enum.TextXAlignment.Left
        v152.TextColor3 = u3.WHITE
        v152.RichText = true
        v152.Font = Enum.Font.Roboto
        v152.TextSize = u4.isSmallScreen() and 18 or 24
        v152.Visible = not u28.ViewOnly
        v150[v151 + 1] = u11.createElement("TextLabel", v152)
        local v155 = {
            ["Size"] = UDim2.new(0.55, 0, 1, 0)
        }
        local v156 = u28.Elements
        local function v161(p157, p158) --[[ Line: 550 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u22
                [3] = u23
            --]]
            local v159 = p158.name
            if u28.Tab ~= u22.TITLES then
                if v159 ~= "" and v159 then
                    table.insert(p157, {
                        ["key"] = v159
                    })
                end
                return p157
            end
            local v160 = {
                ["key"] = v159,
                ["aliases"] = { u23[p158.itemEnum].text }
            }
            table.insert(p157, v160)
            return p157
        end
        local v162 = {}
        for v163 = 1, #v156 do
            v162 = v161(v162, v156[v163], v163 - 1, v156)
        end
        v155.Items = v162
        v155.InputText = v35
        function v155.OnTextChange(p164, p165) --[[ Line: 579 ]]
            --[[
            Upvalues:
                [1] = u34
                [2] = u141
                [3] = u36
            --]]
            u34((u141(p164, p165)))
            u36(p164)
        end
        local v166 = "Search "
        local v167
        if #v144 == 0 then
            v167 = #u28.Elements
        else
            v167 = #v144
        end
        v155.PlaceHolderText = v166 .. tostring(v167) .. " " .. u28.Tab
        v155.MaxCharLength = 30
        v155.LayoutOrder = 2
        v155.BarColor = u3.BLACK
        v155.BarTransparency = 0.5
        v150[v151 + 2] = u11.createElement(u17, v155)
        v147.ListHeader = u11.createElement(u6, v149, v150)
        v147[v148 + 1] = v133
        return u11.createFragment({
            ["Items"] = u11.createElement("Frame", v142, v147)
        })
    end)
}
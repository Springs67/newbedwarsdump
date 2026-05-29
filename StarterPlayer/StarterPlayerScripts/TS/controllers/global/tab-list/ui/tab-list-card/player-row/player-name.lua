local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.TooltipContainer
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u20 = 0
local function v91(u21, p22) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
        [3] = u8
        [4] = u16
        [5] = u20
        [6] = u17
        [7] = u12
        [8] = u13
        [9] = u4
        [10] = u18
        [11] = u14
        [12] = u9
        [13] = u6
        [14] = u7
        [15] = u3
        [16] = u19
        [17] = u15
    --]]
    local v23 = p22.useState
    local v24 = p22.useEffect
    local _, u25 = v23(nil)
    local u26 = u11:GetPlayerByUserId(u21.Player.userId)
    local u29 = (function() --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u26
            [3] = u8
        --]]
        if u5.isHoarceKat() or not u26 then
            return nil
        else
            local v27 = u8.Controllers.PermissionController:hasAnyPermissions({ "anticheat_mod", "admin", "artist" })
            local v28 = u8.Controllers.MatchController:getPlayerParty(u26)
            if v27 then
                if v28 and #v28.members > 1 then
                    return v28.displayId
                else
                    return nil
                end
            else
                return nil
            end
        end
    end)()
    local u30 = u5.isHoarceKat() and "CLAN" or ""
    local u31 = not u5.isHoarceKat() and 0 or u16.PlayerLevelRank[u20 % #u16.PlayerLevelRank + 1].levelCutoff
    if u5.isHoarceKat() then
        u20 = u20 + 1
    end
    if u26 then
        u31 = u17.getGamePlayer(u26):getLevel()
        local v32 = u17.getGamePlayer(u26):getClanTag()
        u30 = v32 == nil and "" or v32
    end
    local u33 = u31 < 0 and "[?]" or "[" .. tostring(u31) .. "]"
    local v34 = u12:getState().Game.queueType
    local v35
    if v34 then
        v35 = u13(v34).noKits == true
    else
        v35 = false
    end
    local u36 = u4.WHITE
    v24(function() --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u25
        --]]
        local v37 = u21.ContentTransparency
        if v37 ~= 0 and (v37 == v37 and v37) then
            u25(u21.ContentTransparency)
        end
    end, { u21.ContentTransparency })
    local v38 = u18.columns.left.avatar.width
    local v39 = u21.Kits
    local v40 = v39 ~= nil and #v39 or v39
    local u41 = v38 * (v40 == nil and 1 or v40)
    local function v63() --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u14
            [3] = u9
            [4] = u6
            [5] = u7
            [6] = u3
            [7] = u19
            [8] = u15
            [9] = u41
            [10] = u18
        --]]
        local v42
        if u21.Kits then
            local v43 = u21.Kits
            local function v51(p44, p45) --[[ Line: 87 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u9
                    [3] = u6
                    [4] = u21
                    [5] = u7
                    [6] = u3
                    [7] = u19
                --]]
                local v46 = u14[p44]
                local v47 = u9.createElement
                local v48 = u6
                local v49 = {
                    ["ClipsDescendants"] = true,
                    ["Size"] = UDim2.fromScale(1, 1)
                }
                local v50 = {
                    u9.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }),
                    ["PlayerKitImage"] = u9.createElement("ImageLabel", {
                        ["BorderSizePixel"] = 0,
                        ["ScaleType"] = "Crop",
                        ["BackgroundTransparency"] = 1,
                        ["Image"] = v46.renderImage,
                        ["Size"] = UDim2.fromScale(1.25, 1.25),
                        ["Position"] = UDim2.fromScale(0.5, 0),
                        ["AnchorPoint"] = Vector2.new(0.5, 0),
                        ["ImageTransparency"] = u21.ContentTransparency,
                        ["LayoutOrder"] = p45
                    }),
                    u9.createElement(u7, {}, { u9.createElement(u3, {
                            ["TextSize"] = 22,
                            ["Text"] = v46.name,
                            ["Font"] = Enum.Font.SourceSansBold,
                            ["TextColor3"] = u19.mcAqua,
                            ["TextXAlignment"] = Enum.TextXAlignment.Left,
                            ["Limits"] = Vector2.new(300, 60)
                        }), u9.createElement(u3, {
                            ["Text"] = "Kit",
                            ["TextSize"] = 18,
                            ["Font"] = Enum.Font.SourceSans,
                            ["TextColor3"] = u19.mcAqua,
                            ["Limits"] = Vector2.new(300, 60)
                        }), u9.createElement(u3, {
                            ["TextSize"] = 18,
                            ["RichText"] = true,
                            ["Text"] = v46.description,
                            ["Font"] = Enum.Font.SourceSans,
                            ["TextColor3"] = Color3.fromRGB(191, 191, 191),
                            ["TextXAlignment"] = Enum.TextXAlignment.Left,
                            ["Limits"] = Vector2.new(300, 500)
                        }) })
                }
                return v47(v48, v49, v50)
            end
            local v52 = table.create(#v43)
            for v53, v54 in v43 do
                v52[v53] = v51(v54, v53 - 1, v43)
            end
            local v55 = {}
            local v56 = #v55
            for v57, v58 in v52 do
                v55[v56 + v57] = v58
            end
            v42 = u9.createFragment(v55)
        else
            local v59 = {
                ["Image"] = u15.X
            }
            local v60 = u21.ContentTransparency
            v59.ImageTransparency = v60 == nil and 0.3 or v60
            v59.BorderSizePixel = 0
            v59.ScaleType = "Crop"
            v59.BackgroundTransparency = 1
            v59.Size = UDim2.fromScale(0.8, 0.8)
            v59.AnchorPoint = Vector2.new(0.5, 0.5)
            v59.Position = UDim2.fromScale(0.5, 0.5)
            v42 = u9.createFragment({
                ["NoKitImage"] = u9.createElement("ImageLabel", v59, { u9.createElement(u7, {}, { u9.createElement(u3, {
                            ["Text"] = "No Kit Equipped",
                            ["TextSize"] = 22,
                            ["Font"] = Enum.Font.SourceSansBold,
                            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                            ["TextXAlignment"] = Enum.TextXAlignment.Left,
                            ["Limits"] = Vector2.new(300, 60)
                        }), u9.createElement(u3, {
                            ["Text"] = "Kit",
                            ["TextSize"] = 18,
                            ["Font"] = Enum.Font.SourceSans,
                            ["TextColor3"] = Color3.fromRGB(191, 191, 191),
                            ["Limits"] = Vector2.new(300, 60)
                        }) }) })
            })
        end
        local v61 = {
            ["BorderSizePixel"] = 0,
            ["ClipsDescendants"] = true,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(0, u41, 1, 0),
            ["BackgroundTransparency"] = u18.bgTransparency.playerRow,
            ["BackgroundColor3"] = u19.backgroundPrimary
        }
        local v62 = {
            u9.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            [#v62 + 1] = v42
        }
        return u9.createFragment({
            ["PlayerKitFrame"] = u9.createElement("Frame", v61, v62)
        })
    end
    local function v86() --[[ Line: 206 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u18
            [3] = u19
            [4] = u9
            [5] = u6
            [6] = u29
            [7] = u4
            [8] = u16
            [9] = u31
            [10] = u21
            [11] = u33
            [12] = u36
            [13] = u30
            [14] = u26
            [15] = u17
            [16] = u15
        --]]
        local v64 = {
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, -u41, 1, 0),
            ["BackgroundTransparency"] = u18.bgTransparency.playerRow,
            ["BackgroundColor3"] = u19.backgroundSecondary
        }
        local v65 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 0)
            }), u9.createElement(u6, {
                ["Size"] = UDim2.new(u18.columns.left.players.leftPadding, 0, 1, 0)
            }) }
        local v66 = #v65
        local v67 = {
            ["Size"] = UDim2.new(u18.columns.left.totalWidth, 0, 1, 0)
        }
        local v68 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 8)
            }) }
        local v69 = #v68
        local v70 = {
            ["Size"] = UDim2.new(1, 0, 1, 0)
        }
        local v71 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 4)
            }) }
        local v72 = #v71
        local v73
        if u29 == nil then
            v73 = false
        else
            v73 = u9.createFragment({
                ["PartyIdContainer"] = u9.createElement("Frame", {
                    ["Size"] = UDim2.new(0.06, 0, 0.9, 0),
                    ["BackgroundColor3"] = u4.WHITE
                }, {
                    u9.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }),
                    u9.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(1, 0)
                    }),
                    ["PartyId"] = u9.createElement("TextLabel", {
                        ["TextScaled"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(0.8, 0.8),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["Text"] = u29,
                        ["TextColor3"] = u4.BLACK,
                        ["Font"] = Enum.Font.GothamBold
                    })
                })
            })
        end
        if v73 then
            v71[v72 + 1] = v73
        end
        local v74 = #v71
        local v75 = u16.getLevelMeta(u31)
        if v75 ~= nil then
            v75 = v75.gradient
        end
        if v75 then
            v75 = u9.createElement("UIGradient", {
                ["Color"] = u16.getLevelMeta(u31).gradient
            })
        end
        local v76 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AutoLocalize"] = false,
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["AutomaticSize"] = "X",
            ["Font"] = "ArialBold",
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(0, 0, 0.8, 0),
            ["TextTransparency"] = u21.ContentTransparency,
            ["Text"] = "<font color=\"" .. u4.richTextColor(u16.getLevelColor(u31)) .. "\">" .. u33 .. "</font>",
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Center,
            ["TextTruncate"] = Enum.TextTruncate.AtEnd,
            ["TextColor3"] = u36
        }
        local v77 = {}
        local v78 = #v77
        if v75 then
            v77[v78 + 1] = v75
        end
        v77[#v77 + 1] = u9.createElement("UITextSizeConstraint", {
            ["MaxTextSize"] = 16
        })
        v71.PlayerLevel = u9.createElement("TextLabel", v76, v77)
        local v79 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.new(0, 0, 0.8, 0),
            ["TextTransparency"] = u21.ContentTransparency
        }
        local v80
        if u30 == "" or not u30 then
            v80 = ""
        else
            local v81 = u21.ContentTransparency
            local v82 = v81 == nil and 0.3 or v81
            v80 = "<font transparency=\"" .. tostring(v82) .. "\" color=\"#ffffff\">[" .. u30 .. "]</font>"
        end
        local v83 = " "
        local v84
        if u26 then
            v84 = u17.getGamePlayer(u26):getDisplayName()
        else
            v84 = u21.Player.displayName
        end
        v79.Text = v80 .. v83 .. v84
        v79.AutoLocalize = false
        v79.TextXAlignment = Enum.TextXAlignment.Left
        v79.TextYAlignment = Enum.TextYAlignment.Center
        v79.TextTruncate = Enum.TextTruncate.AtEnd
        v79.RichText = true
        v79.TextScaled = true
        v79.AutomaticSize = "X"
        v79.Font = "ArialBold"
        v79.TextColor3 = u36
        v79.LayoutOrder = 2
        v71.PlayerName = u9.createElement("TextLabel", v79, { u9.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 16
            }) })
        local v85 = u21.IsEarlyLeave
        if v85 then
            v85 = u9.createFragment({
                ["EarlyLeaveIcon"] = u9.createElement("ImageLabel", {
                    ["ScaleType"] = "Fit",
                    ["BorderSizePixel"] = 0,
                    ["ImageTransparency"] = 0.2,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 3,
                    ["Image"] = u15.DOOR_OPEN_SOLID_ICON,
                    ["Size"] = UDim2.fromOffset(16, 16),
                    ["ImageColor3"] = Color3.fromRGB(255, 59, 59)
                })
            })
        end
        if v85 then
            v71[v74 + 1] = v85
        end
        v68[v69 + 1] = u9.createElement(u6, v70, v71)
        v65[v66 + 1] = u9.createElement(u6, v67, v68)
        return u9.createFragment({
            ["PlayerNameContainer"] = u9.createElement("Frame", v64, v65)
        })
    end
    local v87 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.new(u18.columns.left.totalWidth, 0, 1, 0)
    }
    local v88 = { u9.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 0)
        }) }
    local v89 = #v88
    local v90 = not v35
    if v90 then
        v90 = u9.createElement(v63)
    end
    if v90 then
        v88[v89 + 1] = v90
    end
    v88[#v88 + 1] = u9.createElement(v86)
    return u9.createElement("Frame", v87, v88)
end
return {
    ["PlayerName"] = v10.new(u9)(v91)
}
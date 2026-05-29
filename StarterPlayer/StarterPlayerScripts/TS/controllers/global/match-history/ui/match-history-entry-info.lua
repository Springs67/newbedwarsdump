local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.AutoSizedText
local u5 = v2.ColorUtil
local u6 = v2.DeviceUtil
local u7 = v2.Empty
local u8 = v2.Padding
local u9 = v2.StringUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local function u21(p17) --[[ Line: 18 ]]
    local v18 = {
        "th",
        "st",
        "nd",
        "rd"
    }
    local v19 = p17 % 100
    if v19 >= 11 and v19 <= 13 then
        return tostring(p17) .. "th"
    end
    local v20 = v18[p17 % 10 + 1]
    if v20 == "" or not v20 then
        v20 = v18[1]
    end
    return tostring(p17) .. v20
end
local u22 = {
    ["TEAM"] = 0.6,
    ["KILLS"] = 0.35,
    ["BED_BREAKS"] = 0.35,
    ["FINAL_KILLS"] = 0.35,
    ["DAMAGE"] = 0.35
}
return {
    ["MatchHistoryEntryInfo"] = v13.new(u12)(function(u23, p24) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u10
            [3] = u11
            [4] = u22
            [5] = u12
            [6] = u8
            [7] = u5
            [8] = u14
            [9] = u15
            [10] = u7
            [11] = u9
            [12] = u16
            [13] = u21
            [14] = u3
            [15] = u4
        --]]
        local _ = p24.useState
        local u25 = u6.isHoarceKat() and true or u10.Controllers.PermissionController:hasAnyPermissions({ "admin", "anticheat_mod" })
        local function u31(p26) --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u22
            --]]
            local v27 = u11.values(u22)
            local v28 = 0
            for v29 = 1, #v27 do
                local v30 = v27[v29]
                local _ = v29 - 1
                v28 = v28 + v30
            end
            return u22[p26] / v28 / 1
        end
        local function u76(p32) --[[ Line: 59 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u12
                [3] = u8
                [4] = u25
                [5] = u5
                [6] = u31
                [7] = u14
                [8] = u15
                [9] = u7
                [10] = u9
            --]]
            local v33 = nil
            for v34, v35 in u23.match.players do
                local _ = v34 - 1
                local v36 = v35.playerInfo.userId
                local v37 = tostring(v36)
                local v38 = p32.userId
                if v37 == tostring(v38) == true then
                    v33 = v35
                    break
                end
            end
            local u39 = p32.offlinePlayer
            local v40 = {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.new(1, 0, 0, 30),
                ["BackgroundTransparency"] = p32.highlight and 0.75 or 1
            }
            local v41 = { u12.createElement(u8, {
                    ["Padding"] = {
                        ["Horizontal"] = 8
                    }
                }), u12.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 4)
                }) }
            local v42 = #v41
            local v43 = u25
            if v43 then
                local v44
                if v33 == nil then
                    v44 = v33
                else
                    v44 = v33.partyId
                end
                v43 = v44 ~= nil
                if v43 then
                    local v45 = u12.createFragment
                    local v46 = {}
                    local v47 = u12.createElement
                    local v48 = {
                        ["SizeConstraint"] = "RelativeYY",
                        ["BackgroundTransparency"] = 0.3,
                        ["Size"] = UDim2.new(0.85, 0, 0.85, 0),
                        ["BackgroundColor3"] = u5.WHITE
                    }
                    local v49 = { u12.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }), (u12.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(1, 0)
                        })) }
                    local v50 = u12.createElement
                    local v51 = {
                        ["TextScaled"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(0.8, 0.8),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5)
                    }
                    local v52 = v33.partyId
                    local v53 = tostring(v52)
                    v51.Text = string.sub(v53, 0, 6)
                    v51.TextColor3 = u5.BLACK
                    v51.Font = Enum.Font.GothamBold
                    v49.PartyId = v50("TextLabel", v51)
                    v46.PartyIdContainer = v47("Frame", v48, v49)
                    v43 = v45(v46)
                end
            end
            local v54 = {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(u31("TEAM"), 1)
            }
            local v55 = { u12.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 4)
                }) }
            local v56 = #v55
            if v43 then
                v55[v56 + 1] = v43
            end
            local v57 = #v55
            local v58 = {
                ["Size"] = UDim2.fromScale(1, 1),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
            }
            local v59
            if v33 == nil then
                v59 = v33
            else
                v59 = v33.bedwars.kit
            end
            local v60
            if v59 then
                v60 = u14(v33.bedwars.kit).renderImage
                if v60 == nil then
                    v60 = u15.NONE_KIT_RENDER
                end
            else
                v60 = u15.NONE_KIT_RENDER
            end
            v58.Image = v60
            v58.BackgroundTransparency = 1
            v58.LayoutOrder = 1
            v55.KitImage = u12.createElement("ImageLabel", v58, { u12.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
            v55[v57 + 1] = u12.createElement(u7, {
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(0.9, 1)
            }, {
                u12.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["Padding"] = UDim.new(0, 0)
                }),
                ["PlayerDisplayname"] = u12.createElement("TextBox", {
                    ["PlaceholderText"] = "",
                    ["Size"] = UDim2.new(1, 0, 0.525, 0),
                    ["Text"] = u39.displayName,
                    ["BackgroundTransparency"] = 1,
                    ["AutoLocalize"] = false,
                    ["TextScaled"] = true,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["TextXAlignment"] = "Left",
                    ["LayoutOrder"] = 1,
                    ["TextEditable"] = false,
                    ["ClearTextOnFocus"] = false,
                    [u12.Change.Text] = function(p61) --[[ Line: 193 ]]
                        --[[
                        Upvalues:
                            [1] = u39
                        --]]
                        p61.Text = u39.displayName
                    end
                }),
                ["PlayerUsernameWrapper"] = u12.createElement(u7, {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.new(1, 0, 0.475, 0)
                }, {
                    u12.createElement("UIListLayout", {
                        ["FillDirection"] = "Horizontal",
                        ["SortOrder"] = "LayoutOrder"
                    }),
                    ["@"] = u12.createElement("TextLabel", {
                        ["Text"] = "@",
                        ["BackgroundTransparency"] = 1,
                        ["AutomaticSize"] = "X",
                        ["BorderSizePixel"] = 0,
                        ["AutoLocalize"] = false,
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.new(0, 0, 1, 0),
                        ["Font"] = Enum.Font.SourceSans,
                        ["TextColor3"] = Color3.fromRGB(191, 191, 191)
                    }),
                    ["PlayerUsername"] = u12.createElement("TextBox", {
                        ["PlaceholderText"] = "",
                        ["Size"] = UDim2.new(1, 0, 1, 0),
                        ["Text"] = u39.name,
                        ["BackgroundTransparency"] = 1,
                        ["AutoLocalize"] = false,
                        ["TextScaled"] = true,
                        ["Font"] = Enum.Font.SourceSans,
                        ["TextColor3"] = Color3.fromRGB(191, 191, 191),
                        ["TextXAlignment"] = "Left",
                        ["LayoutOrder"] = 2,
                        ["TextEditable"] = false,
                        ["ClearTextOnFocus"] = false,
                        [u12.Change.Text] = function(p62) --[[ Line: 230 ]]
                            --[[
                            Upvalues:
                                [1] = u39
                            --]]
                            p62.Text = u39.name
                        end
                    })
                })
            })
            v41[v42 + 1] = u12.createElement(u7, v54, v55)
            local v63 = {
                ["Size"] = UDim2.fromScale(u31("KILLS"), 1)
            }
            local v64
            if v33 == nil then
                v64 = v33
            else
                v64 = v33.generic.kills.playerKills
            end
            local v65 = v64 == nil and 0 or v64
            v63.Text = tostring(v65)
            v63.Font = Enum.Font.Roboto
            v63.TextColor3 = Color3.fromRGB(255, 255, 255)
            v63.TextTransparency = 0.2
            v63.TextSize = 14
            v63.BackgroundTransparency = 1
            v63.LayoutOrder = 4
            v41[v42 + 2] = u12.createElement("TextLabel", v63)
            local v66 = {
                ["Size"] = UDim2.fromScale(u31("BED_BREAKS"), 1)
            }
            local v67
            if v33 == nil then
                v67 = v33
            else
                v67 = v33.bedwars.bedBreaks
            end
            local v68 = v67 == nil and 0 or v67
            v66.Text = tostring(v68)
            v66.Font = Enum.Font.Roboto
            v66.TextColor3 = Color3.fromRGB(255, 255, 255)
            v66.TextTransparency = 0.2
            v66.TextSize = 14
            v66.BackgroundTransparency = 1
            v66.LayoutOrder = 5
            v41[v42 + 3] = u12.createElement("TextLabel", v66)
            local v69 = {
                ["Size"] = UDim2.fromScale(u31("FINAL_KILLS"), 1)
            }
            local v70
            if v33 == nil then
                v70 = v33
            else
                v70 = v33.bedwars.finalKills
            end
            local v71 = v70 == nil and 0 or v70
            v69.Text = tostring(v71)
            v69.Font = Enum.Font.Roboto
            v69.TextColor3 = Color3.fromRGB(255, 255, 255)
            v69.TextTransparency = 0.2
            v69.TextSize = 14
            v69.BackgroundTransparency = 1
            v69.LayoutOrder = 6
            v41[v42 + 4] = u12.createElement("TextLabel", v69)
            local v72 = {
                ["Size"] = UDim2.fromScale(u31("DAMAGE"), 1)
            }
            local v73 = u9
            local v74 = math
            if v33 ~= nil then
                v33 = v33.generic.damageDealt
            end
            local v75 = v33 == nil and 0 or v33
            v72.Text = v73.formatNumberWithCommas((v74.round(v75)))
            v72.Font = Enum.Font.Roboto
            v72.TextColor3 = Color3.fromRGB(255, 255, 255)
            v72.TextTransparency = 0.2
            v72.TextSize = 14
            v72.BackgroundTransparency = 1
            v72.LayoutOrder = 7
            v41[v42 + 5] = u12.createElement("TextLabel", v72)
            return u12.createElement("Frame", v40, v41)
        end
        local function v105(p77) --[[ Line: 318 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u12
                [3] = u8
                [4] = u31
                [5] = u21
                [6] = u11
                [7] = u23
                [8] = u76
                [9] = u3
            --]]
            local v78 = p77.team
            local v79 = {
                ["LayoutOrder"] = 2,
                ["BorderSizePixel"] = 0,
                ["BackgroundColor3"] = u16.backgroundSecondary
            }
            local v80 = {
                u12.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 4)
                }),
                ["TableHeader"] = u12.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.15),
                    ["BackgroundColor3"] = u16.backgroundTertiaryCard
                }, {
                    u12.createElement(u8, {
                        ["Padding"] = {
                            ["Horizontal"] = 8,
                            ["Vertical"] = 6
                        }
                    }),
                    u12.createElement("UIListLayout", {
                        ["FillDirection"] = "Horizontal",
                        ["VerticalAlignment"] = "Center",
                        ["Padding"] = UDim.new(0, 4)
                    }),
                    u12.createElement("TextLabel", {
                        ["TextSize"] = 14,
                        ["RichText"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(u31("TEAM"), 1),
                        ["Text"] = v78.name .. " Team" .. "  <font color=\"#FFFFFF\">(" .. u21(v78.placement + 1) .. ")</font>",
                        ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                        ["TextColor3"] = Color3.fromHex(v78.colorHex),
                        ["TextXAlignment"] = Enum.TextXAlignment.Left
                    }),
                    u12.createElement("TextLabel", {
                        ["Text"] = "Kills",
                        ["TextSize"] = 14,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(u31("KILLS"), 1),
                        ["Font"] = Enum.Font.Roboto,
                        ["TextColor3"] = Color3.fromHex(v78.colorHex)
                    }),
                    u12.createElement("TextLabel", {
                        ["Text"] = "Bed Breaks",
                        ["TextSize"] = 14,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(u31("BED_BREAKS"), 1),
                        ["Font"] = Enum.Font.Roboto,
                        ["TextColor3"] = Color3.fromHex(v78.colorHex)
                    }),
                    u12.createElement("TextLabel", {
                        ["Text"] = "Final Kills",
                        ["TextSize"] = 14,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(u31("FINAL_KILLS"), 1),
                        ["Font"] = Enum.Font.Roboto,
                        ["TextColor3"] = Color3.fromHex(v78.colorHex)
                    }),
                    u12.createElement("TextLabel", {
                        ["Text"] = "Damage",
                        ["TextSize"] = 14,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(u31("DAMAGE"), 1),
                        ["Font"] = Enum.Font.Roboto,
                        ["TextColor3"] = Color3.fromHex(v78.colorHex)
                    })
                })
            }
            local v81 = #v80
            local v82 = 0
            local v83 = {}
            for v84, v85 in u11.entries(v78.members) do
                local _ = v84 - 1
                local v86 = v85[1]
                local v87 = v85[2]
                local v88
                if v86 == u23.userId then
                    v88 = u12.createElement(u76, {
                        ["highlight"] = true,
                        ["LayoutOrder"] = 1,
                        ["userId"] = v86,
                        ["offlinePlayer"] = v87
                    })
                else
                    v88 = nil
                end
                if v88 ~= nil then
                    v82 = v82 + 1
                    v83[v82] = v88
                end
            end
            local v89 = {
                ["ScrollingFrameProps"] = {
                    ["Name"] = "TableRows",
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.new(1, 0, 0.85, -4)
                }
            }
            local v90 = { u12.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder"
                }) }
            local v91 = #v90
            for v92, v93 in v83 do
                v90[v91 + v92] = v93
            end
            local v94 = #v90
            local v95 = 0
            local v96 = {}
            for v97, v98 in u11.entries(v78.members) do
                local v99 = v97 - 1
                local v100 = v98[1]
                local v101 = v98[2]
                local v102
                if v100 == u23.userId then
                    v102 = nil
                else
                    v102 = u12.createElement(u76, {
                        ["userId"] = v100,
                        ["offlinePlayer"] = v101,
                        ["LayoutOrder"] = v99 + 2
                    })
                end
                if v102 ~= nil then
                    v95 = v95 + 1
                    v96[v95] = v102
                end
            end
            for v103, v104 in v96 do
                v90[v94 + v103] = v104
            end
            v80[v81 + 1] = u12.createElement(u3, v89, v90)
            return u12.createElement("Frame", v79, v80)
        end
        local v106 = {
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.new(1, 0, 0.79, -70)
            }
        }
        local v107 = { u12.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 4)
            }), u12.createElement(u4, {
                ["TextSize"] = 10,
                ["Text"] = "Match Id: " .. u23.match.matchId,
                ["Font"] = Enum.Font.SourceSans,
                ["TextColor3"] = Color3.fromRGB(191, 191, 191),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["Limits"] = Vector2.new(300, 60)
            }) }
        local v108 = #v107
        local v109 = 0
        local v110 = {}
        for v111, v112 in u23.match.teams do
            local _ = v111 - 1
            local v113
            if v112.members[u23.userId] == nil then
                v113 = nil
            else
                v113 = u12.createElement(v105, {
                    ["layoutOrder"] = 1,
                    ["team"] = v112
                })
            end
            if v113 ~= nil then
                v109 = v109 + 1
                v110[v109] = v113
            end
        end
        local v114 = {
            ["AutomaticSize"] = "Y",
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 0, 0)
        }
        local v115 = { u12.createElement("UIGridLayout", {
                ["FillDirection"] = "Horizontal",
                ["FillDirectionMaxCells"] = 1,
                ["HorizontalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["CellSize"] = UDim2.new(1, 0, 0, 160),
                ["CellPadding"] = UDim2.new(0, 0, 0, 0)
            }) }
        local v116 = #v115
        for v117, v118 in v110 do
            v115[v116 + v117] = v118
        end
        local v119 = #v115
        local v120 = u23.match.teams
        table.sort(v120, function(p121, p122) --[[ Line: 534 ]]
            return p121.placement < p122.placement
        end)
        local v123 = 0
        local v124 = {}
        for v125, v126 in v120 do
            local v127 = v125 - 1
            local v128
            if v126.members[u23.userId] == nil then
                v128 = u12.createElement(v105, {
                    ["team"] = v126,
                    ["layoutOrder"] = v127 + 2
                })
            else
                v128 = nil
            end
            if v128 ~= nil then
                v123 = v123 + 1
                v124[v123] = v128
            end
        end
        for v129, v130 in v124 do
            v115[v119 + v129] = v130
        end
        v107[v108 + 1] = u12.createElement(u7, v114, v115)
        return u12.createElement(u3, v106, v107)
    end)
}
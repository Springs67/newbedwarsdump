local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.ColorUtil
local u6 = v3.Empty
local u7 = v3.OfflinePlayerUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button").ToggleButton
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button-group").ToggleButtonGroup
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank
local u15 = v1.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout
local u16 = v1.import(script, script.Parent, "clan-member-display").ClanMemberDisplay
local u17 = v1.import(script, script.Parent, "clan-profile-members-row").ClanProfileMembersRow
return {
    ["ClanProfileMembersTab"] = v10.new(u9)(function(u18, p19) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u7
            [3] = u8
            [4] = u2
            [5] = u14
            [6] = u9
            [7] = u11
            [8] = u12
            [9] = u13
            [10] = u6
            [11] = u5
            [12] = u17
            [13] = u4
            [14] = u15
        --]]
        local v20 = p19.useState
        local v21 = p19.useEffect
        local u22, u23 = v20({})
        local v24, u25 = v20({})
        local u26, u27 = v20({})
        local u28, u29 = v20({
            {
                ["text"] = "Player",
                ["width"] = 0.275
            },
            {
                ["text"] = "Rank",
                ["width"] = 0.125
            },
            {
                ["text"] = "Level",
                ["width"] = 0.15
            },
            {
                ["text"] = "Season Rank",
                ["width"] = 0.15
            },
            {
                ["text"] = "Total Wins",
                ["width"] = 0.15
            },
            {
                ["text"] = "",
                ["width"] = 0.15
            }
        })
        local u30, u31 = v20(u16.STATS)
        local u32 = (#u28 - 1) * 0.05 / #u28
        v21(function() --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u30
                [3] = u16
                [4] = u29
            --]]
            local v33 = u28
            if u30 == u16.STATS then
                v33[3].text = "Level"
                v33[3].width = 0.15
                v33[4].text = "Season Rank"
                v33[4].width = 0.15
                v33[5].text = "Total Wins"
                v33[5].width = 0.15
            elseif u30 == u16.CLAN_WAR then
                v33[3].text = "Missions Completed"
                v33[3].width = 0.45
                v33[4].text = ""
                v33[5].text = ""
                v33[4].width = 0
                v33[5].width = 0
            else
                v33[3].text = "Contribution"
                v33[3].width = 0.15
                v33[4].text = "Daily Cont."
                v33[4].width = 0.15
                v33[5].text = "Weekly Cont."
                v33[5].width = 0.15
            end
            u29(v33)
        end, { u30 })
        v21(function() --[[ Line: 73 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u7
                [3] = u8
                [4] = u2
                [5] = u23
                [6] = u25
                [7] = u27
            --]]
            local v34 = {}
            local v35 = #v34
            for v36, v37 in u18.Members do
                v35 = v35 + 1
                v34[v35] = { v36, v37 }
            end
            local u38 = {}
            for _, v39 in v34 do
                u38[v39[1]] = v39[2]
            end
            local v40 = u7
            local v41 = u8.values(u38)
            local v42 = table.create(#v41)
            local u43 = {}
            for v44, v45 in v41 do
                local _ = v44 - 1
                v42[v44] = v45.offlinePlayer.userId
            end
            v40.getOfflinePlayersByUserIds(v42):andThen(function(p46) --[[ Line: 99 ]]
                --[[
                Upvalues:
                    [1] = u38
                --]]
                for v47, v48 in p46 do
                    local _ = v47 - 1
                    local v49 = v48.userId
                    local v50 = u38[tostring(v49)]
                    if v50 then
                        local v51 = v48.userId
                        local v52 = tostring(v51)
                        local v53 = {}
                        for v54, v55 in v50 do
                            v53[v54] = v55
                        end
                        v53.offlinePlayer = v48
                        u38[v52] = v53
                    end
                end
            end)
            local function v68(_, p56) --[[ Line: 119 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u18
                    [3] = u43
                --]]
                local v57 = u2
                local v58 = u18.store.Clans.activeClanWar
                if v58 ~= nil then
                    v58 = v58.missionsCompleted
                end
                local v59 = v58 == nil and {} or v58
                local v60 = v57.keys(v59)
                local v61 = table.create(#v60)
                for v62, v63 in v60 do
                    local _ = v62 - 1
                    v61[v62] = string.split(v63, "-")[1]
                end
                local v64 = 0
                local v65 = {}
                for v66, v67 in v61 do
                    local _ = v66 - 1
                    if v67 == p56 == true then
                        v64 = v64 + 1
                        v65[v64] = v67
                    end
                end
                u43[p56] = #v65
            end
            for v69, v70 in u38 do
                v68(v70, v69, u38)
            end
            local v71 = u8.values(u38)
            table.sort(v71, function(p72, p73) --[[ Line: 160 ]]
                return string.lower(p72.offlinePlayer.displayName) < string.lower(p73.offlinePlayer.displayName)
            end)
            u23(v71)
            u25(v71)
            u27(u43)
        end, { u18.Members })
        local u74 = u18.store.Clans.myClanId == u18.ClanId and u18.store.Clans.myClanMember
        if u74 then
            u74 = u18.store.Clans.myClanMember.rank >= u14.ADMIN
        end
        if u74 == nil then
            u74 = false
        end
        local v75 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Left",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 10)
            }) }
        local v76 = #v75
        local v77 = {
            ["Size"] = UDim2.new(0.95, 0, 0.08, 0)
        }
        local function v81(p78, p79) --[[ Line: 221 ]]
            local v80 = {
                ["key"] = p79.offlinePlayer.displayName,
                ["aliases"] = { p79.offlinePlayer.name }
            }
            table.insert(p78, v80)
            return p78
        end
        local v82 = {}
        local function v92(p83, p84) --[[ Line: 177 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u22
            --]]
            if p83 == "" then
                u25(u22)
                return nil
            end
            local v85 = 0
            local v86 = {}
            for v87, v88 in u22 do
                local _ = v87 - 1
                local v89 = v88.offlinePlayer.displayName
                local v90 = table.find(p84, v89) ~= nil
                if not v90 then
                    local v91 = v88.offlinePlayer.name
                    v90 = table.find(p84, v91) ~= nil
                end
                if v90 == true then
                    v85 = v85 + 1
                    v86[v85] = v88
                end
            end
            u25(v86)
        end
        local v93 = {
            ["Title"] = "MEMBERS"
        }
        for v94 = 1, #u22 do
            v82 = v81(v82, u22[v94], v94 - 1, u22)
        end
        v77.Items = v82
        v77.InputText = ""
        v77.OnTextChange = v92
        v77.PlaceHolderText = "Search Member"
        v77.LayoutOrder = 2
        v75[v76 + 1] = u9.createElement(u11, v77)
        local v95 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.new(0.95, 0, 0.08, 0)
        }
        local v96 = {}
        local v97 = #v96
        local v98 = u8.values(u16)
        local function v100(p99) --[[ Line: 250 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u12
            --]]
            return u9.createElement(u12, {
                ["Value"] = p99,
                ["Text"] = string.upper(table.concat(string.split(p99, "_"), " "))
            })
        end
        local v101 = table.create(#v98)
        for v102, v103 in v98 do
            v101[v102] = v100(v103, v102 - 1, v98)
        end
        local v104 = {}
        local v105 = #v104
        local v107 = {
            ["Value"] = u30,
            ["OnChange"] = function(p106) --[[ Name: OnChange, Line 264 ]]
                --[[
                Upvalues:
                    [1] = u31
                --]]
                return u31(p106)
            end
        }
        for v108, v109 in v101 do
            v104[v105 + v108] = v109
        end
        v96[v97 + 1] = u9.createElement(u13, v107, v104)
        v75.ToggleMemberDisplayValues = u9.createElement(u6, v95, v96)
        local v110 = {
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.new(0.95, 0, 0, 20)
        }
        local v111 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 12)
            }), u9.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.03, 0),
                ["PaddingRight"] = UDim.new(0.03, 0)
            }) }
        local v112 = #v111
        local function v116(p113) --[[ Line: 292 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u5
                [3] = u9
            --]]
            local v114 = {
                ["Size"] = UDim2.new(p113.width - u32, 0, 1, 0)
            }
            local v115 = p113.text
            v114.Text = (v115 == "" or not v115) and "" or "<b>" .. p113.text .. "</b>"
            v114.TextScaled = true
            v114.RichText = true
            v114.Font = "Roboto"
            v114.TextColor3 = u5.WHITE
            v114.TextXAlignment = "Left"
            v114.TextYAlignment = "Bottom"
            v114.BackgroundTransparency = 1
            v114.LayoutOrder = 1
            return u9.createElement("TextLabel", v114, { u9.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) })
        end
        local v117 = table.create(#u28)
        for v118, v119 in u28 do
            v117[v118] = v116(v119, v118 - 1, u28)
        end
        local v120 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 1, 0)
        }
        local v121 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Bottom",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v122 = #v121
        for v123, v124 in v117 do
            v121[v122 + v123] = v124
        end
        v111[v112 + 1] = u9.createElement(u6, v120, v121)
        v75.TableColumnHeaders = u9.createElement(u6, v110, v111)
        local function v132(p125, p126) --[[ Line: 337 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u74
                [3] = u18
                [4] = u30
                [5] = u26
                [6] = u9
                [7] = u17
            --]]
            local v127 = {
                ["Columns"] = u28,
                ["ClanMember"] = p125,
                ["AdminView"] = u74
            }
            local v128 = p125.offlinePlayer.userId
            local v129 = u18.store.Clans.myClanMember
            if v129 ~= nil then
                v129 = v129.offlinePlayer.userId
            end
            v127.IsMyClanMemberRow = v128 == v129
            v127.Index = p126
            v127.DisplayDataType = u30
            v127.store = u18.store
            local v130 = p125.offlinePlayer.userId
            local v131 = u26[tostring(v130)]
            v127.missionProgressCount = v131 == nil and 0 or v131
            return u9.createElement(u17, v127)
        end
        local v133 = table.create(#v24)
        for v134, v135 in v24 do
            v133[v134] = v132(v135, v134 - 1, v24)
        end
        local v136 = {
            ["AdditionalSpace"] = 120,
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 5,
                ["Size"] = UDim2.new(1, 0, 0.84, -40)
            }
        }
        local v137 = { u9.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 2),
                ["PaddingLeft"] = UDim.new(0, 2)
            }), u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Left",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 4)
            }) }
        local v138 = #v137
        for v139, v140 in v133 do
            v137[v138 + v139] = v140
        end
        v75[v76 + 2] = u9.createElement(u4, v136, v137)
        return u9.createElement(u15, v93, v75)
    end)
}
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "kit-shop", "filters", "kit-shop-filters").KitShopFilters
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "lobby-kit-shop", "shop-items", "lobby-kit-shop-item-card").KitShopItemCard
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta")
local u15 = v14.BedwarsBPKits
local u16 = v14.BedwarsKitMeta
local u17 = v14.getBedwarsKitMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["TrainingRoomKitList"] = v8.new(u7)(function(u20, p21) --[[ Line: 21 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u18
            [3] = u16
            [4] = u3
            [5] = u5
            [6] = u6
            [7] = u15
            [8] = u12
            [9] = u19
            [10] = u7
            [11] = u9
            [12] = u11
            [13] = u4
            [14] = u10
            [15] = u13
        --]]
        local v22 = p21.useState
        local v23 = p21.useEffect
        local v24, u25 = v22(Vector2.new(584, 443))
        local v26, u27 = v22(443)
        local u28, u29 = v22(false)
        local v30, u31 = v22(false)
        local u32, u33 = v22(false)
        local u34, u35 = v22("")
        local u36, u37 = v22("")
        local u38, u39 = v22({})
        local u40, u41 = v22({})
        local u42, u43 = v22({})
        local v44 = v24.X * 0.2191780821917808
        local v45 = math.floor(v44)
        local v46 = v24.X * 0.03571428571428571
        local v47 = math.floor(v46)
        local function u72() --[[ Line: 43 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u42
                [3] = u38
                [4] = u32
                [5] = u17
                [6] = u28
                [7] = u34
                [8] = u36
                [9] = u40
            --]]
            local v48 = u20.store.Bedwars.ownedKits
            local v49
            if #u42 == 0 then
                v49 = u38
            else
                v49 = u42
            end
            if u32 then
                local v50 = 0
                v49 = {}
                for v51, v52 in v49 do
                    local _ = v51 - 1
                    local v53
                    if v52.bedwarsKit then
                        v53 = u17(v52.bedwarsKit).unlockedInBattlePass
                    else
                        v53 = false
                    end
                    if v53 == true then
                        v50 = v50 + 1
                        v49[v50] = v52
                    end
                end
            end
            if u28 then
                local v54 = 0
                v49 = {}
                for v55, v56 in v49 do
                    local _ = v55 - 1
                    local v57
                    if v56.bedwarsKit then
                        local v58 = v56.bedwarsKit
                        v57 = table.find(v48, v58) ~= nil
                    else
                        v57 = false
                    end
                    if v57 == true then
                        v54 = v54 + 1
                        v49[v54] = v56
                    end
                end
            end
            if u34 ~= "" then
                local v59 = 0
                v49 = {}
                for v60, v61 in v49 do
                    local _ = v60 - 1
                    local v62
                    if v61.bedwarsKit then
                        local v63 = u17(v61.bedwarsKit).kitClass
                        v62 = tostring(v63) == u34
                    else
                        v62 = false
                    end
                    if v62 == true then
                        v59 = v59 + 1
                        v49[v59] = v61
                    end
                end
            end
            if u36 ~= "" then
                local u68 = u36 == "A \226\134\146 Z" and function(p64, p65) --[[ Name: alphabetized, Line 113 ]]
                    return p64 < p65
                end or (u36 == "Z \226\134\146 A" and function(p66, p67) --[[ Name: reverseAlphabetized, Line 120 ]]
                    return p67 < p66
                end or nil)
                local function v71(p69, p70) --[[ Line: 128 ]]
                    --[[
                    Upvalues:
                        [1] = u17
                        [2] = u68
                    --]]
                    return u68(not p69.bedwarsKit and "" or string.lower(u17(p69.bedwarsKit).name), not p70.bedwarsKit and "" or string.lower(u17(p70.bedwarsKit).name))
                end
                table.sort(v49, v71)
            end
            if v49 == u40 then
                return u38
            else
                return v49
            end
        end
        local function u85(p73, p74) --[[ Line: 147 ]]
            --[[
            Upvalues:
                [1] = u43
                [2] = u72
                [3] = u17
                [4] = u38
            --]]
            if p73 == "" then
                u43({})
                return u72()
            end
            local u75 = {}
            local function v82(p76) --[[ Line: 154 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u38
                    [3] = u75
                --]]
                local v77 = nil
                for v78, v79 in u38 do
                    local _ = v78 - 1
                    local v80
                    if v79.bedwarsKit then
                        v80 = string.lower(u17(v79.bedwarsKit).name) == string.lower(p76)
                    else
                        v80 = nil
                    end
                    if v80 == true then
                        v77 = v79
                        break
                    end
                end
                if v77 then
                    local v81 = u75
                    table.insert(v81, v77)
                end
            end
            for v83, v84 in p74 do
                v82(v84, v83 - 1, p74)
            end
            u43(u75)
            return u75
        end
        v23(function() --[[ Line: 181 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u18
                [3] = u20
                [4] = u16
                [5] = u3
                [6] = u5
                [7] = u6
                [8] = u15
                [9] = u12
                [10] = u39
                [11] = u41
            --]]
            local function u121(p86, u87) --[[ Line: 182 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u18
                    [3] = u20
                    [4] = u16
                    [5] = u3
                    [6] = u5
                --]]
                local v88 = 0
                local v89 = {}
                for v90, v91 in p86 do
                    local _ = v90 - 1
                    if not u17(v91).hiddenInShop == true then
                        v88 = v88 + 1
                        v89[v88] = v91
                    end
                end
                local v92 = 0
                local v93 = {}
                for v94, v95 in v89 do
                    local _ = v94 - 1
                    local v96
                    if u87 == nil then
                        v96 = u87
                    else
                        v96 = u87.includeFreeKits
                    end
                    local v97
                    if v96 then
                        v97 = u18.FreeKitRotation.kitAvailableThisWeek(v95, u20.store.Bedwars.freeKitLevel)
                    else
                        v97 = not u18.FreeKitRotation.kitAvailableThisWeek(v95, u20.store.Bedwars.freeKitLevel)
                    end
                    if v97 == true then
                        v92 = v92 + 1
                        v93[v92] = v95
                    end
                end
                local v98 = 0
                local v99 = {}
                for v100, v101 in v93 do
                    local _ = v100 - 1
                    local _ = u17(v101).hiddenInShopTillUnlocked
                    local v102 = true
                    if v102 == true then
                        v98 = v98 + 1
                        v99[v98] = v101
                    end
                end
                local function v108(p103) --[[ Line: 232 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                        [2] = u87
                        [3] = u3
                        [4] = u5
                        [5] = u18
                        [6] = u20
                    --]]
                    local v104 = u16[p103]
                    if v104.battlepassSeason ~= nil then
                        local v105 = u87
                        if v105 ~= nil then
                            v105 = v105.includeBattlePassKits
                        end
                        if not v105 then
                            return false
                        end
                        if not u3.isHoarceKat() and u5.Controllers.UnlockController.allKitsUnlocked then
                            return true
                        end
                        if u18.FreeKitRotation.kitAvailableThisWeek(p103, u20.store.Bedwars.freeKitLevel) then
                            return true
                        end
                    end
                    local v106 = u87
                    if v106 ~= nil then
                        v106 = v106.includeFeaturedKits
                    end
                    local v107 = not v106
                    if v107 then
                        v107 = v104.featured ~= nil
                    end
                    return not v107
                end
                local v109 = 0
                local v110 = {}
                for v111, v112 in v99 do
                    if v108(v112, v111 - 1, v99) == true then
                        v109 = v109 + 1
                        v110[v109] = v112
                    end
                end
                local function v117(p113, p114) --[[ Line: 277 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                    --]]
                    local v115 = u16[p113]
                    local v116 = u16[p114]
                    return v115.name < v116.name
                end
                table.sort(v110, v117)
                local v118 = table.create(#v110)
                for v119, v120 in v110 do
                    local _ = v119 - 1
                    v118[v119] = {
                        ["bedwarsKit"] = v120
                    }
                end
                return v118
            end
            local v122 = u121(u6.values(u18.ShopKits), {
                ["includeFreeKits"] = true,
                ["includeBattlePassKits"] = true
            })
            local v123 = 0
            local v124 = {}
            for v125, v126 in u6.values(u18.ShopKits) do
                local _ = v125 - 1
                if u17(v126).featured ~= nil == true then
                    v123 = v123 + 1
                    v124[v123] = v126
                end
            end
            local v127 = u121(v124, {
                ["includeFeaturedKits"] = true
            })
            local v128 = u121(u15[u12.BATTLE_PASS_SEASON], {
                ["includeBattlePassKits"] = true
            })
            local v129 = u121(u6.values(u18.ShopKits))
            local v130 = u6.entries(u15)
            table.sort(v130, function(p131, p132) --[[ Line: 328 ]]
                local v133 = p131[1]
                local _ = p131[2]
                local v134 = p132[1]
                local _ = p132[2]
                return v134 < v133
            end)
            local function v144(p135, p136) --[[ Line: 336 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u121
                --]]
                local v137 = p136[1]
                local v138 = p136[2]
                if v137 == u12.BATTLE_PASS_SEASON then
                    return p135
                end
                local v139 = {}
                local v140 = #v139
                local v141 = #p135
                table.move(p135, 1, v141, v140 + 1, v139)
                local v142 = v140 + v141
                local v143 = u121(v138, {
                    ["includeBattlePassKits"] = true
                })
                table.move(v143, 1, #v143, v142 + 1, v139)
                return v139
            end
            local v145 = {}
            for v146 = 1, #v130 do
                v145 = v144(v145, v130[v146], v146 - 1, v130)
            end
            local v147 = {}
            local v148 = #v147
            local v149 = #v122
            table.move(v122, 1, v149, v148 + 1, v147)
            local v150 = v148 + v149
            local v151 = #v127
            table.move(v127, 1, v151, v150 + 1, v147)
            local v152 = v150 + v151
            local v153 = #v128
            table.move(v128, 1, v153, v152 + 1, v147)
            local v154 = v152 + v153
            local v155 = #v129
            table.move(v129, 1, v155, v154 + 1, v147)
            local v156 = v154 + v155
            table.move(v145, 1, #v145, v156 + 1, v147)
            u39(v147)
            local v157 = {}
            local v158 = #v157
            local v159 = #v122
            table.move(v122, 1, v159, v158 + 1, v157)
            local v160 = v158 + v159
            local v161 = #v127
            table.move(v127, 1, v161, v160 + 1, v157)
            local v162 = v160 + v161
            local v163 = #v128
            table.move(v128, 1, v163, v162 + 1, v157)
            local v164 = v162 + v163
            local v165 = #v129
            table.move(v129, 1, v165, v164 + 1, v157)
            local v166 = v164 + v165
            table.move(v145, 1, #v145, v166 + 1, v157)
            u41(v157)
        end, {
            u28,
            u32,
            u34,
            u36,
            u20.store.Bedwars.ownedKits
        })
        v23(function() --[[ Line: 396 ]]
            --[[
            Upvalues:
                [1] = u38
                [2] = u72
                [3] = u41
            --]]
            if #u38 == 0 then
                return nil
            end
            u41((u72()))
        end, {
            u28,
            u32,
            u34,
            u36
        })
        local v167 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = u20.Size,
            ["BackgroundColor3"] = u19.backgroundPrimary
        }
        local v173 = { u7.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.03, 0),
                ["PaddingBottom"] = UDim.new(0.05, 0),
                ["PaddingLeft"] = UDim.new(0.03, 0),
                ["PaddingRight"] = UDim.new(0.03, 0)
            }), u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.01, 0)
            }), u7.createElement(u9, {
                ["LayoutOrder"] = 1,
                ["Visible"] = true,
                ["Size"] = UDim2.fromScale(1, 0.05),
                ["SetKitUnlockedToggle"] = function(p168) --[[ Name: SetKitUnlockedToggle, Line 424 ]]
                    --[[
                    Upvalues:
                        [1] = u29
                    --]]
                    u29(p168)
                end,
                ["SetBattlePassKitsToggle"] = function(p169) --[[ Name: SetBattlePassKitsToggle, Line 427 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                    --]]
                    u33(p169)
                end,
                ["SetKitClassFilter"] = function(p170) --[[ Name: SetKitClassFilter, Line 430 ]]
                    --[[
                    Upvalues:
                        [1] = u35
                    --]]
                    u35(p170)
                end,
                ["SetKitSortAlgorithm"] = function(p171) --[[ Name: SetKitSortAlgorithm, Line 433 ]]
                    --[[
                    Upvalues:
                        [1] = u37
                    --]]
                    u37(p171)
                end,
                ["SetFavoritedToggle"] = function(p172) --[[ Name: SetFavoritedToggle, Line 436 ]]
                    --[[
                    Upvalues:
                        [1] = u31
                    --]]
                    u31(p172)
                end,
                ["FavoritedToggle"] = v30,
                ["KitUnlockedToggle"] = u28,
                ["BattlePassKitsToggle"] = u32,
                ["KitClassFilter"] = u34,
                ["KitSortAlgorirthm"] = u36
            }) }
        local v174 = #v173
        local v175 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, u3.isSmallScreen() and 0.08 or 0.06, 0)
        }
        local v176 = {}
        local v177 = #v176
        local v178 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.6, 1)
        }
        local v179 = {}
        for v180 = 1, #u38 do
            local v181 = u38[v180]
            local _ = v180 - 1
            if v181.bedwarsKit then
                local v182 = {
                    ["key"] = u17(v181.bedwarsKit).name
                }
                table.insert(v179, v182)
            end
        end
        v178.Items = v179
        v178.InputText = ""
        function v178.OnTextChange(p183, p184) --[[ Line: 477 ]]
            --[[
            Upvalues:
                [1] = u41
                [2] = u85
            --]]
            u41((u85(p183, p184)))
        end
        v178.PlaceHolderText = "Search Kit"
        v176[v177 + 1] = u7.createElement(u11, v178)
        v173[v174 + 1] = u7.createElement(u4, v175, v176)
        local v186 = {
            ["Size"] = UDim2.new(1, 0, u3.isSmallScreen() and 0.87 or 0.89, 0),
            ["CanvasSize"] = UDim2.new(1, 0, 0.07, v26 + 36),
            ["ScrollingDirection"] = "Y",
            ["ScrollBarThickness"] = 6,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Selectable"] = false,
            [u7.Change.AbsoluteSize] = function(p185) --[[ Line: 491 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                u25(p185.AbsoluteSize)
            end,
            ["LayoutOrder"] = 2
        }
        local v187 = {}
        local v188 = #v187
        local function v192(p189, p190) --[[ Line: 498 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u10
                [3] = u20
            --]]
            if p189.bedwarsKit then
                local u191 = p189.bedwarsKit
                return u7.createElement(u10, {
                    ["Kit"] = u191,
                    ["Selected"] = u20.SelectedKit == u191,
                    ["LayoutOrder"] = p190,
                    ["store"] = u20.store,
                    ["OnClick"] = function() --[[ Name: OnClick, Line 506 ]]
                        --[[
                        Upvalues:
                            [1] = u20
                            [2] = u191
                        --]]
                        u20.SetSelectedKit(u191)
                    end
                })
            end
        end
        local v193 = 0
        local v194 = {}
        for v195, v196 in u40 do
            local v197 = v192(v196, v195 - 1, u40)
            if v197 ~= nil then
                v193 = v193 + 1
                v194[v193] = v197
            end
        end
        local v198 = {
            ["Position"] = UDim2.fromScale(0, 0.01),
            ["Size"] = UDim2.fromScale(0.99, 0.9)
        }
        local v200 = { u7.createElement("UIGridLayout", {
                ["CellSize"] = UDim2.fromOffset(v45, v45),
                ["CellPadding"] = UDim2.fromOffset(v47, v47),
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Top",
                ["SortOrder"] = "LayoutOrder",
                ["FillDirectionMaxCells"] = 4,
                [u7.Change.AbsoluteCellCount] = function(p199) --[[ Line: 535 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                    --]]
                    u27(p199.AbsoluteContentSize.Y)
                end
            }), u7.createElement(u10, {
                ["LayoutOrder"] = -2,
                ["Kit"] = u13.NONE,
                ["Selected"] = u20.SelectedKit == u13.NONE,
                ["store"] = u20.store,
                ["OnClick"] = function() --[[ Name: OnClick, Line 544 ]]
                    --[[
                    Upvalues:
                        [1] = u20
                        [2] = u13
                    --]]
                    u20.SetSelectedKit(u13.NONE)
                end
            }) }
        local v201 = #v200
        for v202, v203 in v194 do
            v200[v201 + v202] = v203
        end
        v187[v188 + 1] = u7.createElement(u4, v198, v200)
        v173[v174 + 2] = u7.createElement("ScrollingFrame", v186, v187)
        return u7.createElement("Frame", v167, v173)
    end)
}
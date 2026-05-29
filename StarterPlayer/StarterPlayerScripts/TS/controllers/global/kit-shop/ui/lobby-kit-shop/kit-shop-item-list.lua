local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.CalcTotalUIScale
local u5 = v3.ColorUtil
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.GetUIScaleAncestors
local u9 = v3.SoundManager
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-type").BundleType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta")
local u23 = v22.BedwarsKitMeta
local u24 = v22.getBedwarsKitMeta
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local v30 = v1.import(script, script.Parent, "filters", "kit-shop-filters")
local u31 = v30.KitShopFilters
local u32 = v30.OwnedFilter
local u33 = v1.import(script, script.Parent, "shop-items", "lobby-kit-shop-bundle-card").KitShopBundleCard
local u34 = v1.import(script, script.Parent, "shop-items", "lobby-kit-shop-item-card").KitShopItemCard
return {
    ["KitShopItemList"] = v13.new(u12)(function(u35, p36) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u12
            [3] = u24
            [4] = u21
            [5] = u20
            [6] = u6
            [7] = u10
            [8] = u18
            [9] = u15
            [10] = u9
            [11] = u28
            [12] = u27
            [13] = u2
            [14] = u16
            [15] = u34
            [16] = u33
            [17] = u25
            [18] = u29
            [19] = u23
            [20] = u11
            [21] = u17
            [22] = u19
            [23] = u8
            [24] = u4
            [25] = u7
            [26] = u26
            [27] = u31
            [28] = u5
            [29] = u14
        --]]
        local v37 = p36.useState
        local v38 = p36.useEffect
        local v39 = p36.useValue
        local v40 = p36.useMemo
        if u35.SelectionMode == nil then
            u35.SelectionMode = "OPEN_DETAILS"
        end
        local u41, u42 = v37(u35.SelectedKit or u35.store.Bedwars.kit)
        local v43, u44 = v37(u35.store.Bedwars.kit)
        local v45, u46 = v37(Vector2.new(584, 443))
        local v47 = u35.InitialState
        if v47 ~= nil then
            v47 = v47.KitClassFilter
        end
        local u48, u49 = v37(v47 == nil and "" or v47)
        local v50 = u35.InitialState
        if v50 ~= nil then
            v50 = v50.OwnedFilter
        end
        if v50 == nil then
            local v51 = u32.ALL
            v50 = tostring(v51)
        end
        local u52, u53 = v37(v50)
        local v54 = u35.InitialState
        if v54 ~= nil then
            v54 = v54.FavoritedToggle
        end
        if v54 == nil then
            v54 = false
        end
        local u55, u56 = v37(v54)
        local v57 = u35.InitialState
        if v57 ~= nil then
            v57 = v57.SearchText
        end
        local u58, u59 = v37(v57 == nil and "" or v57)
        local u60, u61 = v37({})
        local u62, u63 = v37({})
        local u64, u65 = v37({})
        local v66 = u35.InitialState
        if v66 ~= nil then
            v66 = v66.CanvasPositionY
        end
        local u67 = v39(v66)
        local v68 = u35.InitialState
        if v68 ~= nil then
            v68 = v68.KitClassFilter
        end
        local u69 = v39(v68)
        local v70 = u35.InitialState
        if v70 ~= nil then
            v70 = v70.OwnedFilter
        end
        local u71 = v39(v70)
        local v72 = u35.InitialState
        if v72 ~= nil then
            v72 = v72.FavoritedToggle
        end
        local u73 = v39(v72)
        local v74 = u35.InitialState
        if v74 ~= nil then
            v74 = v74.SearchText
        end
        local u75 = v39(v74)
        local u76, u77 = v37(false)
        local u78 = u12.createRef()
        local u79 = u12.createRef()
        local u80 = u12.createRef()
        local u81 = u12.createRef()
        local v82 = v45.X * 0.17123287671232876
        local u83 = math.floor(v82)
        local v84 = v45.X * 0.023809523809523808
        local u85 = math.floor(v84)
        local v86 = u24(v43 or u21.NONE)
        local v87 = u35.store.Bedwars.equippedKitSkins
        if v87 ~= nil then
            v87 = v87[v43 or u21.NONE]
        end
        local v88
        if v87 then
            v88 = u20[v87].renderImage
        else
            v88 = v86.renderImage
        end
        local function u117() --[[ Line: 132 ]]
            --[[
            Upvalues:
                [1] = u35
                [2] = u64
                [3] = u60
                [4] = u55
                [5] = u48
                [6] = u24
                [7] = u52
                [8] = u32
                [9] = u6
                [10] = u10
                [11] = u62
            --]]
            local u89 = u35.store.Bedwars.ownedKits
            local v90
            if #u64 == 0 then
                v90 = u60
            else
                v90 = u64
            end
            if u55 then
                local v91 = 0
                v90 = {}
                for v92, v93 in v90 do
                    local _ = v92 - 1
                    local v94
                    if v93.bedwarsKit then
                        v94 = u35.store.Bedwars.favoriteKits[v93.bedwarsKit] ~= nil
                    else
                        v94 = false
                    end
                    if v94 == true then
                        v91 = v91 + 1
                        v90[v91] = v93
                    end
                end
            end
            if u48 ~= "" then
                local v95 = 0
                v90 = {}
                for v96, v97 in v90 do
                    local _ = v96 - 1
                    local v98
                    if v97.bedwarsKit then
                        local v99 = u24(v97.bedwarsKit).kitClass
                        v98 = tostring(v99) == u48
                    else
                        v98 = false
                    end
                    if v98 == true then
                        v95 = v95 + 1
                        v90[v95] = v97
                    end
                end
            end
            local v100 = u52
            local v101 = u32.ALL
            local v102
            if v100 == tostring(v101) then
                v102 = v90
            else
                local u103 = u6.isHoarceKat()
                local function v113(p104) --[[ Line: 181 ]]
                    --[[
                    Upvalues:
                        [1] = u52
                        [2] = u32
                        [3] = u103
                        [4] = u89
                        [5] = u10
                    --]]
                    if p104.bedwarsKit then
                        local v105 = u52
                        local v106 = u32.OWNED
                        if v105 == tostring(v106) then
                            if not u103 then
                                return u10.Controllers.UnlockController:isKitOwned(p104.bedwarsKit)
                            end
                            local v107 = p104.bedwarsKit
                            return table.find(u89, v107) ~= nil
                        end
                        local v108 = u52
                        local v109 = u32.NOT_OWNED
                        if v108 == tostring(v109) then
                            if not u103 then
                                return not u10.Controllers.UnlockController:isKitOwned(p104.bedwarsKit)
                            end
                            local v110 = p104.bedwarsKit
                            return table.find(u89, v110) == nil
                        end
                        local v111 = u52
                        local v112 = u32.UNLOCKED
                        if v111 == tostring(v112) then
                            if u103 then
                                return false
                            else
                                return u10.Controllers.UnlockController:isKitUnlocked(p104.bedwarsKit)
                            end
                        end
                    end
                    return false
                end
                local v114 = 0
                v102 = {}
                for v115, v116 in v90 do
                    if v113(v116, v115 - 1, v90) == true then
                        v114 = v114 + 1
                        v102[v114] = v116
                    end
                end
            end
            if v102 == u62 then
                return u60
            else
                return v102
            end
        end
        local function u132(p118, p119) --[[ Line: 228 ]]
            --[[
            Upvalues:
                [1] = u65
                [2] = u117
                [3] = u24
                [4] = u18
                [5] = u60
            --]]
            if p118 == "" then
                u65({})
                return u117()
            end
            local u120 = {}
            local function v129(u121) --[[ Line: 235 ]]
                --[[
                Upvalues:
                    [1] = u24
                    [2] = u18
                    [3] = u60
                    [4] = u120
                --]]
                local function v124(p122) --[[ Line: 236 ]]
                    --[[
                    Upvalues:
                        [1] = u24
                        [2] = u121
                        [3] = u18
                    --]]
                    if p122.bedwarsKit then
                        return string.lower(u24(p122.bedwarsKit).name) == string.lower(u121)
                    end
                    if p122.kitBundle then
                        local v123 = u18[p122.kitBundle].kitShopBundle
                        if v123 ~= nil then
                            v123 = string.lower(v123.name)
                        end
                        return v123 == string.lower(u121)
                    end
                end
                local v125 = nil
                for v126, v127 in u60 do
                    if v124(v127, v126 - 1, u60) == true then
                        v125 = v127
                        break
                    end
                end
                if v125 then
                    local v128 = u120
                    table.insert(v128, v125)
                end
            end
            for v130, v131 in p119 do
                v129(v131, v130 - 1, p119)
            end
            u65(u120)
            return u120
        end
        local function u139(u133) --[[ Line: 267 ]]
            --[[
            Upvalues:
                [1] = u35
                [2] = u15
                [3] = u42
                [4] = u44
                [5] = u6
                [6] = u9
                [7] = u28
                [8] = u27
            --]]
            if u35.SelectionMode == "OPEN_DETAILS" then
                if u6.isHoarceKat() then
                    local v134 = u35.SetSelectedKit
                    if v134 ~= nil then
                        v134 = v134(u133)
                    end
                    local _ = v134 == nil
                    u9:playSound(u28.ARMOR_UNEQUIP)
                    u15:dispatch({
                        ["type"] = "SetBedwarsKit",
                        ["kit"] = u133
                    })
                    u42(u133)
                    u44(u133)
                    return nil
                end
                u27.Client:Get("BedwarsActivateKit"):CallServerAsync({
                    ["kit"] = u133
                }):andThen(function(p135) --[[ Line: 293 ]]
                    --[[
                    Upvalues:
                        [1] = u35
                        [2] = u133
                        [3] = u9
                        [4] = u28
                        [5] = u15
                        [6] = u42
                        [7] = u44
                    --]]
                    if p135 then
                        local v136 = u35.SetSelectedKit
                        if v136 ~= nil then
                            v136 = v136(u133)
                        end
                        local v137 = v136 == nil and true or v136
                        u9:playSound(u28.ARMOR_UNEQUIP)
                        if v137 then
                            u15:dispatch({
                                ["type"] = "SetBedwarsKit",
                                ["kit"] = u133
                            })
                            u42(u133)
                            u44(u133)
                        end
                    end
                end)
            elseif u35.SelectionMode == "SELECTION_ONLY" then
                local v138 = u35.SetSelectedKit
                if v138 ~= nil then
                    v138 = v138(u133)
                end
                if v138 == nil and true or v138 then
                    u42(u133)
                end
            end
        end
        local function u162(u140) --[[ Line: 326 ]]
            --[[
            Upvalues:
                [1] = u35
                [2] = u41
                [3] = u2
                [4] = u16
                [5] = u42
                [6] = u139
                [7] = u12
                [8] = u34
                [9] = u33
                [10] = u62
            --]]
            local function v152(p141, p142) --[[ Line: 327 ]]
                --[[
                Upvalues:
                    [1] = u140
                    [2] = u35
                    [3] = u41
                    [4] = u2
                    [5] = u16
                    [6] = u42
                    [7] = u139
                    [8] = u12
                    [9] = u34
                    [10] = u33
                --]]
                local v143 = u140.ShouldFilter
                if v143 ~= nil then
                    v143 = v143(p141)
                end
                if v143 then
                    return nil
                end
                if p141.bedwarsKit then
                    local u144 = p141.bedwarsKit
                    if u35.CustomKitView and table.find(u35.CustomKitView, u144) == nil then
                        return nil
                    end
                    local v148 = {
                        ["Kit"] = u144,
                        ["Selected"] = u41 == u144,
                        ["LayoutOrder"] = p142,
                        ["store"] = u35.store,
                        ["OnClick"] = function() --[[ Name: OnClick, Line 345 ]]
                            --[[
                            Upvalues:
                                [1] = u35
                                [2] = u144
                                [3] = u2
                                [4] = u16
                                [5] = u42
                            --]]
                            local v145 = u35.BannedKits
                            if v145 ~= nil then
                                v145 = table.find(v145, u144) ~= nil
                            end
                            if v145 then
                                return nil
                            end
                            if u35.SelectionMode == "OPEN_DETAILS" then
                                local v146 = {
                                    ["SelectedKit"] = u144
                                }
                                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u16.KIT_DETAILS_APP, v146)
                            end
                            if u35.SelectionMode == "OPEN_DETAILS" or u35.SelectionMode == "SELECTION_ONLY" then
                                local v147 = u35.SetSelectedKit
                                if v147 ~= nil then
                                    v147 = v147(u144)
                                end
                                if v147 == nil and true or v147 then
                                    u42(u144)
                                end
                            end
                        end,
                        ["OnRightClick"] = function() --[[ Name: OnRightClick, Line 373 ]]
                            --[[
                            Upvalues:
                                [1] = u139
                                [2] = u144
                            --]]
                            u139(u144)
                        end,
                        ["SelectionMode"] = u35.SelectionMode
                    }
                    local v149 = u35.BannedKits
                    if v149 ~= nil then
                        v149 = table.find(v149, u144) ~= nil
                    end
                    v148.Banned = v149
                    return u12.createElement(u34, v148)
                end
                if p141.kitBundle and u35.SelectionMode ~= "VIEW_ONLY" then
                    local u150 = p141.kitBundle
                    return u12.createElement(u33, {
                        ["Selected"] = false,
                        ["Bundle"] = u150,
                        ["LayoutOrder"] = p142,
                        ["OnClick"] = function() --[[ Name: OnClick, Line 390 ]]
                            --[[
                            Upvalues:
                                [1] = u2
                                [2] = u16
                                [3] = u150
                            --]]
                            local v151 = {
                                ["SelectedBundle"] = u150
                            }
                            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u16.KIT_DETAILS_APP, v151)
                        end,
                        ["store"] = u35.store
                    })
                end
            end
            local v153 = 0
            local v154 = {}
            for v155, v156 in u62 do
                local v157 = v152(v156, v155 - 1, u62)
                if v157 ~= nil then
                    v153 = v153 + 1
                    v154[v153] = v157
                end
            end
            local v158 = {}
            local v159 = #v158
            for v160, v161 in v154 do
                v158[v159 + v160] = v161
            end
            return u12.createFragment(v158)
        end
        local function v282() --[[ Line: 419 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u35
                [3] = u6
                [4] = u29
                [5] = u10
                [6] = u24
                [7] = u23
                [8] = u11
                [9] = u17
                [10] = u19
                [11] = u18
                [12] = u61
                [13] = u63
            --]]
            local v163 = u25.ShopKits
            if u35.ShowAllKits then
                v163 = u25.ShopKits
            elseif not u6.isHoarceKat() then
                local v164 = u35.CustomKitList
                if v164 == nil then
                    v164 = u29.isLobbyServer()
                end
                if v164 then
                    v163 = u25.ShopKits
                else
                    v163 = u10.Controllers.UnlockController:getUnlockedShopKits()
                end
            end
            local function v219(p165, u166) --[[ Line: 432 ]]
                --[[
                Upvalues:
                    [1] = u24
                    [2] = u25
                    [3] = u35
                    [4] = u6
                    [5] = u10
                    [6] = u23
                --]]
                local v167 = 0
                local v168 = {}
                for v169, v170 in p165 do
                    local _ = v169 - 1
                    if not u24(v170).hiddenInShop == true then
                        v167 = v167 + 1
                        v168[v167] = v170
                    end
                end
                local function v178(p171) --[[ Line: 447 ]]
                    --[[
                    Upvalues:
                        [1] = u166
                        [2] = u25
                        [3] = u35
                    --]]
                    local v172 = u166
                    if v172 ~= nil then
                        v172 = v172.includeFavoriteKits
                    end
                    if v172 then
                        return true
                    else
                        local v173 = u166
                        if v173 ~= nil then
                            v173 = v173.includeFreeKitsOfTheWeek
                        end
                        if v173 then
                            local v174 = u25.FreeKitRotation
                            local v175 = u35.store.Bedwars
                            if v175 ~= nil then
                                v175 = v175.freeKitLevel
                            end
                            return v174.kitAvailableThisWeek(p171, v175)
                        else
                            local v176 = u25.FreeKitRotation
                            local v177 = u35.store.Bedwars
                            if v177 ~= nil then
                                v177 = v177.freeKitLevel
                            end
                            return not v176.kitAvailableThisWeek(p171, v177)
                        end
                    end
                end
                local v179 = 0
                local v180 = {}
                for v181, v182 in v168 do
                    if v178(v182, v181 - 1, v168) == true then
                        v179 = v179 + 1
                        v180[v179] = v182
                    end
                end
                local v183 = 0
                local v184 = {}
                for v185, v186 in v180 do
                    local _ = v185 - 1
                    local v187
                    if u166 == nil then
                        v187 = u166
                    else
                        v187 = u166.includeFavoriteKits
                    end
                    local v188 = not v187
                    if v188 then
                        v188 = u35.store.Bedwars.favoriteKits[v186] ~= nil
                    end
                    if not v188 == true then
                        v183 = v183 + 1
                        v184[v183] = v186
                    end
                end
                local function v196(p189) --[[ Line: 516 ]]
                    --[[
                    Upvalues:
                        [1] = u24
                        [2] = u6
                        [3] = u10
                        [4] = u35
                        [5] = u25
                    --]]
                    if not u24(p189).hiddenInShopTillUnlocked then
                        return true
                    end
                    local v190 = not u6.isHoarceKat() and u10.Controllers.UnlockController.allKitsUnlocked and true or false
                    local v191 = u35.store.Bedwars.ownedKits
                    local v192 = table.find(v191, p189) ~= nil and true or v190
                    local v193 = u25.FreeKitRotation
                    local v194 = u35.store.Bedwars
                    if v194 ~= nil then
                        v194 = v194.freeKitLevel
                    end
                    local v195 = v193.kitAvailableThisWeek(p189, v194) and true or v192
                    return u35.ShowAllKits and true or v195
                end
                local v197 = 0
                local v198 = {}
                for v199, v200 in v184 do
                    if v196(v200, v199 - 1, v184) == true then
                        v197 = v197 + 1
                        v198[v197] = v200
                    end
                end
                local function v206(p201) --[[ Line: 556 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                        [2] = u166
                        [3] = u6
                        [4] = u10
                        [5] = u25
                        [6] = u35
                    --]]
                    local v202 = u23[p201]
                    if v202.battlepassSeason ~= nil then
                        local v203 = u166
                        if v203 ~= nil then
                            v203 = v203.includeBattlePassKits
                        end
                        if not v203 then
                            return false
                        end
                        if not u6.isHoarceKat() and u10.Controllers.UnlockController.allKitsUnlocked then
                            return true
                        end
                        if u25.FreeKitRotation.kitAvailableThisWeek(p201, u35.store.Bedwars.freeKitLevel) then
                            return true
                        end
                    end
                    local v204 = u166
                    if v204 ~= nil then
                        v204 = v204.includeFeaturedKits
                    end
                    local v205 = not v204
                    if v205 then
                        v205 = v202.featured ~= nil
                    end
                    return not v205
                end
                local v207 = 0
                local v208 = {}
                for v209, v210 in v198 do
                    if v206(v210, v209 - 1, v198) == true then
                        v207 = v207 + 1
                        v208[v207] = v210
                    end
                end
                local function v215(p211, p212) --[[ Line: 606 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                    --]]
                    local v213 = u23[p211]
                    local v214 = u23[p212]
                    return v213.name < v214.name
                end
                table.sort(v208, v215)
                local v216 = table.create(#v208)
                for v217, v218 in v208 do
                    local _ = v217 - 1
                    v216[v217] = {
                        ["bedwarsKit"] = v218
                    }
                end
                return v216
            end
            local v220 = v219(u11.keys(u35.store.Bedwars.favoriteKits), {
                ["includeFreeKitsOfTheWeek"] = true,
                ["includeBattlePassKits"] = true,
                ["includeFeaturedKits"] = true,
                ["includeFavoriteKits"] = true
            })
            local v221 = 0
            local v222 = {}
            for v223, v224 in u11.values(v163) do
                local _ = v223 - 1
                local v225 = u24(v224).freeKit and {
                    ["bedwarsKit"] = v224
                } or nil
                if v225 ~= nil then
                    v221 = v221 + 1
                    v222[v221] = v225
                end
            end
            local v226 = v219(u11.values(v163), {
                ["includeFreeKitsOfTheWeek"] = true,
                ["includeBattlePassKits"] = true
            })
            local v227 = 0
            local v228 = {}
            for v229, v230 in u11.values(v163) do
                local _ = v229 - 1
                if u24(v230).featured ~= nil == true then
                    v227 = v227 + 1
                    v228[v227] = v230
                end
            end
            local v231 = v219(v228, {
                ["includeFeaturedKits"] = true,
                ["includeBattlePassKits"] = true
            })
            local v232 = v219(u11.values(v163))
            local v233 = 0
            local v234 = {}
            for v235, v238 in u11.values(v163) do
                local _ = v235 - 1
                local v237 = u24(v238).battlepassSeason
                if not v237 or v237 == u17.BATTLE_PASS_SEASON then
                    local v238 = nil
                end
                if v238 ~= nil then
                    v233 = v233 + 1
                    v234[v233] = v238
                end
            end
            local function v246(p239, p240) --[[ Line: 700 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                local v241 = string.split(u24(p239).battlepassSeason, "season")[2]
                local v242 = tonumber(v241)
                local v243 = (v242 == 0 or (v242 ~= v242 or not v242)) and 0 or v242
                local v244 = string.split(u24(p240).battlepassSeason, "season")[2]
                local v245 = tonumber(v244)
                return ((v245 == 0 or (v245 ~= v245 or not v245)) and 0 or v245) < v243
            end
            table.sort(v234, v246)
            local v247 = v219(v234, {
                ["includeBattlePassKits"] = true
            })
            local v248
            if u29.isLobbyServer() then
                local v249 = u11.values(u19)
                local function v256(p250) --[[ Line: 721 ]]
                    --[[
                    Upvalues:
                        [1] = u18
                    --]]
                    local v251 = u18[p250]
                    local v252 = v251.kitShopBundle ~= nil
                    if v252 then
                        v252 = false
                        for v253, v254 in v251.rewards do
                            local _ = v253 - 1
                            if v254.kit ~= nil then
                                v252 = true
                                break
                            end
                        end
                    end
                    if not v252 then
                        return false
                    end
                    local v255 = v251.kitShopBundle
                    if v255 ~= nil then
                        v255 = v255.disabled
                    end
                    return not v255
                end
                local v257 = 0
                local v258 = {}
                for v259, v260 in v249 do
                    if v256(v260, v259 - 1, v249) == true then
                        v257 = v257 + 1
                        v258[v257] = v260
                    end
                end
                local function v265(p261, p262) --[[ Line: 768 ]]
                    --[[
                    Upvalues:
                        [1] = u18
                    --]]
                    local v263 = u18[p261]
                    local v264 = u18[p262]
                    return v263.name < v264.name
                end
                table.sort(v258, v265)
                v248 = table.create(#v258)
                for v266, v267 in v258 do
                    local _ = v266 - 1
                    v248[v266] = {
                        ["kitBundle"] = v267
                    }
                end
            else
                v248 = {}
            end
            local v268 = {}
            local v269 = #v268
            local v270 = #v220
            table.move(v220, 1, v270, v269 + 1, v268)
            local v271 = v269 + v270
            local v272 = #v226
            table.move(v226, 1, v272, v271 + 1, v268)
            local v273 = v271 + v272
            local v274 = #v231
            table.move(v231, 1, v274, v273 + 1, v268)
            local v275 = v273 + v274
            local v276 = #v248
            table.move(v248, 1, v276, v275 + 1, v268)
            local v277 = v275 + v276
            local v278 = #v232
            table.move(v232, 1, v278, v277 + 1, v268)
            local v279 = v277 + v278
            table.move(v247, 1, #v247, v279 + 1, v268)
            u61(v268)
            local v280 = {}
            local v281 = #v280
            table.move(v268, 1, #v268, v281 + 1, v280)
            u63(v280)
        end
        local v283 = u35.store.Bedwars
        if v283 ~= nil then
            v283 = v283.ownedKits
        end
        v38(v282, {
            u55,
            u48,
            u52,
            v283,
            u35.ShowAllKits,
            u76
        })
        v38(function() --[[ Line: 822 ]]
            --[[
            Upvalues:
                [1] = u60
                [2] = u117
                [3] = u63
            --]]
            if #u60 == 0 then
                return nil
            end
            u63((u117()))
        end, {
            u55,
            u48,
            u52,
            u76
        })
        v38(function() --[[ Line: 830 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u67
                [3] = u73
                [4] = u69
                [5] = u71
                [6] = u75
            --]]
            return function() --[[ Line: 831 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u67
                    [3] = u73
                    [4] = u69
                    [5] = u71
                    [6] = u75
                --]]
                local v284 = u15
                local v285 = {
                    ["type"] = "LobbySetKitShopFilters",
                    ["kitShop"] = {
                        ["CanvasPositionY"] = u67.value,
                        ["FavoritedToggle"] = u73.value,
                        ["KitClassFilter"] = u69.value,
                        ["OwnedFilter"] = u71.value,
                        ["SearchText"] = u75.value
                    }
                }
                v284:dispatch(v285)
            end
        end, {})
        v38(function() --[[ Line: 844 ]]
            --[[
            Upvalues:
                [1] = u73
                [2] = u55
                [3] = u69
                [4] = u48
                [5] = u71
                [6] = u52
                [7] = u75
                [8] = u58
            --]]
            u73.value = u55
            u69.value = u48
            u71.value = u52
            u75.value = u58
        end, {
            u55,
            u48,
            u52,
            u58
        })
        v38(function() --[[ Line: 850 ]]
            --[[
            Upvalues:
                [1] = u78
                [2] = u76
                [3] = u77
                [4] = u35
            --]]
            local u286 = u78:getValue()
            if not u286 then
                return nil
            end
            task.defer(function() --[[ Line: 855 ]]
                --[[
                Upvalues:
                    [1] = u76
                    [2] = u77
                    [3] = u286
                    [4] = u35
                --]]
                if u76 then
                    return nil
                end
                u77(true)
                local v287 = u286.CanvasPosition.X
                local v288 = u35.InitialState
                if v288 ~= nil then
                    v288 = v288.CanvasPositionY
                end
                u286.CanvasPosition = Vector2.new(v287, v288)
            end)
        end, { u76 })
        local v289 = {}
        for v290, v291 in u35 do
            v289[v290] = v291
        end
        v289.store = nil
        v289.ShowAllKits = nil
        v289.CustomKitList = nil
        v289.ExcludeNonShopKits = nil
        v289.ScrollingFrameProps = nil
        v289.SelectedKit = nil
        v289.SetSelectedKit = nil
        v289.SelectionMode = nil
        v289.BannedKits = nil
        v289.InitialState = nil
        v289.CustomKitView = nil
        local function v328() --[[ Line: 886 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u78
                [3] = u67
                [4] = u79
                [5] = u8
                [6] = u4
                [7] = u46
                [8] = u35
                [9] = u83
                [10] = u85
                [11] = u80
                [12] = u34
                [13] = u21
                [14] = u41
                [15] = u2
                [16] = u16
                [17] = u139
                [18] = u162
                [19] = u6
                [20] = u24
                [21] = u25
                [22] = u15
                [23] = u10
                [24] = u7
                [25] = u26
                [26] = u81
            --]]
            local v298 = {
                [u12.Ref] = u78,
                ["Size"] = UDim2.fromScale(1, 1),
                ["CanvasSize"] = UDim2.new(1, 0, 0, 0),
                ["AutomaticCanvasSize"] = "Y",
                ["ScrollingDirection"] = "Y",
                ["ScrollBarThickness"] = 6,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Selectable"] = false,
                [u12.Change.CanvasPosition] = function(p292) --[[ Line: 897 ]]
                    --[[
                    Upvalues:
                        [1] = u67
                    --]]
                    local v293 = u67
                    local v294 = p292.CanvasPosition.Y / 100
                    v293.value = math.round(v294) * 100
                end,
                [u12.Change.AbsoluteSize] = function(p295) --[[ Line: 900 ]]
                    --[[
                    Upvalues:
                        [1] = u79
                        [2] = u8
                        [3] = u4
                        [4] = u46
                    --]]
                    local v296 = u79:getValue()
                    if v296 then
                        local v297 = u4((u8(v296)))
                        u46(p295.AbsoluteSize * (1 / v297))
                    else
                        u46(p295.AbsoluteSize)
                    end
                end,
                ["LayoutOrder"] = 2
            }
            local v299 = u35.ScrollingFrameProps
            if v299 then
                for v300, v301 in v299 do
                    v298[v300] = v301
                end
            end
            local v302 = { u12.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 24)
                }), u12.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0, 3),
                    ["PaddingTop"] = UDim.new(0, 12),
                    ["PaddingBottom"] = UDim.new(0, 12)
                }) }
            local v303 = #v302
            local v304 = {
                ["AutomaticSize"] = "Y",
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0)
            }
            local v305 = { u12.createElement("UIGridLayout", {
                    ["CellSize"] = UDim2.fromOffset(u83, u83),
                    ["CellPadding"] = UDim2.fromOffset(u85, u85),
                    ["HorizontalAlignment"] = "Left",
                    ["VerticalAlignment"] = "Top",
                    ["SortOrder"] = "LayoutOrder",
                    ["FillDirectionMaxCells"] = 5,
                    [u12.Ref] = u80
                }) }
            local v306 = #v305
            local v307 = not u35.ExcludeNonShopKits
            if v307 then
                v307 = u12.createElement(u34, {
                    ["LayoutOrder"] = -3,
                    ["Kit"] = u21.NONE,
                    ["Selected"] = u41 == u21.NONE and true or u41 == nil,
                    ["store"] = u35.store,
                    ["OnClick"] = function() --[[ Name: OnClick, Line 955 ]]
                        --[[
                        Upvalues:
                            [1] = u35
                            [2] = u2
                            [3] = u16
                            [4] = u21
                        --]]
                        if u35.SelectionMode == "OPEN_DETAILS" then
                            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u16.KIT_DETAILS_APP, {
                                ["SelectedKit"] = u21.NONE
                            })
                        end
                        if u35.SelectionMode == "OPEN_DETAILS" or u35.SelectionMode == "SELECTION_ONLY" then
                            local v308 = u35.SetSelectedKit
                            if v308 ~= nil then
                                v308(u21.NONE)
                            end
                        end
                    end,
                    ["OnRightClick"] = function() --[[ Name: OnRightClick, Line 968 ]]
                        --[[
                        Upvalues:
                            [1] = u139
                            [2] = u21
                        --]]
                        u139(u21.NONE)
                    end,
                    ["SelectionMode"] = u35.SelectionMode
                })
            end
            if v307 then
                v305[v306 + 1] = v307
            end
            local v313 = {
                ["ShouldFilter"] = function(p309) --[[ Name: ShouldFilter, Line 978 ]]
                    --[[
                    Upvalues:
                        [1] = u35
                        [2] = u6
                        [3] = u21
                        [4] = u24
                        [5] = u25
                        [6] = u15
                        [7] = u10
                    --]]
                    if u35.SelectionMode ~= "OPEN_DETAILS" then
                        return false
                    end
                    if not p309.bedwarsKit then
                        return p309.kitBundle and true or false
                    end
                    local v310
                    if u6.isHoarceKat() then
                        v310 = p309.bedwarsKit == u21.NONE and true or (u24(p309.bedwarsKit).freeKit or u25.FreeKitRotation.kitAvailableThisWeek(p309.bedwarsKit, u15:getState().Bedwars.freeKitLevel))
                        if not v310 then
                            local v311 = u15:getState().Bedwars.ownedKits
                            local v312 = p309.bedwarsKit
                            v310 = table.find(v311, v312) ~= nil
                        end
                    else
                        v310 = u10.Controllers.UnlockController:isKitUnlocked(p309.bedwarsKit)
                    end
                    return not v310
                end
            }
            v305[#v305 + 1] = u12.createElement(u162, v313)
            v302.UnlockedKits = u12.createElement(u7, v304, v305)
            local v314
            if u35.SelectionMode == "OPEN_DETAILS" then
                v314 = u12.createFragment({
                    ["Divider"] = u12.createElement(u7, {
                        ["LayoutOrder"] = 2,
                        ["Size"] = UDim2.new(0.96, 0, 0, 24)
                    }, {
                        u12.createElement("Frame", {
                            ["BorderSizePixel"] = 0,
                            ["Size"] = UDim2.new(0.3, 0, 0, 2),
                            ["Position"] = UDim2.fromScale(0, 0.5),
                            ["AnchorPoint"] = Vector2.new(0, 0.5),
                            ["BackgroundColor3"] = Color3.fromRGB(217, 217, 217)
                        }),
                        u12.createElement("ImageLabel", {
                            ["BackgroundTransparency"] = 1,
                            ["Size"] = UDim2.new(1, 0, 0.4, 0),
                            ["Position"] = UDim2.fromScale(0, 0.5),
                            ["AnchorPoint"] = Vector2.new(0, 0),
                            ["Image"] = u26.CARET_DOWN,
                            ["ImageColor3"] = Color3.fromRGB(217, 217, 217)
                        }, { u12.createElement("UIAspectRatioConstraint", {
                                ["AspectRatio"] = 1.3355855855855854
                            }) }),
                        u12.createElement("TextLabel", {
                            ["Text"] = "KITS TO BE UNLOCKED",
                            ["TextScaled"] = true,
                            ["TextXAlignment"] = "Center",
                            ["TextYAlignment"] = "Center",
                            ["BackgroundTransparency"] = 1,
                            ["Size"] = UDim2.fromScale(0.36, 1),
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                            ["Position"] = UDim2.fromScale(0.5, 0.5),
                            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                            ["TextColor3"] = Color3.new(255, 255, 255)
                        }),
                        u12.createElement("Frame", {
                            ["BorderSizePixel"] = 0,
                            ["Size"] = UDim2.new(0.3, 0, 0, 2),
                            ["Position"] = UDim2.fromScale(1, 0.5),
                            ["AnchorPoint"] = Vector2.new(1, 0.5),
                            ["BackgroundColor3"] = Color3.fromRGB(217, 217, 217)
                        }),
                        u12.createElement("ImageLabel", {
                            ["BackgroundTransparency"] = 1,
                            ["Size"] = UDim2.new(1, 0, 0.4, 0),
                            ["Position"] = UDim2.fromScale(1, 0.5),
                            ["AnchorPoint"] = Vector2.new(1, 0),
                            ["Image"] = u26.CARET_DOWN,
                            ["ImageColor3"] = Color3.fromRGB(217, 217, 217)
                        }, { u12.createElement("UIAspectRatioConstraint", {
                                ["AspectRatio"] = 1.3355855855855854
                            }) })
                    })
                })
            else
                v314 = false
            end
            if v314 then
                v302[v303 + 1] = v314
            end
            local v315 = #v302
            local v316
            if u35.SelectionMode == "OPEN_DETAILS" then
                local v317 = u12.createFragment
                local v318 = {}
                local v319 = u12.createElement
                local v320 = u7
                local v321 = {
                    ["AutomaticSize"] = "Y",
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.fromScale(1, 0)
                }
                local v322 = {}
                local v327 = {
                    ["ShouldFilter"] = function(p323) --[[ Name: ShouldFilter, Line 1081 ]]
                        --[[
                        Upvalues:
                            [1] = u35
                            [2] = u6
                            [3] = u21
                            [4] = u24
                            [5] = u25
                            [6] = u15
                            [7] = u10
                        --]]
                        if u35.SelectionMode ~= "OPEN_DETAILS" or not p323.bedwarsKit then
                            return false
                        end
                        if not u6.isHoarceKat() then
                            return u10.Controllers.UnlockController:isKitUnlocked(p323.bedwarsKit)
                        end
                        local v324 = p323.bedwarsKit == u21.NONE and true or (u24(p323.bedwarsKit).freeKit or u25.FreeKitRotation.kitAvailableThisWeek(p323.bedwarsKit, u15:getState().Bedwars.freeKitLevel))
                        if not v324 then
                            local v325 = u15:getState().Bedwars.ownedKits
                            local v326 = p323.bedwarsKit
                            v324 = table.find(v325, v326) ~= nil
                        end
                        return v324
                    end
                }
                __set_list(v322, 1, {u12.createElement("UIGridLayout", {
    ["CellSize"] = UDim2.fromOffset(u83, u83),
    ["CellPadding"] = UDim2.fromOffset(u85, u85),
    ["HorizontalAlignment"] = "Left",
    ["VerticalAlignment"] = "Top",
    ["SortOrder"] = "LayoutOrder",
    ["FillDirectionMaxCells"] = 5,
    [u12.Ref] = u81
}), u12.createElement(u162, v327)})
                v318.NotUnlockedKits = v319(v320, v321, v322)
                v316 = v317(v318)
            else
                v316 = false
            end
            if v316 then
                v302[v315 + 1] = v316
            end
            return u12.createFragment({
                ["LobbyKitShopItemList"] = u12.createElement("ScrollingFrame", v298, v302)
            })
        end
        local v329 = u35.SelectionMode
        local v330 = u35.ExcludeNonShopKits
        local v331 = u35.store.Draft.sharedData
        if v331 ~= nil then
            v331 = v331.matchDraftPhase
        end
        local v332 = v40(v328, {
            u62,
            u64,
            v329,
            v330,
            v331,
            u41,
            v43,
            v45
        })
        local v333 = {}
        for v334, v335 in v289 do
            v333[v334] = v335
        end
        v333[u12.Ref] = u79
        v333.AutoButtonColor = false
        v333.Selectable = false
        v333.BackgroundTransparency = 1
        local v336 = { u12.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local _ = #v336
        local v337 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.15)
        }
        local v338 = { u12.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local _ = #v338
        local v339 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.65, 1)
        }
        local v343 = { u12.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.05, 0)
            }), u12.createElement("UIPadding", {
                ["PaddingBottom"] = UDim.new(0.05, 0)
            }), u12.createElement(u31, {
                ["Size"] = UDim2.fromScale(1, 0.6),
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["SetKitClassFilter"] = function(p340) --[[ Name: SetKitClassFilter, Line 1166 ]]
                    --[[
                    Upvalues:
                        [1] = u49
                    --]]
                    return u49(p340)
                end,
                ["SetOwnedFilter"] = function(p341) --[[ Name: SetOwnedFilter, Line 1169 ]]
                    --[[
                    Upvalues:
                        [1] = u53
                    --]]
                    return u53(p341)
                end,
                ["SetFavoritedToggle"] = function(p342) --[[ Name: SetFavoritedToggle, Line 1172 ]]
                    --[[
                    Upvalues:
                        [1] = u56
                    --]]
                    return u56(p342)
                end,
                ["KitClassFilter"] = u48,
                ["OwnedFilter"] = u52,
                ["FavoritedToggle"] = u55
            }) }
        local v344 = #v343
        local v345 = {
            ["BarTransparency"] = 0.5,
            ["Size"] = UDim2.fromScale(1, 0.4),
            ["BarColor"] = u5.BLACK,
            ["CornerRadius"] = UDim.new(0.1, 0)
        }
        local function v351(p346, p347) --[[ Line: 1187 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u18
            --]]
            if p347.bedwarsKit then
                local v348 = {
                    ["key"] = u24(p347.bedwarsKit).name
                }
                table.insert(p346, v348)
                return p346
            else
                local v349 = p347.kitBundle and u18[p347.kitBundle].kitShopBundle
                if v349 then
                    local v350 = {
                        ["key"] = v349.name
                    }
                    table.insert(p346, v350)
                end
                return p346
            end
        end
        local v352 = {}
        for v353 = 1, #u60 do
            v352 = v351(v352, u60[v353], v353 - 1, u60)
        end
        v345.Items = v352
        v345.InputText = u58
        function v345.OnTextChange(p354, p355) --[[ Line: 1215 ]]
            --[[
            Upvalues:
                [1] = u59
                [2] = u63
                [3] = u132
            --]]
            u59(p354)
            u63((u132(p354, p355)))
        end
        v345.PlaceHolderText = "Search Kit"
        v343[v344 + 1] = u12.createElement(u14, v345, { u12.createElement("UIStroke", {
                ["Transparency"] = 0.5,
                ["Thickness"] = 1,
                ["Color"] = u5.WHITE
            }) })
        v338.Filters = u12.createElement(u7, v339, v343)
        v338.EquippedKit = u12.createElement(u7, {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.35, 1)
        }, { u12.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }), u12.createElement(u7, {
                ["Size"] = UDim2.fromScale(0.5, 1)
            }, { u12.createElement("Frame", {
                    ["BackgroundTransparency"] = 0.5,
                    ["Size"] = UDim2.fromScale(1, 0.75),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["BackgroundColor3"] = u5.BLACK
                }, {
                    u12.createElement("UIPadding", {
                        ["PaddingTop"] = UDim.new(0.1, 0),
                        ["PaddingBottom"] = UDim.new(0.1, 0),
                        ["PaddingLeft"] = UDim.new(0.1, 0),
                        ["PaddingRight"] = UDim.new(0.1, 0)
                    }),
                    u12.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 5)
                    }),
                    u12.createElement("UIListLayout", {
                        ["FillDirection"] = "Vertical",
                        ["HorizontalAlignment"] = "Center",
                        ["VerticalFlex"] = "SpaceAround",
                        ["SortOrder"] = "LayoutOrder"
                    }),
                    u12.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["TextScaled"] = true,
                        ["RichText"] = true,
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(1, 0.4),
                        ["Text"] = "<font color=\"" .. u5.richTextColor(u5.WHITE) .. "\" transparency=\"" .. tostring(0.5) .. "\">Equipped</font>",
                        ["TextColor3"] = u5.WHITE,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
                        ["TextXAlignment"] = Enum.TextXAlignment.Center,
                        ["TextYAlignment"] = Enum.TextYAlignment.Center
                    }, { u12.createElement("UITextSizeConstraint", {
                            ["MaxTextSize"] = 24,
                            ["MinTextSize"] = 6
                        }) }),
                    u12.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["TextScaled"] = true,
                        ["RichText"] = true,
                        ["LayoutOrder"] = 2,
                        ["Size"] = UDim2.fromScale(1, 0.5),
                        ["Text"] = "<b>" .. v86.name .. "</b>",
                        ["TextColor3"] = u5.WHITE,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
                        ["TextXAlignment"] = Enum.TextXAlignment.Center,
                        ["TextYAlignment"] = Enum.TextYAlignment.Center
                    }, { u12.createElement("UITextSizeConstraint", {
                            ["MaxTextSize"] = 32,
                            ["MinTextSize"] = 8
                        }) })
                }) }), u12.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.5, 1),
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["Image"] = v88
            }, { u12.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }) })
        v336.FiltersContainer = u12.createElement(u7, v337, v338)
        v336.KitListContainer = u12.createElement(u7, {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.85)
        }, { v332 })
        return u12.createElement("ImageButton", v333, v336)
    end)
}
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").StringUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-meta").BedBreakEffectMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-meta").KillEffectMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-utils").getLobbyGadgetImage
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-item-types").LockerItemCategory
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-preview-util").LockerPreviewUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-meta").WinEffectMeta
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local v29 = {}
local u30 = {
    u24.KILL_EFFECTS,
    u24.BREAK_BED_EFFECTS,
    u24.BED_SKIN,
    u24.LOBBY_GADGETS,
    u24.EMOTES
}
v29.PREVIEW_TABS = u30
local u31 = nil
function v29.buildElementGrid(u32, p33, p34, _) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u16
        [3] = u31
        [4] = u4
        [5] = u9
        [6] = u10
        [7] = u11
        [8] = u2
    --]]
    local u35 = {}
    if u32 == u24.EMOTES then
        local v36 = p33.emotes
        local v37 = u16.NONE
        if table.find(v36, v37) == nil then
            local v38 = u16.NONE
            table.insert(v36, v38)
        end
        local v39 = 0
        u35 = {}
        for v40, v41 in v36 do
            local _ = v40 - 1
            local v42 = u31({
                ["emote"] = v41
            })
            if v42 ~= nil then
                v39 = v39 + 1
                u35[v39] = v42
            end
        end
    elseif u32 == u24.KILL_EFFECTS then
        local v43 = 0
        u35 = {}
        for v44, v45 in p33.killEffects do
            local _ = v44 - 1
            local v46 = u31({
                ["killEffect"] = v45
            })
            if v46 ~= nil then
                v43 = v43 + 1
                u35[v43] = v46
            end
        end
    elseif u32 == u24.WIN_EFFECTS then
        local v47 = 0
        u35 = {}
        for v48, v49 in p33.winEffects do
            local _ = v48 - 1
            local v50 = u31({
                ["winEffect"] = v49
            })
            if v50 ~= nil then
                v47 = v47 + 1
                u35[v47] = v50
            end
        end
    elseif u32 == u24.TITLES then
        local v51 = 0
        u35 = {}
        for v52, v53 in p33.titles do
            local _ = v52 - 1
            local v54 = u31({
                ["title"] = v53
            })
            if v54 ~= nil then
                v51 = v51 + 1
                u35[v51] = v54
            end
        end
    elseif u32 == u24.LOBBY_GADGETS then
        local v55 = 0
        u35 = {}
        for v56, v57 in p33.lobbyGadgets do
            local _ = v56 - 1
            local v58 = u31({
                ["lobbyGadget"] = v57
            })
            if v58 ~= nil then
                v55 = v55 + 1
                u35[v55] = v58
            end
        end
    elseif u32 == u24.CONSUMABLES then
        if not p34 then
            return {}
        end
        local v59 = u4.entries(p34)
        local function v66(p60) --[[ Line: 146 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u24
            --]]
            local v61 = p60[1]
            local v62 = p60[2]
            local v63 = u9(v62.consumable)
            if not v63 then
                return nil
            end
            if not v63.displayInLocker then
                return nil
            end
            local v64 = {
                ["name"] = v63.displayName
            }
            local v65 = v63.image
            v64.imageId = v65 == nil and "" or v65
            v64.itemEnum = v62.consumable
            v64.description = v63.description
            v64.lockerTab = u24.CONSUMABLES
            v64.amount = v62.amount
            v64.consumableId = v61
            v64.expireTime = v62.expireTime
            return v64
        end
        local v67 = 0
        u35 = {}
        for v68, v69 in v59 do
            local v70 = v66(v69, v68 - 1, v59)
            if v70 ~= nil then
                v67 = v67 + 1
                u35[v67] = v70
            end
        end
    elseif u32 == u24.BREAK_BED_EFFECTS then
        local v71 = 0
        u35 = {}
        for v72, v73 in p33.breakBedEffects do
            local _ = v72 - 1
            local v74 = u31({
                ["breakBedEffect"] = v73
            })
            if v74 ~= nil then
                v71 = v71 + 1
                u35[v71] = v74
            end
        end
    elseif u32 == u24.BADGES then
        local v75 = 0
        u35 = {}
        for v76, v77 in p33.badges do
            local _ = v76 - 1
            local v78 = u31({
                ["achievementBadge"] = v77
            })
            if v78 ~= nil then
                v75 = v75 + 1
                u35[v75] = v78
            end
        end
    elseif u32 == u24.BED_SKIN then
        local v79 = p33.bedSkins
        local function v90(p80) --[[ Line: 226 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u11
                [3] = u2
                [4] = u35
                [5] = u32
            --]]
            local v81 = u10(p80)
            local v82 = u11(v81.itemType)
            local v83 = string.split(v81.skinTag, "_")
            local v84 = table.create(#v83)
            for v85, v86 in v83 do
                local _ = v85 - 1
                v84[v85] = u2.capitalizeFirstLetter(v86)
            end
            local v87 = u35
            local v88 = {
                ["name"] = table.concat(v84, "") .. " " .. v82.displayName
            }
            local v89 = v81.renderImage
            v88.imageId = v89 == nil and "" or v89
            v88.itemEnum = p80
            v88.lockerTab = u32
            table.insert(v87, v88)
        end
        for v91, v92 in v79 do
            v90(v92, v91 - 1, v79)
        end
        table.insert(u35, {
            ["name"] = "None",
            ["imageId"] = "",
            ["itemEnum"] = "none",
            ["none"] = true,
            ["lockerTab"] = u32
        })
    end
    table.sort(u35, function(p93, p94) --[[ Line: 268 ]]
        if string.lower(p93.name) == "none" then
            return true
        elseif string.lower(p94.name) == "none" then
            return false
        else
            return p93.name < p94.name
        end
    end)
    return u35
end
u31 = function(p95, p96) --[[ Name: createLockerItemDisplay, Line 282 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u16
        [3] = u24
        [4] = u17
        [5] = u18
        [6] = u27
        [7] = u28
        [8] = u25
        [9] = u26
        [10] = u19
        [11] = u20
        [12] = u21
        [13] = u13
        [14] = u14
        [15] = u12
        [16] = u8
    --]]
    if p95.emote then
        local v97 = p95.emote
        local v98 = u15[v97]
        if not v98 then
            return nil
        end
        if v98.disabled then
            return nil
        end
        if v97 == u16.NONE and p96 then
            return nil
        end
        local v99 = {
            ["name"] = v98.name
        }
        local v100 = v98.image
        v99.imageId = v100 == nil and "" or v100
        v99.itemEnum = v97
        v99.lockerTab = u24.EMOTES
        return v99
    end
    if p95.killEffect then
        local v101 = p95.killEffect
        local v102 = u17[v101]
        if not v102 then
            return nil
        end
        if v101 == u18.NONE and p96 then
            return nil
        end
        local v103 = {
            ["name"] = v102.name
        }
        local v104 = v102.image
        v103.imageId = v104 == nil and "" or v104
        v103.itemEnum = v101
        v103.lockerTab = u24.KILL_EFFECTS
        return v103
    end
    if p95.winEffect then
        local v105 = p95.winEffect
        local v106 = u27[v105]
        if not v106 then
            return nil
        end
        if v105 == u28.NONE and p96 then
            return nil
        end
        local v107 = {
            ["name"] = v106.name
        }
        local v108 = v106.image
        v107.imageId = v108 == nil and "" or v108
        v107.itemEnum = v105
        v107.lockerTab = u24.WIN_EFFECTS
        return v107
    end
    if p95.title then
        local v109 = p95.title
        local v110 = u25[v109]
        if not v110 then
            return nil
        end
        if v109 == u26.NONE and p96 then
            return nil
        end
        local v111 = v110.name
        if v111 == nil then
            v111 = v110.text
        end
        local v112 = v110.name == "None" and "None" or v111
        local v113 = {}
        local v114 = {
            ["imageId"] = "",
            ["name"] = v112
        }
        for v115, v116 in v110 do
            v113[v115] = v116
        end
        v114.title = v113
        v114.itemEnum = v109
        v114.lockerTab = u24.TITLES
        return v114
    end
    if p95.lobbyGadget then
        local v117 = p95.lobbyGadget
        local v118 = u19[v117]
        if not v118 then
            return nil
        end
        if v117 == u20.NONE and p96 then
            return nil
        end
        local v119
        if v118.items then
            local v120 = u21(v117)
            v119 = v120 == nil and "" or v120
        else
            v119 = nil
        end
        local v121 = {
            ["name"] = v118.name
        }
        local v122 = v118.image
        if v122 == nil then
            v122 = v119 == nil and "" or v119
        end
        v121.imageId = v122
        v121.itemEnum = v117
        v121.lockerTab = u24.BREAK_BED_EFFECTS
        return v121
    end
    if p95.breakBedEffect then
        local v123 = p95.breakBedEffect
        local v124 = u13[v123]
        if v123 == u14.NONE and p96 then
            return nil
        end
        local v125 = {
            ["name"] = v124.name
        }
        local v126 = v124.image
        v125.imageId = v126 == nil and "" or v126
        v125.itemEnum = v123
        v125.lockerTab = u24.BREAK_BED_EFFECTS
        return v125
    end
    if p95.achievementBadge then
        local v127 = p95.achievementBadge
        if v127 == u12.NONE then
            return {
                ["name"] = "None",
                ["imageId"] = "",
                ["itemEnum"] = v127,
                ["lockerTab"] = u24.BADGES
            }
        end
        local v128 = u8.getMeta(v127)
        local v129 = {}
        if v128 ~= nil then
            v128 = v128.title
        end
        v129.name = v128 == nil and "" or v128
        v129.imageId = ""
        v129.itemEnum = v127
        v129.lockerTab = u24.BADGES
        return v129
    end
end
v29.createLockerItemDisplay = u31
function v29.getEquippedLockerCosmeticDisplay(p130, p131) --[[ Line: 464 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u6
        [3] = u17
        [4] = u24
        [5] = u18
        [6] = u27
        [7] = u28
        [8] = u25
        [9] = u26
        [10] = u19
        [11] = u21
        [12] = u20
        [13] = u13
        [14] = u14
        [15] = u12
        [16] = u8
        [17] = u10
        [18] = u11
        [19] = u2
    --]]
    if p130 == u22.KILL_EFFECT then
        local v132
        if p131 == nil then
            v132 = p131
        else
            v132 = p131.selectedKillEffect
        end
        local v133
        if v132 then
            v133 = p131.selectedKillEffect
        else
            v133 = u6:getState().Locker.selectedKillEffect
        end
        local v134 = u17[v133]
        local v135 = {
            ["name"] = v134.name
        }
        local v136 = v134.image
        v135.imageId = v136 == nil and "" or v136
        v135.itemEnum = v133
        v135.lockerTab = u24.KILL_EFFECTS
        v135.none = v133 == u18.NONE
        return v135
    end
    if p130 == u22.WIN_EFFECT then
        local v137
        if p131 == nil then
            v137 = p131
        else
            v137 = p131.selectedWinEffect
        end
        local v138
        if v137 then
            v138 = p131.selectedWinEffect
        else
            v138 = u6:getState().Locker.selectedWinEffect
        end
        local v139 = u27[v138]
        local v140 = {
            ["name"] = v139.name
        }
        local v141 = v139.image
        v140.imageId = v141 == nil and "" or v141
        v140.itemEnum = v138
        v140.lockerTab = u24.WIN_EFFECTS
        v140.none = v138 == u28.NONE
        return v140
    end
    if p130 == u22.TITLE then
        local v142
        if p131 == nil then
            v142 = p131
        else
            v142 = p131.selectedTitle
        end
        if v142 then
            if p131 ~= nil then
                p131 = p131.selectedTitle
            end
        else
            p131 = u6:getState().Locker.selectedTitle
        end
        local v143 = u25[p131]
        local v144 = {}
        local v145 = v143.name
        if v145 == nil then
            v145 = v143.text
        end
        v144.name = v145
        v144.imageId = ""
        v144.itemEnum = p131
        v144.lockerTab = u24.TITLES
        v144.none = p131 == u26.NONE
        return v144
    end
    if p130 == u22.LOBBY_GADGET then
        local v146
        if p131 == nil then
            v146 = p131
        else
            v146 = p131.selectedLobbyGadget
        end
        if v146 then
            if p131 ~= nil then
                p131 = p131.selectedLobbyGadget
            end
        else
            p131 = u6:getState().Locker.selectedLobbyGadget
        end
        local v147 = u19[p131]
        if not v147 then
            print("[Locker Util] Attempeted to index an unknown Lobby Gadget: " .. p131)
        end
        local v148 = {}
        local v149
        if v147 == nil then
            v149 = v147
        else
            v149 = v147.name
        end
        v148.name = v149 == nil and "" or v149
        local v150
        if v147 then
            local v151 = u21(p131)
            v150 = v151 == nil and "" or v151
        else
            v150 = ""
        end
        v148.imageId = v150
        v148.itemEnum = p131
        v148.lockerTab = u24.LOBBY_GADGETS
        v148.none = p131 == u20.NONE
        return v148
    end
    if p130 == u22.BED_BREAK_EFFECT then
        local v152
        if p131 == nil then
            v152 = p131
        else
            v152 = p131.selectedBreakBedEffect
        end
        if v152 then
            if p131 ~= nil then
                p131 = p131.selectedBreakBedEffect
            end
        else
            p131 = u6:getState().Locker.selectedBreakBedEffect
        end
        local v153 = u13[p131]
        local v154 = {}
        local v155
        if v153 == nil then
            v155 = v153
        else
            v155 = v153.name
        end
        v154.name = v155
        if v153 ~= nil then
            v153 = v153.image
        end
        v154.imageId = v153 == nil and "" or v153
        v154.itemEnum = p131
        v154.lockerTab = u24.BREAK_BED_EFFECTS
        v154.none = p131 == u14.NONE
        return v154
    end
    if p130 == u22.BADGE then
        local v156
        if p131 == nil then
            v156 = p131
        else
            v156 = p131.featuredBadges[1]
        end
        if v156 then
            if p131 ~= nil then
                p131 = p131.featuredBadges[1]
            end
        else
            p131 = u6:getState().Locker.featuredBadges[1]
        end
        if p131 == u12.NONE or p131 == nil then
            return {
                ["name"] = "None",
                ["imageId"] = "",
                ["none"] = true,
                ["itemEnum"] = u12.NONE,
                ["lockerTab"] = u24.BADGES
            }
        end
        local v157 = u8.getMeta(p131)
        local v158 = {}
        local v159
        if v157 == nil then
            v159 = v157
        else
            v159 = v157.title
        end
        v158.name = v159 == nil and "" or v159
        local v160 = v157.goal
        if v160 ~= nil then
            v160 = v160.value
        end
        v158.description = v157.description(v160)
        v158.imageId = ""
        v158.itemEnum = p131
        v158.lockerTab = u24.BADGES
        return v158
    end
    if p130 ~= u22.BED_SKIN then
        return {
            ["name"] = "None",
            ["imageId"] = "",
            ["itemEnum"] = "none",
            ["none"] = true
        }
    end
    local v161
    if p131 == nil then
        v161 = p131
    else
        v161 = p131.bedSkin
    end
    local v162
    if v161 then
        v162 = p131.bedSkin
    else
        v162 = u6:getState().Locker.bedSkin
    end
    if not v162 then
        return {
            ["name"] = "None",
            ["imageId"] = "",
            ["itemEnum"] = nil,
            ["none"] = true,
            ["lockerTab"] = u24.BED_SKIN
        }
    end
    local v163 = u10(v162)
    local v164 = u11(v163.itemType)
    local v165 = string.split(v163.skinTag, "_")
    local v166 = table.create(#v165)
    for v167, v168 in v165 do
        local _ = v167 - 1
        v166[v167] = u2.capitalizeFirstLetter(v168)
    end
    local v169 = table.concat(v166, "")
    local v170 = {}
    local v171 = v163.name
    if v171 == nil then
        v171 = v169 .. " " .. v164.displayName
    end
    v170.name = v171
    local v172 = v163.renderImage
    v170.imageId = v172 == nil and "" or v172
    v170.itemEnum = v162
    v170.lockerTab = u24.BED_SKIN
    return v170
end
function v29.isPreviewTab(p173) --[[ Line: 727 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    return table.find(u30, p173) ~= nil
end
function v29.previewElement(p174, p175, p176) --[[ Line: 733 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u3
        [3] = u24
        [4] = u18
        [5] = u14
        [6] = u20
    --]]
    if u23.canPreviewLockerElement(p174, p175) then
        if p174 then
            if p175 == u24.KILL_EFFECTS then
                local v177 = p174.itemEnum
                if v177 == u18.NONE then
                    u3.Controllers.LockerPreviewController:cleanup()
                else
                    u3.Controllers.LockerPreviewController:preview({
                        ["killEffect"] = v177
                    }, p176)
                end
            elseif p175 == u24.BREAK_BED_EFFECTS then
                local v178 = p174.itemEnum
                if v178 == u14.NONE then
                    u3.Controllers.LockerPreviewController:cleanup()
                else
                    u3.Controllers.LockerPreviewController:preview({
                        ["bedBreakEffect"] = v178
                    }, p176)
                end
            elseif p175 == u24.BED_SKIN then
                local v179 = p174.itemEnum
                if v179 == "none" then
                    u3.Controllers.LockerPreviewController:cleanup()
                else
                    u3.Controllers.LockerPreviewController:preview({
                        ["bedSkin"] = v179
                    }, p176)
                end
            elseif p175 == u24.LOBBY_GADGETS then
                local v180 = p174.itemEnum
                if v180 == u20.NONE then
                    u3.Controllers.LockerPreviewController:cleanup()
                else
                    u3.Controllers.LockerPreviewController:preview({
                        ["lobbyGadget"] = v180
                    }, p176)
                end
            elseif p175 == u24.EMOTES then
                local v181 = {
                    ["emote"] = p174.itemEnum
                }
                u3.Controllers.LockerPreviewController:preview(v181, p176)
            else
                u3.Controllers.LockerPreviewController:cleanup()
            end
        else
            u3.Controllers.LockerPreviewController:cleanup()
            return
        end
    else
        u3.Controllers.LockerPreviewController:cleanup()
        return nil
    end
end
function v29.openFullscreenPreview(p182, p183) --[[ Line: 789 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u3
        [3] = u5
        [4] = u7
        [5] = u24
    --]]
    if u23.canPreviewLockerElement(p182, p183) then
        local u184 = u5.LocalPlayer:FindFirstChildOfClass("PlayerGui")
        if u184 ~= nil then
            u184 = u184:FindFirstChild(u7.LOCKER)
        end
        local function v185() --[[ Line: 800 ]]
            --[[
            Upvalues:
                [1] = u184
            --]]
            if u184 then
                u184.Enabled = false
            end
        end
        local function v186() --[[ Line: 805 ]]
            --[[
            Upvalues:
                [1] = u184
            --]]
            if u184 then
                u184.Enabled = true
            end
        end
        if p183 == u24.KILL_EFFECTS then
            local v187 = u3.Controllers.LockerPreviewController
            local v188 = {}
            if p182 ~= nil then
                p182 = p182.itemEnum
            end
            v188.killEffect = p182
            v187:openFullscreenPreview(v188, {
                ["fromLocker"] = true,
                ["onOpen"] = v185,
                ["onClose"] = v186
            })
            return
        elseif p183 == u24.BREAK_BED_EFFECTS then
            local v189 = u3.Controllers.LockerPreviewController
            local v190 = {}
            if p182 ~= nil then
                p182 = p182.itemEnum
            end
            v190.bedBreakEffect = p182
            v189:openFullscreenPreview(v190, {
                ["fromLocker"] = true,
                ["onOpen"] = v185,
                ["onClose"] = v186
            })
            return
        elseif p183 == u24.BED_SKIN then
            local v191 = u3.Controllers.LockerPreviewController
            local v192 = {}
            if p182 ~= nil then
                p182 = p182.itemEnum
            end
            v192.bedSkin = p182
            v191:openFullscreenPreview(v192, {
                ["fromLocker"] = true,
                ["onOpen"] = v185,
                ["onClose"] = v186
            })
            return
        elseif p183 == u24.LOBBY_GADGETS then
            local v193 = u3.Controllers.LockerPreviewController
            local v194 = {}
            if p182 ~= nil then
                p182 = p182.itemEnum
            end
            v194.lobbyGadget = p182
            v193:openFullscreenPreview(v194, {
                ["fromLocker"] = true,
                ["onOpen"] = v185,
                ["onClose"] = v186
            })
        elseif p183 == u24.EMOTES then
            local v195 = u3.Controllers.LockerPreviewController
            local v196 = {}
            if p182 ~= nil then
                p182 = p182.itemEnum
            end
            v196.emote = p182
            v195:openFullscreenPreview(v196, {
                ["fromLocker"] = true,
                ["onOpen"] = v185,
                ["onClose"] = v186
            })
        end
    else
        u3.Controllers.LockerPreviewController:cleanup()
        return nil
    end
end
return {
    ["LockerUtil"] = v29
}
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-team-upgrade", "bed-team-upgrade-type").BedTeamUpgrade
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-type").TeamUpgrade
local v7 = u3.keys(v6)
local v8 = table.create(#v7)
local u9 = {
    ["kills"] = {},
    ["bedBreaks"] = {},
    ["finalDeaths"] = {},
    ["kits"] = {},
    ["othersUsingKitSkin"] = {},
    ["teamBedStatus"] = {},
    ["itemTiersPurchased"] = {}
}
for v10, v11 in v7 do
    local _ = v10 - 1
    v8[v10] = { v11, 0 }
end
local v12 = {}
for _, v13 in v8 do
    v12[v13[1]] = v13[2]
end
u9.myTeamUpgrades = v12
u9.teamUpgrades = {}
u9.kit = nil
u9.weapon = nil
u9.equippedKitSkins = nil
u9.ownedKits = {}
u9.ownedKitSkins = {}
u9.useKitSkin = true
u9.playerLevel = 0
u9.playerLevelTotalExperience = 0
u9.milestoneRewardsClaimed = {}
u9.freeKitLevel = 0
u9.bedCoins = 0
u9.favoriteKits = {}
local v14 = u3.keys(v5)
local v15 = table.create(#v14)
for v16, v17 in v14 do
    local _ = v16 - 1
    v15[v16] = { v17, false }
end
local v18 = {}
for _, v19 in v15 do
    v18[v19[1]] = v19[2]
end
u9.myBedTeamUpgrades = v18
u9.bedTeamUpgrades = {}
u9.bedHealth = {}
u9.bedPlatingHealth = {}
return {
    ["BedwarsReducer"] = function(p20, p21) --[[ Name: BedwarsReducer, Line 66 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u3
            [3] = u4
            [4] = u2
        --]]
        if p20 == nil then
            p20 = u9
        end
        if p21.type == "BedwarsSetSome" then
            local v22 = {}
            for v23, v24 in p20 do
                v22[v23] = v24
            end
            for v25, v26 in p21.data do
                v22[v25] = v26
            end
            return v22
        elseif p21.type == "BedwarsSetKills" then
            local v27 = {}
            for v28, v29 in p20 do
                v27[v28] = v29
            end
            local v30 = {}
            for v31, v32 in p20.kills do
                v30[v31] = v32
            end
            v30[p21.userId] = p21.kills
            v27.kills = v30
            return v27
        elseif p21.type == "BedwarsIncrementKills" then
            local v33 = p20.kills[p21.userId]
            if v33 ~= 0 and (v33 == v33 and v33) then
                local v34 = p20.kills
                local v35 = p21.userId
                v34[v35] = v34[v35] + 1
                return p20
            end
            local v36 = {}
            for v37, v38 in p20 do
                v36[v37] = v38
            end
            local v39 = {}
            for v40, v41 in p20.kills do
                v39[v40] = v41
            end
            v39[p21.userId] = 1
            v36.kills = v39
            return v36
        else
            if p21.type == "BedwarsSetBedBreaks" then
                local v42 = p21.userId
                if v42 ~= 0 and (v42 == v42 and v42) then
                    local v43 = p20.bedBreaks[p21.userId]
                    if v43 ~= 0 and (v43 == v43 and v43) then
                        local v44 = p20.bedBreaks
                        local v45 = p21.userId
                        v44[v45] = v44[v45] + 1
                        local v46 = {}
                        for v47, v48 in p20 do
                            v46[v47] = v48
                        end
                        return v46
                    end
                    local v49 = {}
                    for v50, v51 in p20 do
                        v49[v50] = v51
                    end
                    local v52 = {}
                    for v53, v54 in p20.bedBreaks do
                        v52[v53] = v54
                    end
                    v52[p21.userId] = 1
                    v49.bedBreaks = v52
                    return v49
                end
            end
            if p21.type == "BedwarsSetFinalDeaths" then
                local v55 = {}
                for v56, v57 in p20 do
                    v55[v56] = v57
                end
                local v58 = {}
                for v59, v60 in p20.finalDeaths do
                    v58[v59] = v60
                end
                v58[p21.userId] = p21.dead
                v55.finalDeaths = v58
                return v55
            elseif p21.type == "BedwarsSetKits" then
                local v61 = {}
                for v62, v63 in p20 do
                    v61[v62] = v63
                end
                local v64 = {}
                for v65, v66 in p20.kits do
                    v64[v65] = v66
                end
                v64[p21.userId] = p21.kit
                v61.kits = v64
                return v61
            elseif p21.type == "SetBedwarsWeapon" then
                local v67 = {}
                for v68, v69 in p20 do
                    v67[v68] = v69
                end
                v67.weapon = p21.weapon
                return v67
            elseif p21.type == "BedwarsSetTeamUpgrades" then
                local v70 = {}
                for v71, v72 in p20 do
                    v70[v71] = v72
                end
                local v73 = {}
                for v74, v75 in p20.teamUpgrades do
                    v73[v74] = v75
                end
                v73[p21.teamId] = p21.teamUpgrades
                v70.teamUpgrades = v73
                return v70
            elseif p21.type == "SetMyTeamUpgrades" then
                local v76 = {}
                for v77, v78 in p20 do
                    v76[v77] = v78
                end
                v76.myTeamUpgrades = p21.myTeamUpgrades
                return v76
            elseif p21.type == "BedwarsSetBedTeamUpgrades" then
                local v79 = {}
                for v80, v81 in p20 do
                    v79[v80] = v81
                end
                local v82 = {}
                for v83, v84 in p20.bedTeamUpgrades do
                    v82[v83] = v84
                end
                v82[p21.teamId] = p21.bedTeamUpgrades
                v79.bedTeamUpgrades = v82
                return v79
            elseif p21.type == "SetMyBedTeamUpgrades" then
                local v85 = {}
                for v86, v87 in p20 do
                    v85[v86] = v87
                end
                v85.myBedTeamUpgrades = p21.myBedTeamUpgrades
                return v85
            elseif p21.type == "SetBedHealth" then
                local v88 = {}
                for v89, v90 in p20 do
                    v88[v89] = v90
                end
                local v91 = {}
                for v92, v93 in p20.bedHealth do
                    v91[v92] = v93
                end
                v91[p21.teamId] = {
                    ["health"] = p21.bedHealth,
                    ["maxHealth"] = p21.maxBedHealth
                }
                v88.bedHealth = v91
                return v88
            elseif p21.type == "SetBedPlatingHealth" then
                local v94 = {}
                for v95, v96 in p20 do
                    v94[v95] = v96
                end
                local v97 = {}
                for v98, v99 in p20.bedPlatingHealth do
                    v97[v98] = v99
                end
                v97[p21.teamId] = {
                    ["health"] = p21.platingHealth,
                    ["maxHealth"] = p21.maxPlatingHealth
                }
                v94.bedPlatingHealth = v97
                return v94
            elseif p21.type == "BedwarsSetBedStatus" then
                local v100 = {}
                for v101, v102 in p20 do
                    v100[v101] = v102
                end
                local v103 = {}
                for v104, v105 in p20.teamBedStatus do
                    v103[v104] = v105
                end
                v103[p21.teamId] = p21.bedStatus
                v100.teamBedStatus = v103
                return v100
            elseif p21.type == "BedwarsSetBedAliveSuddenDeath" then
                print("[BW Reducer]: Before", p20.teamBedStatus)
                local v106 = {}
                for v107, v108 in u3.keys(p20.teamBedStatus) do
                    local _ = v107 - 1
                    v106[v108] = u4.BedStatus.BED_BROKEN
                    local _ = v106[v108]
                end
                print("[BW Reducer]: After", p20.teamBedStatus)
                local v109 = {}
                for v110, v111 in p20 do
                    v109[v110] = v111
                end
                v109.teamBedStatus = v106
                return v109
            elseif p21.type == "BedwarsAddItemPurchased" then
                local v112 = {}
                for v113, v114 in p20 do
                    v112[v113] = v114
                end
                local v115 = {}
                local v116 = #v115
                local v117 = p20.itemTiersPurchased
                local v118 = #v117
                table.move(v117, 1, v118, v116 + 1, v115)
                v115[v116 + v118 + 1] = p21.itemType
                v112.itemTiersPurchased = v115
                return v112
            elseif p21.type == "BedwarsBulkAddItemPurchased" then
                local v119 = {}
                for v120, v121 in p20 do
                    v119[v120] = v121
                end
                local v122 = {}
                local v123 = #v122
                local v124 = p20.itemTiersPurchased
                local v125 = #v124
                table.move(v124, 1, v125, v123 + 1, v122)
                local v126 = v123 + v125
                local v127 = p21.itemTypes
                table.move(v127, 1, #v127, v126 + 1, v122)
                v119.itemTiersPurchased = v122
                return v119
            elseif p21.type == "SetBedwarsKit" then
                local v128 = {}
                for v129, v130 in p20 do
                    v128[v129] = v130
                end
                v128.kit = p21.kit
                return v128
            elseif p21.type == "AddOwnedKits" then
                local v131 = {}
                for v132, v133 in p20 do
                    v131[v132] = v133
                end
                local v134 = {}
                local v135 = #v134
                local v136 = p20.ownedKits
                local v137 = #v136
                table.move(v136, 1, v137, v135 + 1, v134)
                local v138 = v135 + v137
                local v139 = p21.kits
                table.move(v139, 1, #v139, v138 + 1, v134)
                v131.ownedKits = v134
                return v131
            elseif p21.type == "SetOwnedKitSkins" then
                local v140 = {}
                for v141, v142 in p20 do
                    v140[v141] = v142
                end
                v140.ownedKitSkins = p21.ownedKitSkins
                return v140
            elseif p21.type == "SetUseKitSkin" then
                local v143 = {}
                for v144, v145 in p20 do
                    v143[v144] = v145
                end
                v143.useKitSkin = p21.useKitSkin
                return v143
            elseif p21.type == "SetEquippedKitSkins" then
                local v146 = {}
                for v147, v148 in p20 do
                    v146[v147] = v148
                end
                v146.equippedKitSkins = p21.equippedKitSkins
                return v146
            elseif p21.type == "EquipKitSkin" then
                local v149 = {}
                for v150, v151 in p20 do
                    v149[v150] = v151
                end
                local v152 = {}
                for v153, v154 in p20.equippedKitSkins do
                    v152[v153] = v154
                end
                v152[p21.kit] = p21.kitSkin
                v149.equippedKitSkins = v152
                return v149
            elseif p21.type == "BedwarsUpdateBossBar" then
                local v155 = {}
                for v156, v157 in p20 do
                    v155[v156] = v157
                end
                local v158 = {
                    ["health"] = p21.health
                }
                local v159 = p21.maxHealth
                if v159 == nil then
                    v159 = p20.bossBar
                    if v159 ~= nil then
                        v159 = v159.maxHealth
                    end
                end
                v158.maxHealth = v159
                v155.bossBar = v158
                return v155
            elseif p21.type == "BedwarsSetPvPArenaAugmentSelection" then
                local v160 = {}
                for v161, v162 in p20 do
                    v160[v161] = v162
                end
                if not v160.pvpArena then
                    v160.pvpArena = {}
                end
                if not v160.pvpArena.userIdAugmentMap then
                    v160.pvpArena.userIdAugmentMap = {}
                end
                local v163 = u2.getOrCreate(v160.pvpArena.userIdAugmentMap, p21.userId, {})
                local v164 = p21.augment
                table.insert(v163, v164)
                return v160
            elseif p21.type == "AddFavoriteKit" then
                local v165 = {}
                for v166, v167 in p20 do
                    v165[v166] = v167
                end
                local v168 = p20.favoriteKits
                v168[p21.kit] = true
                v165.favoriteKits = v168
                return v165
            elseif p21.type == "RemoveFavoriteKit" then
                p20.favoriteKits[p21.kit] = nil
                local v169 = {}
                for v170, v171 in p20 do
                    v169[v170] = v171
                end
                v169.favoriteKits = p20.favoriteKits
                return v169
            elseif p21.type == "BedwarsSetPregameVoteState" then
                local v172 = {}
                for v173, v174 in p20 do
                    v172[v173] = v174
                end
                if not v172.pregameVote then
                    v172.pregameVote = {}
                end
                v172.pregameVote.voteState = p21.voteState
                return v172
            elseif p21.type == "SetPregameVoteWon" then
                local v175 = {}
                for v176, v177 in p20 do
                    v175[v176] = v177
                end
                if not v175.pregameVote then
                    v175.pregameVote = {}
                end
                v175.pregameVote.winningVotingOption = p21.winningVotingOption
                v175.pregameVote.winningVoterIndex = p21.winningVoterIndex
                return v175
            else
                if p21.type ~= "BedwarsSetPregameVoteEndTime" then
                    return p20
                end
                local v178 = {}
                for v179, v180 in p20 do
                    v178[v179] = v180
                end
                if not v178.pregameVote then
                    v178.pregameVote = {}
                end
                v178.pregameVote.pregameVoteEndTime = p21.voteEndTime
                return v178
            end
        end
    end
}
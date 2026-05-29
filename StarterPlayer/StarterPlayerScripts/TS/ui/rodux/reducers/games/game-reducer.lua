local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "script-editor", "script-editor-util").ScriptEditorUtil
local u7 = {
    ["teams"] = {},
    ["myTeam"] = nil,
    ["startTime"] = os.time() + 15,
    ["endTime"] = -1,
    ["matchState"] = u5.PRE,
    ["queueType"] = nil,
    ["teleportingToLobbyAtTime"] = -1,
    ["spectating"] = false,
    ["spectatingPlayer"] = nil,
    ["customMatch"] = nil,
    ["pregameVotingEnabled"] = false,
    ["sprayModeEnabled"] = false,
    ["teamScores"] = {},
    ["serverRegion"] = "",
    ["unlockedShopCategories"] = {},
    ["matchEvents"] = {},
    ["murderCoins"] = 0,
    ["scripts"] = {},
    ["scriptContents"] = {},
    ["consoleText"] = {},
    ["consoleFrontIndex"] = 0,
    ["openScript"] = nil,
    ["consoleOpen"] = false,
    ["infoOpen"] = true,
    ["syncOpen"] = false,
    ["scriptUpdateId"] = 0,
    ["scriptsRunning"] = false,
    ["activeGoose"] = nil,
    ["gooseHolder"] = nil,
    ["gooseOwnerTeam"] = nil,
    ["eggCountMap"] = {},
    ["dragonEggTeamScores"] = {},
    ["pvpArenaTeamHealth"] = {},
    ["matchEndSummaryVisible"] = false,
    ["honoredPlayers"] = {}
}
return {
    ["GameReducer"] = function(p8, u9) --[[ Name: GameReducer, Line 45 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
            [3] = u2
            [4] = u5
            [5] = u6
            [6] = u3
        --]]
        if p8 == nil then
            p8 = u7
        end
        local v10 = u9.type
        if v10 == "GameSetSome" then
            local v11 = {}
            for v12, v13 in p8 do
                v11[v12] = v13
            end
            for v14, v15 in u9.data do
                v11[v14] = v15
            end
            return v11
        end
        if v10 == "GameSetUnlockedShopCategories" then
            local v16 = {}
            for v17, v18 in p8 do
                v16[v17] = v18
            end
            v16.unlockedShopCategories = u9.unlockedShopCategories
            return v16
        end
        if v10 ~= "GameSetTeams" then
            if v10 == "GameAddTeamMember" then
                local v19 = u9.player.UserId == u4.LocalPlayer.UserId
                local u20 = nil
                local v21 = p8.myTeam
                if v21 ~= nil then
                    v21 = v21.id
                end
                local v22 = v21 == u9.teamId
                local v23 = p8.teams
                local function v34(p24) --[[ Line: 106 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u20
                        [3] = u2
                    --]]
                    if p24.id ~= u9.teamId then
                        return p24
                    end
                    local v25 = {}
                    for v26, v27 in p24 do
                        v25[v26] = v27
                    end
                    local v28 = {}
                    local v29 = #v28
                    for v30, v31 in p24.members do
                        v29 = v29 + 1
                        v28[v29] = { v30, v31 }
                    end
                    local v32 = {}
                    for _, v33 in v28 do
                        v32[v33[1]] = v33[2]
                    end
                    v25.members = v32
                    u20 = v25
                    u20.members[u9.player.UserId] = u2.getOfflinePlayer(u9.player)
                    return u20
                end
                local v35 = table.create(#v23)
                for v36, v37 in v23 do
                    v35[v36] = v34(v37, v36 - 1, v23)
                end
                local v38 = {}
                for v39, v40 in p8 do
                    v38[v39] = v40
                end
                v38.teams = v35
                if not (v19 or v22) then
                    u20 = p8.myTeam
                end
                v38.myTeam = u20
                return v38
            end
            if v10 == "GameRemoveTeamMember" then
                local v41 = u9.player.UserId == u4.LocalPlayer.UserId
                local u42 = nil
                local v43 = p8.myTeam
                if v43 ~= nil then
                    v43 = v43.id
                end
                local v44 = v43 == u9.teamId
                local v45 = p8.teams
                local v46 = table.create(#v45)
                local function v59(p47) --[[ Line: 157 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u42
                    --]]
                    if p47.id ~= u9.teamId then
                        return p47
                    end
                    local v48 = {}
                    for v49, v50 in p47 do
                        v48[v49] = v50
                    end
                    local v51 = {}
                    local v52 = #v51
                    for v53, v54 in p47.members do
                        v52 = v52 + 1
                        v51[v52] = { v53, v54 }
                    end
                    local v55 = {}
                    for _, v56 in v51 do
                        v55[v56[1]] = v56[2]
                    end
                    v48.members = v55
                    u42 = v48
                    u42.members[u9.player.UserId] = nil
                    local v57 = u42.members
                    local v58 = u9.player.UserId
                    v57[tostring(v58)] = nil
                    return u42
                end
                for v60, v61 in v45 do
                    v46[v60] = v59(v61, v60 - 1, v45)
                end
                local v62 = {}
                for v63, v64 in p8 do
                    v62[v63] = v64
                end
                v62.teams = v46
                if v41 then
                    u42 = nil
                elseif not v44 then
                    u42 = p8.myTeam
                end
                v62.myTeam = u42
                return v62
            end
            if v10 == "GameSetEndTime" then
                local v65 = {}
                for v66, v67 in p8 do
                    v65[v66] = v67
                end
                v65.endTime = u9.endTime
                return v65
            end
            if v10 == "GameSetMatchState" then
                local v68 = p8.teleportingToLobbyAtTime
                if u9.matchState == u5.POST then
                    v68 = tick() + 10
                end
                local v69 = {}
                for v70, v71 in p8 do
                    v69[v70] = v71
                end
                v69.matchState = u9.matchState
                v69.teleportingToLobbyAtTime = v68
                return v69
            end
            if v10 == "GameSetQueueType" then
                local v72 = {}
                for v73, v74 in p8 do
                    v72[v73] = v74
                end
                v72.queueType = u9.queueType
                return v72
            end
            if v10 == "GameSetSpectator" then
                local v75 = {}
                for v76, v77 in p8 do
                    v75[v76] = v77
                end
                v75.spectating = u9.spectating
                v75.spectatingPlayer = u9.spectatingPlayer
                return v75
            end
            if v10 == "GameSetStartTime" then
                local v78 = {}
                for v79, v80 in p8 do
                    v78[v79] = v80
                end
                v78.startTime = u9.startTime
                return v78
            end
            if v10 == "SetCustomMatchData" then
                local v81 = {}
                for v82, v83 in p8 do
                    v81[v82] = v83
                end
                v81.customMatch = {
                    ["joinCode"] = u9.customMatch.joinCode,
                    ["hostUserId"] = u9.customMatch.hostUserId
                }
                return v81
            end
            if v10 == "SetSpectatedTurret" then
                local v84 = {}
                for v85, v86 in p8 do
                    v84[v85] = v86
                end
                v84.selectedTurret = u9.selectedTurret
                return v84
            end
            if v10 == "SetCustomMatchData" then
                local v87 = {}
                for v88, v89 in p8 do
                    v87[v88] = v89
                end
                v87.customMatch = {
                    ["joinCode"] = u9.customMatch.joinCode,
                    ["hostUserId"] = u9.customMatch.hostUserId
                }
                return v87
            end
            if v10 == "GameSetSprayModeEnabled" then
                local v90 = {}
                for v91, v92 in p8 do
                    v90[v91] = v92
                end
                v90.sprayModeEnabled = u9.sprayModeEnabled
                return v90
            end
            if v10 == "GameSetTeamScores" then
                local v93 = {}
                for v94, v95 in p8 do
                    v93[v94] = v95
                end
                local v96 = {}
                local v97 = #v96
                local v98 = u9.teamScores
                table.move(v98, 1, #v98, v97 + 1, v96)
                v93.teamScores = v96
                return v93
            end
            if v10 == "GameAddTeamScore" then
                local v99 = {}
                for v100, v101 in p8 do
                    v99[v100] = v101
                end
                local v102 = {}
                local v103 = #v102
                local v104 = p8.teamScores
                local v105 = #v104
                table.move(v104, 1, v105, v103 + 1, v102)
                v102[v103 + v105 + 1] = {
                    ["teamId"] = u9.teamId,
                    ["score"] = u9.score
                }
                v99.teamScores = v102
                return v99
            end
            if v10 == "GameUpdateTeamScore" then
                local v106 = {}
                for v107, v108 in p8 do
                    v106[v107] = v108
                end
                local v109 = p8.teamScores
                local v110 = table.create(#v109)
                for v111, v113 in v109 do
                    local _ = v111 - 1
                    if v113.teamId == u9.teamId then
                        local v113 = {}
                        for v114, v115 in v113 do
                            v113[v114] = v115
                        end
                        v113.score = u9.score
                    end
                    v110[v111] = v113
                end
                v106.teamScores = v110
                return v106
            end
            if v10 == "SetServerRegion" then
                local v116 = {}
                for v117, v118 in p8 do
                    v116[v117] = v118
                end
                v116.serverRegion = u9.serverRegion
                return v116
            end
            if v10 == "GameAddMatchEvent" then
                p8.matchEvents[u9.matchEvent.id] = u9.matchEvent
                local v119 = {}
                for v120, v121 in p8 do
                    v119[v120] = v121
                end
                return v119
            end
            if v10 == "GameRemoveMatchEvent" then
                p8.matchEvents[u9.matchEventId] = nil
                local v122 = {}
                for v123, v124 in p8 do
                    v122[v123] = v124
                end
                return v122
            end
            if v10 == "GameRegisterScriptSyntaxError" then
                local v125 = p8.scripts[u9.scriptId]
                if not v125 then
                    return p8
                end
                v125.knownSyntaxError = u9.syntaxError
                local v126 = {}
                for v127, v128 in p8 do
                    v126[v127] = v128
                end
                v126.scriptUpdateId = p8.scriptUpdateId + 1
                return v126
            end
            if v10 == "GameUpdateScript" then
                for _, v129 in u9.scriptUpdates do
                    local v130 = p8.scripts[v129.scriptId]
                    if v130 then
                        local v131 = v129.scriptName
                        if v131 ~= "" and v131 then
                            v130.scriptName = v129.scriptName
                        end
                        if u9.updateFromServer then
                            v130.editInProgress = false
                        end
                        if u9.updateFromServer or v129.knownSyntaxError ~= nil then
                            v130.knownSyntaxError = v129.knownSyntaxError
                        end
                        local v132 = v129.scriptContents
                        if v132 ~= "" and v132 then
                            local v133 = not u9.updateFromServer
                            if not v133 then
                                local v134 = v129.editedByUserId
                                local v135 = u4
                                if v135 ~= nil then
                                    v135 = v135.LocalPlayer
                                    if v135 ~= nil then
                                        v135 = v135.UserId
                                    end
                                end
                                v133 = v134 ~= v135
                            end
                            if v133 then
                                p8.scriptContents[v129.scriptId] = v129.scriptContents
                            elseif v129.scriptContents ~= p8.scriptContents[v129.scriptId] then
                                v130.editInProgress = true
                            end
                        end
                    elseif v129.scriptName ~= nil and v129.scriptContents ~= nil then
                        p8.scripts[v129.scriptId] = {
                            ["loaded"] = false,
                            ["editInProgress"] = false,
                            ["scriptId"] = v129.scriptId,
                            ["scriptName"] = v129.scriptName,
                            ["knownSyntaxError"] = v129.knownSyntaxError
                        }
                        p8.scriptContents[v129.scriptId] = v129.scriptContents
                    end
                end
                local v136 = {}
                for v137, v138 in p8 do
                    v136[v137] = v138
                end
                v136.scriptUpdateId = p8.scriptUpdateId + 1
                return v136
            end
            if v10 == "GameDeleteScript" then
                p8.scripts[u9.scriptId] = nil
                p8.scriptContents[u9.scriptId] = nil
                local v139 = {}
                for v140, v141 in p8 do
                    v139[v140] = v141
                end
                v139.scriptUpdateId = p8.scriptUpdateId + 1
                return v139
            end
            if v10 == "GameRegisterNewConsoleLines" then
                for _, v142 in u9.newLines do
                    if #p8.consoleText < u6.MAX_VISIBLE_CONSOLE_LINES then
                        local v143 = p8.consoleText
                        table.insert(v143, v142)
                    else
                        p8.consoleText[p8.consoleFrontIndex + 1] = v142
                        p8.consoleFrontIndex = (p8.consoleFrontIndex + 1) % u6.MAX_VISIBLE_CONSOLE_LINES
                    end
                end
                local v144 = {}
                for v145, v146 in p8 do
                    v144[v145] = v146
                end
                v144.scriptUpdateId = p8.scriptUpdateId + 1
                return v144
            end
            if v10 == "GameSetScriptSyncOpen" then
                local v147 = {}
                for v148, v149 in p8 do
                    v147[v148] = v149
                end
                v147.syncOpen = u9.open
                local v150
                if u9.open then
                    v150 = false
                else
                    v150 = p8.infoOpen
                end
                v147.infoOpen = v150
                local v151
                if u9.open then
                    v151 = false
                else
                    v151 = p8.consoleOpen
                end
                v147.consoleOpen = v151
                return v147
            end
            if v10 == "GameSetConsoleOpen" then
                local v152 = {}
                for v153, v154 in p8 do
                    v152[v153] = v154
                end
                v152.consoleOpen = u9.open
                local v155
                if u9.open then
                    v155 = false
                else
                    v155 = p8.syncOpen
                end
                v152.syncOpen = v155
                local v156
                if u9.open then
                    v156 = false
                else
                    v156 = p8.infoOpen
                end
                v152.infoOpen = v156
                return v152
            end
            if v10 == "GameSetScriptInfoOpen" then
                local v157 = {}
                for v158, v159 in p8 do
                    v157[v158] = v159
                end
                v157.infoOpen = u9.open
                local v160
                if u9.open then
                    v160 = false
                else
                    v160 = p8.syncOpen
                end
                v157.syncOpen = v160
                local v161
                if u9.open then
                    v161 = false
                else
                    v161 = p8.consoleOpen
                end
                v157.consoleOpen = v161
                return v157
            end
            if v10 == "GameSetOpenScript" then
                local v162
                if u9.scriptId == nil then
                    v162 = nil
                else
                    v162 = p8.scripts[u9.scriptId]
                end
                if v162 then
                    v162.loaded = true
                end
                local v163 = {}
                for v164, v165 in p8 do
                    v163[v164] = v165
                end
                v163.consoleOpen = false
                v163.infoOpen = false
                v163.syncOpen = false
                v163.openScript = u9.scriptId
                v163.scriptUpdateId = p8.scriptUpdateId + 1
                return v163
            end
            if v10 == "GameSetScriptsRunning" then
                local v166 = {}
                for v167, v168 in p8 do
                    v166[v167] = v168
                end
                v166.scriptsRunning = u9.running
                return v166
            end
            if v10 == "GameSetScriptEditInProgress" then
                local v169 = p8.scripts[u9.scriptId]
                if not v169 or v169.editInProgress == u9.editInProgress then
                    return p8
                end
                v169.editInProgress = u9.editInProgress
                local v170 = {}
                for v171, v172 in p8 do
                    v170[v171] = v172
                end
                v170.scriptUpdateId = p8.scriptUpdateId + 1
                return v170
            end
            if v10 == "GameSetMyTeam" then
                local v173 = {}
                for v174, v175 in p8 do
                    v173[v174] = v175
                end
                v173.myTeam = u9.myTeam
                return v173
            end
            if v10 == "RegisterActiveGoose" then
                local v176 = {}
                for v177, v178 in p8 do
                    v176[v177] = v178
                end
                v176.activeGoose = {
                    ["despawnTime"] = u9.despawnTime
                }
                return v176
            end
            if v10 == "SetGooseHolder" then
                local v179 = {}
                for v180, v181 in p8 do
                    v179[v180] = v181
                end
                v179.gooseHolder = u9.gooseHolder
                return v179
            end
            if v10 == "DeleteGooseHolder" then
                local v182 = {}
                for v183, v184 in p8 do
                    v182[v183] = v184
                end
                v182.gooseHolder = nil
                return v182
            end
            if v10 == "SetGooseOwnerTeam" then
                local v185 = {}
                for v186, v187 in p8 do
                    v185[v186] = v187
                end
                v185.gooseOwnerTeam = u9.ownerTeam
                return v185
            end
            if v10 == "DeleteGooseOwnerTeam" then
                local v188 = {}
                for v189, v190 in p8 do
                    v188[v189] = v190
                end
                v188.gooseOwnerTeam = nil
                return v188
            end
            if v10 == "GameSetPlayerEggCount" then
                p8.eggCountMap = u3.deepCopy(p8.eggCountMap)
                p8.eggCountMap[u9.userID] = u9.count
                local v191 = {}
                for v192, v193 in p8 do
                    v191[v192] = v193
                end
                return v191
            end
            if v10 == "AddDragonEggTeamScores" then
                local v194 = {}
                for v195, v196 in p8 do
                    v194[v195] = v196
                end
                local v197 = {}
                local v198 = #v197
                local v199 = p8.dragonEggTeamScores
                local v200 = #v199
                table.move(v199, 1, v200, v198 + 1, v197)
                v197[v198 + v200 + 1] = {
                    ["teamId"] = u9.teamId,
                    ["score"] = u9.score
                }
                v194.dragonEggTeamScores = v197
                return v194
            end
            if v10 == "SetDragonEggTeamScores" then
                local v201 = {}
                for v202, v203 in p8 do
                    v201[v202] = v203
                end
                local v204 = p8.dragonEggTeamScores
                local v205 = table.create(#v204)
                for v206, v208 in v204 do
                    local _ = v206 - 1
                    if v208.teamId == u9.teamId then
                        local v208 = {}
                        for v209, v210 in v208 do
                            v208[v209] = v210
                        end
                        v208.score = u9.score
                    end
                    v205[v206] = v208
                end
                v201.dragonEggTeamScores = v205
                return v201
            end
            if v10 == "AddPvPArenaTeamHealth" then
                local v211 = {}
                for v212, v213 in p8 do
                    v211[v212] = v213
                end
                local v214 = {}
                local v215 = #v214
                local v216 = p8.pvpArenaTeamHealth
                local v217 = #v216
                table.move(v216, 1, v217, v215 + 1, v214)
                v214[v215 + v217 + 1] = {
                    ["team"] = u9.team,
                    ["health"] = u9.health
                }
                v211.pvpArenaTeamHealth = v214
                return v211
            end
            if v10 == "SetPvPArenaTeamHealth" then
                local v218 = {}
                for v219, v220 in p8 do
                    v218[v219] = v220
                end
                local v221 = p8.pvpArenaTeamHealth
                local v222 = table.create(#v221)
                for v223, v225 in v221 do
                    local _ = v223 - 1
                    if v225.team.id == u9.team.id then
                        local v225 = {}
                        for v226, v227 in v225 do
                            v225[v226] = v227
                        end
                        v225.health = u9.health
                    end
                    v222[v223] = v225
                end
                v218.pvpArenaTeamHealth = v222
                return v218
            end
            if v10 == "SetMatchEndSummaryVisible" then
                local v228 = {}
                for v229, v230 in p8 do
                    v228[v229] = v230
                end
                v228.matchEndSummaryVisible = u9.visible
                return v228
            end
            if v10 ~= "GameAddHonoredPlayer" then
                return p8
            end
            local v231 = {}
            for v232, v233 in p8 do
                v231[v232] = v233
            end
            local v234 = {}
            local v235 = #v234
            local v236 = p8.honoredPlayers
            local v237 = #v236
            table.move(v236, 1, v237, v235 + 1, v234)
            v234[v235 + v237 + 1] = u9.userId
            v231.honoredPlayers = v234
            return v231
        end
        local v238 = u4.LocalPlayer
        if v238 ~= nil then
            v238 = v238:GetAttribute("Team")
        end
        local v239 = nil
        for v240, v241 in u9.teams do
            local _ = v240 - 1
            if v241.id == v238 == true then
                v239 = v241
                break
            end
        end
        local v242 = {}
        for v243, v244 in p8 do
            v242[v243] = v244
        end
        v242.teams = u9.teams
        v242.myTeam = v239
        return v242
    end
}
-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local WaterGunMode = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "water-gun", "water-gun-util").WaterGunMode;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local ScriptEditorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "script-editor", "script-editor-util").ScriptEditorUtil;
local u2 = {
    teams = {},
    myTeam = nil,
    startTime = os.time() + 15,
    endTime = -1,
    matchState = MatchState.PRE,
    queueType = nil,
    teleportingToLobbyAtTime = -1,
    spectating = false,
    spectatingPlayer = nil,
    customMatch = nil,
    pregameVotingEnabled = false,
    sprayModeEnabled = false,
    teamScores = {},
    serverRegion = "",
    unlockedShopCategories = {},
    matchEvents = {},
    murderCoins = 0,
    scripts = {},
    scriptContents = {},
    consoleText = {},
    consoleFrontIndex = 0,
    openScript = nil,
    consoleOpen = false,
    infoOpen = true,
    syncOpen = false,
    scriptUpdateId = 0,
    scriptsRunning = false,
    activeGoose = nil,
    gooseHolder = nil,
    gooseOwnerTeam = nil,
    eggCountMap = {},
    dragonEggTeamScores = {},
    pvpArenaTeamHealth = {},
    matchEndSummaryVisible = false,
    honoredPlayers = {},
    waterGunMode = WaterGunMode.SINGLE_SHOT
};

return {
    GameReducer = function(p3, u4) -- Line: 47, Name: GameReducer
        -- upvalues: u2 (copy), Players (copy), OfflinePlayerUtil (copy), MatchState (copy), ScriptEditorUtil (copy), u1 (copy)
        if p3 == nil then
            p3 = u2;
        end;

        local type = u4.type;

        if type == "GameSetSome" then
            local v5 = {};

            for i, v in p3 do
                v5[i] = v;
            end;

            for i, v in u4.data do
                v5[i] = v;
            end;

            return v5;
        end;

        if type == "GameSetUnlockedShopCategories" then
            local v6 = {};

            for i, v in p3 do
                v6[i] = v;
            end;

            v6.unlockedShopCategories = u4.unlockedShopCategories;

            return v6;
        end;

        if type ~= "GameSetTeams" then
            if type == "GameAddTeamMember" then
                local v7 = u4.player.UserId == Players.LocalPlayer.UserId;
                local u8 = nil;
                local myTeam = p3.myTeam;

                if myTeam ~= nil then
                    myTeam = myTeam.id;
                end;

                local v9 = myTeam == u4.teamId;
                local teams = p3.teams;

                local function v15(p10) -- Line: 108
                    -- upvalues: u4 (copy), u8 (ref), OfflinePlayerUtil (ref)
                    if p10.id ~= u4.teamId then
                        return p10;
                    end;

                    local v11 = {};

                    for i, v in p10 do
                        v11[i] = v;
                    end;

                    local v12 = {};
                    local v13 = #v12;

                    for i, v in p10.members do
                        v13 = v13 + 1;
                        v12[v13] = { i, v };
                    end;

                    local v14 = {};

                    for _, v in v12 do
                        v14[v[1]] = v[2];
                    end;

                    v11.members = v14;
                    u8 = v11;
                    u8.members[u4.player.UserId] = OfflinePlayerUtil.getOfflinePlayer(u4.player);

                    return u8;
                end;

                local v16 = table.create(#teams);

                for i, v in teams do
                    v16[i] = v15(v, i - 1, teams);
                end;

                local v17 = {};

                for i, v in p3 do
                    v17[i] = v;
                end;

                v17.teams = v16;
                local v18;

                if v7 or v9 then
                    v18 = u8;
                else
                    v18 = p3.myTeam;
                end;

                v17.myTeam = v18;

                return v17;
            end;

            if type == "GameRemoveTeamMember" then
                local v19 = u4.player.UserId == Players.LocalPlayer.UserId;
                local u20 = nil;
                local myTeam = p3.myTeam;

                if myTeam ~= nil then
                    myTeam = myTeam.id;
                end;

                local v21 = myTeam == u4.teamId;
                local teams = p3.teams;

                local function v27(p22) -- Line: 159
                    -- upvalues: u4 (copy), u20 (ref)
                    if p22.id ~= u4.teamId then
                        return p22;
                    end;

                    local v23 = {};

                    for i, v in p22 do
                        v23[i] = v;
                    end;

                    local v24 = {};
                    local v25 = #v24;

                    for i, v in p22.members do
                        v25 = v25 + 1;
                        v24[v25] = { i, v };
                    end;

                    local v26 = {};

                    for _, v in v24 do
                        v26[v[1]] = v[2];
                    end;

                    v23.members = v26;
                    u20 = v23;
                    u20.members[u4.player.UserId] = nil;
                    u20.members[tostring(u4.player.UserId)] = nil;

                    return u20;
                end;

                local v28 = table.create(#teams);

                for i, v in teams do
                    v28[i] = v27(v, i - 1, teams);
                end;

                local v29 = {};

                for i, v in p3 do
                    v29[i] = v;
                end;

                v29.teams = v28;
                local v30;

                if v19 then
                    v30 = nil;
                elseif v21 then
                    v30 = u20;
                else
                    v30 = p3.myTeam;
                end;

                v29.myTeam = v30;

                return v29;
            end;

            if type == "GameSetEndTime" then
                local v31 = {};

                for i, v in p3 do
                    v31[i] = v;
                end;

                v31.endTime = u4.endTime;

                return v31;
            end;

            if type == "GameSetMatchState" then
                local teleportingToLobbyAtTime = p3.teleportingToLobbyAtTime;

                if u4.matchState == MatchState.POST then
                    teleportingToLobbyAtTime = tick() + 10;
                end;

                local v32 = {};

                for i, v in p3 do
                    v32[i] = v;
                end;

                v32.matchState = u4.matchState;
                v32.teleportingToLobbyAtTime = teleportingToLobbyAtTime;

                return v32;
            end;

            if type == "GameSetQueueType" then
                local v33 = {};

                for i, v in p3 do
                    v33[i] = v;
                end;

                v33.queueType = u4.queueType;

                return v33;
            end;

            if type == "GameSetSpectator" then
                local v34 = {};

                for i, v in p3 do
                    v34[i] = v;
                end;

                v34.spectating = u4.spectating;
                v34.spectatingPlayer = u4.spectatingPlayer;

                return v34;
            end;

            if type == "GameSetStartTime" then
                local v35 = {};

                for i, v in p3 do
                    v35[i] = v;
                end;

                v35.startTime = u4.startTime;

                return v35;
            end;

            if type == "SetCustomMatchData" then
                local v36 = {};

                for i, v in p3 do
                    v36[i] = v;
                end;

                v36.customMatch = {
                    joinCode = u4.customMatch.joinCode,
                    hostUserId = u4.customMatch.hostUserId
                };

                return v36;
            end;

            if type == "SetSpectatedTurret" then
                local v37 = {};

                for i, v in p3 do
                    v37[i] = v;
                end;

                v37.selectedTurret = u4.selectedTurret;

                return v37;
            end;

            if type == "SetCustomMatchData" then
                local v38 = {};

                for i, v in p3 do
                    v38[i] = v;
                end;

                v38.customMatch = {
                    joinCode = u4.customMatch.joinCode,
                    hostUserId = u4.customMatch.hostUserId
                };

                return v38;
            end;

            if type == "GameSetSprayModeEnabled" then
                local v39 = {};

                for i, v in p3 do
                    v39[i] = v;
                end;

                v39.sprayModeEnabled = u4.sprayModeEnabled;

                return v39;
            end;

            if type == "GameSetTeamScores" then
                local v40 = {};

                for i, v in p3 do
                    v40[i] = v;
                end;

                local v41 = {};
                local teamScores = u4.teamScores;
                table.move(teamScores, 1, #teamScores, #v41 + 1, v41);
                v40.teamScores = v41;

                return v40;
            end;

            if type == "GameAddTeamScore" then
                local v42 = {};

                for i, v in p3 do
                    v42[i] = v;
                end;

                local v43 = {};
                local v44 = #v43;
                local teamScores = p3.teamScores;
                local v45 = #teamScores;
                table.move(teamScores, 1, v45, v44 + 1, v43);
                v43[v44 + v45 + 1] = {
                    teamId = u4.teamId,
                    score = u4.score
                };
                v42.teamScores = v43;

                return v42;
            end;

            if type == "GameUpdateTeamScore" then
                local v46 = {};

                for i, v in p3 do
                    v46[i] = v;
                end;

                local teamScores = p3.teamScores;

                local function _(p47) -- Line: 327
                    -- upvalues: u4 (copy)
                    if p47.teamId ~= u4.teamId then
                        return p47;
                    end;

                    local v48 = {};

                    for i, v in p47 do
                        v48[i] = v;
                    end;

                    v48.score = u4.score;

                    return v48;
                end;

                local v49 = table.create(#teamScores);

                for i, v in teamScores do
                    local _ = i - 1;

                    if v.teamId == u4.teamId then
                        local v = {};

                        for i2, v2 in v do
                            v[i2] = v2;
                        end;

                        v.score = u4.score;
                    end;

                    v49[i] = v;
                end;

                v46.teamScores = v49;

                return v46;
            end;

            if type == "SetServerRegion" then
                local v50 = {};

                for i, v in p3 do
                    v50[i] = v;
                end;

                v50.serverRegion = u4.serverRegion;

                return v50;
            end;

            if type == "GameAddMatchEvent" then
                p3.matchEvents[u4.matchEvent.id] = u4.matchEvent;
                local v51 = {};

                for i, v in p3 do
                    v51[i] = v;
                end;

                return v51;
            end;

            if type == "GameRemoveMatchEvent" then
                p3.matchEvents[u4.matchEventId] = nil;
                local v52 = {};

                for i, v in p3 do
                    v52[i] = v;
                end;

                return v52;
            end;

            if type == "GameRegisterScriptSyntaxError" then
                local v53 = p3.scripts[u4.scriptId];

                if not v53 then
                    return p3;
                end;

                v53.knownSyntaxError = u4.syntaxError;
                local v54 = {};

                for i, v in p3 do
                    v54[i] = v;
                end;

                v54.scriptUpdateId = p3.scriptUpdateId + 1;

                return v54;
            end;

            if type == "GameUpdateScript" then
                for _, v in u4.scriptUpdates do
                    local v55 = p3.scripts[v.scriptId];

                    if v55 then
                        local scriptName = v.scriptName;

                        if scriptName ~= "" and scriptName then
                            v55.scriptName = v.scriptName;
                        end;

                        if u4.updateFromServer then
                            v55.editInProgress = false;
                        end;

                        if u4.updateFromServer or v.knownSyntaxError ~= nil then
                            v55.knownSyntaxError = v.knownSyntaxError;
                        end;

                        local scriptContents = v.scriptContents;

                        if scriptContents ~= "" and scriptContents then
                            local v56 = not u4.updateFromServer;

                            if not v56 then
                                local v57 = Players;

                                if v57 ~= nil then
                                    v57 = v57.LocalPlayer;

                                    if v57 ~= nil then
                                        v57 = v57.UserId;
                                    end;
                                end;

                                v56 = v.editedByUserId ~= v57;
                            end;

                            if v56 then
                                p3.scriptContents[v.scriptId] = v.scriptContents;
                            elseif v.scriptContents ~= p3.scriptContents[v.scriptId] then
                                v55.editInProgress = true;
                            end;
                        end;
                    elseif v.scriptName ~= nil and v.scriptContents ~= nil then
                        p3.scripts[v.scriptId] = {
                            loaded = false,
                            editInProgress = false,
                            scriptId = v.scriptId,
                            scriptName = v.scriptName,
                            knownSyntaxError = v.knownSyntaxError
                        };
                        p3.scriptContents[v.scriptId] = v.scriptContents;
                    end;
                end;

                local v58 = {};

                for i, v in p3 do
                    v58[i] = v;
                end;

                v58.scriptUpdateId = p3.scriptUpdateId + 1;

                return v58;
            end;

            if type == "GameDeleteScript" then
                p3.scripts[u4.scriptId] = nil;
                p3.scriptContents[u4.scriptId] = nil;
                local v59 = {};

                for i, v in p3 do
                    v59[i] = v;
                end;

                v59.scriptUpdateId = p3.scriptUpdateId + 1;

                return v59;
            end;

            if type == "GameRegisterNewConsoleLines" then
                for _, v in u4.newLines do
                    if #p3.consoleText < ScriptEditorUtil.MAX_VISIBLE_CONSOLE_LINES then
                        table.insert(p3.consoleText, v);
                    else
                        p3.consoleText[p3.consoleFrontIndex + 1] = v;
                        p3.consoleFrontIndex = (p3.consoleFrontIndex + 1) % ScriptEditorUtil.MAX_VISIBLE_CONSOLE_LINES;
                    end;
                end;

                local v60 = {};

                for i, v in p3 do
                    v60[i] = v;
                end;

                v60.scriptUpdateId = p3.scriptUpdateId + 1;

                return v60;
            end;

            if type == "GameSetScriptSyncOpen" then
                local v61 = {};

                for i, v in p3 do
                    v61[i] = v;
                end;

                v61.syncOpen = u4.open;
                local v62;

                if u4.open then
                    v62 = false;
                else
                    v62 = p3.infoOpen;
                end;

                v61.infoOpen = v62;
                local v63;

                if u4.open then
                    v63 = false;
                else
                    v63 = p3.consoleOpen;
                end;

                v61.consoleOpen = v63;

                return v61;
            end;

            if type == "GameSetConsoleOpen" then
                local v64 = {};

                for i, v in p3 do
                    v64[i] = v;
                end;

                v64.consoleOpen = u4.open;
                local v65;

                if u4.open then
                    v65 = false;
                else
                    v65 = p3.syncOpen;
                end;

                v64.syncOpen = v65;
                local v66;

                if u4.open then
                    v66 = false;
                else
                    v66 = p3.infoOpen;
                end;

                v64.infoOpen = v66;

                return v64;
            end;

            if type == "GameSetScriptInfoOpen" then
                local v67 = {};

                for i, v in p3 do
                    v67[i] = v;
                end;

                v67.infoOpen = u4.open;
                local v68;

                if u4.open then
                    v68 = false;
                else
                    v68 = p3.syncOpen;
                end;

                v67.syncOpen = v68;
                local v69;

                if u4.open then
                    v69 = false;
                else
                    v69 = p3.consoleOpen;
                end;

                v67.consoleOpen = v69;

                return v67;
            end;

            if type == "GameSetOpenScript" then
                local v70;

                if u4.scriptId == nil then
                    v70 = nil;
                else
                    v70 = p3.scripts[u4.scriptId];
                end;

                if v70 then
                    v70.loaded = true;
                end;

                local v71 = {};

                for i, v in p3 do
                    v71[i] = v;
                end;

                v71.consoleOpen = false;
                v71.infoOpen = false;
                v71.syncOpen = false;
                v71.openScript = u4.scriptId;
                v71.scriptUpdateId = p3.scriptUpdateId + 1;

                return v71;
            end;

            if type == "GameSetScriptsRunning" then
                local v72 = {};

                for i, v in p3 do
                    v72[i] = v;
                end;

                v72.scriptsRunning = u4.running;

                return v72;
            end;

            if type == "GameSetScriptEditInProgress" then
                local v73 = p3.scripts[u4.scriptId];

                if not v73 or v73.editInProgress == u4.editInProgress then
                    return p3;
                end;

                v73.editInProgress = u4.editInProgress;
                local v74 = {};

                for i, v in p3 do
                    v74[i] = v;
                end;

                v74.scriptUpdateId = p3.scriptUpdateId + 1;

                return v74;
            end;

            if type == "GameSetMyTeam" then
                local v75 = {};

                for i, v in p3 do
                    v75[i] = v;
                end;

                v75.myTeam = u4.myTeam;

                return v75;
            end;

            if type == "RegisterActiveGoose" then
                local v76 = {};

                for i, v in p3 do
                    v76[i] = v;
                end;

                v76.activeGoose = {
                    despawnTime = u4.despawnTime
                };

                return v76;
            end;

            if type == "SetGooseHolder" then
                local v77 = {};

                for i, v in p3 do
                    v77[i] = v;
                end;

                v77.gooseHolder = u4.gooseHolder;

                return v77;
            end;

            if type == "DeleteGooseHolder" then
                local v78 = {};

                for i, v in p3 do
                    v78[i] = v;
                end;

                v78.gooseHolder = nil;

                return v78;
            end;

            if type == "SetGooseOwnerTeam" then
                local v79 = {};

                for i, v in p3 do
                    v79[i] = v;
                end;

                v79.gooseOwnerTeam = u4.ownerTeam;

                return v79;
            end;

            if type == "DeleteGooseOwnerTeam" then
                local v80 = {};

                for i, v in p3 do
                    v80[i] = v;
                end;

                v80.gooseOwnerTeam = nil;

                return v80;
            end;

            if type == "GameSetPlayerEggCount" then
                p3.eggCountMap = u1.deepCopy(p3.eggCountMap);
                p3.eggCountMap[u4.userID] = u4.count;
                local v81 = {};

                for i, v in p3 do
                    v81[i] = v;
                end;

                return v81;
            end;

            if type == "AddDragonEggTeamScores" then
                local v82 = {};

                for i, v in p3 do
                    v82[i] = v;
                end;

                local v83 = {};
                local v84 = #v83;
                local dragonEggTeamScores = p3.dragonEggTeamScores;
                local v85 = #dragonEggTeamScores;
                table.move(dragonEggTeamScores, 1, v85, v84 + 1, v83);
                v83[v84 + v85 + 1] = {
                    teamId = u4.teamId,
                    score = u4.score
                };
                v82.dragonEggTeamScores = v83;

                return v82;
            end;

            if type == "SetDragonEggTeamScores" then
                local v86 = {};

                for i, v in p3 do
                    v86[i] = v;
                end;

                local dragonEggTeamScores = p3.dragonEggTeamScores;

                local function _(p87) -- Line: 663
                    -- upvalues: u4 (copy)
                    if p87.teamId ~= u4.teamId then
                        return p87;
                    end;

                    local v88 = {};

                    for i, v in p87 do
                        v88[i] = v;
                    end;

                    v88.score = u4.score;

                    return v88;
                end;

                local v89 = table.create(#dragonEggTeamScores);

                for i, v in dragonEggTeamScores do
                    local _ = i - 1;

                    if v.teamId == u4.teamId then
                        local v = {};

                        for i2, v2 in v do
                            v[i2] = v2;
                        end;

                        v.score = u4.score;
                    end;

                    v89[i] = v;
                end;

                v86.dragonEggTeamScores = v89;

                return v86;
            end;

            if type == "AddPvPArenaTeamHealth" then
                local v90 = {};

                for i, v in p3 do
                    v90[i] = v;
                end;

                local v91 = {};
                local v92 = #v91;
                local pvpArenaTeamHealth = p3.pvpArenaTeamHealth;
                local v93 = #pvpArenaTeamHealth;
                table.move(pvpArenaTeamHealth, 1, v93, v92 + 1, v91);
                v91[v92 + v93 + 1] = {
                    team = u4.team,
                    health = u4.health
                };
                v90.pvpArenaTeamHealth = v91;

                return v90;
            end;

            if type == "SetPvPArenaTeamHealth" then
                local v94 = {};

                for i, v in p3 do
                    v94[i] = v;
                end;

                local pvpArenaTeamHealth = p3.pvpArenaTeamHealth;

                local function _(p95) -- Line: 709
                    -- upvalues: u4 (copy)
                    if p95.team.id ~= u4.team.id then
                        return p95;
                    end;

                    local v96 = {};

                    for i, v in p95 do
                        v96[i] = v;
                    end;

                    v96.health = u4.health;

                    return v96;
                end;

                local v97 = table.create(#pvpArenaTeamHealth);

                for i, v in pvpArenaTeamHealth do
                    local _ = i - 1;

                    if v.team.id == u4.team.id then
                        local v = {};

                        for i2, v2 in v do
                            v[i2] = v2;
                        end;

                        v.health = u4.health;
                    end;

                    v97[i] = v;
                end;

                v94.pvpArenaTeamHealth = v97;

                return v94;
            end;

            if type == "SetMatchEndSummaryVisible" then
                local v98 = {};

                for i, v in p3 do
                    v98[i] = v;
                end;

                v98.matchEndSummaryVisible = u4.visible;

                return v98;
            end;

            if type ~= "GameAddHonoredPlayer" then
                if type ~= "WaterGunSetMode" then
                    return p3;
                end;

                local v99 = {};

                for i, v in p3 do
                    v99[i] = v;
                end;

                v99.waterGunMode = u4.waterGunMode;

                return v99;
            end;

            local v100 = {};

            for i, v in p3 do
                v100[i] = v;
            end;

            local v101 = {};
            local v102 = #v101;
            local honoredPlayers = p3.honoredPlayers;
            local v103 = #honoredPlayers;
            table.move(honoredPlayers, 1, v103, v102 + 1, v101);
            v101[v102 + v103 + 1] = u4.userId;
            v100.honoredPlayers = v101;

            return v100;
        end;

        local LocalPlayer = Players.LocalPlayer;

        if LocalPlayer ~= nil then
            LocalPlayer = LocalPlayer:GetAttribute("Team");
        end;

        local function _(p104) -- Line: 78
            -- upvalues: LocalPlayer (copy)
            return p104.id == LocalPlayer;
        end;

        local v105 = nil;

        for i, v in u4.teams do
            local _ = i - 1;

            if v.id == LocalPlayer == true then
                v105 = v;
                break;
            end;
        end;

        local v106 = {};

        for i, v in p3 do
            v106[i] = v;
        end;

        v106.teams = u4.teams;
        v106.myTeam = v105;

        return v106;
    end
};
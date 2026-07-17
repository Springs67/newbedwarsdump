-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local SkullDropScoreCard = RuntimeLib.import(script, script.Parent, "skull-drop-score-card").SkullDropScoreCard;
local v37 = v3.new(u2)(function(u5, p6) -- Line: 16
    -- upvalues: u2 (copy), ClientSyncEvents (copy), MatchState (copy), Players (copy), GamePlayerUtil (copy), SkullDropScoreCard (copy), DeviceUtil (copy), ColorUtil (copy), Empty (copy)
    local _ = p6.useState;
    local useEffect = p6.useEffect;

    local function _(p7) -- Line: 20
        -- upvalues: u5 (copy)
        local localTeam = u5.localTeam;

        if localTeam ~= nil then
            localTeam = localTeam.id;
        end;

        return p7.teamId == localTeam;
    end;

    local v8 = nil;

    for i, v in u5.teamScores do
        local _ = i - 1;
        local localTeam = u5.localTeam;

        if localTeam ~= nil then
            localTeam = localTeam.id;
        end;

        if v.teamId == localTeam == true then
            v8 = v;
            break;
        end;
    end;

    if v8 ~= nil then
        v8 = v8.score;
    end;

    local function _(p9) -- Line: 43
        -- upvalues: u5 (copy)
        local localTeam = u5.localTeam;

        if localTeam ~= nil then
            localTeam = localTeam.id;
        end;

        return p9.teamId == localTeam;
    end;

    local v10 = -1;

    for i, v in u5.teamScores do
        local _ = i - 1;
        local localTeam = u5.localTeam;

        if localTeam ~= nil then
            localTeam = localTeam.id;
        end;

        if v.teamId == localTeam == true then
            v10 = i - 1;
            break;
        end;
    end;

    local v11 = v10 + 1;
    local u12 = u2.createRef();
    useEffect(function() -- Line: 62
        -- upvalues: ClientSyncEvents (ref), MatchState (ref), u12 (copy)
        ClientSyncEvents.MatchStateChange:connect(function(p13) -- Line: 63
            -- upvalues: MatchState (ref), u12 (ref)
            if p13.matchState ~= MatchState.POST then
                return nil;
            end;

            local v14 = u12:getValue();

            if v14 then
                v14.Position = UDim2.fromScale(0.5, 0.05);
            end;
        end);
    end, {});
    local teamScores = u5.teamScores;

    local function v26(p15, p16) -- Line: 74
        -- upvalues: u5 (copy), Players (ref), GamePlayerUtil (ref), u2 (ref), SkullDropScoreCard (ref)
        local teamId = p15.teamId;
        local score = p15.score;

        if p16 + 1 > 3 then
            return nil;
        end;

        local function _(p17) -- Line: 81
            -- upvalues: teamId (copy)
            return p17.id == tostring(teamId);
        end;

        local v18 = nil;

        for i, v in u5.teams do
            local _ = i - 1;

            if v.id == tostring(teamId) == true then
                v18 = v;
                break;
            end;
        end;

        if not v18 then
            return nil;
        end;

        local localTeam = u5.localTeam;

        if localTeam ~= nil then
            localTeam = localTeam.id;
        end;

        local v19 = localTeam == tostring(teamId);
        local name = v18.name;
        local v20 = 0;
        local v21 = nil;

        for _ in v18.members do
            v20 = v20 + 1;
        end;

        if v20 == 1 then
            local v22 = {};
            local v23 = #v22;

            for i, v in v18.members do
                v23 = v23 + 1;
                v22[v23] = { i, v };
            end;

            local v24 = v22[1];
            local v25 = v24[2];
            v21 = Players:GetPlayerByUserId(v24[1]);

            if v21 then
                name = GamePlayerUtil.getGamePlayer(v21):getDisplayName();
            else
                name = v25.displayName;
            end;
        end;

        return u2.createElement(SkullDropScoreCard, {
            Name = name,
            TeamColor = v18.color,
            Score = score,
            Placement = p16 + 1,
            MainPlayer = v21,
            IsLocalTeam = v19
        });
    end;

    local v27 = 0;
    local v28 = {};

    for i, v in teamScores do
        local v29 = v26(v, i - 1, teamScores);

        if v29 ~= nil then
            v27 = v27 + 1;
            v28[v27] = v29;
        end;
    end;

    local v30 = {
        Size = u5.Size or UDim2.fromScale(1, 0.79),
        AutomaticSize = "Y",
        LayoutOrder = 1,
        [u2.Ref] = u12
    };
    local v31 = { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            VerticalAlignment = "Center",
            HorizontalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 10)
        }) };
    local v32 = #v31;

    for i, v in v28 do
        v31[v32 + i] = v;
    end;

    local v33 = #v31;
    local v34 = v11 > 3;

    if v34 then
        local v35 = {
            Name = DeviceUtil.isHoarceKat() and "Me" or GamePlayerUtil.getGamePlayer(Players.LocalPlayer):getDisplayName()
        };
        local localTeam = u5.localTeam;

        if localTeam ~= nil then
            localTeam = localTeam.color;
        end;

        if localTeam == nil then
            localTeam = ColorUtil.WHITE;
        end;

        v35.TeamColor = localTeam;
        v35.Score = v8 == nil and 0 or v8;
        v35.Placement = v11;
        local v36;

        if DeviceUtil.isHoarceKat() then
            v36 = nil;
        else
            v36 = Players.LocalPlayer;
        end;

        v35.MainPlayer = v36;
        v35.IsLocalTeam = true;
        v34 = u2.createElement(SkullDropScoreCard, v35);
    end;

    if v34 then
        v31[v33 + 1] = v34;
    end;

    return u2.createFragment({
        SkullDropScores = u2.createElement(Empty, v30, v31)
    });
end);

return {
    SkullDropScores = v4.connect(function(p38, p39) -- Line: 197
        local v40 = {};

        for i, v in p39 do
            v40[i] = v;
        end;

        local teamScores = p38.Game.teamScores;
        table.sort(teamScores, function(p41, p42) -- Line: 204
            return p41.teamId < p42.teamId;
        end);
        table.sort(teamScores, function(p43, p44) -- Line: 208
            if not p43 then
                return false;
            end;

            if not p44 then
                return true;
            end;

            local score = p43.score;
            local score2 = p44.score;

            return (score2 == nil and 0 or score2) < (score == nil and 0 or score);
        end);
        v40.teamScores = teamScores;
        v40.teams = p38.Game.teams;
        v40.localTeam = p38.Game.myTeam;

        return v40;
    end)(v37)
};
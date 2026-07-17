-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "TeamController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 27
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "TeamController";
    p5.teamNames = {};
    p5.teamDropdown = {
        map = {}
    };
end;

function u3.KnitStart(u6) -- Line: 39
    -- upvalues: PlaceUtil (copy), KnitClient (copy), default2 (copy), default (copy), ClientStore (copy), u2 (copy), RuntimeLib (copy)
    if PlaceUtil.isLobbyServer() then
        return nil;
    end;

    KnitClient.Controllers.ConnectController:waitForConnected();
    default2.Client:Get("TeamsUpdateEvent"):Connect(function(p7) -- Line: 44
        -- upvalues: default (ref), ClientStore (ref), u2 (ref)
        default.Info("Teams update event");
        ClientStore:dispatch({
            type = "GameSetTeams",
            teams = u2.values(p7.teams)
        });
    end);
    default2.Client:Get("TeamAddMemberEvent"):Connect(function(p8, p9) -- Line: 51
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "GameAddTeamMember",
            teamId = p8,
            player = p9
        });
    end);
    default2.Client:Get("TeamRemoveMemberEvent"):Connect(function(p10, p11) -- Line: 58
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "GameRemoveTeamMember",
            teamId = p10,
            player = p11
        });
    end);
    RuntimeLib.Promise.all({ KnitClient.Controllers.TablistController.waitForScoreboardSnapshot(), KnitClient.Controllers.MatchController:getQueueTypeAsync() }):andThen(function(p12) -- Line: 66
        -- upvalues: u6 (copy)
        u6:setupTeamsData(p12[2], p12[1]);
    end);
end;

function u3.getTeams(p13) -- Line: 73
    -- upvalues: ClientStore (copy)
    return ClientStore:getState().Game.teams;
end;

function u3.getTeam(p14, u15) -- Line: 76
    -- upvalues: ClientStore (copy)
    local function _(p16) -- Line: 78
        -- upvalues: u15 (copy)
        return p16.id == u15;
    end;

    for i, v in ClientStore:getState().Game.teams do
        local _ = i - 1;

        if v.id == u15 == true then
            return v;
        end;
    end;

    return nil;
end;

function u3.getPlayerTeam(p17, p18) -- Line: 92
    -- upvalues: GamePlayerUtil (copy)
    local v19 = GamePlayerUtil.getGamePlayer(p18):getTeamId();

    if v19 ~= "" and v19 then
        return p17:getTeam(v19);
    end;
end;

function u3.getTeamById(p20, u21) -- Line: 98
    -- upvalues: ClientStore (copy)
    local function _(p22) -- Line: 100
        -- upvalues: u21 (copy)
        return p22.id == u21;
    end;

    for i, v in ClientStore:getState().Game.teams do
        local _ = i - 1;

        if v.id == u21 == true then
            return v;
        end;
    end;

    return nil;
end;

function u3.getTeamNames(p23, p24) -- Line: 114
    -- upvalues: ClientStore (copy)
    if #p23.teamNames ~= 0 then
        return p23.teamNames;
    end;

    local teams = ClientStore:getState().Game.teams;

    local function _(p25) -- Line: 119
        return p25.name;
    end;

    local v26 = table.create(#teams);

    for i, v in teams do
        local _ = i - 1;
        v26[i] = v.name;
    end;

    table.sort(v26);
    p23.teamNames = v26;

    if p24 then
        table.insert(p23.teamNames, 1, "Spectator");
    end;

    return p23.teamNames;
end;

function u3.getTeamDropdown(p27, p28) -- Line: 137
    -- upvalues: ClientStore (copy), ColorUtil (copy), u2 (copy)
    if p27.teamDropdown.dropDownItems then
        return p27.teamDropdown;
    end;

    local teams = ClientStore:getState().Game.teams;

    local function _(p29, p30) -- Line: 142
        -- upvalues: ColorUtil (ref)
        p29[p30.name] = {
            text = "<font color=\"" .. (ColorUtil.richTextColor(p30.color) .. "\">") .. p30.name .. "</font>",
            value = p30.id
        };

        return p29;
    end;

    local v31 = {};

    for i = 1, #teams do
        local v32 = teams[i];
        local _ = i - 1;
        v31[v32.name] = {
            text = "<font color=\"" .. (ColorUtil.richTextColor(v32.color) .. "\">") .. v32.name .. "</font>",
            value = v32.id
        };
    end;

    p27.teamDropdown.map = v31;
    local v33 = {};
    local v34 = #v33;

    for i, v in p27.teamDropdown.map do
        v34 = v34 + 1;
        v33[v34] = { i, v };
    end;

    local v35 = u2.values(v33);

    local function _(p36) -- Line: 169
        return p36[2];
    end;

    local v37 = table.create(#v35);

    for i, v in v35 do
        local _ = i - 1;
        v37[i] = v[2];
    end;

    table.sort(v37, function(p38, p39) -- Line: 178
        return p38.value < p39.value;
    end);
    p27.teamDropdown.dropDownItems = v37;

    if p28 then
        p27.teamDropdown.map.Spectator = {
            text = "Spectator",
            value = "Spectator"
        };
        table.insert(p27.teamDropdown.dropDownItems, 1, {
            text = "Spectator",
            value = "Spectator"
        });
    end;

    return p27.teamDropdown;
end;

function u3.setupTeamsData(p40, p41, p42) -- Line: 196
    -- upvalues: ClientStore (copy), getQueueMeta (copy), ColorUtil (copy), Players (copy), GamePlayerUtil (copy), OfflinePlayerUtil (copy), u2 (copy)
    if #ClientStore:getState().Game.teams ~= 0 then
        return nil;
    end;

    local v43 = getQueueMeta(p41);

    if not v43 then
        return nil;
    end;

    local u44 = {};
    local teams = v43.teams;

    local function v47(p45) -- Line: 208
        -- upvalues: ColorUtil (ref), u44 (copy)
        local v46 = {
            id = p45.id,
            name = p45.displayName,
            members = {},
            color = ColorUtil.hexColor(p45.colorHex)
        };
        u44[p45.id] = v46;
    end;

    for i, v in teams do
        v47(v, i - 1, teams);
    end;

    local v48 = Players:GetPlayers();

    local function v54(p49) -- Line: 223
        -- upvalues: GamePlayerUtil (ref), u44 (copy), OfflinePlayerUtil (ref)
        local v50 = GamePlayerUtil.getGamePlayer(p49);
        local v51 = v50:getTeamId();
        local v52;

        if v51 == "" or not v51 then
            v52 = v51;
        else
            v52 = v50:isInGame();
        end;

        if v52 ~= "" and v52 then
            local v53 = u44[v51];

            if v53 ~= nil then
                v53.members[p49.UserId] = OfflinePlayerUtil.getOfflinePlayer(p49);
            end;
        end;
    end;

    for i, v in v48 do
        v54(v, i - 1, v48);
    end;

    local v55 = u2.entries(p42.players);

    local function v62(p56) -- Line: 246
        -- upvalues: Players (ref), OfflinePlayerUtil (ref), u44 (copy)
        local v57 = p56[1];
        local v58 = p56[2];
        local teamId = v58.teamId;

        if teamId ~= "" and teamId then
            local v59 = Players:GetPlayerByUserId(v57);
            local offlinePlayerDisplay = v58.offlinePlayerDisplay;

            if offlinePlayerDisplay then
                v59 = offlinePlayerDisplay;
            elseif v59 then
                v59 = OfflinePlayerUtil.getOfflinePlayer(v59);
            end;

            if not v59 then
                return nil;
            end;

            local v60 = u44[v58.teamId];
            local v61;

            if v60 == nil then
                v61 = v60;
            else
                v61 = v60.members[v57];
            end;

            if not v61 and v60 ~= nil then
                v60.members[v57] = v59;
            end;
        end;
    end;

    for i, v in v55 do
        v62(v, i - 1, v55);
    end;

    ClientStore:dispatch({
        type = "GameSetTeams",
        teams = u2.values(u44)
    });
end;

return {
    TeamController = KnitClient.CreateController(u3.new())
};
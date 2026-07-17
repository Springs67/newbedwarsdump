-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local LoggerProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "TournamentTeamController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 22
    -- upvalues: KnitController (copy), default (copy), LoggerProvider (copy)
    KnitController.constructor(p3);
    p3.Name = "TournamentTeamController";
    p3.tournamentRemoteNamespace = default.Client:GetNamespace("Tournament");
    p3.logger = LoggerProvider.getLogger("TournamentTeamController");
end;

function u1.KnitStart(u4) -- Line: 28
    -- upvalues: KnitController (copy), ClientStore (copy)
    KnitController.KnitStart(u4);
    u4.tournamentRemoteNamespace:Get("UpdatedTournamentTeam"):Connect(function(p5) -- Line: 30
        -- upvalues: u4 (copy)
        u4:updatedTournamentTeam(p5);
    end);
    u4.tournamentRemoteNamespace:Get("SendTournamentTeamInvitations"):Connect(function(p6) -- Line: 33
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "UpdateTeamInvitations",
            invitations = p6.invites
        });
    end);
    u4.tournamentRemoteNamespace:Get("ClearTournamentTeamData"):Connect(function() -- Line: 39
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "ClearTournamentTeam"
        });
    end);
end;

function u1.updatedTournamentTeam(p7, p8) -- Line: 45
    -- upvalues: ClientStore (copy)
    ClientStore:dispatch({
        type = "UpdateTournamentTeam",
        myTeamId = p8.teamId,
        myTeamName = p8.teamName,
        myTeamIcon = p8.teamIcon,
        myTeamLeader = p8.leader,
        myTeamMembers = p8.members,
        myTeamRegion = p8.region,
        myTeamDivision = p8.division,
        myTeamInvites = p8.invitations,
        leaderPartyMembers = p8.leaderPartyMembers
    });
end;

u1.createTournamentTeam = RuntimeLib.async(function(p9) -- Line: 69
    -- upvalues: RuntimeLib (copy)
    local v10 = RuntimeLib.await(p9.tournamentRemoteNamespace:Get("CreateTournamentTeam"):CallServerAsync());
    p9.logger:Info("Create Tournament Team Result: {result}", v10);

    return v10;
end);
u1.updateTournamentTeamName = RuntimeLib.async(function(p11, p12, p13) -- Line: 74
    -- upvalues: RuntimeLib (copy)
    return RuntimeLib.await(p11.tournamentRemoteNamespace:Get("UpdateTournamentTeamName"):CallServerAsync(p12, p13));
end);
u1.updateTournamentTeamIcon = RuntimeLib.async(function(p14, p15) -- Line: 77
    -- upvalues: RuntimeLib (copy)
    return RuntimeLib.await(p14.tournamentRemoteNamespace:Get("UpdateTournamentTeamIcon"):CallServerAsync(p15));
end);
u1.acceptTournamentTeamInvitation = RuntimeLib.async(function(p16, p17) -- Line: 80
    -- upvalues: RuntimeLib (copy)
    return RuntimeLib.await(p16.tournamentRemoteNamespace:Get("AcceptTournamentTeamInvitation"):CallServerAsync(p17));
end);
u1.declineTournamentTeamInvitation = RuntimeLib.async(function(p18, p19) -- Line: 83
    -- upvalues: RuntimeLib (copy)
    return RuntimeLib.await(p18.tournamentRemoteNamespace:Get("DeclineTournamentTeamInvitation"):CallServerAsync(p19));
end);
u1.leaveTournamentTeam = RuntimeLib.async(function(p20, p21) -- Line: 86
    -- upvalues: RuntimeLib (copy)
    return RuntimeLib.await(p20.tournamentRemoteNamespace:Get("LeaveTournamentTeam"):CallServerAsync(p21));
end);
u1.requestTournamentTeamData = RuntimeLib.async(function(p22, p23) -- Line: 89
    -- upvalues: RuntimeLib (copy)
    return RuntimeLib.await(p22.tournamentRemoteNamespace:Get("RequestTournamentTeamData"):CallServerAsync(p23));
end);
u1.requestSendTournamentTeamInvitation = RuntimeLib.async(function(p24, p25, p26) -- Line: 92
    -- upvalues: RuntimeLib (copy)
    return RuntimeLib.await(p24.tournamentRemoteNamespace:Get("RequestSendTournamentTeamInvitation"):CallServerAsync(p25, p26));
end);
u1.requestRevokeTournamentTeamInvitation = RuntimeLib.async(function(p27, p28, p29) -- Line: 95
    -- upvalues: RuntimeLib (copy)
    return RuntimeLib.await(p27.tournamentRemoteNamespace:Get("RequestRevokeTournamentTeamInvitation"):CallServerAsync(p28, p29));
end);
u1.requestKickTournamentTeamMember = RuntimeLib.async(function(p30, p31, p32) -- Line: 98
    -- upvalues: RuntimeLib (copy)
    return RuntimeLib.await(p30.tournamentRemoteNamespace:Get("RequestKickTournamentTeamMember"):CallServerAsync(p31, p32));
end);
u1.requestDisbandTournamentTeam = RuntimeLib.async(function(p33, p34) -- Line: 101
    -- upvalues: RuntimeLib (copy), ClientStore (copy)
    if RuntimeLib.await(p33.tournamentRemoteNamespace:Get("RequestDisbandTournamentTeam"):CallServerAsync(p34)) then
        ClientStore:dispatch({
            type = "ClearTournamentTeam"
        });
    end;
end);
u1.fetchRecommendedPlayersToInvite = RuntimeLib.async(function(p35) -- Line: 109
    -- upvalues: RuntimeLib (copy)
    return RuntimeLib.await(p35.tournamentRemoteNamespace:Get("FetchRecommendedPlayersToInvite"):CallServerAsync());
end);
KnitClient.CreateController(u1.new());

return nil;
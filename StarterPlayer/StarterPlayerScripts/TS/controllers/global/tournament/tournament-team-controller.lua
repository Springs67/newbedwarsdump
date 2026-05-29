local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "TournamentTeamController"
    end,
    ["__index"] = u3
})
u7.__index = u7
function u7.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u5
    --]]
    u3.constructor(p10)
    p10.Name = "TournamentTeamController"
    p10.tournamentRemoteNamespace = u6.Client:GetNamespace("Tournament")
    p10.logger = u5.getLogger("TournamentTeamController")
end
function u7.KnitStart(u11) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    u3.KnitStart(u11)
    u11.tournamentRemoteNamespace:Get("UpdatedTournamentTeam"):Connect(function(p12) --[[ Line: 30 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        u11:updatedTournamentTeam(p12)
    end)
    u11.tournamentRemoteNamespace:Get("SendTournamentTeamInvitations"):Connect(function(p13) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        u4:dispatch({
            ["type"] = "UpdateTeamInvitations",
            ["invitations"] = p13.invites
        })
    end)
    u11.tournamentRemoteNamespace:Get("ClearTournamentTeamData"):Connect(function() --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        u4:dispatch({
            ["type"] = "ClearTournamentTeam"
        })
    end)
end
function u7.updatedTournamentTeam(_, p14) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4:dispatch({
        ["type"] = "UpdateTournamentTeam",
        ["myTeamId"] = p14.teamId,
        ["myTeamName"] = p14.teamName,
        ["myTeamIcon"] = p14.teamIcon,
        ["myTeamLeader"] = p14.leader,
        ["myTeamMembers"] = p14.members,
        ["myTeamRegion"] = p14.region,
        ["myTeamDivision"] = p14.division,
        ["myTeamInvites"] = p14.invitations,
        ["leaderPartyMembers"] = p14.leaderPartyMembers
    })
end
u7.createTournamentTeam = u1.async(function(p15) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v16 = u1.await(p15.tournamentRemoteNamespace:Get("CreateTournamentTeam"):CallServerAsync())
    p15.logger:Info("Create Tournament Team Result: {result}", v16)
    return v16
end)
u7.updateTournamentTeamName = u1.async(function(p17, p18, p19) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.await(p17.tournamentRemoteNamespace:Get("UpdateTournamentTeamName"):CallServerAsync(p18, p19))
end)
u7.updateTournamentTeamIcon = u1.async(function(p20, p21) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.await(p20.tournamentRemoteNamespace:Get("UpdateTournamentTeamIcon"):CallServerAsync(p21))
end)
u7.acceptTournamentTeamInvitation = u1.async(function(p22, p23) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.await(p22.tournamentRemoteNamespace:Get("AcceptTournamentTeamInvitation"):CallServerAsync(p23))
end)
u7.declineTournamentTeamInvitation = u1.async(function(p24, p25) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.await(p24.tournamentRemoteNamespace:Get("DeclineTournamentTeamInvitation"):CallServerAsync(p25))
end)
u7.leaveTournamentTeam = u1.async(function(p26, p27) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.await(p26.tournamentRemoteNamespace:Get("LeaveTournamentTeam"):CallServerAsync(p27))
end)
u7.requestTournamentTeamData = u1.async(function(p28, p29) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.await(p28.tournamentRemoteNamespace:Get("RequestTournamentTeamData"):CallServerAsync(p29))
end)
u7.requestSendTournamentTeamInvitation = u1.async(function(p30, p31, p32) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.await(p30.tournamentRemoteNamespace:Get("RequestSendTournamentTeamInvitation"):CallServerAsync(p31, p32))
end)
u7.requestRevokeTournamentTeamInvitation = u1.async(function(p33, p34, p35) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.await(p33.tournamentRemoteNamespace:Get("RequestRevokeTournamentTeamInvitation"):CallServerAsync(p34, p35))
end)
u7.requestKickTournamentTeamMember = u1.async(function(p36, p37, p38) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.await(p36.tournamentRemoteNamespace:Get("RequestKickTournamentTeamMember"):CallServerAsync(p37, p38))
end)
u7.requestDisbandTournamentTeam = u1.async(function(p39, p40) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u4
    --]]
    if u1.await(p39.tournamentRemoteNamespace:Get("RequestDisbandTournamentTeam"):CallServerAsync(p40)) then
        u4:dispatch({
            ["type"] = "ClearTournamentTeam"
        })
    end
end)
u7.fetchRecommendedPlayersToInvite = u1.async(function(p41) --[[ Line: 109 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.await(p41.tournamentRemoteNamespace:Get("FetchRecommendedPlayersToInvite"):CallServerAsync())
end)
v2.CreateController(u7.new())
return nil
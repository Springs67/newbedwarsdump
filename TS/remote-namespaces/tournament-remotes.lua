local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return {
    ["TournamentRemotes"] = v1.Definitions.Namespace({
        ["InviteTeamMemberToParty"] = v1.Definitions.ServerAsyncFunction(),
        ["CreateTournamentTeam"] = v1.Definitions.ServerAsyncFunction(),
        ["UpdateTournamentTeamName"] = v1.Definitions.ServerAsyncFunction(),
        ["UpdateTournamentTeamIcon"] = v1.Definitions.ServerAsyncFunction(),
        ["RequestSendTournamentTeamInvitation"] = v1.Definitions.ServerAsyncFunction(),
        ["RequestRevokeTournamentTeamInvitation"] = v1.Definitions.ServerAsyncFunction(),
        ["AcceptTournamentTeamInvitation"] = v1.Definitions.ServerAsyncFunction(),
        ["DeclineTournamentTeamInvitation"] = v1.Definitions.ServerAsyncFunction(),
        ["LeaveTournamentTeam"] = v1.Definitions.ServerAsyncFunction(),
        ["RequestKickTournamentTeamMember"] = v1.Definitions.ServerAsyncFunction(),
        ["RequestDisbandTournamentTeam"] = v1.Definitions.ServerAsyncFunction(),
        ["FetchRecommendedPlayersToInvite"] = v1.Definitions.ServerAsyncFunction(),
        ["ClearTournamentTeamData"] = v1.Definitions.ServerToClientEvent(),
        ["UpdatedTournamentTeam"] = v1.Definitions.ServerToClientEvent(),
        ["SendTournamentTeamInvitations"] = v1.Definitions.ServerToClientEvent(),
        ["RequestTournamentTeamData"] = v1.Definitions.ServerAsyncFunction()
    })
}
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = {
    ["incomingTournamentInvites"] = {},
    ["outboundTournamentInvites"] = {},
    ["myTeamMembers"] = {},
    ["leaderPartyMembers"] = {}
}
return {
    ["TournamentReducer"] = function(p5, p6) --[[ Name: TournamentReducer, Line 11 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u3
        --]]
        if p5 == nil then
            p5 = u4
        end
        local u7 = {}
        for v8, v9 in p5 do
            u7[v8] = v9
        end
        local function v10() --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            u7.myTeamId = nil
            u7.myTeamName = nil
            u7.myTeamIcon = nil
            u7.myTeamLeader = nil
            u7.myTeamMembers = {}
            u7.myTeamRegion = nil
            u7.myTeamDivision = nil
            u7.outboundTournamentInvites = {}
        end
        local v11 = p6.type
        if v11 == "UpdateTournamentTeam" then
            u7.myTeamId = p6.myTeamId
            local v12 = p6.myTeamName
            if v12 ~= "" and v12 then
                u7.myTeamName = p6.myTeamName
            end
            if p6.myTeamIcon then
                u7.myTeamIcon = p6.myTeamIcon
            end
            local v13 = p6.myTeamLeader
            if v13 ~= 0 and (v13 == v13 and v13) then
                u7.myTeamLeader = p6.myTeamLeader
            end
            if p6.myTeamMembers then
                u7.myTeamMembers = p6.myTeamMembers
            end
            if p6.myTeamRegion then
                u7.myTeamRegion = p6.myTeamRegion
            end
            if p6.myTeamDivision then
                u7.myTeamDivision = p6.myTeamDivision
            end
            if p6.myTeamInvites then
                u7.outboundTournamentInvites = p6.myTeamInvites
            end
            if p6.leaderPartyMembers then
                u7.leaderPartyMembers = p6.leaderPartyMembers
            end
        elseif v11 == "UpdateTeamInvitations" then
            u7.incomingTournamentInvites = p6.invitations
        elseif v11 == "ClearTournamentTeam" then
            v10()
        elseif v11 == "UpdateLeaderParty" then
            u7.leaderPartyMembers = p6.partyMembers
        end
        local v14 = u2.isHoarceKat() and 0 or u3.LocalPlayer.UserId
        local v15 = u7.myTeamLeader
        if v15 ~= 0 and (v15 == v15 and v15) then
            v15 = u7.myTeamLeader == v14
        end
        local v16 = u7.myTeamMembers
        if v16 then
            v16 = table.find(u7.myTeamMembers, v14) ~= nil
        end
        if (v15 == 0 or (v15 ~= v15 or not v15)) and not v16 then
            v10()
        end
        return u7
    end
}
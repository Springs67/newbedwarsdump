-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local u1 = {
    incomingTournamentInvites = {},
    outboundTournamentInvites = {},
    myTeamMembers = {},
    leaderPartyMembers = {}
};

return {
    TournamentReducer = function(p2, p3) -- Line: 11, Name: TournamentReducer
        -- upvalues: u1 (copy), DeviceUtil (copy), Players (copy)
        if p2 == nil then
            p2 = u1;
        end;

        local u4 = {};

        for i, v in p2 do
            u4[i] = v;
        end;

        local function v5() -- Line: 20
            -- upvalues: u4 (copy)
            u4.myTeamId = nil;
            u4.myTeamName = nil;
            u4.myTeamIcon = nil;
            u4.myTeamLeader = nil;
            u4.myTeamMembers = {};
            u4.myTeamRegion = nil;
            u4.myTeamDivision = nil;
            u4.outboundTournamentInvites = {};
        end;

        local type = p3.type;

        if type == "UpdateTournamentTeam" then
            u4.myTeamId = p3.myTeamId;
            local myTeamName = p3.myTeamName;

            if myTeamName ~= "" and myTeamName then
                u4.myTeamName = p3.myTeamName;
            end;

            if p3.myTeamIcon then
                u4.myTeamIcon = p3.myTeamIcon;
            end;

            local myTeamLeader = p3.myTeamLeader;

            if myTeamLeader ~= 0 and (myTeamLeader == myTeamLeader and myTeamLeader) then
                u4.myTeamLeader = p3.myTeamLeader;
            end;

            if p3.myTeamMembers then
                u4.myTeamMembers = p3.myTeamMembers;
            end;

            if p3.myTeamRegion then
                u4.myTeamRegion = p3.myTeamRegion;
            end;

            if p3.myTeamDivision then
                u4.myTeamDivision = p3.myTeamDivision;
            end;

            if p3.myTeamInvites then
                u4.outboundTournamentInvites = p3.myTeamInvites;
            end;

            if p3.leaderPartyMembers then
                u4.leaderPartyMembers = p3.leaderPartyMembers;
            end;
        elseif type == "UpdateTeamInvitations" then
            u4.incomingTournamentInvites = p3.invitations;
        elseif type == "ClearTournamentTeam" then
            v5();
        elseif type == "UpdateLeaderParty" then
            u4.leaderPartyMembers = p3.partyMembers;
        end;

        local v6 = DeviceUtil.isHoarceKat() and 0 or Players.LocalPlayer.UserId;
        local myTeamLeader = u4.myTeamLeader;

        if myTeamLeader ~= 0 and (myTeamLeader == myTeamLeader and myTeamLeader) then
            myTeamLeader = u4.myTeamLeader == v6;
        end;

        local v7 = u4.myTeamMembers and table.find(u4.myTeamMembers, v6) ~= nil;

        if (myTeamLeader == 0 or (myTeamLeader ~= myTeamLeader or not myTeamLeader)) and not v7 then
            v5();
        end;

        return u4;
    end
};
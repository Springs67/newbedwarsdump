-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local SlideIn = v1.SlideIn;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v6.Players;
local RunService = v6.RunService;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local TournamentDivision = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-types").TournamentDivision;
local TournamentAppBracketPage = RuntimeLib.import(script, script.Parent, "bracket-page", "tournament-app-bracket-page").TournamentAppBracketPage;
local TournamentAppIncomingInvitesPage = RuntimeLib.import(script, script.Parent, "incoming-invites-page", "tournament-app-incoming-invites-page").TournamentAppIncomingInvitesPage;
local TournamentAppInfoPage = RuntimeLib.import(script, script.Parent, "info-page", "tournament-app-info-page").TournamentAppInfoPage;
local TournamentAppOutboundInvitePage = RuntimeLib.import(script, script.Parent, "outbound-invites-page", "tournament-app-outbound-invites-page").TournamentAppOutboundInvitePage;
local TournamentAppTeamPage = RuntimeLib.import(script, script.Parent, "team-page", "tournament-app-team-page").TournamentAppTeamPage;
local TournamentCreateTeamPage = RuntimeLib.import(script, script.Parent, "team-page", "tournament-create-team-page").TournamentCreateTeamPage;
local TournamentAppHeader = RuntimeLib.import(script, script.Parent, "tournament-app-header").TournamentAppHeader;
local TournamentAppTab = RuntimeLib.import(script, script.Parent, "tournament-app-types").TournamentAppTab;
local v31 = v4.new(u3)(function(p7, p8) -- Line: 24
    -- upvalues: RunService (copy), TournamentAppTab (copy), DeviceUtil (copy), u3 (copy), DarkBackground (copy), TournamentAppHeader (copy), TournamentAppInfoPage (copy), TournamentAppTeamPage (copy), TournamentCreateTeamPage (copy), TournamentAppBracketPage (copy), TournamentAppIncomingInvitesPage (copy), EmoteType (copy), TournamentDivision (copy), u2 (copy), TournamentAppOutboundInvitePage (copy), SlideIn (copy)
    local useState = p8.useState;
    local _ = p8.useEffect;
    local v9;

    if RunService:IsStudio() then
        v9 = nil;
    else
        v9 = p7.TeamData;
    end;

    local v10, u11 = useState(TournamentAppTab.TEAM);
    local v12 = {
        ResetOnSpawn = false,
        DisplayOrder = 20,
        IgnoreGuiInset = not DeviceUtil.isSmallScreen()
    };
    local v13 = { u3.createElement(DarkBackground, {
            AppId = p7.AppId
        }) };
    local v14 = {};
    local _ = #v14;
    local v15 = {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        Modal = true,
        AutoButtonColor = false,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.7, 0.8),
        BackgroundColor3 = Color3.fromHex("403E74")
    };
    local v17 = { u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = Enum.SortOrder.LayoutOrder
        }), u3.createElement(TournamentAppHeader, {
            AppId = p7.AppId,
            SelectedTab = v10,

            SelectTabButton = function(p16) -- Line: 31
                -- upvalues: u11 (copy)
                u11(p16);
            end
        }) };
    local v18 = #v17;
    local v19;

    if v10 == TournamentAppTab.INFO then
        v19 = u3.createElement(TournamentAppInfoPage);
    else
        v19 = false;
    end;

    if v19 then
        v17[v18 + 1] = v19;
    end;

    local v20 = #v17;
    local v21;

    if v10 == TournamentAppTab.TEAM then
        if v9 then
            v21 = u3.createElement(TournamentAppTeamPage, {
                TeamName = v9.TeamName,
                TeamIcon = v9.TeamIcon,
                TeamId = v9.TeamId,
                TeamLeader = v9.TeamLeader,
                TeamMembers = v9.TeamMembers,
                Region = v9.Region,
                Division = v9.Division,
                Emotes = p7.Emotes
            });
        else
            v21 = u3.createElement(TournamentCreateTeamPage);
        end;
    else
        v21 = false;
    end;

    if v21 then
        v17[v20 + 1] = v21;
    end;

    local v22 = #v17;
    local v23;

    if v10 == TournamentAppTab.BRACKET then
        v23 = u3.createElement(TournamentAppBracketPage, {
            inATeam = v9 and true or false
        });
    else
        v23 = false;
    end;

    if v23 then
        v17[v22 + 1] = v23;
    end;

    local v24 = #v17;
    local v25;

    if v10 == TournamentAppTab.INVITES then
        local createElement = u3.createElement;
        local v26 = {};
        local v27;

        if RunService:IsStudio() then
            v27 = {
                {
                    teamId = "10240120401240124",
                    teamName = "Aery Gamers",
                    teamTag = "AG",
                    invitingPlayer = 14124124,
                    weekId = "3",
                    teamIcon = EmoteType.ACADEMY_AERY_GL,
                    division = TournamentDivision.Division_I
                }
            };
        else
            v27 = u2.values(p7.incomingTournamentInvites);
        end;

        v26.Invites = v27;
        v25 = createElement(TournamentAppIncomingInvitesPage, v26);
    else
        v25 = false;
    end;

    if v25 then
        v17[v24 + 1] = v25;
    end;

    local v28 = #v17;
    local v29 = v10 == TournamentAppTab.OUTBOUND_INVITES;

    if v29 then
        local v30 = {};
        local TeamData = p7.TeamData;

        if TeamData ~= nil then
            TeamData = TeamData.OutboundInvites;
        end;

        v30.OutboundInvites = TeamData == nil and {} or TeamData;
        v29 = u3.createElement(TournamentAppOutboundInvitePage, v30);
    end;

    if v29 then
        v17[v28 + 1] = v29;
    end;

    v14.AppBackground = u3.createElement("ImageButton", v15, v17);
    v13[#v13 + 1] = u3.createElement(SlideIn, {}, v14);

    return u3.createFragment({
        TournamentTeamApp = u3.createElement("ScreenGui", v12, v13)
    });
end);

return {
    TournamentApp = v5.connect(function(p32, p33) -- Line: 134
        -- upvalues: Players (copy)
        local myTeamId = p32.Tournament.myTeamId;

        if myTeamId ~= "" and myTeamId then
            myTeamId = p32.Tournament.myTeamName;

            if myTeamId ~= "" and myTeamId then
                myTeamId = p32.Tournament.myTeamIcon;

                if myTeamId then
                    myTeamId = p32.Tournament.myTeamLeader;

                    if myTeamId ~= 0 and (myTeamId == myTeamId and myTeamId) then
                        myTeamId = p32.Tournament.myTeamRegion and p32.Tournament.myTeamDivision and p32.Tournament.outboundTournamentInvites;
                    end;
                end;
            end;
        end;

        if myTeamId == 0 or (myTeamId ~= myTeamId or (myTeamId == "" or not myTeamId)) then
            local v34 = {};

            for i, v in p33 do
                v34[i] = v;
            end;

            v34.Emotes = nil;
            v34.TeamData = nil;
            v34.incomingTournamentInvites = p32.Tournament.incomingTournamentInvites;
            v34.outboundTournamentInvites = p32.Tournament.outboundTournamentInvites;

            return v34;
        end;

        local v35 = {};

        for i, v in p33 do
            v35[i] = v;
        end;

        local v36;

        if p32.Tournament.myTeamLeader == Players.LocalPlayer.UserId then
            v36 = p32.Locker.emotes;
        else
            v36 = nil;
        end;

        v35.Emotes = v36;
        v35.TeamData = {
            TeamId = p32.Tournament.myTeamId,
            TeamName = p32.Tournament.myTeamName,
            TeamIcon = p32.Tournament.myTeamIcon,
            TeamLeader = p32.Tournament.myTeamLeader,
            TeamMembers = p32.Tournament.myTeamMembers or {},
            Region = p32.Tournament.myTeamRegion,
            Division = p32.Tournament.myTeamDivision,
            OutboundInvites = p32.Tournament.outboundTournamentInvites
        };
        v35.incomingTournamentInvites = p32.Tournament.incomingTournamentInvites;

        return v35;
    end)(v31)
};
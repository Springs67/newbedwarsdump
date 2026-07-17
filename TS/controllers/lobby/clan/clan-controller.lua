-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local EncodeJSON = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src", "Knit", "Util", "TableUtil").EncodeJSON;
local MaxPriorityQueue = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "datastructures", "out").MaxPriorityQueue;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local MarketplaceService = v2.MarketplaceService;
local Players = v2.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local ClanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local ClanWarUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Gamepass = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanMenuTab = RuntimeLib.import(script, script.Parent, "ui", "clan-menu", "clan-menu-core").ClanMenuTab;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 30, Name: __tostring
        return "ClanController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 36
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 40
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p5);
    p5.Name = "ClanController";
    p5.clansRemotes = default.Client:GetNamespace("Clans");
    p5.distinctAuditLogs = {};
    p5.clanAuditLogs = {};
    p5.clanWarLeaderboardRequestCD = 120;
    p5.lastClanWarWeeklyLeaderboardRequest = 0;
    p5.clanWarWeeklyLeaderboard = {};
    p5.lastClanWarAllTimeLeaderboardRequest = 0;
    p5.clanWarAllTimeLeaderboard = {};
end;

function u3.KnitStart(p6) -- Line: 52
    -- upvalues: KnitController (copy), default (copy), Flamework (copy), BedwarsAppIds (copy), SoundManager (copy), GameSound (copy), ClientStore (copy), ClanWarUtils (copy), ClientSyncEvents (copy), BedwarsImageId (copy), ColorUtil (copy), Theme (copy), ClanMenuTab (copy), Players (copy), ClanUtil (copy)
    KnitController.KnitStart(p6);
    default.Client:GetNamespace("Clans"):OnEvent("ClanUpdate", function(p7) -- Line: 54
        -- upvalues: Flamework (ref), BedwarsAppIds (ref), SoundManager (ref), GameSound (ref), ClientStore (ref), ClanWarUtils (ref), ClientSyncEvents (ref)
        local v8 = p7.newClan and p7.clanId;

        if v8 ~= "" and v8 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_PROFILE, {
                newClan = true,
                ClanId = p7.clanId
            });
            SoundManager:playSound(GameSound.BEDWARS_UPGRADE_SUCCESS);
        end;

        ClientStore:dispatch({
            type = "ClanUpdate",
            myClanId = p7.clanId,
            myClan = p7.clanProfile,
            me = p7.me
        });
        local v9 = ClanWarUtils.getActiveClanWarId();
        local v10;

        if v9 == "" or not v9 then
            v10 = nil;
        else
            v10 = p7.clanProfile;

            if v10 ~= nil then
                v10 = v10.clanWar.wars[v9];
            end;
        end;

        if v10 then
            ClientStore:dispatch({
                type = "ClanSetActiveClanWar",
                activeClanWar = v10
            });
        end;

        if p7.clanId == nil then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.CLAN_PROFILE);
        end;

        ClientSyncEvents.ClanUpdate:fire(p7);
    end);
    default.Client:GetNamespace("Clans"):OnEvent("ClanInvite", function(p11) -- Line: 95
        -- upvalues: ClientStore (ref), Flamework (ref), BedwarsImageId (ref), ColorUtil (ref), Theme (ref), BedwarsAppIds (ref), ClanMenuTab (ref)
        ClientStore:dispatch({
            type = "ClanInviteIncoming",
            clanInvite = p11.clanInvite
        });
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
            image = BedwarsImageId.CLAN,
            message = "<b>Clan <font color=\"" .. ColorUtil.richTextColor(Theme.mcAqua) .. "\">[" .. p11.clanInvite.clanTag .. "]</font> has sent you an invite!</b>",

            onClick = function() -- Line: 104, Name: onClick
                -- upvalues: Flamework (ref), BedwarsAppIds (ref), ClanMenuTab (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_MENU, {
                    tab = ClanMenuTab.INVITES
                });
            end
        });
    end);
    default.Client:GetNamespace("Clans"):OnEvent("ClanInvitesUpdate", function(p12) -- Line: 111
        -- upvalues: ClientStore (ref)
        local u13 = {};

        local function _(p14) -- Line: 114
            -- upvalues: u13 (copy)
            u13[p14.clanId] = p14;
        end;

        for i, v in p12.clanInvites do
            local _ = i - 1;
            u13[v.clanId] = v;
        end;

        ClientStore:dispatch({
            type = "ClanSetClanInvites",
            incomingClanInvites = u13
        });
    end);
    default.Client:GetNamespace("Clans"):OnEvent("OpenClanMenu", function(p15) -- Line: 127
        -- upvalues: Flamework (ref), BedwarsAppIds (ref)
        if p15.open then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_MENU, {});

            return;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.CLAN_MENU);
    end);
    p6.clansRemotes:OnEvent("SetPlayerClanWarMissions", function(p16) -- Line: 134
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "LobbySetClanWarMissionsData",
            clanWarMissionsData = p16.clanWarPlayerMissions
        });
    end);
    Players.LocalPlayer:GetAttributeChangedSignal("ClanPassPaid"):Connect(function() -- Line: 140
        -- upvalues: ClientStore (ref), ClanUtil (ref), Players (ref)
        ClientStore:dispatch({
            type = "ClanSetClanPassPaid",
            paid = ClanUtil.hasClanPass(Players.LocalPlayer)
        });
    end);
end;

u3.submitClanCreateForm = RuntimeLib.async(function(p17, p18) -- Line: 147
    -- upvalues: RuntimeLib (copy)
    local v19 = p17.clansRemotes:Get("SubmitClanCreateForm"):CallServerAsync(p18);

    return RuntimeLib.await(v19:andThen(function(p20) -- Line: 149
        return p20;
    end));
end);

function u3.promptClanPassPurchase(p21) -- Line: 154
    -- upvalues: ClanUtil (copy), Players (copy), MarketplaceService (copy), Gamepass (copy)
    if not ClanUtil.hasClanPass(Players.LocalPlayer) then
        MarketplaceService:PromptGamePassPurchase(Players.LocalPlayer, Gamepass.CLAN_CREATE_PASS);
    end;
end;

function u3.requestClanWarWeeklyLeaderboardAsync(u22) -- Line: 160
    -- upvalues: default (copy), RuntimeLib (copy)
    if os.time() - u22.lastClanWarWeeklyLeaderboardRequest <= u22.clanWarLeaderboardRequestCD then
        return RuntimeLib.Promise.new(function(p23) -- Line: 170
            -- upvalues: u22 (copy)
            return p23(u22.clanWarWeeklyLeaderboard);
        end);
    end;

    u22.lastClanWarWeeklyLeaderboardRequest = os.time();
    local v24 = default.Client:Get("RequestClanWarWeeklyLeaderboard"):CallServerAsync();
    v24:andThen(function(p25) -- Line: 164
        -- upvalues: u22 (copy)
        u22.clanWarWeeklyLeaderboard = p25;
    end);

    return v24;
end;

function u3.requestClanWarAllTimeLeaderboardAsync(u26) -- Line: 175
    -- upvalues: default (copy), RuntimeLib (copy)
    if os.time() - u26.lastClanWarAllTimeLeaderboardRequest <= u26.clanWarLeaderboardRequestCD then
        return RuntimeLib.Promise.new(function(p27) -- Line: 185
            -- upvalues: u26 (copy)
            return p27(u26.clanWarAllTimeLeaderboard);
        end);
    end;

    u26.lastClanWarAllTimeLeaderboardRequest = os.time();
    local v28 = default.Client:Get("RequestClanWarAllTimeLeaderboard"):CallServerAsync();
    v28:andThen(function(p29) -- Line: 179
        -- upvalues: u26 (copy)
        u26.clanWarAllTimeLeaderboard = p29;
    end);

    return v28;
end;

function u3.getMyClanProfileData(p30) -- Line: 190
    -- upvalues: ClientStore (copy), RuntimeLib (copy), ClanWarUtils (copy)
    local myClan = ClientStore:getState().Clans.myClan;

    if myClan then
        return RuntimeLib.Promise.new(function(p31) -- Line: 194
            -- upvalues: myClan (copy)
            return p31(myClan);
        end);
    end;

    local v32 = p30.clansRemotes:Get("RequestMyClanProfile"):CallServerAsync();
    v32:andThen(function(p33) -- Line: 200
        -- upvalues: ClientStore (ref), ClanWarUtils (ref)
        if p33 then
            ClientStore:dispatch({
                type = "ClanSetMyClanProfile",
                myClanProfile = p33
            });
            local v34 = ClanWarUtils.getActiveClanWarId();
            local v35;

            if v34 == "" or not v34 then
                v35 = nil;
            else
                v35 = p33.clanWar.wars[v34];
            end;

            if v35 then
                ClientStore:dispatch({
                    type = "ClanSetActiveClanWar",
                    activeClanWar = v35
                });
            end;
        end;
    end);

    return v32;
end;

function u3.fetchClanGuestDisplay(p36, p37) -- Line: 220
    local v38 = p36.clansRemotes:Get("FetchClanGuestView"):CallServer(p37);

    if v38 ~= nil then
        v38 = v38.clanProfile;
    end;

    return v38;
end;

function u3.promoteMember(p39, p40, p41) -- Line: 227
    return p39.clansRemotes:Get("PromoteMember"):CallServerAsync(p40, p41);
end;

function u3.demoteMember(p42, p43, p44) -- Line: 230
    return p42.clansRemotes:Get("DemoteMember"):CallServerAsync(p43, p44);
end;

function u3.kickPlayer(p45, p46, p47) -- Line: 233
    return p45.clansRemotes:Get("KickMember"):CallServerAsync(p46, p47);
end;

function u3.transferLeadership(p48, p49, p50) -- Line: 236
    return p48.clansRemotes:Get("TransferLeader"):CallServerAsync(p49, p50);
end;

u3.upgrade = RuntimeLib.async(function(p51, p52, p53) -- Line: 239
    return p51.clansRemotes:Get("Upgrade"):CallServerAsync(p52, p53);
end);
u3.selectClanHqBackgroundMusic = RuntimeLib.async(function(p54, p55, p56) -- Line: 242
    -- upvalues: RuntimeLib (copy)
    return RuntimeLib.await(p54.clansRemotes:Get("SelectClanHqBackgroundMusic"):CallServerAsync(p55, p56));
end);
u3.selectClanHqSkybox = RuntimeLib.async(function(p57, p58, p59) -- Line: 245
    -- upvalues: RuntimeLib (copy)
    return RuntimeLib.await(p57.clansRemotes:Get("SelectClanHqSkybox"):CallServerAsync(p58, p59));
end);
u3.selectClanPodiumBanner = RuntimeLib.async(function(p60, p61, p62) -- Line: 248
    -- upvalues: RuntimeLib (copy)
    return RuntimeLib.await(p60.clansRemotes:Get("SelectClanPodiumBanner"):CallServerAsync(p61, p62));
end);
u3.selectClanChatTagColor = RuntimeLib.async(function(p63, p64, p65) -- Line: 251
    -- upvalues: RuntimeLib (copy)
    return RuntimeLib.await(p63.clansRemotes:Get("SelectClanChatTagColor"):CallServerAsync(p64, p65));
end);

function u3.updateClanInfo(p66, p67, p68) -- Line: 254
    return p66.clansRemotes:Get("UpdateClanInfo"):CallServerAsync(p67, p68);
end;

function u3.updateClanEmblem(p69, p70, p71) -- Line: 257
    return p69.clansRemotes:Get("UpdateClanEmblem"):CallServerAsync(p70, p71);
end;

function u3.deleteClan(p72, p73) -- Line: 260
    p72.clansRemotes:Get("DeleteClan"):CallServer(p73);
end;

function u3.cancelDeleteClan(p74, p75) -- Line: 263
    p74.clansRemotes:Get("CancelMarkedDelete"):CallServerAsync(p75);
end;

function u3.leaveClan(u76) -- Line: 266
    -- upvalues: Flamework (copy), BedwarsAppIds (copy), Theme (copy), SoundManager (copy), GameSound (copy), ClientSyncEvents (copy), UILayers (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CONFIRMATION_MODAL, {
        Title = "Leave Clan?",
        Body = "Are you sure you want to leave this clan? You can\'t undo this action.",
        PrimaryBtnProps = {
            Text = "Leave",
            BackgroundColor3 = Theme.backgroundError
        },
        SecondaryBtnProps = {
            Text = "Cancel"
        },

        OnPrimaryBtnClick = function() -- Line: 277, Name: OnPrimaryBtnClick
            -- upvalues: u76 (copy), Flamework (ref), BedwarsAppIds (ref), SoundManager (ref), GameSound (ref), ClientSyncEvents (ref)
            if not u76.clansRemotes:Get("LeaveClan"):CallServer() then
                SoundManager:playSound(GameSound.ERROR_NOTIFICATION);

                return;
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.CLAN_PROFILE);
            SoundManager:playSound(GameSound.ARMOR_UNEQUIP);
            ClientSyncEvents.ClanLeave:fire();
        end,

        OnSecondaryBtnClick = function() -- Line: 287, Name: OnSecondaryBtnClick
            -- upvalues: Flamework (ref), UILayers (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
        end
    });
end;

function u3.invitePlayerToClan(p77, p78, p79) -- Line: 292
    return p77.clansRemotes:Get("InvitePlayerToClan"):CallServer(p78, p79);
end;

function u3.clanInviteDecision(p80, p81, p82) -- Line: 295
    -- upvalues: Flamework (copy), BedwarsAppIds (copy), ClientStore (copy)
    p80.clansRemotes:Get("ClanInviteDecision"):CallServerAsync(p81, p82):andThen(function(p83) -- Line: 297
        -- upvalues: Flamework (ref), BedwarsAppIds (ref)
        local v84 = p83.joinedClan and p83.clanId;

        if v84 ~= "" and (v84 and not Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(BedwarsAppIds.CLAN_PROFILE)) then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_PROFILE, {
                ClanId = p83.clanId
            });
        end;
    end):catch(function(p85) -- Line: 308
        return print("[ClanInviteDecision Error]", p85);
    end);
    ClientStore:dispatch({
        type = "ClanInviteDelete",
        clanId = p81
    });
end;

function u3.kitShopPurchase(p86, p87) -- Line: 316
    -- upvalues: SoundManager (copy), GameSound (copy)
    local v88 = p86.clansRemotes:Get("KitShopPurchase"):CallServerAsync(p87);
    v88:andThen(function(p89) -- Line: 318
        -- upvalues: SoundManager (ref), GameSound (ref)
        if p89 then
            SoundManager:playSound(GameSound.BEDWARS_UPGRADE_SUCCESS);
        end;
    end);

    return v88;
end;

function u3.requestToJoinClan(p90, p91) -- Line: 326
    return p90.clansRemotes:Get("RequestToJoinClan"):CallServerAsync(p91);
end;

function u3.loadAuditLogs(u92, u93) -- Line: 329
    -- upvalues: MaxPriorityQueue (copy), EncodeJSON (copy)
    return u92.clansRemotes:Get("ClanLoadAuditLogs"):CallServerAsync(u93):andThen(function(p94) -- Line: 330
        -- upvalues: u92 (copy), u93 (copy), MaxPriorityQueue (ref), EncodeJSON (ref)
        local v95 = u92.distinctAuditLogs[u93];
        local u96 = v95 == nil and {} or v95;
        local u97 = u92.clanAuditLogs[u93];

        if u97 == nil then
            u97 = MaxPriorityQueue.new();
        end;

        local function v101(p98) -- Line: 346
            -- upvalues: EncodeJSON (ref), u96 (copy), u97 (copy)
            local v99 = EncodeJSON({
                timestamp = p98.timestamp,
                data = p98.data
            });

            if u96[v99] == nil then
                local v100 = DateTime.fromIsoDate(p98.timestamp);

                if v100 ~= nil then
                    v100 = v100.UnixTimestamp;
                end;

                u97:InsertWithPriority(p98, v100 == nil and 0 or v100);
                u96[v99] = true;
            end;
        end;

        for i, v in p94 do
            v101(v, i - 1, p94);
        end;

        u92.clanAuditLogs[u93] = u97;
        u92.distinctAuditLogs[u93] = u96;

        return u97;
    end);
end;

KnitClient.CreateController(u3.new());

return nil;
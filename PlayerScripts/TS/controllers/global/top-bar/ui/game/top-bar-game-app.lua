-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local TopBarButton = v1.TopBarButton;
local TopBarCard = v1.TopBarCard;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameHudWidget = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game-hud", "game-hud-widget").GameHudWidget;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local QueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local HudAlivePlayerCounts = RuntimeLib.import(script, script.Parent, "hud-alive-player-counts").HudAlivePlayerCounts;
local HudBedHealth = RuntimeLib.import(script, script.Parent, "hud-bed-health").HudBedHealth;
local HudEventTimer = RuntimeLib.import(script, script.Parent, "hud-event-timer").HudEventTimer;
local HudLocalKills = RuntimeLib.import(script, script.Parent, "hud-local-kills").HudLocalKills;
local HudLuckyBlockLuckHud = RuntimeLib.import(script, script.Parent, "hud-lucky-block-luck").HudLuckyBlockLuckHud;
local HudMatchTimer = RuntimeLib.import(script, script.Parent, "hud-match-timer").HudMatchTimer;
local HudTeamBridgeDuelScores = RuntimeLib.import(script, script.Parent, "hud-team-bridge-duel-scores", "hud-team-bridge-duel-scores").HudTeamBridgeDuelScores;
local HudTeamScores = RuntimeLib.import(script, script.Parent, "hud-team-scores", "hud-team-scores").HudTeamScores;
local HudTeamBeds = RuntimeLib.import(script, script.Parent, "hud-teams", "hud-beds").HudTeamBeds;
local v36 = v3.new(u2)(function(p5, p6) -- Line: 29
    -- upvalues: DeviceUtil (copy), QueueType (copy), QueueMeta (copy), Flamework (copy), GameType (copy), GameHudWidget (copy), KnitClient (copy), MatchState (copy), ClientSyncEvents (copy), u2 (copy), TopBarCard (copy), ColorUtil (copy), HudLuckyBlockLuckHud (copy), HudEventTimer (copy), HudMatchTimer (copy), HudLocalKills (copy), HudBedHealth (copy), HudTeamBeds (copy), HudAlivePlayerCounts (copy), HudTeamScores (copy), HudTeamBridgeDuelScores (copy), TopBarButton (copy), BedwarsImageId (copy)
    local _ = p6.useMemo;
    local useState = p6.useState;
    local useEffect = p6.useEffect;
    local v7;

    if DeviceUtil.isHoarceKat() then
        v7 = QueueType.SKYWARS_TO2;
    else
        v7 = p5.QueueType or QueueType.BEDWARS_TEST;
    end;

    local v8;

    if DeviceUtil.isHoarceKat() then
        v8 = QueueMeta[v7];
    else
        v8 = Flamework.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(v7);
    end;

    local teams = v8.teams;
    local v9 = DeviceUtil.isMobileControls();
    local v10;

    if v8.game == GameType.BEDWARS then
        v10 = true;
    elseif v8.hudWidgets then
        v10 = table.find(v8.hudWidgets, GameHudWidget.BEDS) ~= nil;
    else
        v10 = false;
    end;

    local v11;

    if DeviceUtil.isHoarceKat() then
        v11 = false;
    else
        v11 = KnitClient.Controllers.MatchController:getMatchState() == MatchState.POST;
    end;

    local v12, u13 = useState(v11);
    useEffect(function() -- Line: 54
        -- upvalues: ClientSyncEvents (ref), MatchState (ref), u13 (copy)
        ClientSyncEvents.MatchStateChange:connect(function(p14) -- Line: 55
            -- upvalues: MatchState (ref), u13 (ref)
            if p14.matchState == MatchState.POST then
                u13(true);
            end;
        end);
    end, {});
    local v15 = {};
    local v16 = #v15;
    local v17;

    if v8.winConInfoHud == nil then
        v17 = false;
    else
        v17 = not v12 and u2.createElement(TopBarCard, {
            LayoutOrder = 0,
            BackgroundColor3 = ColorUtil.hexColor(16755200)
        }, { u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextSize = 16,
                Text = v8.winConInfoHud,
                AutomaticSize = Enum.AutomaticSize.X,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = ColorUtil.WHITE
            }) });
    end;

    if v17 then
        v15[v16 + 1] = v17;
    end;

    local v18 = #v15;
    local luckyBlock = v8.luckyBlock;

    if luckyBlock ~= nil then
        luckyBlock = luckyBlock.luckSystem;
    end;

    if luckyBlock then
        luckyBlock = not v12 and u2.createElement(HudLuckyBlockLuckHud, {
            LayoutOrder = 0
        });
    end;

    if luckyBlock then
        v15[v18 + 1] = luckyBlock;
    end;

    local v19 = #v15;
    local v20 = not v12 and u2.createElement(HudEventTimer, {
        LayoutOrder = 1
    });

    if v20 then
        v15[v19 + 1] = v20;
    end;

    local v21 = #v15;
    local v22 = not v12 and u2.createElement(HudMatchTimer, {
        LayoutOrder = 2
    });

    if v22 then
        v15[v21 + 1] = v22;
    end;

    local v23 = #v15;
    local v24 = not v12 and u2.createElement(HudLocalKills, {
        AppId = "HudKillsApp",
        LayoutOrder = 3,
        LocalPlayerId = p5.LocalPlayerId
    });

    if v24 then
        v15[v23 + 1] = v24;
    end;

    local v25 = #v15;
    local v26 = not v12;

    if v26 then
        if v10 then
            v26 = u2.createElement(HudBedHealth, {
                AppId = "HudBedHealth"
            });
        else
            v26 = v10;
        end;
    end;

    if v26 then
        v15[v25 + 1] = v26;
    end;

    local v27 = #v15;
    local v28 = v10 and not v12 and u2.createElement(HudTeamBeds, {
        LayoutOrder = 4,
        Teams = teams
    });

    if v28 then
        v15[v27 + 1] = v28;
    end;

    local v29 = #v15;
    local hudWidgets = v8.hudWidgets;

    if hudWidgets ~= nil then
        hudWidgets = table.find(hudWidgets, GameHudWidget.ALIVE_PLAYERS) ~= nil;
    end;

    if hudWidgets then
        hudWidgets = not v12 and u2.createElement(HudAlivePlayerCounts, {
            LayoutOrder = 4
        });
    end;

    if hudWidgets then
        v15[v29 + 1] = hudWidgets;
    end;

    local v30 = #v15;
    local hudWidgets2 = v8.hudWidgets;

    if hudWidgets2 ~= nil then
        hudWidgets2 = table.find(hudWidgets2, GameHudWidget.SCORE) ~= nil;
    end;

    if hudWidgets2 then
        hudWidgets2 = u2.createElement(HudTeamScores, {
            LayoutOrder = 4
        });
    end;

    if hudWidgets2 then
        v15[v30 + 1] = hudWidgets2;
    end;

    local v31 = #v15;
    local hudWidgets3 = v8.hudWidgets;

    if hudWidgets3 ~= nil then
        hudWidgets3 = table.find(hudWidgets3, GameHudWidget.BRIDGE_DUEL_SCORE) ~= nil;
    end;

    if hudWidgets3 then
        hudWidgets3 = not v9 and u2.createElement(HudTeamBridgeDuelScores, {
            LayoutOrder = 4
        });
    end;

    if hudWidgets3 then
        v15[v31 + 1] = hudWidgets3;
    end;

    local v32 = #v15;
    local v35 = DeviceUtil.isMobileControls() and u2.createElement(TopBarButton, {
        LayoutOrder = 52,
        ToolTip = "OPEN TABLIST",
        Image = BedwarsImageId.TabListMobileIcon,

        OnClick = function(p33, p34) -- Line: 182, Name: OnClick
            -- upvalues: KnitClient (ref)
            local TablistController = KnitClient.Controllers.TablistController;
            TablistController.toggleTablist();
            p34(TablistController.tablistOpen);
        end,

        SelectedState = {
            BackgroundColor = ColorUtil.WHITE
        }
    });

    if v35 then
        v15[v32 + 1] = v35;
    end;

    return u2.createFragment(v15);
end);

return {
    TopBarGameApp = v4.connect(function(p37, p38) -- Line: 198
        local v39 = {};

        for i, v in p38 do
            v39[i] = v;
        end;

        v39.QueueType = p37.Game.queueType;
        v39.CustomMatchMapSaveInfoDto = p37.CustomMatch.mapSaveData;
        v39.IsCustom = p37.Game.customMatch ~= nil;

        return v39;
    end)(v36)
};
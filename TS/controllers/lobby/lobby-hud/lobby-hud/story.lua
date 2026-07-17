-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out");
local PartyInvitesReducer = v1.PartyInvitesReducer;
local PartyReducer = v1.PartyReducer;
local QueueState = v1.QueueState;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local ClansReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "clan-reducer").ClansReducer;
local EventReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "event-reducer").EventReducer;
local BedwarsReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer;
local LobbyReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "lobby-reducer").LobbyReducer;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local EventType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType;
local EventMissionsUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-missions", "event-missions-util").EventMissionsUtil;
local EventShopItem = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item").EventShopItem;
local EventUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local KillEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
local LobbyHudMain = RuntimeLib.import(script, script.Parent, "lobby-hud-main", "lobby-hud-main").LobbyHudMain;
local LobbyHudSide = RuntimeLib.import(script, script.Parent, "lobby-hud-side", "lobby-hud-side").LobbyHudSide;

return function(p4) -- Line: 26
    -- upvalues: EventType (copy), EventMeta (copy), EventMissionsUtil (copy), u3 (copy), BedwarsReducer (copy), PartyReducer (copy), PartyInvitesReducer (copy), ClansReducer (copy), EventReducer (copy), LobbyReducer (copy), BedwarsKit (copy), OfflinePlayerUtil (copy), QueueState (copy), EventUtil (copy), EventShopItem (copy), u2 (copy), StoreProvider (copy), LobbyHudMain (copy), LobbyHudSide (copy), ClientStore (copy), KillEffectType (copy), EmoteType (copy)
    local EGG_HUNT_2024 = EventType.EGG_HUNT_2024;
    local u5 = {};

    local function _(p6) -- Line: 32
        -- upvalues: EventMissionsUtil (ref), EGG_HUNT_2024 (copy), u5 (copy)
        local v7 = EventMissionsUtil.convertMissionsToDataStore(EGG_HUNT_2024, p6.pool, p6.id);
        u5[p6.id] = v7;
    end;

    for i, v in EventMeta[EGG_HUNT_2024].missionGenerators do
        local _ = i - 1;
        local v8 = EventMissionsUtil.convertMissionsToDataStore(EGG_HUNT_2024, v.pool, v.id);
        u5[v.id] = v8;
    end;

    local v9 = u3.combineReducers({
        Bedwars = BedwarsReducer,
        Party = PartyReducer,
        PartyInvites = PartyInvitesReducer,
        Clans = ClansReducer,
        Event = EventReducer,
        Lobby = LobbyReducer
    });
    local v10 = {
        Lobby = {
            robuxStore = {
                newPlayerBundleData = {
                    purchased = false,
                    firstJoinTime = os.time()
                }
            }
        },
        Bedwars = {
            bedCoins = 9999999999,
            playerLevel = 20,
            kit = BedwarsKit.ALCHEMIST,
            kits = { BedwarsKit.NONE, BedwarsKit.ALCHEMIST },
            milestoneRewardsClaimed = {}
        }
    };
    local v11 = {};
    local v12 = {};

    for i, v in OfflinePlayerUtil.Dummy.SnickTrix do
        v11[i] = v;
    end;

    v11.displayName = "SnickTrix";
    v12.leader = v11;
    local v13 = {
        OfflinePlayerUtil.Dummy.spleenhook,
        OfflinePlayerUtil.Dummy.Vorlias,
        OfflinePlayerUtil.Dummy.spleenhook,
        OfflinePlayerUtil.Dummy.Vorlias,
        OfflinePlayerUtil.Dummy.spleenhook,
        OfflinePlayerUtil.Dummy.Vorlias,
        OfflinePlayerUtil.Dummy.spleenhook,
        OfflinePlayerUtil.Dummy.Vorlias,
        OfflinePlayerUtil.Dummy.spleenhook,
        OfflinePlayerUtil.Dummy.Vorlias,
        OfflinePlayerUtil.Dummy.spleenhook,
        OfflinePlayerUtil.Dummy.Vorlias,
        OfflinePlayerUtil.Dummy.spleenhook
    };

    local function _(p14) -- Line: 76
        local v15 = {};

        for i, v in p14 do
            v15[i] = v;
        end;

        v15.displayName = p14.name;

        return v15;
    end;

    local v16 = table.create(#v13);

    for i, v in v13 do
        local _ = i - 1;
        local v17 = {};

        for i2, v2 in v do
            v17[i2] = v2;
        end;

        v17.displayName = v.name;
        v16[i] = v17;
    end;

    v12.members = v16;
    v12.queueData = nil;
    v12.queueState = QueueState.NONE;
    v12.outgoingInviteUserIds = {};
    v10.Party = v12;
    v10.PartyInvites = {
        incomingInvites = {
            {
                fromPlayer = {
                    name = "SnickTrix",
                    userId = OfflinePlayerUtil.Dummy.SnickTrix.userId
                },
                time = os.time()
            },
            {
                fromPlayer = {
                    name = "spleenhook",
                    userId = OfflinePlayerUtil.Dummy.spleenhook.userId
                },
                time = os.time() - 10
            }
        }
    };
    v10.Clans = {
        myClanId = "1"
    };
    local v18 = {};
    local v19 = {};

    for i, v in EventUtil.makeStarterEventData() do
        v18[i] = v;
    end;

    v18.events = {
        [EventType.EGG_HUNT_2024] = {
            itemsPurchased = {
                {
                    item = EventShopItem.HALLOWEEN_EMOTE,
                    time = os.time()
                }
            },
            missionsClaimed = {},
            claimedEggs = {}
        }
    };
    v19.profileData = v18;
    v19.activeMissions = {
        [EGG_HUNT_2024] = u5
    };
    v10.Event = v19;
    local v20 = u3.Store.new(v9, v10);
    local u21 = u2.mount(u2.createElement(StoreProvider, {
        store = v20
    }, { u2.createElement(LobbyHudMain, {
            AppId = "LobbyHudMain"
        }) }), p4);
    local u22 = u2.mount(u2.createElement(StoreProvider, {
        store = v20
    }, { u2.createElement(LobbyHudSide, {
            AppId = "LobbyHudSide"
        }) }), p4);
    ClientStore:dispatch({
        type = "LobbyAddRewardsToDisplay",
        rewards = {
            {
                paid = false,
                clanShopContribution = 1000
            },
            {
                paid = false,
                killEffect = KillEffectType.BOXING_GLOVE
            },
            {
                paid = false,
                emote = EmoteType.DISCO
            },
            {
                paid = false,
                emote = EmoteType.PENGUIN_DISCO
            },
            {
                paid = false,
                clanShopContribution = 1000
            },
            {
                paid = false,
                killEffect = KillEffectType.BOXING_GLOVE
            },
            {
                paid = false,
                emote = EmoteType.DISCO
            },
            {
                paid = false,
                emote = EmoteType.PENGUIN_DISCO
            },
            {
                paid = false,
                clanShopContribution = 1000
            },
            {
                paid = false,
                killEffect = KillEffectType.BOXING_GLOVE
            },
            {
                paid = false,
                emote = EmoteType.DISCO
            },
            {
                paid = false,
                emote = EmoteType.PENGUIN_DISCO
            },
            {
                paid = false,
                clanShopContribution = 1000
            },
            {
                paid = false,
                killEffect = KillEffectType.BOXING_GLOVE
            },
            {
                paid = false,
                emote = EmoteType.DISCO
            },
            {
                paid = false,
                emote = EmoteType.PENGUIN_DISCO
            }
        }
    });

    return function() -- Line: 217
        -- upvalues: u2 (ref), u21 (copy), u22 (copy)
        u2.unmount(u21);
        u2.unmount(u22);
    end;
end;
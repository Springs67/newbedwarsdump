-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local RandomUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local CheckInSystem = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "checkin-system", "checkin-system").CheckInSystem;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local EventType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType;
local EventMissionsUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-missions", "event-missions-util").EventMissionsUtil;
local EventShopItem = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item").EventShopItem;
local EventUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-types");
local GlobalTeamEventKey = v2.GlobalTeamEventKey;
local GlobalTeamKey = v2.GlobalTeamKey;
local EventApp = RuntimeLib.import(script, script.Parent, "event-app").EventApp;

return function(p3) -- Line: 17
    -- upvalues: EventType (copy), EventMeta (copy), CreateRoduxApp (copy), EventApp (copy), ClientStore (copy), EventUtil (copy), GlobalTeamKey (copy), EventShopItem (copy), EventMissionsUtil (copy), RandomUtil (copy), GlobalTeamEventKey (copy), CheckInSystem (copy), u1 (copy)
    local EGG_HUNT_2026 = EventType.EGG_HUNT_2026;
    local v4 = EventMeta[EGG_HUNT_2026];
    local _ = v4.currencies[1];
    local u5 = CreateRoduxApp("EventApp", EventApp, {
        event = EGG_HUNT_2026
    }, {}, {
        Parent = p3
    });
    local v6 = {};
    local v7 = {
        type = "SetEventDataAll"
    };

    for i, v in EventUtil.makeStarterEventData() do
        v6[i] = v;
    end;

    v6.events = {
        [EGG_HUNT_2026] = {
            totalGlobalTeamContribution = 100000,
            globalTeamKey = GlobalTeamKey.SUMMER_2025_TEAM,
            timedGoals = {
                [GlobalTeamKey.SUMMER_2025_TEAM] = {
                    summer_2025_timed_goal_1 = 50000,
                    summer_2025_timed_goal_2 = 100000,
                    summer_2025_timed_goal_3 = 500000,
                    summer_2025_timed_goal_4 = 1000000
                }
            },
            claimedGlobalTeamRewards = { "summer_2025_timed_goal_1_reward_1", "summer_2025_timed_goal_2_reward_1" },
            itemsPurchased = {
                {
                    item = EventShopItem.HALLOWEEN_EMOTE,
                    time = os.time()
                }
            },
            missionsClaimed = {},
            totalEnvelopesCollected = {
                tier1 = 0,
                tier2 = 0,
                tier3 = 0
            },
            dailyEnvelopesCollected = {
                tier1 = 0,
                tier2 = 0,
                tier3 = 0
            }
        }
    };
    v7.eventData = v6;
    ClientStore:dispatch(v7);
    local u8 = {};

    local function _(p9) -- Line: 69
        -- upvalues: EventMissionsUtil (ref), EGG_HUNT_2026 (copy), RandomUtil (ref), u8 (copy)
        local v10 = EventMissionsUtil.convertMissionsToDataStore(EGG_HUNT_2026, p9.pool, p9.id);
        u8[p9.id] = RandomUtil.randomArraySelectN(v10, p9.selectAmount);
    end;

    for i, v in v4.missionGenerators do
        local _ = i - 1;
        local v11 = EventMissionsUtil.convertMissionsToDataStore(EGG_HUNT_2026, v.pool, v.id);
        u8[v.id] = RandomUtil.randomArraySelectN(v11, v.selectAmount);
    end;

    ClientStore:dispatch({
        type = "SetEventPartial",
        data = {
            activeMissions = {
                [EGG_HUNT_2026] = u8
            }
        }
    });
    ClientStore:dispatch({
        type = "SetEventGlobalTeamDataSingle",
        key = GlobalTeamEventKey.SUMMER_2025,
        data = {
            globalTeams = {
                [GlobalTeamKey.SUMMER_2025_TEAM] = {
                    score = 0,
                    memberCount = 2,
                    timedGoalsData = {
                        summer_2025_timed_goal_1 = 450000,
                        summer_2025_timed_goal_2 = 50000,
                        summer_2025_timed_goal_3 = 50000,
                        summer_2025_timed_goal_4 = 50000
                    }
                }
            }
        }
    });
    ClientStore:dispatch({
        type = "SetEventGlobalTeamKeySingle",
        key = GlobalTeamEventKey.SUMMER_2025,
        data = GlobalTeamKey.SUMMER_2025_TEAM
    });
    ClientStore:dispatch({
        type = "LobbySetCheckInData",
        system = CheckInSystem.LNY_2025,
        data = {
            checkIns = { {
                    time = 1737760854
                }, {
                    time = 1737915635
                }, {
                    time = 1737946041
                }, {
                    time = 1738103400
                } }
        }
    });

    return function() -- Line: 124
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;
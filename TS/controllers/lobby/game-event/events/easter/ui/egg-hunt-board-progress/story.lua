-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local EventReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "event-reducer").EventReducer;
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local EventType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType;
local EventMissionsUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-missions", "event-missions-util").EventMissionsUtil;
local EventShopItem = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item").EventShopItem;
local EventUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil;
local EggHunt2026MilestoneMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "egg-hunt-types", "egg-hunt-2026-milestone-meta").EggHunt2026MilestoneMeta;
local Easter2026MilestoneRewardMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "egg-hunt-types", "egg-hunt-2026-milestone-reward-meta").Easter2026MilestoneRewardMeta;
local EggHuntBoardCore = RuntimeLib.import(script, script.Parent, "egg-hunt-board-core").EggHuntBoardCore;

return function(p3) -- Line: 16
    -- upvalues: EventType (copy), EventMeta (copy), EventMissionsUtil (copy), u2 (copy), GameReducer (copy), EventReducer (copy), EventUtil (copy), EventShopItem (copy), u1 (copy), EggHunt2026MilestoneMeta (copy), Easter2026MilestoneRewardMeta (copy), EggHuntBoardCore (copy), StoreProvider (copy)
    local EASTER_2023 = EventType.EASTER_2023;
    local u4 = {};

    local function _(p5) -- Line: 22
        -- upvalues: EventMissionsUtil (ref), EASTER_2023 (copy), u4 (copy)
        local v6 = EventMissionsUtil.convertMissionsToDataStore(EASTER_2023, p5.pool, p5.id);
        u4[p5.id] = v6;
    end;

    for i, v in EventMeta[EASTER_2023].missionGenerators do
        local _ = i - 1;
        local v7 = EventMissionsUtil.convertMissionsToDataStore(EASTER_2023, v.pool, v.id);
        u4[v.id] = v7;
    end;

    local v8 = u2.combineReducers({
        Game = GameReducer,
        Event = EventReducer
    });
    local v9 = {};
    local v10 = {};
    local v11 = {};

    for i, v in EventUtil.makeStarterEventData() do
        v9[i] = v;
    end;

    v9.events = {
        [EASTER_2023] = {
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
    v10.profileData = v9;
    v10.activeMissions = {
        [EASTER_2023] = u4
    };
    v11.Event = v10;
    local v12 = u2.Store.new(v8, v11);
    local v13 = {
        store = v12
    };
    local v14 = {};
    local v15 = {
        milestoneMeta = EggHunt2026MilestoneMeta,
        milestoneRewardsMeta = Easter2026MilestoneRewardMeta
    };
    local v16 = v12:getState().Event.profileData.events[EASTER_2023];

    if v16 ~= nil then
        local claimedEggs = v16.claimedEggs;
        v16 = claimedEggs ~= nil and #claimedEggs or claimedEggs;
    end;

    v15.numEggsCollected = v16 == nil and 0 or v16;
    v14[#v14 + 1] = u1.createElement(EggHuntBoardCore, v15);
    local u17 = u1.mount(u1.createElement(StoreProvider, v13, v14), p3);

    return function() -- Line: 82
        -- upvalues: u1 (ref), u17 (copy)
        return u1.unmount(u17);
    end;
end;
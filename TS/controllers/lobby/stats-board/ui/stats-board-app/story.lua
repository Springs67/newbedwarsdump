-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local RankUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil;
local QueueStatsUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stats", "queue-stats-util").QueueStatsUtil;
local StatsBoard = RuntimeLib.import(script, script.Parent, "stats-board-app").StatsBoard;

return function(p3) -- Line: 11
    -- upvalues: QueueStatsUtil (copy), u1 (copy), QueueType (copy), RankUtil (copy), ClientStore (copy), u2 (copy), StatsBoard (copy), CreateRoduxApp (copy)
    local v4 = {};

    for i, v in QueueStatsUtil.makeStarterBedwarsQueueStats() do
        v4[i] = v;
    end;

    v4.firstPlayTime = 0;
    v4.lastPlayTime = 0;
    v4.wins = 162;
    v4.losses = 72;
    v4.ties = 0;
    v4.earlyLeaves = 0;
    v4.matches = 23;
    v4.kills = 56532;
    v4.deaths = 343;
    v4.currentWinStreak = 3;
    v4.highestWinStreak = 7;
    v4.bedBreaks = 3;
    v4.finalKills = 5;
    v4.damage = 0;
    v4.healing = 0;
    v4.totalPlayTime = 0;
    v4.damageTaken = 0;
    v4.knockIntoVoid = 0;
    v4.blockBreaks = 0;
    v4.blocksPlaced = 0;
    v4.projectilesUsed = 0;
    v4.projectileDamage = 0;
    v4.arrowDamage = 0;
    v4.ironCollected = 0;
    v4.diamondCollected = 0;
    v4.emeraldCollected = 0;
    v4.diamondGuardianKills = 0;
    v4.titanKills = 0;
    v4.telepearlsUsed = 0;
    v4.telepearlBlocksTravelled = 0;
    v4.enchants = 0;
    v4.multiKills = 0;
    v4.highestKillStreak = 0;
    v4.highestMultiKillChain = 0;
    local u5 = {};

    for i, v in QueueStatsUtil.makeStarterBedwarsQueueStats() do
        u5[i] = v;
    end;

    u5.firstPlayTime = 0;
    u5.lastPlayTime = 0;
    u5.wins = 162;
    u5.losses = 72;
    u5.ties = 0;
    u5.earlyLeaves = 0;
    u5.matches = 23;
    u5.kills = 5632;
    u5.deaths = 343;
    u5.currentWinStreak = 32;
    u5.highestWinStreak = 734;
    u5.bedBreaks = 333;
    u5.finalKills = 533;
    u5.damage = 0;
    u5.healing = 0;
    u5.totalPlayTime = 0;
    u5.damageTaken = 0;
    u5.knockIntoVoid = 0;
    u5.blockBreaks = 0;
    u5.blocksPlaced = 0;
    u5.projectilesUsed = 0;
    u5.projectileDamage = 0;
    u5.arrowDamage = 0;
    u5.ironCollected = 0;
    u5.diamondCollected = 0;
    u5.emeraldCollected = 0;
    u5.diamondGuardianKills = 0;
    u5.titanKills = 0;
    u5.telepearlsUsed = 0;
    u5.telepearlBlocksTravelled = 0;
    u5.enchants = 0;
    u5.multiKills = 0;
    u5.highestKillStreak = 0;
    u5.highestMultiKillChain = 0;
    local v6 = u1.values(QueueType);

    local function v9(p7) -- Line: 91
        -- upvalues: RankUtil (ref), u5 (copy)
        if p7 ~= RankUtil.activeRankMeta.queueType then
            return { p7, u5 };
        end;

        local v8 = {};

        for i, v in u5 do
            v8[i] = v;
        end;

        v8.lastPlayTime = os.time() - 172800;

        return { p7, v8 };
    end;

    local v10 = table.create(#v6);

    for i, v in v6 do
        v10[i] = v9(v, i - 1, v6);
    end;

    ClientStore:dispatch({
        type = "SetStats",
        globalStats = v4,
        queues = u1.fromEntries(v10),
        rankStats = {
            rankPoints = 3800,
            matchesPlayed = 6,
            leaderboardPosition = -1
        }
    });
    local u15 = CreateRoduxApp("stats-board", function(p11) -- Line: 121, Name: statsBoard
        -- upvalues: u2 (ref), StatsBoard (ref)
        local v12 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(437, 700)
        };
        local v13 = {};
        local v14 = {};

        for i, v in p11 do
            v14[i] = v;
        end;

        v13[#v13 + 1] = u2.createElement(StatsBoard, v14);

        return u2.createElement("Frame", v12, v13);
    end, {}, {}, {
        Parent = p3
    });

    return function() -- Line: 140
        -- upvalues: u2 (ref), u15 (copy)
        u2.unmount(u15);
    end;
end;
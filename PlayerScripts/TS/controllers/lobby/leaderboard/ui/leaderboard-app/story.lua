-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-meta");
local DEFAULT_LEADERBOARD_TO_DISPLAY = v2.DEFAULT_LEADERBOARD_TO_DISPLAY;
local getLeaderboardMeta = v2.getLeaderboardMeta;
local getLeaderboardsToDisplay = v2.getLeaderboardsToDisplay;
local PlayfabLeaderboard = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "leaderboard", "leaderboard-types").PlayfabLeaderboard;
local RankDistribution = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-distribution").RankDistribution;
local RankMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;
local RankUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil;
local LeaderboardCore = RuntimeLib.import(script, script.Parent, "leaderboard-core").LeaderboardCore;

return function(p3) -- Line: 15
    -- upvalues: ClientStore (copy), PlayfabLeaderboard (copy), getLeaderboardMeta (copy), RankDistribution (copy), RankMeta (copy), RankUtil (copy), getLeaderboardsToDisplay (copy), DEFAULT_LEADERBOARD_TO_DISPLAY (copy), u1 (copy), LeaderboardCore (copy), CreateRoduxApp (copy)
    local v4 = table.create(100, "");
    local v5 = table.create(#v4);

    local function v8(p6, p7) -- Line: 18
        return {
            userId = 1,
            username = "ExamplePlayer" .. tostring(p7),
            avatarImage = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(math.random(100000000, 999999999)) .. "&w=60&h=60",
            statValue = math.random(1400, 3000)
        };
    end;

    for i, v in v4 do
        v5[i] = v8(v, i - 1, v4);
    end;

    table.sort(v5, function(p9, p10) -- Line: 33
        return p9.statValue > p10.statValue;
    end);
    local v11 = {
        type = "UpdateLeaderboard",
        leaderboard = PlayfabLeaderboard.WinsMonthly
    };
    local v12 = {};

    for i, v in getLeaderboardMeta(PlayfabLeaderboard.WinsMonthly) do
        v12[i] = v;
    end;

    v12.nextReset = os.time() + math.random(100000, 1000000);
    v12.lastRefresh = os.time() - math.random(100, 1000);
    v12.users = v5;
    v12.leaderboardPosition = 63735;
    v12.localStatValue = 4667;
    v11.data = v12;
    ClientStore:dispatch(v11);
    local v13 = RankDistribution:getDisplayedRank(0, -1);
    local v14 = RankMeta[v13.division];
    local v15 = {
        rankStatValue = 25,
        image = v14.image,
        rankName = v14.name
    };
    local v16 = {
        type = "UpdateLeaderboard",
        leaderboard = RankUtil.activeRankMeta.leaderboard
    };
    local v17 = {};

    for i, v in getLeaderboardMeta(RankUtil.activeRankMeta.leaderboard) do
        v17[i] = v;
    end;

    v17.lastRefresh = os.time() - math.random(100, 1000);

    local function v22(p18) -- Line: 74
        -- upvalues: RankDistribution (ref), RankMeta (ref)
        local v19 = RankDistribution:getDisplayedRank(p18.statValue, -1);
        local v20 = RankMeta[v19.division];
        local v21 = {};

        for i, v in p18 do
            v21[i] = v;
        end;

        v21.statRank = {
            rankStatValue = 75,
            image = v20.image,
            rankName = v20.name
        };
        v21.statValue = v19.rankPoints;

        return v21;
    end;

    local v23 = table.create(#v5);

    for i, v in v5 do
        v23[i] = v22(v, i - 1, v5);
    end;

    v17.users = v23;
    v17.leaderboardPosition = 63735;
    v17.localStatRank = v15;
    v17.localStatValue = v13.rankPoints;
    v16.data = v17;
    ClientStore:dispatch(v16);
    local u28 = CreateRoduxApp("LeaderboardApp", function(p24) -- Line: 101, Name: leaderboard
        -- upvalues: getLeaderboardsToDisplay (ref), DEFAULT_LEADERBOARD_TO_DISPLAY (ref), u1 (ref), LeaderboardCore (ref)
        local v25 = {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(437, 700)
        };
        local v26 = {};
        local v27 = {
            Leaderboards = getLeaderboardsToDisplay(),
            DefaultLeaderboard = DEFAULT_LEADERBOARD_TO_DISPLAY
        };

        for i, v in p24 do
            v27[i] = v;
        end;

        v26[#v26 + 1] = u1.createElement(LeaderboardCore, v27);

        return u1.createElement("Frame", v25, v26);
    end, {
        LeaderboardName = RankUtil.activeRankMeta.leaderboard
    }, {}, {
        Parent = p3
    });

    return function() -- Line: 125
        -- upvalues: u1 (ref), u28 (copy)
        u1.unmount(u28);
    end;
end;
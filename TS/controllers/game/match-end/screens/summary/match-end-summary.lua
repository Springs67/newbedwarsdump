-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PlayerHighlights = RuntimeLib.import(script, script.Parent.Parent, "player-highlights", "ui", "player-highlights").PlayerHighlights;
local MatchEndProgress = RuntimeLib.import(script, script.Parent.Parent, "progress", "ui", "match-end-progress").MatchEndProgress;
local MatchEndStats = RuntimeLib.import(script, script.Parent.Parent, "stats", "ui", "match-end-stats").MatchEndStats;
local LobbyTimer = RuntimeLib.import(script, script.Parent, "ui", "lobby-timer").LobbyTimer;
local v4 = {};
local u5 = setmetatable({}, {
    __index = v4
});
u5.PROGRESS = "PROGRESS";
v4.PROGRESS = "PROGRESS";
u5.STATS = "STATS";
v4.STATS = "STATS";
u5.HIGHLIGHTS = "HIGHLIGHTS";
v4.HIGHLIGHTS = "HIGHLIGHTS";

local function v38(p6, p7) -- Line: 28
    -- upvalues: u5 (ref), u2 (copy), ColorUtil (copy), DeviceUtil (copy), TweenService (copy), LobbyTimer (copy), Button (copy), Theme (copy), MatchEndProgress (copy), MatchEndStats (copy), PlayerHighlights (copy)
    local useEffect = p7.useEffect;
    local v8, u9 = p7.useState(u5.PROGRESS);
    local u10 = u2.createRef();
    local v11 = ColorUtil.hexColor(6645940);
    local v12 = ColorUtil.hexColor(3026766);
    useEffect(function() -- Line: 35
        -- upvalues: u10 (copy), DeviceUtil (ref), TweenService (ref)
        local u13 = u10:getValue();
        task.spawn(function() -- Line: 37
            -- upvalues: DeviceUtil (ref), TweenService (ref), u13 (copy)
            if DeviceUtil.isHoarceKat() then
                task.wait(0.5);
            end;

            TweenService:Create(u13, TweenInfo.new(0.3, Enum.EasingStyle.Cubic), {
                Position = UDim2.fromScale(0, 0)
            }):Play();
        end);
    end);
    local v14 = {
        Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, 110),
        BackgroundTransparency = 1
    };
    local createElement = u2.createElement;
    local v15 = {
        LobbyTimerWrapper = u2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 30 or 50),
            Position = UDim2.fromOffset(0, -90),
            BackgroundTransparency = 1,
            [u2.Ref] = u10
        }, { u2.createElement(LobbyTimer, {
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.new(0.5, 0, 0, DeviceUtil.isSmallScreen() and 5 or 10)
            }) })
    };
    local createElement2 = u2.createElement;
    local v16 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(DeviceUtil.isSmallScreen() and 0.98 or 0.8, 1),
        Position = UDim2.new(0.5, 0, 0.5, DeviceUtil.isSmallScreen() and 35 or 50),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = DeviceUtil.isHoarceKat() and true or p6.store.Game.matchEndSummaryVisible
    };
    local v17 = {};
    local createElement3 = u2.createElement;
    local v18 = {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 30 or 40),
        Position = UDim2.fromScale(0, 0),
        AnchorPoint = Vector2.new(0, 0)
    };
    local v19 = {};
    local createElement4 = u2.createElement;
    local v20 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1)
    };
    local v21 = {};
    local v22 = u2.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5)
    });
    local createElement5 = u2.createElement;
    local v23 = {
        Text = "<b>PROGRESS</b>",
        LayoutOrder = 0,
        Size = UDim2.new(0, DeviceUtil.isSmallScreen() and 90 or 150, 1, 0)
    };
    local v24;

    if v8 == u5.PROGRESS then
        v24 = v11;
    else
        v24 = v12;
    end;

    v23.BackgroundColor3 = v24;
    local v25 = {};
    local v26;

    if v8 == u5.PROGRESS then
        v26 = ColorUtil.WHITE;
    else
        v26 = Theme.textSecondary;
    end;

    v25.TextColor3 = v26;
    v23.TextLabel = v25;
    v23.CornerRadius = UDim.new(0, 10);

    function v23.OnClick() -- Line: 95
        -- upvalues: u9 (copy), u5 (ref)
        u9(u5.PROGRESS);
    end;

    local v27 = createElement5(Button, v23);
    local createElement6 = u2.createElement;
    local v28 = {
        Text = "<b>STATS</b>",
        LayoutOrder = 1,
        Size = UDim2.new(0, DeviceUtil.isSmallScreen() and 90 or 100, 1, 0)
    };
    local v29;

    if v8 == u5.STATS then
        v29 = v11;
    else
        v29 = v12;
    end;

    v28.BackgroundColor3 = v29;
    local v30 = {};
    local v31;

    if v8 == u5.STATS then
        v31 = ColorUtil.WHITE;
    else
        v31 = Theme.textSecondary;
    end;

    v30.TextColor3 = v31;
    v28.TextLabel = v30;
    v28.CornerRadius = UDim.new(0, 10);

    function v28.OnClick() -- Line: 108
        -- upvalues: u9 (copy), u5 (ref)
        u9(u5.STATS);
    end;

    v21[1], v21[2], v21[3] = v22, v27, createElement6(Button, v28);
    v19.MatchSummaryTabButtonsLeft = createElement4("Frame", v20, v21);
    local createElement7 = u2.createElement;
    local v32 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1)
    };
    local v33 = {};
    local v34 = u2.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5)
    });
    local createElement8 = u2.createElement;
    local v35 = {
        Text = "<b>HIGHLIGHTS</b>",
        LayoutOrder = 0,
        Size = UDim2.new(0, DeviceUtil.isSmallScreen() and 90 or 150, 1, 0)
    };

    if v8 ~= u5.HIGHLIGHTS then
        v11 = v12;
    end;

    v35.BackgroundColor3 = v11;
    local v36 = {};
    local v37;

    if v8 == u5.HIGHLIGHTS then
        v37 = ColorUtil.WHITE;
    else
        v37 = Theme.textSecondary;
    end;

    v36.TextColor3 = v37;
    v35.TextLabel = v36;
    v35.CornerRadius = UDim.new(0, 10);

    function v35.OnClick() -- Line: 133
        -- upvalues: u9 (copy), u5 (ref)
        u9(u5.HIGHLIGHTS);
    end;

    v35.Visible = p6.PlayerHighlights ~= nil;
    v33[1], v33[2] = v34, createElement8(Button, v35);
    v19.MatchSummaryTabButtonsRight = createElement7("Frame", v32, v33);
    v17.MatchSummaryTabButtons = createElement3("Frame", v18, v19);
    v17[1], v17[2], v17[3] = u2.createElement(MatchEndProgress, {
    DisableAnimation = true,
    WinningTeamId = p6.WinningTeamId,
    BattlePassMatchExperienceEarned = p6.BattlePassMatchExperienceEarned,
    PlayerMatchExperienceEarned = p6.PlayerMatchExperienceEarned,
    BedCoinsEarned = p6.BedCoinsEarned,
    ClanContributionEarned = p6.ClanContributionEarned,
    RankChangeData = p6.RankChangeData,
    MissionProgress = p6.MissionProgress,
    ArmorTrimXpEarned = p6.ArmorTrimXpEarned,
    KitStatsDelta = p6.KitStatsDelta,
    EquippedKit = p6.EquippedKit,
    Visible = v8 == u5.PROGRESS
}), u2.createElement(MatchEndStats, {
    DisableAnimation = true,
    store = p6.store,
    TrackedStats = p6.TrackedStats,
    PreviousLeaderboardPosition = p6.PreviousLeaderboardPosition,
    NewLeaderboardPosition = p6.NewLeaderboardPosition,
    WinningTeamId = p6.WinningTeamId,
    Visible = v8 == u5.STATS
}), u2.createElement(PlayerHighlights, {
    DisableAnimation = true,
    cards = p6.PlayerHighlights,
    Visible = v8 == u5.HIGHLIGHTS
});
    v15.MatchSummaryWrapper = createElement2("Frame", v16, v17);

    return createElement("Frame", v14, v15);
end;

local u39 = nil;

local function MatchEndSummaryAppWrapper(p40) -- Line: 173
    -- upvalues: u2 (copy), u39 (ref)
    local v41 = {};
    local v42 = {};
    local v43 = {
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        DisplayOrder = 101
    };

    for i, v in p40 do
        v42[i] = v;
    end;

    v41[#v41 + 1] = u2.createElement(u39, v42);

    return u2.createElement("ScreenGui", v43, v41);
end;

u39 = v3.new(u2)(v38);

return {
    MatchEndSummaryAppWrapper = MatchEndSummaryAppWrapper,
    MatchEndSummaryTab = u5,
    MatchEndSummaryApp = u39
};
-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking");
local CATEGORY_TO_ICON = v5.CATEGORY_TO_ICON;
local STAT_TO_CATEGORY = v5.STAT_TO_CATEGORY;
local STAT_TO_DESCRIPTION = v5.STAT_TO_DESCRIPTION;
local TrackType = v5.TrackType;
local TYPE_PRIORITY = v5.TYPE_PRIORITY;
local StatTrackingUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking-util").StatTrackingUtil;
local MatchEndScreensMeta = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "match-end-screen-meta").MatchEndScreensMeta;
local LeaderboardPosition = RuntimeLib.import(script, script.Parent, "leaderboard", "leaderboard-position").LeaderboardPosition;
local u6 = RuntimeLib.import(script, script.Parent, "winstreak", "winstreak-section");
local u7 = nil;

local function MatchEndStatsWrapper(p8) -- Line: 257
    -- upvalues: u3 (copy), DeviceUtil (copy), u7 (ref)
    local v9 = {};
    local v10 = {
        Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, 110),
        BackgroundTransparency = 1
    };
    v9[#v9 + 1] = u3.createElement("Frame", v10, { u3.createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(DeviceUtil.isSmallScreen() and 0.98 or 0.8, 1),
            Position = UDim2.new(0.5, 0, 0.5, DeviceUtil.isSmallScreen() and 35 or 50),
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, { u3.createElement(u7, {
                store = p8.store,
                WinningTeamId = p8.WinningTeamId,
                PreviousLeaderboardPosition = p8.PreviousLeaderboardPosition,
                NewLeaderboardPosition = p8.NewLeaderboardPosition,
                TrackedStats = p8.TrackedStats,
                DisableAnimation = p8.DisableAnimation
            }) }) });

    return u3.createElement("ScreenGui", {
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        DisplayOrder = 101
    }, v9);
end;

u7 = v4.new(u3)(function(u11, p12) -- Line: 22
    -- upvalues: u3 (copy), DeviceUtil (copy), u2 (copy), StatTrackingUtil (copy), TweenService (copy), UIUtil (copy), MatchEndScreensMeta (copy), CATEGORY_TO_ICON (copy), STAT_TO_CATEGORY (copy), STAT_TO_DESCRIPTION (copy), TrackType (copy), ColorUtil (copy), TYPE_PRIORITY (copy), AutoCanvasScrollingFrame (copy), LeaderboardPosition (copy), u6 (copy)
    local _ = p12.useState;
    local useEffect = p12.useEffect;
    local u13 = u3.createRef();
    local u14 = u3.createRef();
    local u15 = UDim2.new(1, 0, DeviceUtil.isSmallScreen() and 0.6 or 0, (not u11.TrackedStats or DeviceUtil.isSmallScreen()) and 0 or #u2.entries(StatTrackingUtil.MATCH_TYPES) * 32 + 20);
    local v16;

    if u11.PreviousLeaderboardPosition == nil then
        v16 = false;
    else
        v16 = u11.NewLeaderboardPosition ~= nil;
    end;

    useEffect(function() -- Line: 30
        -- upvalues: u14 (copy), u13 (copy), u11 (copy), u15 (copy), DeviceUtil (ref), TweenService (ref), UIUtil (ref), MatchEndScreensMeta (ref)
        local u17 = u14:getValue();
        local u18 = u13:getValue();
        task.spawn(function() -- Line: 33
            -- upvalues: u11 (ref), u18 (copy), u15 (ref), DeviceUtil (ref), TweenService (ref), UIUtil (ref), u17 (copy), MatchEndScreensMeta (ref)
            if u11.DisableAnimation then
                u18.Size = u15;

                return nil;
            end;

            if DeviceUtil.isHoarceKat() then
                task.wait(0.1);
            end;

            local v19 = TweenInfo.new(0.4, Enum.EasingStyle.Cubic);

            if u11.TrackedStats then
                TweenService:Create(u18, v19, {
                    Size = u15
                }):Play();
            end;

            UIUtil:setContainerTransparency(u17, 1, {
                onSetTweenInfo = TweenInfo.new(0),
                onCleanUpTweenInfo = v19
            }):DoCleaning();
            local displaySecs = MatchEndScreensMeta[5].displaySecs;
            local u20 = TweenInfo.new(0.5, Enum.EasingStyle.Cubic);
            task.delay((displaySecs == nil and 1 or displaySecs) - 0.5, function() -- Line: 59
                -- upvalues: u11 (ref), TweenService (ref), u18 (ref), UIUtil (ref), u17 (ref), u20 (copy)
                if u11.TrackedStats then
                    TweenService:Create(u18, TweenInfo.new(0.4, Enum.EasingStyle.Cubic), {
                        Size = UDim2.new(1, 0, 0, 0)
                    }):Play();
                end;

                UIUtil:setContainerTransparency(u17, 1, {
                    onSetTweenInfo = u20
                });
            end);
        end);
    end);
    local TrackedStats = u11.TrackedStats;

    if TrackedStats then
        local TrackedStats2 = u11.TrackedStats;

        if TrackedStats2 then
            local function v26(p21, p22) -- Line: 75
                -- upvalues: u11 (copy), StatTrackingUtil (ref), CATEGORY_TO_ICON (ref), STAT_TO_CATEGORY (ref), STAT_TO_DESCRIPTION (ref), TrackType (ref), u3 (ref), DeviceUtil (ref), ColorUtil (ref)
                if not u11.TrackedStats then
                    return nil;
                end;

                if table.find(StatTrackingUtil.MATCH_TYPES, p21) == nil then
                    return nil;
                end;

                local v23 = CATEGORY_TO_ICON[STAT_TO_CATEGORY[p21]];
                local v24 = STAT_TO_DESCRIPTION[p21];
                local v25 = u11.TrackedStats[p21];

                if p21 == TrackType.HEALING or (p21 == TrackType.DAMAGE or p21 == TrackType.PROJECTILEDAMAGE) then
                    v25 = math.ceil(v25);
                end;

                return u3.createElement("Frame", {
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 20 or 24),
                    LayoutOrder = p22
                }, {
                    u3.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.fromScale(0.1, 1),
                        Position = UDim2.fromScale(0, 0.5),
                        AnchorPoint = Vector2.new(0, 0.5),
                        Image = v23,
                        ScaleType = Enum.ScaleType.Fit
                    }, { u3.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) }),
                    MatchStatsTitle = u3.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0.9, 1),
                        Position = UDim2.fromScale(0.1, 0),
                        Text = v24,
                        TextColor3 = ColorUtil.WHITE,
                        TextSize = DeviceUtil.isSmallScreen() and 18 or 24,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    }),
                    MatchStatsValue = u3.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(DeviceUtil.isSmallScreen() and 0.95 or 1, 1),
                        Text = tostring(v25),
                        TextColor3 = ColorUtil.WHITE,
                        TextSize = DeviceUtil.isSmallScreen() and 18 or 24,
                        TextXAlignment = Enum.TextXAlignment.Right,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    })
                });
            end;

            local v27 = 0;
            local v28 = {};

            for i, v in TYPE_PRIORITY do
                local v29 = v26(v, i - 1, TYPE_PRIORITY);

                if v29 ~= nil then
                    v27 = v27 + 1;
                    v28[v27] = v29;
                end;
            end;

            local v30 = {
                ScrollingFrameProps = {
                    Size = UDim2.fromScale(DeviceUtil.isSmallScreen() and 0.9 or 0.8, DeviceUtil.isSmallScreen() and 0.9 or 1),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5)
                }
            };
            local v31 = { u3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, DeviceUtil.isSmallScreen() and 4 or 8)
                }) };
            local v32 = #v31;

            for i, v in v28 do
                v31[v32 + i] = v;
            end;

            TrackedStats2 = u3.createFragment({
                StatsWrapper = u3.createElement(AutoCanvasScrollingFrame, v30, v31)
            });
        end;

        local v33 = {
            Size = UDim2.fromScale(1, 0),
            BorderSizePixel = 0,
            BackgroundColor3 = ColorUtil.BLACK,
            BackgroundTransparency = 0.7,
            LayoutOrder = 1,
            ClipsDescendants = true,
            [u3.Ref] = u13
        };
        local v34 = {
            u3.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(400, (1 / 0))
            }),
            u3.createElement("UICorner", {
                CornerRadius = UDim.new(0.05, 0)
            }),
            [#v34 + 1] = TrackedStats2
        };
        TrackedStats = u3.createFragment({
            StatsContainer = u3.createElement("Frame", v33, v34)
        });
    end;

    local v35 = {
        Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 1 or 0.8),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, DeviceUtil.isSmallScreen() and 20 or 0),
        BackgroundTransparency = 1,
        Visible = u11.Visible,
        [u3.Ref] = u14
    };
    local v36 = {
        u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.05, 0)
        }),
        MatchStatsTitle = u3.createElement("TextLabel", {
            Text = "MATCH STATS",
            TextScaled = true,
            LayoutOrder = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0.1),
            TextColor3 = ColorUtil.WHITE,
            Font = Enum.Font.LuckiestGuy
        })
    };
    local v37 = #v36;

    if TrackedStats then
        v36[v37 + 1] = TrackedStats;
    end;

    local _ = #v36;
    local v38 = {
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Size = UDim2.fromScale(0.85, DeviceUtil.isSmallScreen() and 0.2 or 0.14)
    };
    local v39 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.04, 0)
        }) };
    local v40 = #v39;

    if v16 then
        v16 = u3.createElement(LeaderboardPosition, {
            PreviousLeaderboardPos = u11.PreviousLeaderboardPosition,
            NewLeaderboardPos = u11.NewLeaderboardPosition,
            FrameProps = {
                Size = UDim2.fromScale(0.4, 1)
            }
        });
    end;

    if v16 then
        v39[v40 + 1] = v16;
    end;

    v39[#v39 + 1] = u3.createElement(u6, {
        store = u11.store,
        FrameProps = {
            Size = UDim2.fromScale(0.4, 1)
        },
        WinningTeamId = u11.WinningTeamId
    });
    v36.BottomWrapper = u3.createElement("Frame", v38, v39);

    return u3.createFragment({
        MatchStatsWrapper = u3.createElement("Frame", v35, v36)
    });
end);

return {
    MatchEndStatsWrapper = MatchEndStatsWrapper,
    MatchEndStats = u7
};
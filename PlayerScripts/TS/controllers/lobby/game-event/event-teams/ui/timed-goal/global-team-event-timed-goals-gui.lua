-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local StringUtil = v1.StringUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local Logger = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").Logger;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local GlobalTeamsUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-util").GlobalTeamsUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local EventAppNavlink = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "event-navbar", "event-app-navlink").EventAppNavlink;
local GlobalTeamEventGoalsOverview = RuntimeLib.import(script, script.Parent, "global-team-event-timed-goals-overview").GlobalTeamEventGoalsOverview;
local GlobalTeamEventTimedGoalsRiddleCard = RuntimeLib.import(script, script.Parent, "global-team-event-timed-goals-riddle-card").GlobalTeamEventTimedGoalsRiddleCard;
local GlobalTeamTimedGoalRewardBox = RuntimeLib.import(script, script.Parent, "global-team-timed-goal-reward-box").GlobalTeamTimedGoalRewardBox;

return {
    GlobalTeamTimedGoalsGUI = v4.new(u3)(function(u5, p6) -- Line: 27
        -- upvalues: GlobalTeamsUtil (copy), Logger (copy), u3 (copy), Empty (copy), ClientStore (copy), DeviceUtil (copy), KnitClient (copy), u2 (copy), default (copy), SoundManager (copy), GameSound (copy), Theme (copy), GlobalTeamEventGoalsOverview (copy), GlobalTeamEventTimedGoalsRiddleCard (copy), EventAppNavlink (copy), ColorUtil (copy), Padding (copy), StringUtil (copy), GlobalTeamTimedGoalRewardBox (copy), AutoCanvasScrollingFrame (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local u7 = 0;
        local u8 = GlobalTeamsUtil.getGlobalTeamEventKeyFromEventType(u5.EventType);

        if not u8 then
            Logger:default():Debug("Missing globalTeamEventKey");

            return u3.createFragment({
                NoGlobalTeamEvent = u3.createElement(Empty)
            });
        end;

        local u9 = GlobalTeamsUtil.getGlobalTeamEventMeta(u8);
        local u10, u11 = useState({});
        local u12, u13 = useState(0);
        local u14, u15 = useState(nil);
        local v16;

        if u14 == nil then
            v16 = u14;
        else
            local timedGoal = u14.timedGoal;
            v16 = timedGoal ~= nil and #timedGoal.rewards or timedGoal;
        end;

        local u17, u18 = useState(1500 / (v16 == nil and 1 or v16));
        local v19, u20 = useState(0);
        local u21, u22 = useState(nil);
        local u23, u24 = useState(ClientStore:getState().Event.profileData.events[u5.EventType]);
        local u25, _ = useState(u3.createRef());
        local v26 = GlobalTeamsUtil.getTimedGoalsForTeam(u5.EventType, u5.GlobalTeamKey);

        if not v26 then
            Logger:default():Debug("Missing allTimedGoals");

            return u3.createFragment({
                NoTimedGoals = u3.createElement(Empty)
            });
        end;

        local v27 = #v26 - 1;
        local v28 = false;
        local v29 = nil;
        local v30;

        while true do
            if v28 then
                v27 = v27 - 1;
            else
                v28 = true;
            end;

            if v27 < 0 then
                v30 = v29;
                break;
            end;

            v30 = v26[v27 + 1];

            if GlobalTeamsUtil.isTimedGoalActive(v30) then
                break;
            end;
        end;

        if not v30 then
            local _ = v26[1];
        end;

        useEffect(function() -- Line: 94
            -- upvalues: DeviceUtil (ref), ClientStore (ref), u8 (copy), KnitClient (ref), u22 (copy), u23 (copy), u11 (copy), u24 (copy), u5 (copy), u2 (ref), u9 (copy), GlobalTeamsUtil (ref), u15 (copy), default (ref), u14 (copy)
            local u31 = true;
            local v32;

            if DeviceUtil.isHoarceKat() then
                v32 = ClientStore:getState().Event.globalTeamEventDataMap[u8];
            else
                v32 = KnitClient.Controllers.GlobalTeamsController:getLocalGlobalEventData(u8);
            end;

            u22(v32);
            local v33 = u23;

            if v33 ~= nil then
                v33 = v33.claimedGlobalTeamRewards;
            end;

            u11(v33 == nil and {} or v33);
            u24(ClientStore:getState().Event.profileData.events[u5.EventType]);

            local function _(p34) -- Line: 114
                -- upvalues: GlobalTeamsUtil (ref)
                return GlobalTeamsUtil.isTimedGoalActive(p34);
            end;

            local v35 = nil;

            for i, v in u2.values(u9.timedGoals[u5.GlobalTeamKey]) do
                local _ = i - 1;

                if GlobalTeamsUtil.isTimedGoalActive(v) == true then
                    v35 = v;
                    break;
                end;
            end;

            if v35 then
                if v32 ~= nil then
                    v32 = v32.globalTeams[u5.GlobalTeamKey];

                    if v32 ~= nil then
                        v32 = v32.timedGoalsData;

                        if v32 ~= nil then
                            v32 = v32[v35.key];
                        end;
                    end;
                end;

                u15({
                    timedGoal = v35,
                    score = v32 == nil and 0 or v32
                });
            end;

            local u36;

            if DeviceUtil.isHoarceKat() then
                u36 = nil;
            else
                u36 = default.Client:Get("GlobalTeamScoresUpdatedServerToClient"):Connect(function(p37) -- Line: 155
                    -- upvalues: u31 (ref), u22 (ref), u5 (ref), u14 (ref), u15 (ref)
                    if u31 then
                        return nil;
                    end;

                    u22(p37.globalTeamEventData);
                    local v38 = p37.globalTeamEventData.globalTeams[u5.GlobalTeamKey];

                    if v38 ~= nil then
                        local timedGoalsData = v38.timedGoalsData;

                        if timedGoalsData ~= nil then
                            local function _(p39, p40) -- Line: 166
                                -- upvalues: u14 (ref), u15 (ref)
                                local v41 = u14;

                                if v41 ~= nil then
                                    v41 = v41.timedGoal.key;
                                end;

                                if v41 == p40 then
                                    u15({
                                        timedGoal = u14.timedGoal,
                                        score = p39
                                    });
                                end;
                            end;

                            for i, v in timedGoalsData do
                                local v42 = u14;

                                if v42 ~= nil then
                                    v42 = v42.timedGoal.key;
                                end;

                                if v42 == i then
                                    u15({
                                        timedGoal = u14.timedGoal,
                                        score = v
                                    });
                                end;
                            end;
                        end;
                    end;
                end);
            end;

            return function() -- Line: 185
                -- upvalues: u31 (ref), u36 (ref)
                u31 = false;
                local v43 = u36;

                if v43 ~= nil then
                    v43:Disconnect();
                end;
            end;
        end, {});
        useEffect(function() -- Line: 194
            -- upvalues: u14 (copy), u23 (copy), u5 (copy), u13 (copy), u18 (copy), u20 (copy), u25 (copy)
            local v44 = u14;

            if v44 ~= nil then
                v44 = v44.timedGoal;
            end;

            local u45 = u14;

            if u45 ~= nil then
                u45 = u45.score;
            end;

            if v44 and u45 ~= nil then
                if u23 then
                    local timedGoals = u23.timedGoals;

                    if timedGoals ~= nil then
                        timedGoals = timedGoals[u5.GlobalTeamKey];

                        if timedGoals ~= nil then
                            timedGoals = timedGoals[v44.key];
                        end;
                    end;

                    u13(timedGoals == nil and 0 or timedGoals);
                end;

                local v46 = 1500 / #v44.rewards;
                u18(v46);
                local u47 = 0;

                local function _(p48) -- Line: 226
                    -- upvalues: u45 (copy), u47 (ref)
                    if p48.globalTeamScoreRequired <= u45 then
                        u47 = u47 + 1;
                    end;
                end;

                for i, v in v44.rewards do
                    local _ = i - 1;

                    if v.globalTeamScoreRequired <= u45 then
                        u47 = u47 + 1;
                    end;
                end;

                local function _(p49) -- Line: 235
                    -- upvalues: u45 (copy)
                    return u45 < p49.globalTeamScoreRequired;
                end;

                local v50 = -1;

                for i, v in v44.rewards do
                    local _ = i - 1;

                    if u45 < v.globalTeamScoreRequired == true then
                        v50 = i - 1;
                        break;
                    end;
                end;

                local v51 = v50 - 1;

                if v44.rewards[#v44.rewards - 1 + 1].globalTeamScoreRequired <= u45 then
                    v50 = #v44.rewards - 1;
                    v51 = #v44.rewards - 1;
                end;

                local v52 = v44.rewards[v50 + 1].globalTeamScoreRequired - (v51 < 0 and 0 or v44.rewards[v51 + 1].globalTeamScoreRequired);
                local v53 = u47 * v46 + (v52 == 0 and 0 or (u45 - (v51 < 0 and 0 or v44.rewards[v51 + 1].globalTeamScoreRequired)) / v52) * v46;
                u20(v53);
                local v54 = u25:getValue();

                if v54 then
                    v54.CanvasPosition = Vector2.new(0, 1500 - v53 + v46);
                end;
            end;
        end, { u14 });

        local function u60(p55, p56) -- Line: 267
            -- upvalues: u10 (copy), u7 (ref), default (ref), u8 (copy), SoundManager (ref), GameSound (ref), u11 (copy)
            if table.find(u10, p56) ~= nil then
                return nil;
            end;

            if tick() - u7 < 0.5 then
                return nil;
            end;

            u7 = tick();

            if not default.Client:Get("TryToClaimGlobalTimedGoalReward"):CallServer({
                globalTeamEventKey = u8,
                timedGoalKey = p55,
                rewardId = p56
            }) then
                return nil;
            end;

            SoundManager:playSound(GameSound.UI_REWARD);
            local v57 = {};
            local v58 = #v57;
            local v59 = #u10;
            table.move(u10, 1, v59, v58 + 1, v57);
            v57[v58 + v59 + 1] = p56;
            u11(v57);
        end;

        local v61 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local v62 = { u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0.03, 0),
                PaddingBottom = UDim.new(0.03, 0),
                PaddingLeft = UDim.new(0.02, 0),
                PaddingRight = UDim.new(0.02, 0)
            }) };
        local _ = #v62;
        local v63 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 1)
        };
        local v64 = {};
        local v65 = {
            Size = UDim2.fromScale(0.265, 1)
        };
        local v66 = { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 8),
                VerticalFlex = Enum.UIFlexAlignment.SpaceBetween
            }), u3.createElement(GlobalTeamEventGoalsOverview, {
                CurrentTimedGoalData = u14
            }), u3.createElement(GlobalTeamEventTimedGoalsRiddleCard, {
                CurrentTimedGoalData = u14
            }) };
        local _ = #v66;

        local function v73(u67, p68) -- Line: 338
            -- upvalues: u14 (copy), u21 (copy), u5 (copy), u15 (copy), u3 (ref), EventAppNavlink (ref)
            local v69 = {
                Text = u67.name,
                SubText = os.date("%m/%d", u67.startTime) .. " - " .. os.date("%m/%d", u67.endTime),
                Page = u67.key
            };
            local v70 = u14;

            if v70 ~= nil then
                v70 = v70.timedGoal.key;
            end;

            v69.ActivePage = v70 == nil and "" or v70;

            function v69.OnClick() -- Line: 353
                -- upvalues: u67 (copy), u21 (ref), u5 (ref), u15 (ref)
                local v71 = {
                    timedGoal = u67
                };
                local v72 = u21;

                if v72 ~= nil then
                    v72 = v72.globalTeams[u5.GlobalTeamKey];

                    if v72 ~= nil then
                        v72 = v72.timedGoalsData;

                        if v72 ~= nil then
                            v72 = v72[u67.key];
                        end;
                    end;
                end;

                v71.score = v72 == nil and 0 or v72;
                u15(v71);
            end;

            v69.ThemeColor = Color3.fromRGB(255, 214, 36);

            return u3.createElement(EventAppNavlink, v69);
        end;

        local v74 = table.create(#v26);

        for i, v in v26 do
            v74[i] = v73(v, i - 1, v26);
        end;

        local v75 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.2),
            Position = UDim2.fromScale(0.05, 0.725),
            AnchorPoint = Vector2.new(0, 0.5)
        };
        local v76 = { u3.createElement("UIGridLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                FillDirectionMaxCells = 2,
                CellSize = UDim2.fromScale(0.45, 0.45),
                CellPadding = UDim2.fromScale(0.02, 0.02)
            }) };
        local v77 = #v76;

        for i, v in v74 do
            v76[v77 + i] = v;
        end;

        v66.TimedGoalsNavbar = u3.createElement(Empty, v75, v76);
        v64.SideTab = u3.createElement(Empty, v65, v66);
        local v78;

        if u14 == nil then
            v78 = u3.createFragment({
                GlobalTeamEventTimedGoalsErrorText = u3.createElement("TextLabel", {
                    Text = "No timed goal selected",
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(1, 1),
                    TextColor3 = ColorUtil.WHITE,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                })
            });
        else
            local v79 = {
                ScrollingFrameProps = {
                    LayoutOrder = 2,
                    Selectable = false,
                    Size = UDim2.fromScale(1, 1),
                    CanvasSize = UDim2.new(1, 0, 0, 1580)
                },
                ScrollingFrameRef = u25
            };
            local v80 = {};
            local _ = #v80;
            local v81 = {
                BackgroundTransparency = 0,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 1)
            };
            local v82 = { u3.createElement(Padding, {
                    Padding = {
                        Vertical = 60,
                        Right = 60,
                        Left = 80
                    }
                }), u3.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    SortOrder = "LayoutOrder",
                    HorizontalAlignment = "Right",
                    Padding = UDim.new(0, 10)
                }) };
            local _ = #v82;
            local rewards = u14.timedGoal.rewards;

            local function v85(p83, p84) -- Line: 457
                -- upvalues: u3 (ref), u17 (copy), StringUtil (ref), ColorUtil (ref)
                return u3.createElement("Frame", {
                    BackgroundTransparency = 1,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.fromOffset(0, 1500 - (p84 + 1) * u17),
                    Size = UDim2.fromScale(1, 0.015)
                }, {
                    GlobalTeamEventRewardScoreRequirement = u3.createElement("TextLabel", {
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        TextXAlignment = "Right",
                        Text = StringUtil.formatNumberWithCommas(p83.globalTeamScoreRequired),
                        Size = UDim2.fromScale(1, 1),
                        TextColor3 = ColorUtil.WHITE,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    })
                });
            end;

            local v86 = table.create(#rewards);

            for i, v in rewards do
                v86[i] = v85(v, i - 1, rewards);
            end;

            local v87 = {
                BackgroundTransparency = 1,
                LayoutOrder = 100,
                Size = UDim2.new(0.3, 0, 0, 1500)
            };
            local v88 = {};
            local v89 = #v88;

            for i, v in v86 do
                v88[v89 + i] = v;
            end;

            v82.GlobalTeamEventRewardScoreRequirementsColumn = u3.createElement("Frame", v87, v88);
            local rewards2 = u14.timedGoal.rewards;

            local function v92(p90, p91) -- Line: 493
                -- upvalues: u14 (copy), u3 (ref), u17 (copy), ColorUtil (ref)
                if p91 == #u14.timedGoal.rewards - 1 then
                    return nil;
                end;

                return u3.createElement("Frame", {
                    BackgroundTransparency = 0.6,
                    BorderSizePixel = 0,
                    ZIndex = 100,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.fromOffset(0, 1500 - (p91 + 1) * u17),
                    Size = UDim2.new(1, 0, 0, 2),
                    BackgroundColor3 = ColorUtil.BLACK
                });
            end;

            local v93 = 0;
            local v94 = {};

            for i, v in rewards2 do
                local v95 = v92(v, i - 1, rewards2);

                if v95 ~= nil then
                    v93 = v93 + 1;
                    v94[v93] = v95;
                end;
            end;

            local v96 = {
                BorderSizePixel = 5,
                BackgroundTransparency = 0,
                LayoutOrder = 200,
                Size = UDim2.new(0, 75, 0, 1500),
                BackgroundColor3 = Theme.backgroundTertiary,
                Position = UDim2.fromScale(0.5, 0),
                AnchorPoint = Vector2.new(0.5, 0)
            };
            local v97 = {
                u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.1, 0)
                }),
                GlobalTeamEventRewardProgressBar = u3.createElement("Frame", {
                    BorderSizePixel = 0,
                    BackgroundTransparency = 0,
                    Size = UDim2.new(0.9, 0, 0, v19),
                    Position = UDim2.fromScale(0.5, 1),
                    AnchorPoint = Vector2.new(0.5, 1),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                }, { u3.createElement("UICorner", {
                        CornerRadius = UDim.new(0.1, 0)
                    }), u3.createElement("UIGradient", {
                        Rotation = 90,
                        Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 193, 73)), ColorSequenceKeypoint.new(1, Color3.fromRGB(153, 116, 44)) })
                    }) })
            };
            local v98 = #v97;

            for i, v in v94 do
                v97[v98 + i] = v;
            end;

            v82.GlobalTeamEventRewardProgressBarContainer = u3.createElement("Frame", v96, v97);
            local rewards3 = u14.timedGoal.rewards;

            local function v104(u99, p100) -- Line: 555
                -- upvalues: u17 (copy), u14 (copy), u10 (copy), u8 (copy), u60 (copy), u12 (copy), u3 (ref), GlobalTeamTimedGoalRewardBox (ref)
                local v101 = {
                    BackgroundTransparency = 1,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.fromOffset(0, 1500 - (p100 + 1) * u17),
                    Size = UDim2.new(1, 0, 0, 80)
                };
                local v102 = {};
                local v103 = {
                    RewardData = u99,
                    Score = u14.score,
                    Claimed = table.find(u10, u99.globalTeamRewardId) ~= nil,
                    GlobalTeamEventKey = u8,

                    OnClaimClick = function() -- Line: 571
                        -- upvalues: u60 (ref), u14 (ref), u99 (copy)
                        return u60(u14.timedGoal.key, u99.globalTeamRewardId);
                    end,

                    HasEnoughPoints = u14.score >= u99.globalTeamScoreRequired,
                    PersonalScoreContribution = u12
                };
                v102[#v102 + 1] = u3.createElement(GlobalTeamTimedGoalRewardBox, v103);

                return u3.createElement("Frame", v101, v102);
            end;

            local v105 = table.create(#rewards3);

            for i, v in rewards3 do
                v105[i] = v104(v, i - 1, rewards3);
            end;

            local v106 = {
                BackgroundTransparency = 1,
                LayoutOrder = 300,
                Size = UDim2.new(0.4, 0, 0, 1500),
                BackgroundColor3 = ColorUtil.BLACK
            };
            local v107 = {};
            local v108 = #v107;

            for i, v in v105 do
                v107[v108 + i] = v;
            end;

            v82.GlobalTeamEventRewardBoxesColumn = u3.createElement("Frame", v106, v107);
            v80.GlobalTeamFrameContainer = u3.createElement(Empty, v81, v82);
            v78 = u3.createFragment({
                GlobalTeamRewardsList = u3.createElement(AutoCanvasScrollingFrame, v79, v80)
            });
        end;

        v64[#v64 + 1] = v78;
        v62.TimedGoalsContent = u3.createElement(Empty, v63, v64);

        return u3.createFragment({
            GlobalTeamTimedGoalsGUI = u3.createElement("Frame", v61, v62)
        });
    end)
};
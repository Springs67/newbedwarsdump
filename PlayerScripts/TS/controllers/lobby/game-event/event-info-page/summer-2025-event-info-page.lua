-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Countdown = v1.Countdown;
local Empty = v1.Empty;
local Padding = v1.Padding;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local RewardList = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-list").RewardList;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata");
local EventCurrencyType = v6.EventCurrencyType;
local EventType = v6.EventType;
local Summer2025Constants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "summer-2025", "summer-2025-constants").Summer2025Constants;
local GameReset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game-reset", "game-reset").GameReset;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-types");
local GlobalTeamEventKey = v7.GlobalTeamEventKey;
local GlobalTeamKey = v7.GlobalTeamKey;
local GlobalTeamsUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-util").GlobalTeamsUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PillCounter = RuntimeLib.import(script, script.Parent.Parent.Parent, "clan", "ui", "profile", "war-tab", "pill-counter").PillCounter;
local GlobalTeamEventGoalsOverview = RuntimeLib.import(script, script.Parent.Parent, "event-teams", "ui", "timed-goal", "global-team-event-timed-goals-overview").GlobalTeamEventGoalsOverview;
local GlobalTeamEventTimedGoalsRiddleCard = RuntimeLib.import(script, script.Parent.Parent, "event-teams", "ui", "timed-goal", "global-team-event-timed-goals-riddle-card").GlobalTeamEventTimedGoalsRiddleCard;
local v15 = v4.new(u3)(function(u8, p9) -- Line: 26
    -- upvalues: EventType (copy), GameReset (copy), GlobalTeamsUtil (copy), GlobalTeamEventKey (copy), u2 (copy), GlobalTeamKey (copy), u3 (copy), Empty (copy), Padding (copy), GlobalTeamEventGoalsOverview (copy), GlobalTeamEventTimedGoalsRiddleCard (copy), Theme (copy), Countdown (copy), PillCounter (copy), BedwarsImageId (copy), Summer2025Constants (copy), RewardList (copy), EventCurrencyType (copy)
    local useEffect = p9.useEffect;
    local v10, u11 = p9.useState(nil);
    local summer2025CollectionData = u8.eventDataProfile.events[EventType.SUMMER_2025].summer2025CollectionData;

    if summer2025CollectionData ~= nil then
        summer2025CollectionData = summer2025CollectionData.dailyCollectionMap[GameReset.resetTime:getDailyResetId()];
    end;

    useEffect(function() -- Line: 42
        -- upvalues: GlobalTeamsUtil (ref), GlobalTeamEventKey (ref), u2 (ref), GlobalTeamKey (ref), u8 (copy), u11 (copy)
        local timedGoals = GlobalTeamsUtil.getGlobalTeamEventMeta(GlobalTeamEventKey.SUMMER_2025).timedGoals;

        local function _(p12) -- Line: 49
            -- upvalues: GlobalTeamsUtil (ref)
            return GlobalTeamsUtil.isTimedGoalActive(p12);
        end;

        local v13 = nil;

        for i, v in u2.values(timedGoals[GlobalTeamKey.SUMMER_2025_TEAM]) do
            local _ = i - 1;

            if GlobalTeamsUtil.isTimedGoalActive(v) == true then
                v13 = v;
                break;
            end;
        end;

        local v14 = u8.globalTeamDataMap[GlobalTeamEventKey.SUMMER_2025];

        if v14 ~= nil then
            v14 = v14.globalTeams[GlobalTeamKey.SUMMER_2025_TEAM];
        end;

        if v14 and v13 then
            local timedGoalsData = v14.timedGoalsData;

            if timedGoalsData ~= nil then
                timedGoalsData = timedGoalsData[v13.key];
            end;

            u11({
                timedGoal = v13,
                score = timedGoalsData == nil and 0 or timedGoalsData
            });
        end;
    end, {});

    return u3.createFragment({
        Summer2025EventInfoPage = u3.createElement(Empty, {
            Size = UDim2.fromScale(1, 1)
        }, {
            u3.createElement(Padding, {
                Padding = UDim.new(0, 8)
            }),
            u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 8)
            }),
            SideBar = u3.createElement(Empty, {
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.35, 1)
            }, { u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0, 8)
                }), u3.createElement(GlobalTeamEventGoalsOverview, {
                    CurrentTimedGoalData = v10,
                    FrameProps = {
                        LayoutOrder = 1
                    }
                }), u3.createElement(GlobalTeamEventTimedGoalsRiddleCard, {
                    CurrentTimedGoalData = v10,
                    FrameProps = {
                        LayoutOrder = 2
                    }
                }) }),
            DailyTreasureChests = u3.createElement("Frame", {
                BorderSizePixel = 0,
                LayoutOrder = 3,
                Size = UDim2.fromScale(0.625, 0.35),
                Position = UDim2.fromScale(0.025, 0.05),
                AnchorPoint = Vector2.new(0, 0),
                BackgroundColor3 = Theme.backgroundTertiary
            }, {
                u3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0.05, 0),
                    PaddingRight = UDim.new(0.05, 0),
                    PaddingTop = UDim.new(0.075, 0),
                    PaddingBottom = UDim.new(0.075, 0)
                }),
                u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.1, 0)
                }),
                LeftSide = u3.createElement(Empty, {
                    Size = UDim2.fromScale(0.5, 1)
                }, {
                    u3.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0.025, 0)
                    }),
                    Title = u3.createElement("TextLabel", {
                        Text = "Daily",
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.2),
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }),
                    u3.createElement(Countdown, {
                        PreText = "Resets in: ",
                        EndTime = GameReset.resetTime:getNextDailyResetTime(),
                        TextLabel = {
                            LayoutOrder = 2,
                            TextTransparency = 0.3,
                            Size = UDim2.new(1, 0, 0.12, 0),
                            TextXAlignment = Enum.TextXAlignment.Left,
                            FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
                        },
                        CountdownConfig = {
                            minutes = true,
                            hours = true,
                            days = false
                        }
                    }),
                    Description = u3.createElement("TextLabel", {
                        Text = "Buy treasure maps in matches to find treasure chests",
                        TextScaled = true,
                        TextTransparency = 0.3,
                        BackgroundTransparency = 1,
                        LayoutOrder = 3,
                        Size = UDim2.fromScale(0.825, 0.19),
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }),
                    u3.createElement(Empty, {
                        LayoutOrder = 4,
                        Size = UDim2.fromScale(1, 0.04)
                    }),
                    u3.createElement(PillCounter, {
                        Tooltip = "Treasure Chests",
                        DisableCountAnimation = true,
                        Icon = BedwarsImageId.PIRATE_MAP_TREASURE_CHEST,
                        Amount = summer2025CollectionData == nil and 0 or summer2025CollectionData,
                        MaxAmount = Summer2025Constants.dailyEventCurrencyTreasureLimit,
                        FrameProps = {
                            LayoutOrder = 5,
                            Size = UDim2.new(0.6, 0, 0.3, 0)
                        }
                    })
                }),
                RightSide = u3.createElement(Empty, {
                    Size = UDim2.fromScale(0.5, 1),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0, 0.5)
                }, {
                    u3.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0.025, 0)
                    }),
                    Title = u3.createElement("TextLabel", {
                        Text = "Rewards",
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        Size = UDim2.fromScale(1, 0.2),
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }),
                    Description = u3.createElement("TextLabel", {
                        Text = "Open treasure chests for a chance of event currency and in-match resources",
                        TextScaled = true,
                        TextTransparency = 0.3,
                        BackgroundTransparency = 1,
                        LayoutOrder = 3,
                        Size = UDim2.fromScale(0.95, 0.22),
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular),
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }),
                    u3.createElement(Empty, {
                        LayoutOrder = 4,
                        Size = UDim2.new(1, 0, 0.09, 0)
                    }),
                    u3.createElement(RewardList, {
                        Rewards = {
                            {
                                eventCurrency = {
                                    amount = 500,
                                    currency = EventCurrencyType.SUMMER_2025_CURRENCY
                                }
                            },
                            {
                                eventCurrency = {
                                    amount = 750,
                                    currency = EventCurrencyType.SUMMER_2025_CURRENCY
                                }
                            },
                            {
                                eventCurrency = {
                                    amount = 1000,
                                    currency = EventCurrencyType.SUMMER_2025_CURRENCY
                                }
                            }
                        },
                        FrameProps = {
                            LayoutOrder = 5
                        },
                        UIGridlayoutProps = {
                            HorizontalAlignment = Enum.HorizontalAlignment.Left
                        }
                    })
                })
            })
        })
    });
end);

return {
    Summer2025EventInfoPage = v5.connect(function(p16, p17) -- Line: 271
        local v18 = {};

        for i, v in p17 do
            v18[i] = v;
        end;

        v18.eventDataProfile = p16.Event.profileData;
        v18.globalTeamDataMap = p16.Event.globalTeamEventDataMap;

        return v18;
    end)(v15)
};
-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata");
local EventCurrencyType = v5.EventCurrencyType;
local EventType = v5.EventType;
local GlobalTeamEventKey = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-types").GlobalTeamEventKey;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v10 = v3.new(u2)(function(u6, p7) -- Line: 15
    -- upvalues: u2 (copy), Theme (copy), Empty (copy), AutoSizedText (copy), ColorUtil (copy)
    local useState = p7.useState;
    local useEffect = p7.useEffect;
    local _, u8 = useState(nil);
    local _, u9 = useState(true);
    useEffect(function() -- Line: 20
        -- upvalues: u6 (copy), u9 (copy), u8 (copy)
        if u6.globalTeamEventData then
            u9(false);
            u8(u6.globalTeamEventData.globalTeams);
        end;
    end, { u6.localTeamKey, u6.globalTeamEventData });

    return u2.createFragment({
        EventTeamSelectedContent = u2.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.9, 0.9)
        }, {
            u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            TeamProgressContainer = u2.createElement("Frame", {
                BorderSizePixel = 0,
                AutomaticSize = "Y",
                LayoutOrder = 1,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.5),
                BackgroundColor3 = Theme.backgroundTertiary
            }),
            u2.createElement(Empty, {
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 0.25)
            }, {
                ContributionCount = u2.createElement("Frame", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.fromScale(0, 0.5),
                    Size = UDim2.fromScale(0.25, 1)
                }, {
                    u2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical,
                        HorizontalAlignment = Enum.HorizontalAlignment.Left,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }),
                    u2.createElement(AutoSizedText, {
                        Text = "SHELL CONTRIBUTIONS:",
                        TextSize = 14,
                        LayoutOrder = 1,
                        Limits = Vector2.new(1000, 40),
                        Font = Enum.Font.GothamBold,
                        TextColor3 = ColorUtil.WHITE,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }),
                    CurrencyPills = u2.createElement("Frame", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        LayoutOrder = 2,
                        Size = UDim2.fromScale(0.5, 1)
                    }, { u2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal,
                            HorizontalAlignment = Enum.HorizontalAlignment.Left,
                            VerticalAlignment = Enum.VerticalAlignment.Center,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = UDim.new(0, 2)
                        }), u2.createElement("ImageLabel", {
                            ImageTransparency = 0,
                            BorderSizePixel = 0,
                            BackgroundTransparency = 1,
                            LayoutOrder = 1,
                            Image = u6.ContributionCurrencyImage,
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            Size = UDim2.fromScale(0.5, 1),
                            ScaleType = Enum.ScaleType.Fit
                        }), u2.createElement("TextLabel", {
                            TextSize = 14,
                            RichText = true,
                            BackgroundTransparency = 1,
                            LayoutOrder = 2,
                            Text = "<b>" .. tostring(u6.CoinsCollected) .. "</b>",
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            Size = UDim2.fromScale(0.05, 1),
                            Font = Enum.Font.GothamBold,
                            TextColor3 = ColorUtil.WHITE,
                            TextXAlignment = Enum.TextXAlignment.Left
                        }) })
                }),
                u2.createElement("Frame", {
                    LayoutOrder = 2,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.35, 1.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    BackgroundColor3 = Color3.fromHex("#0a8230")
                }, { u2.createElement("TextLabel", {
                        Text = "🔥2x shell bonus active!🔥",
                        RichText = true,
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        TextWrap = false,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.fromScale(1, 1),
                        Font = Enum.Font.GothamBold,
                        TextColor3 = Color3.fromHex("#ffff15"),
                        TextXAlignment = Enum.TextXAlignment.Center
                    }) })
            })
        })
    });
end);

return {
    EventTeamSelectedContent = v4.connect(function(p11, p12) -- Line: 140
        -- upvalues: EventType (copy), EventCurrencyType (copy), GlobalTeamEventKey (copy)
        local v13 = {};

        for i, v in p12 do
            v13[i] = v;
        end;

        local v14 = p11.Event.profileData.events[EventType.SUMMER_2024];

        if v14 ~= nil then
            v14 = v14.globalTeamKey;
        end;

        v13.localTeamKey = v14;
        v13.summerEventProfileData = p11.Event.profileData.events[EventType.SUMMER_2024];
        v13.summerEventCurrencyData = p11.Event.profileData.currencies[EventCurrencyType.SUMMER_2024_CURRENCY];
        v13.globalTeamEventData = p11.Event.globalTeamEventDataMap[GlobalTeamEventKey.SUMMER_2024];

        return v13;
    end)(v10)
};
-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local useSpring = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-flipper", "src").useSpring;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local TweenService = v5.TweenService;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local STAT_TO_DESCRIPTION = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking").STAT_TO_DESCRIPTION;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local MatchEndScreensMeta = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "match-end-screen-meta").MatchEndScreensMeta;

return {
    StatCardComponent = v4.new(u3)(function(u6, p7) -- Line: 23
        -- upvalues: u3 (copy), ClientStore (copy), DeviceUtil (copy), OfflinePlayerUtil (copy), useSpring (copy), Players (copy), UIUtil (copy), SoundManager (copy), GameSound (copy), u2 (copy), MatchEndScreensMeta (copy), TweenService (copy), ColorUtil (copy), Padding (copy), Empty (copy), Theme (copy), STAT_TO_DESCRIPTION (copy)
        local u8 = u3.createRef();
        local u9 = u3.createRef();
        local v10 = nil;

        for _, v in ClientStore:getState().Game.teams do
            if v.members[u6.card.player.userId] ~= nil then
                v10 = v;
                break;
            end;
        end;

        local v11 = DeviceUtil.isHoarceKat() and {
            id = "4",
            name = "Orange",
            members = {
                [OfflinePlayerUtil.Dummy.Bryan3838.userId] = OfflinePlayerUtil.Dummy.Bryan3838,
                [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                [OfflinePlayerUtil.Dummy.Rascal.userId] = OfflinePlayerUtil.Dummy.Rascal
            },
            color = Color3.fromRGB(255, 166, 71)
        } or v10;
        local u12 = p7.useValue(4);
        local _, u13 = useSpring(p7, 0.8);
        local u14, u15 = p7.useState(0.8);
        p7.useEffect(function() -- Line: 52
            -- upvalues: u9 (copy), Players (ref), u6 (copy), u13 (copy), u14 (copy), u15 (copy), u8 (copy), UIUtil (ref), SoundManager (ref), GameSound (ref), u2 (ref), u12 (copy), MatchEndScreensMeta (ref), TweenService (ref)
            local v16 = u9:getValue();

            if v16 then
                v16.Image = Players:GetUserThumbnailAsync(u6.card.player.userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size352x352);
            end;

            local u17 = nil;
            u17 = u13:onStep(function(p18) -- Line: 59
                -- upvalues: u14 (ref), u17 (ref), u15 (ref)
                if p18 == u14 then
                    u17:disconnect();
                end;

                u15(p18);
            end);
            local u19 = u13:onComplete(function() -- Line: 65
                -- upvalues: u17 (ref)
                u17:disconnect();
            end);
            local u20 = u8:getValue();

            if u20 then
                if u6.DisableAnimation then
                    return nil;
                end;

                local u21 = UIUtil:setContainerTransparency(u20, 1, {
                    onCleanUpTweenInfo = TweenInfo.new(0.2)
                });
                task.delay(u6.index * 0.5, function() -- Line: 77
                    -- upvalues: SoundManager (ref), GameSound (ref), u21 (copy), u13 (ref), u2 (ref), u12 (ref)
                    SoundManager:playSound(GameSound.EMOTE_OPEN);
                    u21:DoCleaning();
                    u13:setGoal(u2.Spring.new(1, {
                        dampingRatio = 0.7,
                        frequency = u12.value
                    }));
                end);
                local displaySecs = MatchEndScreensMeta[2].displaySecs;
                task.delay((displaySecs == nil and 1 or displaySecs) - 0.5, function() -- Line: 92
                    -- upvalues: TweenService (ref), u20 (copy)
                    TweenService:Create(u20, TweenInfo.new(0.5, Enum.EasingStyle.Cubic), {
                        Position = UDim2.fromScale(0.5, 2)
                    }):Play();
                end);
            end;

            return function() -- Line: 98
                -- upvalues: u17 (ref), u19 (copy)
                u17:disconnect();
                u19:disconnect();
            end;
        end, {});
        local v22 = {
            Size = UDim2.fromScale(0.2, 0.5)
        };
        local v23 = {};
        local _ = #v23;
        local v24 = {
            Size = UDim2.fromScale(u14, u14),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            [u3.Ref] = u8,
            BackgroundColor3 = ColorUtil.WHITE,
            BackgroundTransparency = 0,
            LayoutOrder = u6.index
        };
        local v25 = {
            u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 0.7113543091655267
            }),
            u3.createElement("UICorner"),
            u3.createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("4E5082")), ColorSequenceKeypoint.new(1, Color3.fromHex("2E2F4E")) })
            }),
            u3.createElement("UIListLayout", {
                Padding = UDim.new(0),
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        };
        local _ = #v25;
        local v26 = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 0.6)
        };
        local v27 = {
            u3.createElement("UICorner"),
            u3.createElement(Padding, {
                Padding = UDim.new(0.1, 0)
            }),
            u3.createElement("UIListLayout", {
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05),
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center
            }),
            AvatarWrapper = u3.createElement(Empty, {
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.6)
            }, { u3.createElement("ImageLabel", {
                    [u3.Ref] = u9,
                    Size = UDim2.fromScale(1, 1),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    BackgroundColor3 = ColorUtil.BLACK,
                    BackgroundTransparency = 0.7,
                    ScaleType = Enum.ScaleType.Crop
                }, { u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }), u3.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }) }) })
        };
        local _ = #v27;
        local v28 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.35)
        };
        local v29 = {
            u3.createElement("UIListLayout", {
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05),
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center
            }),
            DisplayName = u3.createElement("TextLabel", {
                TextScaled = true,
                TextYAlignment = "Bottom",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                AutoLocalize = false,
                Size = UDim2.fromScale(1, 0.5),
                Text = u6.card.player.displayName,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextColor3 = Color3.new(1, 1, 1)
            })
        };
        local v30 = #v29;
        local v31;

        if v11 == nil then
            v31 = false;
        else
            v31 = u3.createFragment({
                TeamName = u3.createElement("TextLabel", {
                    TextScaled = true,
                    TextYAlignment = "Bottom",
                    BackgroundTransparency = 1,
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(1, 0.4),
                    Text = string.upper(v11.name),
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = v11.color
                })
            });
        end;

        if v31 then
            v29[v30 + 1] = v31;
        end;

        v27.PlayerInfoContainer = u3.createElement(Empty, v28, v29);
        v25.TopSection = u3.createElement(Empty, v26, v27);
        local createElement = u3.createElement;
        local v32 = {
            BorderSizePixel = 0,
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0.4),
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local v33 = {
            u3.createElement("UICorner"),
            FlatTopBorder = u3.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 0.1),
                BackgroundColor3 = Theme.backgroundPrimary
            })
        };
        local createElement2 = u3.createElement;
        local v34 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v35 = {};
        local v36 = u3.createElement("UIListLayout", {
            Padding = UDim.new(0.01),
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center
        });
        local createElement3 = u3.createElement;
        local v37 = {
            TextScaled = true,
            RichText = true,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0.45)
        };
        local v38 = math.round(u6.card.amount);
        v37.Text = tostring(v38);
        v37.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
        v37.TextColor3 = ColorUtil.WHITE;
        v35[1], v35[2], v35[3] = v36, createElement3("TextLabel", v37), u3.createElement("TextLabel", {
    TextScaled = true,
    RichText = true,
    BackgroundTransparency = 1,
    Size = UDim2.fromScale(0.8, 0.3),
    Text = string.upper(STAT_TO_DESCRIPTION[u6.card.trackType]),
    FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
    TextColor3 = Theme.textPrimary
});
        v33[2] = createElement2(Empty, v34, v35);
        v25.BottomSection = createElement("Frame", v32, v33);
        v23.StatCard = u3.createElement("Frame", v24, v25);

        return u3.createFragment({
            StatCardWrapper = u3.createElement(Empty, v22, v23)
        });
    end)
};
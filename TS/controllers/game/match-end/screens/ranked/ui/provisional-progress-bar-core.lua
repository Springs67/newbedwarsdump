-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local NumberSpinner = v1.NumberSpinner;
local SlideIn = v1.SlideIn;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local RankUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local NUM_PROVISIONAL_MATCHES = RankUtil.NUM_PROVISIONAL_MATCHES;

return {
    ProvisionalProgressBarCore = v3.new(u2)(function(p4, p5) -- Line: 15
        -- upvalues: u2 (copy), NumberSpinner (copy), TweenService (copy), NUM_PROVISIONAL_MATCHES (copy), SoundManager (copy), GameSound (copy), RuntimeLib (copy), SlideIn (copy), Empty (copy), ColorUtil (copy)
        local useEffect = p5.useEffect;
        local u6, u7 = p5.useState(p4.RankedMatchesPlayed - 1);
        local u8 = u2.createRef();
        local u9 = u2.createRef();
        useEffect(function() -- Line: 21
            -- upvalues: u8 (copy), u9 (copy), NumberSpinner (ref), u6 (copy), u7 (copy), TweenService (ref), NUM_PROVISIONAL_MATCHES (ref), SoundManager (ref), GameSound (ref), RuntimeLib (ref)
            local v10 = u8:getValue();
            local u11 = u9:getValue();
            local u12 = NumberSpinner.fromGuiObject(v10);
            u12.Duration = 0;
            u12.Decimals = 0;
            u12.Prefix = "";
            u12.Value = u6;

            local function u14() -- Line: 31
                -- upvalues: u6 (ref), u7 (ref), u12 (copy), TweenService (ref), u11 (copy), NUM_PROVISIONAL_MATCHES (ref), SoundManager (ref), GameSound (ref)
                local v13 = u6 + 1;
                u7(v13);
                u12.Duration = 0.5;
                u12.Value = v13;
                TweenService:Create(u11, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                    Size = UDim2.fromScale(math.min(v13 / NUM_PROVISIONAL_MATCHES, 1), 1)
                }):Play();
                SoundManager:playSound(GameSound.BATTLE_PASS_PROGRESS_EXP_GAIN);
            end;

            RuntimeLib.Promise.defer(function() -- Line: 44
                -- upvalues: u14 (copy)
                task.wait(1);
                u14();
            end);
        end, {});

        return u2.createElement(SlideIn, {}, { u2.createElement(Empty, {
                BackgroundTransparency = 1,
                AnchorPoint = p4.AnchorPoint or Vector2.new(0.5, 0.5),
                Position = p4.Position or UDim2.fromScale(0.5, 0.4),
                Size = UDim2.fromScale(0.6, 0.6)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    HorizontalAlignment = "Center",
                    VerticalAlignment = "Bottom",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.03, 0)
                }),
                u2.createElement(Empty, {
                    LayoutOrder = 1,
                    Size = UDim2.new(0.4, 0, 0.15, 0)
                }, {
                    u2.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        HorizontalAlignment = "Center",
                        VerticalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0.05, 0)
                    }),
                    ProgressNumber = u2.createElement("TextLabel", {
                        Size = UDim2.new(0, 0, 1, 0),
                        AutomaticSize = "X",
                        Text = "<b>" .. tostring(u6) .. "</b>",
                        TextColor3 = ColorUtil.hexColor(16773227),
                        Font = "Roboto",
                        TextScaled = true,
                        RichText = true,
                        BackgroundTransparency = 1,
                        LayoutOrder = 1,
                        [u2.Ref] = u8
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 24
                        }) }),
                    u2.createElement("TextLabel", {
                        AutomaticSize = "X",
                        Text = "<b>PLACEMENT MATCHES PLAYED</b>",
                        Font = "Roboto",
                        TextScaled = true,
                        RichText = true,
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        Size = UDim2.new(0, 0, 1, 0),
                        TextColor3 = ColorUtil.WHITE
                    }, { u2.createElement("UITextSizeConstraint", {
                            MaxTextSize = 24
                        }) })
                }),
                ProgressContainer = u2.createElement(Empty, {
                    LayoutOrder = 2,
                    Size = UDim2.new(1, 0, 0.22, 0)
                }, {
                    u2.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        HorizontalAlignment = "Right",
                        VerticalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0, 8)
                    }),
                    u2.createElement(Empty, {
                        LayoutOrder = 1,
                        Size = UDim2.new(1, 0, 0.3, 0)
                    }, { u2.createElement("TextLabel", {
                            Font = "Roboto",
                            TextXAlignment = "Left",
                            TextScaled = true,
                            RichText = true,
                            BackgroundTransparency = 1,
                            Size = UDim2.new(0.5, 0, 1, 0),
                            Text = "<b>" .. tostring(0) .. "</b>",
                            TextColor3 = ColorUtil.WHITE
                        }), u2.createElement("TextLabel", {
                            Font = "Roboto",
                            TextXAlignment = "Right",
                            TextScaled = true,
                            RichText = true,
                            TextTransparency = 0.4,
                            BackgroundTransparency = 1,
                            Size = UDim2.new(0.5, 0, 1, 0),
                            AnchorPoint = Vector2.new(1, 0),
                            Position = UDim2.fromScale(1, 0),
                            Text = "<b>" .. tostring(NUM_PROVISIONAL_MATCHES) .. "</b>",
                            TextColor3 = ColorUtil.WHITE
                        }) }),
                    ProgressBarBackground = u2.createElement("Frame", {
                        BackgroundTransparency = 0.3,
                        BorderSizePixel = 0,
                        LayoutOrder = 2,
                        Size = UDim2.new(1, 0, 0.4, 0),
                        BackgroundColor3 = ColorUtil.BLACK
                    }, {
                        ProgressBar = u2.createElement("Frame", {
                            Size = UDim2.new((p4.RankedMatchesPlayed - 1) / NUM_PROVISIONAL_MATCHES, 0, 1, 0),
                            BackgroundColor3 = ColorUtil.WHITE,
                            BorderSizePixel = 0,
                            [u2.Ref] = u9
                        })
                    })
                }),
                u2.createElement(Empty, {
                    LayoutOrder = 3,
                    Size = UDim2.new(1, 0, 0.15, 0)
                }, {
                    u2.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        HorizontalAlignment = "Center",
                        VerticalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0, 8)
                    }),
                    MetricDescription = u2.createElement("TextLabel", {
                        Font = "Roboto",
                        TextTransparency = 0.35,
                        TextScaled = true,
                        RichText = true,
                        BackgroundTransparency = 1,
                        LayoutOrder = 2,
                        Size = UDim2.new(1, 0, 0.4, 0),
                        Text = "<b>Complete " .. tostring(NUM_PROVISIONAL_MATCHES) .. " placement matches to unlock your rank</b>",
                        TextColor3 = ColorUtil.WHITE
                    })
                })
            }) });
    end)
};
-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ShineEffect = v1.ShineEffect;
local ShineEffectVariation = v1.ShineEffectVariation;
local SlideIn = v1.SlideIn;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u4 = UDim2.fromScale(0.6, 0.9);
local u5 = UDim2.fromScale(0.5, 0.46);
local u6 = Vector2.new(0.5, 0.5);

return {
    TutorialPromptMenu = v3.new(u2)(function(p7, p8) -- Line: 19
        -- upvalues: u2 (copy), TweenService (copy), DeviceUtil (copy), SlideIn (copy), u4 (copy), u5 (copy), u6 (copy), Theme (copy), Empty (copy), ColorUtil (copy), Button (copy), KnitClient (copy), ShineEffect (copy), ShineEffectVariation (copy)
        local _ = p8.useState;
        local useEffect = p8.useEffect;
        local u9 = u2.createRef();
        useEffect(function() -- Line: 23
            -- upvalues: u9 (copy), TweenService (ref)
            local v10 = u9:getValue();

            if not v10 then
                return nil;
            end;

            local u11 = TweenService:Create(v10, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Position = UDim2.fromScale(0.5, 0.51)
            });
            local u12 = TweenService:Create(v10, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Position = UDim2.fromScale(0.5, 0.49)
            });
            u11:Play();
            u11.Completed:Connect(function() -- Line: 36
                -- upvalues: u12 (copy)
                u12:Play();
            end);
            u12.Completed:Connect(function() -- Line: 39
                -- upvalues: u11 (copy)
                u11:Play();
            end);

            return function() -- Line: 42
                -- upvalues: u11 (copy), u12 (copy)
                u11:Destroy();
                u12:Destroy();
            end;
        end, {});

        return u2.createElement("ScreenGui", {
            DisplayOrder = 30,
            IgnoreGuiInset = DeviceUtil.isSmallScreen()
        }, { u2.createElement(SlideIn, {}, { u2.createElement("Frame", {
                    LayoutOrder = 1,
                    BorderSizePixel = 0,
                    BackgroundTransparency = 0,
                    Size = u4,
                    Position = u5,
                    AnchorPoint = u6,
                    BackgroundColor3 = Theme.backgroundSecondary
                }, { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0.1, 0)
                    }), u2.createElement(Empty, {
                        Size = UDim2.fromScale(1, 0.9),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5)
                    }, {
                        u2.createElement("UIListLayout", {
                            FillDirection = "Vertical",
                            SortOrder = "LayoutOrder",
                            Padding = UDim.new(0.015, 0),
                            HorizontalAlignment = Enum.HorizontalAlignment.Center
                        }),
                        u2.createElement("TextLabel", {
                            RichText = true,
                            LineHeight = 1.05,
                            TextScaled = true,
                            BackgroundTransparency = 1,
                            LayoutOrder = 0,
                            Size = UDim2.fromScale(0.8, 0.06),
                            Position = UDim2.fromScale(0.5, 0.5),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Text = "Welcome to <font color=\"" .. ColorUtil.richTextColor(Color3.fromRGB(97, 222, 254)) .. "\">Bed</font><font color=\"" .. ColorUtil.richTextColor(Color3.fromRGB(255, 84, 98)) .. "\">Wars</font>!",
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Font = Enum.Font.LuckiestGuy,
                            TextXAlignment = Enum.TextXAlignment.Center,
                            TextYAlignment = Enum.TextYAlignment.Center
                        }),
                        ImageWrapper = u2.createElement("Frame", {
                            LayoutOrder = 1,
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            Size = UDim2.fromScale(0.38, 0.42)
                        }, {
                            MascotImage = u2.createElement("ImageLabel", {
                                [u2.Ref] = u9,
                                Position = UDim2.fromScale(0.5, 0.5),
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Size = UDim2.fromScale(1, 1),
                                Image = "rbxassetid://16820928725",
                                BackgroundTransparency = 1,
                                ScaleType = Enum.ScaleType.Fit
                            })
                        }),
                        Textbox = u2.createElement("Frame", {
                            LayoutOrder = 2,
                            Size = UDim2.fromScale(0.8, 0.25),
                            BackgroundColor3 = Theme.backgroundPrimary
                        }, {
                            u2.createElement("UICorner", {
                                CornerRadius = UDim.new(0.1, 0)
                            }),
                            TextWrapper = u2.createElement("Frame", {
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                Size = UDim2.fromScale(0.92, 0.92),
                                Position = UDim2.fromScale(0.5, 0.5),
                                AnchorPoint = Vector2.new(0.5, 0.5)
                            }, { u2.createElement("UIListLayout", {
                                    FillDirection = "Vertical",
                                    SortOrder = "LayoutOrder",
                                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                                    VerticalAlignment = Enum.VerticalAlignment.Center
                                }), u2.createElement("TextLabel", {
                                    Text = "Complete the BedWars Tutorial for <b>FREE</b> rewards!",
                                    RichText = true,
                                    LineHeight = 1.05,
                                    TextScaled = true,
                                    BackgroundTransparency = 1,
                                    LayoutOrder = 0,
                                    Size = UDim2.fromScale(1, 0.4),
                                    TextColor3 = Color3.fromRGB(255, 255, 255),
                                    Font = Enum.Font.Arial,
                                    TextXAlignment = Enum.TextXAlignment.Center,
                                    TextYAlignment = Enum.TextYAlignment.Center
                                }), u2.createElement("TextLabel", {
                                    Text = "• Choose a beginner kit to try out!\n• Get the [🎓 Scholar] title",
                                    RichText = true,
                                    LineHeight = 1.05,
                                    TextScaled = true,
                                    BackgroundTransparency = 1,
                                    LayoutOrder = 1,
                                    Size = UDim2.fromScale(0.9, 0.5),
                                    TextColor3 = Color3.fromRGB(255, 255, 255),
                                    Font = Enum.Font.Arial,
                                    TextXAlignment = Enum.TextXAlignment.Left,
                                    TextYAlignment = Enum.TextYAlignment.Top
                                }) })
                        }),
                        BeginTutorialButton = u2.createElement(Button, {
                            Text = "Begin Tutorial",
                            LayoutOrder = 3,
                            CornerRadius = UDim.new(0.1, 0),
                            Size = UDim2.fromScale(0.4, 0.1),
                            TextLabel = {
                                ZIndex = 2,
                                Font = Enum.Font.ArialBold,
                                Size = UDim2.fromScale(0.9, 0.65),
                                Position = UDim2.fromScale(0.5, 0.5),
                                AnchorPoint = Vector2.new(0.5, 0.5)
                            },
                            BackgroundColor3 = Color3.fromRGB(44, 184, 96),

                            OnClick = function() -- Line: 167, Name: OnClick
                                -- upvalues: KnitClient (ref)
                                KnitClient.Controllers.LobbyTutorialController:respondToTutorialPrompt(true);
                            end
                        }, { u2.createElement(ShineEffect, {
                                Loop = false,
                                OnHover = true,
                                Variation = ShineEffectVariation.gradientLarge
                            }) }),
                        ReturnToLobbyButton = u2.createElement(Button, {
                            Text = "Return to Lobby",
                            ZIndex = 2,
                            LayoutOrder = 4,
                            CornerRadius = UDim.new(0.2, 0),
                            Size = UDim2.fromScale(0.3, 0.06),
                            TextLabel = {
                                ZIndex = 2,
                                Font = Enum.Font.ArialBold,
                                Size = UDim2.fromScale(0.9, 0.65),
                                Position = UDim2.fromScale(0.5, 0.5),
                                AnchorPoint = Vector2.new(0.5, 0.5)
                            },
                            BackgroundColor3 = Theme.backgroundTertiary,

                            OnClick = function() -- Line: 190, Name: OnClick
                                -- upvalues: KnitClient (ref)
                                KnitClient.Controllers.LobbyTutorialController:respondToTutorialPrompt(false);
                            end
                        }),
                        u2.createElement("TextLabel", {
                            Text = "(You will be able to complete the tutorial at a later time.)",
                            RichText = true,
                            LineHeight = 1.05,
                            TextScaled = true,
                            TextTransparency = 0.3,
                            BackgroundTransparency = 1,
                            LayoutOrder = 5,
                            Size = UDim2.fromScale(0.8, 0.035),
                            Position = UDim2.fromScale(0.5, 0),
                            AnchorPoint = Vector2.new(0.5, 0),
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Font = Enum.Font.Arial,
                            TextXAlignment = Enum.TextXAlignment.Center,
                            TextYAlignment = Enum.TextYAlignment.Top
                        })
                    }) }) }) });
    end)
};
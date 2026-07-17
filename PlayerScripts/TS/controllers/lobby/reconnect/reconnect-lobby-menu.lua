-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SlideIn = v1.SlideIn;
local TimedProgressBar = v1.TimedProgressBar;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u4 = UDim2.fromScale(0.55, 0.75);
local u5 = UDim2.fromScale(0.5, 0.46);
local u6 = Vector2.new(0.5, 0.5);

return {
    ReconnectingMenu = v3.new(u2)(function(u7, p8) -- Line: 18
        -- upvalues: u2 (copy), RuntimeLib (copy), KnitClient (copy), TweenService (copy), DeviceUtil (copy), SlideIn (copy), u4 (copy), u5 (copy), u6 (copy), Theme (copy), Empty (copy), getQueueMeta (copy), TimedProgressBar (copy), Button (copy)
        local _ = p8.useState;
        local useEffect = p8.useEffect;
        local u9 = u2.createRef();
        local v10 = u2.createRef();
        local v11 = u2.createRef();

        local function _() -- Line: 24
            -- upvalues: u7 (copy)
            return os.time() >= u7.ResponseEndTime;
        end;

        useEffect(function() -- Line: 31
            -- upvalues: RuntimeLib (ref), u7 (copy), KnitClient (ref)
            local u13 = RuntimeLib.Promise.defer(function() -- Line: 32
                -- upvalues: u7 (ref), KnitClient (ref)
                while true do
                    local v12 = task.wait(0.5);

                    if v12 == 0 or (v12 ~= v12 or not v12) then
                        break;
                    end;

                    if os.time() >= u7.ResponseEndTime then
                        KnitClient.Controllers.ReconnectLobbyController:cancelReconnectToMatch();
                    end;
                end;
            end);

            return function() -- Line: 44
                -- upvalues: u13 (copy)
                u13:cancel();
            end;
        end, { u7.ResponseEndTime });
        useEffect(function() -- Line: 48
            -- upvalues: u9 (copy), TweenService (ref)
            local v14 = u9:getValue();

            if not v14 then
                return nil;
            end;

            local u15 = TweenService:Create(v14, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Position = UDim2.fromScale(0.5, 0.51)
            });
            local u16 = TweenService:Create(v14, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Position = UDim2.fromScale(0.5, 0.49)
            });
            u15:Play();
            u15.Completed:Connect(function() -- Line: 61
                -- upvalues: u16 (copy)
                u16:Play();
            end);
            u16.Completed:Connect(function() -- Line: 64
                -- upvalues: u15 (copy)
                u15:Play();
            end);

            return function() -- Line: 67
                -- upvalues: u15 (copy), u16 (copy)
                u15:Destroy();
                u16:Destroy();
            end;
        end, {});

        return u2.createElement("ScreenGui", {
            DisplayOrder = 20,
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
                                    Text = "Existing match found!",
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
                                    RichText = true,
                                    LineHeight = 1.05,
                                    TextScaled = true,
                                    BackgroundTransparency = 1,
                                    LayoutOrder = 1,
                                    Size = UDim2.fromScale(0.9, 0.5),
                                    Text = "Attempting to reconnect you to your recent " .. getQueueMeta(u7.QueueType).title .. " match.",
                                    TextColor3 = Color3.fromRGB(255, 255, 255),
                                    Font = Enum.Font.Arial,
                                    TextXAlignment = Enum.TextXAlignment.Center,
                                    TextYAlignment = Enum.TextYAlignment.Center
                                }) })
                        }),
                        u2.createElement(TimedProgressBar, {
                            LayoutOrder = 3,
                            HideOnComplete = true,
                            Size = UDim2.fromScale(0.6, 0.04),
                            Position = UDim2.fromScale(0.5, 0.5),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            EndTime = u7.ResponseEndTime,
                            ProgressBarConfig = {
                                Flip = true,
                                GradientRotation = 180,
                                BarGradient = ColorSequence.new(Color3.fromHex("33B6FF"), Color3.fromHex("C8EBFF"))
                            }
                        }),
                        u2.createElement(Empty, {
                            LayoutOrder = 4,
                            ZIndex = 2,
                            Size = UDim2.fromScale(0.6, 0.1)
                        }, {
                            u2.createElement("UIListLayout", {
                                FillDirection = "Horizontal",
                                SortOrder = "LayoutOrder",
                                Padding = UDim.new(0.015, 0),
                                HorizontalAlignment = Enum.HorizontalAlignment.Center
                            }),
                            CancelReconnect = u2.createElement(Button, {
                                [u2.Ref] = v10,
                                CornerRadius = UDim.new(0.2, 0),
                                Size = UDim2.fromScale(0.5, 0.9),
                                TextLabel = {
                                    ZIndex = 4,
                                    Font = Enum.Font.ArialBold,
                                    Size = UDim2.fromScale(0.9, 0.65),
                                    Position = UDim2.fromScale(0.5, 0.5),
                                    AnchorPoint = Vector2.new(0.5, 0.5)
                                },
                                Text = "Abandon",
                                BackgroundColor3 = Theme.backgroundError,

                                OnClick = function() -- Line: 202, Name: OnClick
                                    -- upvalues: KnitClient (ref)
                                    KnitClient.Controllers.ReconnectLobbyController:cancelReconnectToMatch();
                                end,

                                ZIndex = 3,
                                LayoutOrder = 1
                            }),
                            ConfirmReconnect = u2.createElement(Button, {
                                [u2.Ref] = v11,
                                CornerRadius = UDim.new(0.2, 0),
                                Size = UDim2.fromScale(0.5, 0.9),
                                TextLabel = {
                                    ZIndex = 4,
                                    Font = Enum.Font.ArialBold,
                                    Size = UDim2.fromScale(0.9, 0.65),
                                    Position = UDim2.fromScale(0.5, 0.5),
                                    AnchorPoint = Vector2.new(0.5, 0.5)
                                },
                                Text = "Confirm",
                                BackgroundColor3 = Theme.mcGreen,

                                OnClick = function() -- Line: 221, Name: OnClick
                                    -- upvalues: KnitClient (ref)
                                    KnitClient.Controllers.ReconnectLobbyController:confirmReconnectToMatch();
                                end,

                                ZIndex = 3,
                                LayoutOrder = 2
                            })
                        })
                    }) }) }) });
    end)
};
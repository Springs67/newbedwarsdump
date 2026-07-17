-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local RandomUtil = v1.RandomUtil;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local CircleCountdown = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "circle-countdown").CircleCountdown;
local u4 = { "rbxassetid://11815911253", "rbxassetid://11815911417", "rbxassetid://11815911579", "rbxassetid://11815911724" };

return {
    MinigameInfo = v3.new(u2)(function(u5, p6) -- Line: 13
        -- upvalues: u2 (copy), UIUtil (copy), RandomUtil (copy), u4 (copy), ColorUtil (copy), Empty (copy), CircleCountdown (copy), DeviceUtil (copy)
        local useEffect = p6.useEffect;
        local _ = p6.useState;
        local u7 = u2.createRef();
        useEffect(function() -- Line: 17
            -- upvalues: u7 (copy), u5 (copy), UIUtil (ref)
            local u8 = u7:getValue();

            if not u8 then
                return nil;
            end;

            local v9 = u5.startTime - os.time();
            task.delay(v9 - 0.3, function() -- Line: 24
                -- upvalues: UIUtil (ref), u8 (copy)
                UIUtil:setContainerTransparency(u8, 1, {
                    onSetTweenInfo = TweenInfo.new(0.3)
                });
            end);
        end, {});

        return u2.createElement("ScreenGui", {
            IgnoreGuiInset = true,
            ResetOnSpawn = false,
            DisplayOrder = 100
        }, {
            MinigameInfoContainer = u2.createElement("ImageLabel", {
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Image = RandomUtil.randomArraySelectN(u4, 1)[1],
                ScaleType = "Crop",
                BackgroundTransparency = 1,
                [u2.Ref] = u7
            }, {
                GradientOverlay = u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = ColorUtil.WHITE
                }, { u2.createElement("UIGradient", {
                        Rotation = 55,
                        Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(179, 223, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(179, 223, 255)) }),
                        Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0.6) })
                    }) }),
                u2.createElement(Empty, {
                    ZIndex = 3,
                    Size = UDim2.fromScale(1, 1)
                }, {
                    u2.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.06, 0),
                        PaddingBottom = UDim.new(0.06, 0),
                        PaddingLeft = UDim.new(0.04, 0),
                        PaddingRight = UDim.new(0.04, 0)
                    }),
                    Header = u2.createElement(Empty, {
                        Size = UDim2.fromScale(1, 0.1)
                    }, {
                        Title = u2.createElement("TextLabel", {
                            TextScaled = true,
                            RichText = true,
                            TextXAlignment = "Left",
                            BackgroundTransparency = 1,
                            ZIndex = 3,
                            Size = UDim2.fromScale(0.9, 1),
                            Text = "<b>" .. string.upper(u5.minigame.displayName) .. "</b>",
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            Font = Enum.Font.Roboto
                        }),
                        u2.createElement(CircleCountdown, {
                            EndTime = u5.startTime,
                            FrameProps = {
                                ZIndex = 3,
                                Size = UDim2.fromScale(0.1, 1),
                                Position = UDim2.fromScale(1, 0),
                                AnchorPoint = Vector2.new(1, 0)
                            }
                        })
                    }),
                    Content = u2.createElement(Empty, {
                        ZIndex = 3,
                        Size = UDim2.fromScale(1, 1),
                        Position = UDim2.fromScale(0, 0.15)
                    }, { u2.createElement("UIListLayout", {
                            FillDirection = "Horizontal",
                            VerticalAlignment = "Center",
                            HorizontalAlignment = "Center",
                            SortOrder = "LayoutOrder",
                            Padding = UDim.new(0.05, 0)
                        }), u2.createElement(Empty, {
                            LayoutOrder = 1,
                            Size = UDim2.fromScale(0.475, 1)
                        }, {
                            InfoImage = u2.createElement("ImageLabel", {
                                ScaleType = "Crop",
                                LayoutOrder = 2,
                                ZIndex = 3,
                                Size = UDim2.fromScale(1, 0.8),
                                Image = u5.minigame.infoImage
                            }, { u2.createElement("UIStroke", {
                                    Thickness = 3,
                                    Color = Color3.fromRGB(255, 255, 255)
                                }), u2.createElement("UICorner", {
                                    CornerRadius = UDim.new(0.1, 0)
                                }) })
                        }), u2.createElement(Empty, {
                            LayoutOrder = 2,
                            Size = UDim2.fromScale(0.475, 1)
                        }, {
                            InfoCard = u2.createElement("Frame", {
                                AutomaticSize = "Y",
                                BorderSizePixel = 0,
                                LayoutOrder = 1,
                                ZIndex = 3,
                                Size = UDim2.fromScale(1, 0.3),
                                BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                            }, {
                                u2.createElement("UICorner", {
                                    CornerRadius = UDim.new(0.1, 0)
                                }),
                                u2.createElement("UIPadding", {
                                    PaddingTop = UDim.new(0, DeviceUtil.isSmallScreen() and 14 or 24),
                                    PaddingBottom = UDim.new(0, DeviceUtil.isSmallScreen() and 14 or 24),
                                    PaddingLeft = UDim.new(0.06, 0),
                                    PaddingRight = UDim.new(0.06, 0)
                                }),
                                u2.createElement("UIListLayout", {
                                    FillDirection = "Vertical",
                                    VerticalAlignment = "Top",
                                    SortOrder = "LayoutOrder",
                                    Padding = UDim.new(0, DeviceUtil.isSmallScreen() and 8 or 10)
                                }),
                                Subtitle = u2.createElement("TextLabel", {
                                    AutomaticSize = "Y",
                                    Text = "<b>INSTRUCTIONS</b>",
                                    TextScaled = true,
                                    RichText = true,
                                    TextXAlignment = "Left",
                                    TextYAlignment = "Top",
                                    BackgroundTransparency = 1,
                                    LayoutOrder = 1,
                                    ZIndex = 3,
                                    Size = UDim2.fromScale(1, 0),
                                    TextColor3 = Color3.fromRGB(124, 228, 255),
                                    Font = Enum.Font.Roboto
                                }, { u2.createElement("UITextSizeConstraint", {
                                        MaxTextSize = DeviceUtil.isSmallScreen() and 16 or 40
                                    }) }),
                                Body = u2.createElement("TextLabel", {
                                    AutomaticSize = "Y",
                                    TextScaled = true,
                                    TextWrap = true,
                                    TextWrapped = true,
                                    TextXAlignment = "Left",
                                    TextYAlignment = "Top",
                                    TextTransparency = 0.3,
                                    BackgroundTransparency = 1,
                                    LayoutOrder = 2,
                                    ZIndex = 3,
                                    Size = UDim2.fromScale(1, 0),
                                    Text = u5.minigame.description,
                                    TextColor3 = Color3.fromRGB(255, 255, 255),
                                    Font = Enum.Font.Roboto
                                }, { u2.createElement("UITextSizeConstraint", {
                                        MaxTextSize = DeviceUtil.isSmallScreen() and 14 or 32
                                    }) })
                            })
                        }) })
                })
            })
        });
    end)
};
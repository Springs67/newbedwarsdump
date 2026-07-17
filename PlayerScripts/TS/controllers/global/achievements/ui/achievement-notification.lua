-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local ShineEffect = v1.ShineEffect;
local ShineEffectVariation = v1.ShineEffectVariation;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local AchievementUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local AchievementIcon = RuntimeLib.import(script, script.Parent, "achievement-icon").AchievementIcon;

return {
    AchievementNotification = v3.new(u2)(function(p4, p5) -- Line: 15
        -- upvalues: AchievementUtil (copy), u2 (copy), UIUtil (copy), TweenService (copy), DeviceUtil (copy), ColorUtil (copy), ShineEffect (copy), ShineEffectVariation (copy), AchievementIcon (copy), BedwarsImageId (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local v6 = AchievementUtil.getMeta(p4.Id);
        local u7 = u2.createRef();
        local u8 = u2.createRef();
        local u9 = u2.createRef();
        local u10 = u2.createRef();
        useEffect(function() -- Line: 23
            -- upvalues: u7 (copy), u8 (copy), u9 (copy), u10 (copy), UIUtil (ref), TweenService (ref), DeviceUtil (ref)
            local u11 = u7:getValue();
            local u12 = u8:getValue();
            local u13 = u9:getValue();
            local u14 = u10:getValue();

            local function u15() -- Line: 30
                -- upvalues: UIUtil (ref), u11 (copy), TweenService (ref), DeviceUtil (ref), u12 (copy), u13 (copy), u14 (copy)
                UIUtil:setContainerTransparency(u11, 1, {
                    durationTillCleanUp = 0.01,
                    onSetTweenInfo = TweenInfo.new(0),
                    onCleanUpTweenInfo = TweenInfo.new(0.1)
                });
                TweenService:Create(u11, TweenInfo.new(0.1), {
                    Position = UDim2.new(0.5, 0, 0, DeviceUtil.isSmallScreen() and 15 or 30)
                }):Play();
                TweenService:Create(u12, TweenInfo.new(0.6, Enum.EasingStyle.Back), {
                    Size = UDim2.fromScale(1, 1)
                }):Play();
                TweenService:Create(u13, TweenInfo.new(1.2, Enum.EasingStyle.Exponential), {
                    Rotation = 420,
                    Size = UDim2.fromScale(3, 3)
                }):Play();
                task.delay(0.9, function() -- Line: 47
                    -- upvalues: TweenService (ref), u13 (ref)
                    TweenService:Create(u13, TweenInfo.new(1.5), {
                        ImageTransparency = 1
                    }):Play();
                end);
                task.delay(3, function() -- Line: 53
                    -- upvalues: UIUtil (ref), u11 (ref), TweenService (ref)
                    UIUtil:setContainerTransparency(u11, 1, {
                        onSetTweenInfo = TweenInfo.new(0.1)
                    });
                    TweenService:Create(u11, TweenInfo.new(0.1), {
                        Position = UDim2.new(0.5, 0, 0, 0)
                    }):Play();
                end);
                UIUtil:setContainerTransparency(u14, 1, {
                    durationTillCleanUp = 0.01,
                    onSetTweenInfo = TweenInfo.new(0),
                    onCleanUpTweenInfo = TweenInfo.new(0.1)
                });
                task.delay(0.5, function() -- Line: 67
                    -- upvalues: UIUtil (ref), u14 (ref)
                    UIUtil:setContainerTransparency(u14, 1, {
                        onSetTweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Sine)
                    });
                end);
                task.delay(2, function() -- Line: 72
                    -- upvalues: u14 (ref)
                    u14:Destroy();
                end);
            end;

            if DeviceUtil.isHoarceKat() then
                task.delay(0, function() -- Line: 77
                    -- upvalues: u15 (copy)
                    return u15();
                end);

                return;
            end;

            u15();
        end);
        local v16 = {
            DisplayOrder = 9999,
            ResetOnSpawn = false,
            IgnoreGuiInset = true
        };
        local v17 = {};
        local v18 = {
            [u2.Ref] = u7,
            Size = UDim2.fromScale(1, 0.2),
            Position = UDim2.new(0.5, 0, 0, 0),
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = ColorUtil.WHITE,
            BorderSizePixel = 0
        };
        local v19 = { u2.createElement("UIGradient", {
                Rotation = 0,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 150, 105)),
                    ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 150, 105)),
                    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(228, 175, 0)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 119, 91))
                })
            }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 20)
            }), u2.createElement("UIStroke", {
                Thickness = 2,
                Color = ColorUtil.WHITE
            }) };
        local v20 = #v19;
        local v21 = {};
        local v22 = math;
        local goal = v6.goal;

        if goal ~= nil then
            goal = goal.value;
        end;

        local v23 = #v6.description(goal == nil and 0 or goal) * 10 + 100;
        v21.AspectRatio = v22.max(v23, 340) / 70;
        v19[v20 + 1] = u2.createElement("UIAspectRatioConstraint", v21);
        v19[v20 + 2] = u2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new((1 / 0), DeviceUtil.isSmallScreen() and 35 or 70)
        });
        v19[v20 + 3] = u2.createElement("Frame", {
            [u2.Ref] = u10,
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundTransparency = 1,
            ClipsDescendants = true
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 20)
            }), u2.createElement(ShineEffect, {
                Speed = 2,
                Loop = false,
                DelayTime = DeviceUtil.isHoarceKat() and 1 or 0,
                Variation = ShineEffectVariation.solid
            }) });
        local v24 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1)
        };
        local v25 = {
            u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            AchievementImage = u2.createElement("Frame", {
                LayoutOrder = 0,
                BackgroundTransparency = 1,
                Size = UDim2.new(0, DeviceUtil.isSmallScreen() and 40 or 80, 1, 0)
            }, {
                u2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 2),
                    PaddingBottom = UDim.new(0, 2),
                    PaddingLeft = UDim.new(0, 5),
                    PaddingRight = UDim.new(0, 0)
                }),
                AchievementIconWrapper = u2.createElement("Frame", {
                    [u2.Ref] = u8,
                    Size = UDim2.fromScale(2.5, 2.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundTransparency = 1,
                    ZIndex = 2
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }), u2.createElement(AchievementIcon, {
                        Simple = true,
                        Darkened = false,
                        Id = p4.Id
                    }) }),
                AchievementGlow = u2.createElement("ImageLabel", {
                    [u2.Ref] = u9,
                    Size = UDim2.fromScale(0, 0),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = BedwarsImageId.ACHIEVEMENT_GLOW,
                    ScaleType = Enum.ScaleType.Fit,
                    BackgroundTransparency = 1,
                    ZIndex = 1
                }, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) })
            })
        };
        local _ = #v25;
        local v26 = {
            Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(DeviceUtil.isSmallScreen() and 35 or 70, 0),
            LayoutOrder = 1,
            BackgroundTransparency = 1
        };
        local v27 = {
            u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, DeviceUtil.isSmallScreen() and 5 or 10)
            }),
            u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, DeviceUtil.isSmallScreen() and 5 or 15),
                PaddingBottom = UDim.new(0, DeviceUtil.isSmallScreen() and 5 or 15),
                PaddingLeft = UDim.new(0, 0),
                PaddingRight = UDim.new(0, DeviceUtil.isSmallScreen() and 10 or 15)
            }),
            AchievementUnlocked = u2.createElement("TextLabel", {
                Text = "ACHIEVEMENT UNLOCKED!",
                TextScaled = true,
                LayoutOrder = 0,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.45),
                FontFace = Font.fromName("RobotoMono", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            }, { u2.createElement("UIStroke", {
                    Transparency = 0.8,
                    Thickness = 1,
                    Color = Color3.fromRGB(64, 220, 255)
                }) })
        };
        local _ = #v27;
        local v28 = {
            Size = UDim2.fromScale(1, 0.55)
        };
        local goal2 = v6.goal;

        if goal2 ~= nil then
            goal2 = goal2.value;
        end;

        v28.Text = v6.description(goal2 == nil and 0 or goal2);
        v28.Font = Enum.Font.LuckiestGuy;
        v28.TextScaled = true;
        v28.TextColor3 = ColorUtil.WHITE;
        v28.LayoutOrder = 1;
        v28.BackgroundTransparency = 1;
        v27.AchievementDesc = u2.createElement("TextLabel", v28, { u2.createElement("UIStroke", {
                Thickness = 1,
                Color = Color3.fromRGB(0, 151, 138)
            }) });
        v25.AchievementText = u2.createElement("Frame", v26, v27);
        v19.AchievementContainer = u2.createElement("Frame", v24, v25);
        v17[#v17 + 1] = u2.createElement("Frame", v18, v19);

        return u2.createFragment({
            AchievementNotification = u2.createElement("ScreenGui", v16, v17)
        });
    end)
};
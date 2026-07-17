-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local TimedProgressBar = v1.TimedProgressBar;
local TooltipContainer = v1.TooltipContainer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local TweenService = v6.TweenService;
local Workspace = v6.Workspace;
local KitShopItemList = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "lobby-kit-shop", "kit-shop-item-list").KitShopItemList;
local CircleCountdown = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "circle-countdown").CircleCountdown;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;
local getBedwarsClassMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class-meta").getBedwarsClassMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v70 = v4.new(u3)(function(u7, p8) -- Line: 29
    -- upvalues: BedwarsKit (copy), u3 (copy), DeviceUtil (copy), KnitClient (copy), u2 (copy), TweenService (copy), DarkBackground (copy), ColorUtil (copy), Empty (copy), TimedProgressBar (copy), Workspace (copy), CircleCountdown (copy), GameSound (copy), BedwarsImageId (copy), BedwarsKitMeta (copy), getBedwarsClassMeta (copy), Theme (copy), SoundManager (copy), TooltipContainer (copy), AutoSizedText (copy), KitShopItemList (copy)
    local useEffect = p8.useEffect;
    local useState = p8.useState;
    local useMemo = p8.useMemo;
    local useValue = p8.useValue;
    local u9, u10 = useState(1);
    local u11 = useValue(u9);
    local v12;

    if u7.SelectedKits then
        v12 = u7.SelectedKits[u9 + 1];
    else
        v12 = nil;
    end;

    local u13, u14 = useState(v12);
    local v15, u16 = useState(u7.SelectedKits or table.create(2, BedwarsKit.RANDOM));
    local v17, u18 = useState("");
    local u19 = u3.createRef();
    local u20 = {};

    local function v25(p21) -- Line: 41
        -- upvalues: DeviceUtil (ref), KnitClient (ref), u11 (copy), BedwarsKit (ref), u16 (copy), u14 (copy)
        if not p21 then
            return false;
        end;

        if not DeviceUtil.isHoarceKat() then
            KnitClient.Controllers.CombinedKitDraftController:onKitSelect(p21, u11.value):andThen(function(p22) -- Line: 47
                -- upvalues: BedwarsKit (ref), u16 (ref)
                local function _(p23) -- Line: 49
                    -- upvalues: BedwarsKit (ref)
                    if p23 == BedwarsKit.NONE then
                        return BedwarsKit.RANDOM;
                    end;

                    return p23;
                end;

                local v24 = table.create(#p22);

                for i, v in p22 do
                    local _ = i - 1;

                    if v == BedwarsKit.NONE then
                        local v = BedwarsKit.RANDOM;
                    end;

                    v24[i] = v;
                end;

                u16(v24);
            end);
        end;

        u14(p21);

        return true;
    end;

    useEffect(function() -- Line: 65
        -- upvalues: u11 (copy), u9 (copy)
        u11.value = u9;
    end, { u9 });
    useEffect(function() -- Line: 68
        -- upvalues: u16 (copy), u13 (copy), BedwarsKit (ref), u11 (copy), u10 (copy)
        u16(function(p26) -- Line: 69
            -- upvalues: u13 (ref), BedwarsKit (ref), u11 (ref)
            local v27 = {};
            table.move(p26, 1, #p26, #v27 + 1, v27);
            local v28 = u13 or BedwarsKit.RANDOM;

            if v28 == BedwarsKit.NONE then
                v28 = BedwarsKit.RANDOM;
            end;

            v27[u11.value + 1] = v28;

            return v27;
        end);
        u10(function(p29) -- Line: 78
            -- upvalues: u11 (ref)
            local v30 = (p29 + 1) % 2;
            u11.value = v30;

            return v30;
        end);
    end, { u13 });
    useEffect(function() -- Line: 84
        -- upvalues: u19 (copy), u2 (ref), TweenService (ref)
        local u31 = u19:getValue();

        if not u31 then
            return nil;
        end;

        local u32 = u2.new();
        local u33 = TweenService:Create(u31, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            Transparency = 0.25
        });
        local u34 = TweenService:Create(u31, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            Transparency = 0.5
        });
        u32:GiveTask(u33.Completed:Connect(function() -- Line: 96
            -- upvalues: u32 (copy), u34 (copy)
            u32:GiveTask(task.delay(0.5, function() -- Line: 97
                -- upvalues: u34 (ref)
                u34:Play();
            end));
        end));
        u32:GiveTask(function() -- Line: 101
            -- upvalues: u33 (copy)
            u33:Cancel();
            u33:Destroy();
        end);
        u32:GiveTask(u34.Completed:Connect(function() -- Line: 105
            -- upvalues: u32 (copy), u33 (copy)
            u32:GiveTask(task.delay(0.5, function() -- Line: 106
                -- upvalues: u33 (ref)
                u33:Play();
            end));
        end));
        u32:GiveTask(function() -- Line: 110
            -- upvalues: u34 (copy)
            u34:Cancel();
            u34:Destroy();
        end);
        u33:Play();

        return function() -- Line: 115
            -- upvalues: u32 (copy), u31 (copy)
            u32:Destroy();
            u31.Transparency = 0;
        end;
    end, {});
    useEffect(function() -- Line: 120
        -- upvalues: u2 (ref), u20 (copy), TweenService (ref)
        local u35 = u2.new();

        for _, v in u20 do
            local u36 = v.ref:getValue();

            if u36 then
                local u37 = TweenService:Create(u36, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    Transparency = 0.5
                });
                local u38 = TweenService:Create(u36, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                    Transparency = 0
                });
                u35:GiveTask(function() -- Line: 133
                    -- upvalues: u36 (copy)
                    u36.Transparency = 0;
                end);
                u35:GiveTask(u37.Completed:Connect(function() -- Line: 136
                    -- upvalues: u35 (copy), u38 (copy)
                    u35:GiveTask(task.delay(0.5, function() -- Line: 137
                        -- upvalues: u38 (ref)
                        u38:Play();
                    end));
                end));
                u35:GiveTask(function() -- Line: 141
                    -- upvalues: u37 (copy)
                    u37:Cancel();
                    u37:Destroy();
                end);
                u35:GiveTask(u38.Completed:Connect(function() -- Line: 145
                    -- upvalues: u35 (copy), u37 (copy)
                    u35:GiveTask(task.delay(0.5, function() -- Line: 146
                        -- upvalues: u37 (ref)
                        u37:Play();
                    end));
                end));
                u35:GiveTask(function() -- Line: 150
                    -- upvalues: u38 (copy)
                    u38:Cancel();
                    u38:Destroy();
                end);
                u37:Play();
            end;
        end;

        return function() -- Line: 156
            -- upvalues: u35 (copy)
            u35:Destroy();
        end;
    end, { v15, u9 });
    local u39 = useMemo(function() -- Line: 160
        -- upvalues: u7 (copy)
        return u7.CustomMatch ~= nil;
    end, { u7.CustomMatch });
    useEffect(function() -- Line: 163
        -- upvalues: u2 (ref), u39 (copy), u7 (copy), u18 (copy)
        local u40 = u2.new();

        if not u39 then
            local startTime = u7.store.Game.startTime;
            local v41 = math.max(startTime == nil and 0 or startTime, 0);
            u40:GiveTask(task.delay(v41 - os.time(), function() -- Line: 172
                -- upvalues: u18 (ref)
                u18("Starting Match...");
            end));
        end;

        u18(u39 and "Select your Kits..." or "Match Begins in...");

        return function() -- Line: 177
            -- upvalues: u40 (copy)
            u40:Destroy();
        end;
    end, { u7.CustomMatch, u7.store.Game.startTime });
    local v42 = {
        DisplayOrder = 1500,
        IgnoreGuiInset = true
    };
    local v43 = { u3.createElement(DarkBackground, {
            AppId = u7.AppId
        }) };
    local _ = #v43;
    local v44 = {
        AutoButtonColor = false,
        Image = "rbxassetid://71356717298935",
        Size = UDim2.fromScale(1, 1),
        ScaleType = Enum.ScaleType.Crop
    };
    local v45 = {
        u3.createElement("Frame", {
            Transparency = 0.5,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = ColorUtil.BLACK
        }),
        BackgroundGradient = u3.createElement("Frame", {
            [u3.Ref] = u19,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = ColorUtil.WHITE,
            Transparency = 0.5
        }, { u3.createElement("UIGradient", {
                Rotation = 90,
                Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.625, 1), NumberSequenceKeypoint.new(1, 0.3) }),
                Color = ColorSequence.new(ColorUtil.WHITE)
            }) })
    };
    local createElement = u3.createElement;
    local v46 = {
        Size = UDim2.fromScale(1, 0.2)
    };
    local v47 = {};
    local v48 = u3.createElement("TextLabel", {
        TextScaled = true,
        BackgroundTransparency = 1,
        TextTransparency = 0,
        ZIndex = 10,
        LayoutOrder = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, u7.CustomMatch and 0.5 or 0.22),
        Size = UDim2.fromScale(0.2, 0.4),
        Text = v17,
        TextColor3 = ColorUtil.WHITE,
        TextXAlignment = Enum.TextXAlignment.Center,
        FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
    });
    local v49;

    if u39 then
        v49 = u3.createFragment({
            GoBackIcon = u3.createElement("ImageButton", {
                LayoutOrder = 0,
                Size = UDim2.fromScale(0.25, 0.25),
                Image = BedwarsImageId.ARROW_LEFT,
                SizeConstraint = Enum.SizeConstraint.RelativeYY,
                ScaleType = Enum.ScaleType.Fit,
                Rotation = 180,
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.fromScale(0.95, 0.5),
                ImageTransparency = 0.2,
                BackgroundTransparency = 1,

                [u3.Event.MouseButton1Click] = function() -- Line: 316
                    -- upvalues: KnitClient (ref)
                    KnitClient.Controllers.CombinedKitDraftController:unmountUI();
                end
            })
        });
    else
        v49 = useMemo(function() -- Line: 232
            -- upvalues: u7 (copy), u3 (ref), Empty (ref), TimedProgressBar (ref), Workspace (ref), CircleCountdown (ref), GameSound (ref)
            local startTime = u7.store.Game.startTime;
            local v50 = math.max(startTime == nil and 0 or startTime, 0);

            return u3.createFragment({
                CountdownSection = u3.createElement(Empty, {
                    Size = UDim2.fromScale(0.7, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.68)
                }, { u3.createElement(Empty, {
                        Size = UDim2.new(0.45, 0, 0.15, 0),
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.fromScale(0, 0.5)
                    }, { u3.createElement("UIPadding", {
                            PaddingRight = UDim.new(0.1, 0),
                            PaddingLeft = UDim.new(0.1, 0)
                        }), u3.createElement(TimedProgressBar, {
                            Rotation = 180,
                            Size = UDim2.fromScale(1, 1),
                            StartTime = Workspace:GetServerTimeNow(),
                            EndTime = v50,
                            BackgroundColor3 = Color3.fromRGB(64, 5, 5),
                            ProgressBarConfig = {
                                GradientRotation = 180,
                                Flip = true,
                                BarGradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(66, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 56, 56)) })
                            }
                        }) }), u3.createElement(CircleCountdown, {
                        OnlyPlaySoundLastNSec = 10,
                        EndTime = v50,
                        FrameProps = {
                            ZIndex = 3,
                            Size = UDim2.fromScale(0.2, 0.9),
                            Position = UDim2.fromScale(0.5, 0.5),
                            AnchorPoint = Vector2.new(0.5, 0.5)
                        },
                        PlayCustomSoundAtTime = {
                            timeLeftSec = 3,
                            sound = GameSound.LTM_GOAL_MOVING_SOUND
                        }
                    }), u3.createElement(Empty, {
                        Size = UDim2.new(0.45, 0, 0.15, 0),
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.fromScale(1, 0.5)
                    }, { u3.createElement("UIPadding", {
                            PaddingRight = UDim.new(0.1, 0),
                            PaddingLeft = UDim.new(0.1, 0)
                        }), u3.createElement(TimedProgressBar, {
                            Size = UDim2.fromScale(1, 1),
                            StartTime = Workspace:GetServerTimeNow(),
                            EndTime = v50,
                            BackgroundColor3 = Color3.fromRGB(64, 5, 5),
                            ProgressBarConfig = {
                                GradientRotation = 180,
                                Flip = true,
                                BarGradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(66, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 56, 56)) })
                            }
                        }) }) })
            });
        end, { u7.store.Game.startTime });
    end;

    v47[1], v47[2] = v48, v49;
    v45.Header = createElement(Empty, v46, v47);
    local v51 = #v45;
    local v52 = {
        Size = UDim2.fromScale(0.25, 0.8),
        Position = UDim2.fromScale(0, 0.2),
        AnchorPoint = Vector2.new(0, 0)
    };
    local v53 = {};

    local function v65(p54, u55) -- Line: 331
        -- upvalues: BedwarsKitMeta (ref), getBedwarsClassMeta (ref), u3 (ref), u20 (copy), u9 (copy), ColorUtil (ref), Theme (ref), SoundManager (ref), GameSound (ref), u11 (copy), u10 (copy), Empty (ref), TooltipContainer (ref), AutoSizedText (ref)
        local v56 = BedwarsKitMeta[p54];
        local v57;

        if v56.kitClass == nil then
            v57 = nil;
        else
            v57 = getBedwarsClassMeta(v56.kitClass);
        end;

        local v58 = u3.createRef();
        table.insert(u20, {
            ref = v58,
            index = u55
        });
        local v59 = {
            Size = UDim2.fromScale(1, 1)
        };
        local v60;

        if u55 == u9 then
            v60 = ColorUtil.darken(Theme.backgroundPrimary, 0.6);
        else
            v60 = ColorUtil.darken(Theme.backgroundPrimary, 0.2);
        end;

        v59.BackgroundColor3 = v60;
        v59.BorderSizePixel = 0;
        v59.Image = BedwarsKitMeta[p54].renderImage;

        v59[u3.Event.MouseButton1Click] = function() -- Line: 345
            -- upvalues: SoundManager (ref), GameSound (ref), u11 (ref), u55 (copy), u10 (ref)
            SoundManager:playSound(GameSound.UI_CLICK);
            u11.value = u55;
            u10(u55);
        end;

        local v61 = {
            u3.createElement("UICorner", {
                CornerRadius = UDim.new(0.03, 0)
            }),
            u3.createElement("UIStroke", {
                Color = Color3.fromRGB(255, 255, 255),
                Thickness = u55 == u9 and 3 or 0,
                [u3.Ref] = v58
            }),
            u3.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }),
            KitNumber = u3.createElement(Empty, {
                ZIndex = 10,
                Size = UDim2.fromScale(1, 0.16),
                BackgroundColor3 = ColorUtil.BLACK
            }, { u3.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.035, 0)
                }), u3.createElement(Empty, {
                    LayoutOrder = 0
                }), u3.createElement("TextLabel", {
                    TextScaled = true,
                    TextXAlignment = "Left",
                    BackgroundTransparency = 1,
                    TextTransparency = 0,
                    ZIndex = 10,
                    LayoutOrder = 2,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.fromScale(0.8, 0.8),
                    Text = "Kit " .. tostring(u55 + 1),
                    TextColor3 = ColorUtil.WHITE,
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
                }) })
        };
        local _ = #v61;
        local v62 = {
            BackgroundTransparency = 0.55,
            ZIndex = 10,
            Size = UDim2.fromScale(1, 0.16),
            Position = UDim2.fromScale(0, 1),
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v63 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.035, 0)
            }), u3.createElement("UICorner", {
                CornerRadius = UDim.new(0.03, 0)
            }), u3.createElement(Empty, {
                LayoutOrder = 0
            }) };
        local v64 = #v63;

        if v57 then
            if v57.imageId == "" then
                v57 = false;
            else
                v57 = u3.createFragment({
                    KitClass = u3.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        ScaleType = "Fit",
                        ImageTransparency = 0,
                        ZIndex = 10,
                        LayoutOrder = 1,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Size = UDim2.fromScale(0.12, 0.75),
                        Image = v57.imageId
                    }, { u3.createElement(TooltipContainer, {}, { u3.createElement(AutoSizedText, {
                                TextSize = 16,
                                Text = v57.display,
                                Font = Enum.Font.SourceSansBold
                            }) }), u3.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }) })
                });
            end;
        end;

        if v57 then
            v63[v64 + 1] = v57;
        end;

        v63[#v63 + 1] = u3.createElement("TextLabel", {
            TextScaled = true,
            TextXAlignment = "Left",
            BackgroundTransparency = 1,
            TextTransparency = 0,
            ZIndex = 10,
            LayoutOrder = 2,
            AnchorPoint = Vector2.new(0, 0.5),
            Size = UDim2.fromScale(0.8, 0.8),
            Text = v56.name,
            TextColor3 = ColorUtil.WHITE,
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        });
        v61.KitNameTag = u3.createElement("Frame", v62, v63);

        return u3.createElement("ImageButton", v59, v61);
    end;

    local v66 = table.create(#v15);

    for i, v in v15 do
        v66[i] = v65(v, i - 1, v15);
    end;

    local v67 = {
        Size = UDim2.fromScale(0.35, 0.75),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v68 = { u3.createElement("UIListLayout", {
            VerticalFlex = "SpaceAround",
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0.01, 0)
        }) };
    local v69 = #v68;

    for i, v in v66 do
        v68[v69 + i] = v;
    end;

    v53[#v53 + 1] = u3.createElement(Empty, v67, v68);
    v45[v51 + 1] = u3.createElement(Empty, v52, v53);
    v45[v51 + 2] = u3.createElement(Empty, {
        Size = UDim2.fromScale(0.7, 0.8),
        Position = UDim2.fromScale(1, 0.2),
        AnchorPoint = Vector2.new(1, 0)
    }, {
        KitSelection = u3.createElement(Empty, {
            Size = UDim2.fromScale(0.9, 1),
            Position = UDim2.fromScale(0.4, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Top",
                Padding = UDim.new(0.01, 0)
            }), u3.createElement(KitShopItemList, {
                SelectionMode = "SELECTION_ONLY",
                Size = UDim2.fromScale(1, 0.9),
                store = u7.store,
                SelectedKit = u13,
                SetSelectedKit = v25
            }) })
    });
    v43.CombinedKitDraftApp = u3.createElement("ImageButton", v44, v45);

    return u3.createElement("ScreenGui", v42, v43);
end);

return {
    KIT_SELECTION_LENGTH = 2,
    CombinedKitDraftApp = v5.connect(function(p71, p72) -- Line: 514
        local v73 = {};

        for i, v in p72 do
            v73[i] = v;
        end;

        v73.store = p71;
        v73.CustomMatch = p71.Game.customMatch;

        return v73;
    end)(v70)
};
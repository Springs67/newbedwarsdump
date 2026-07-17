-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local SummonedSpiritType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "summoned-spirit-type").SummonedSpiritType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GLOW_PANEL_BLUE = BedwarsImageId.GLOW_PANEL_BLUE;

return {
    SpiritSummonerDisplay = v4.new(u3)(function(p5, p6) -- Line: 15
        -- upvalues: DeviceUtil (copy), SummonedSpiritType (copy), BedwarsImageId (copy), u2 (copy), Players (copy), u3 (copy), GLOW_PANEL_BLUE (copy), TooltipContainer (copy), AutoSizedText (copy), ColorUtil (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local v7 = DeviceUtil.isSmallScreen() and 1.5 or 1;
        local v8, u9 = useState(1);
        local v10, u11 = useState(0);
        local v12, u13 = useState(0);
        local v14, u15 = useState(SummonedSpiritType.ATTACK);
        local v16 = Color3.fromRGB(255, 148, 235);
        local v17;

        if v8 == 1 then
            v17 = BedwarsImageId.SPIRIT_SUMMONER_TIER_1_LARGE;
        elseif v8 == 2 then
            v17 = BedwarsImageId.SPIRIT_SUMMONER_TIER_2_LARGE;
        elseif v8 == 3 then
            v17 = BedwarsImageId.SPIRIT_SUMMONER_TIER_3_LARGE;
        else
            v17 = BedwarsImageId.SPIRIT_SUMMONER_TIER_1_LARGE;
        end;

        useEffect(function() -- Line: 45
            -- upvalues: DeviceUtil (ref), u2 (ref), Players (ref), u9 (copy), u11 (copy), u13 (copy), u15 (copy)
            if DeviceUtil.isHoarceKat() then
                return nil;
            end;

            local u18 = u2.new();
            u18:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("SpiritSummonerTier"):Connect(function() -- Line: 50
                -- upvalues: u9 (ref), Players (ref)
                u9(Players.LocalPlayer:GetAttribute("SpiritSummonerTier"));
            end));
            u18:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("ReadySummonedAttackSpirits"):Connect(function() -- Line: 53
                -- upvalues: u11 (ref), Players (ref)
                u11(Players.LocalPlayer:GetAttribute("ReadySummonedAttackSpirits"));
            end));
            u18:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("ReadySummonedHealSpirits"):Connect(function() -- Line: 56
                -- upvalues: u13 (ref), Players (ref)
                u13(Players.LocalPlayer:GetAttribute("ReadySummonedHealSpirits"));
            end));
            u18:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("SpiritSummonerAffinity"):Connect(function() -- Line: 59
                -- upvalues: u15 (ref), Players (ref)
                u15(Players.LocalPlayer:GetAttribute("SpiritSummonerAffinity"));
            end));

            return function() -- Line: 62
                -- upvalues: u18 (copy)
                u18:DoCleaning();
            end;
        end);

        return u3.createFragment({
            SpiritSummonerDisplay = u3.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u3.createElement("Frame", {
                    Transparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(v7 * 0.13, v7 * 0.24),
                    Position = UDim2.fromScale(0.025, DeviceUtil.isMobileControls() and 0.25 or 0.3)
                }, {
                    OuterContainer = u3.createElement("ImageLabel", {
                        BorderSizePixel = 0,
                        ImageTransparency = 0.35,
                        BackgroundTransparency = 0,
                        Image = GLOW_PANEL_BLUE,
                        Size = UDim2.fromScale(0.5, 1),
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    }, {
                        u3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical,
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            VerticalAlignment = Enum.VerticalAlignment.Center,
                            Padding = UDim.new(0.01),
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }),
                        u3.createElement("UIStroke", {
                            Thickness = 1,
                            Transparency = 0.5,
                            Color = Color3.fromRGB(0, 247, 255)
                        }),
                        u3.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 4)
                        }),
                        u3.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 0.4
                        }),
                        u3.createElement("UIGradient", {
                            Rotation = 90,
                            Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 196, 250)), ColorSequenceKeypoint.new(1, Color3.fromRGB(94, 189, 255)) }),
                            Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.3), NumberSequenceKeypoint.new(1, 0.3) })
                        }),
                        CurrentSpiritTierWrapper = u3.createElement("Frame", {
                            BackgroundTransparency = 1,
                            Size = UDim2.fromScale(1, 0.3)
                        }, {
                            CurrentSpiritTier = u3.createElement("ImageLabel", {
                                BackgroundTransparency = 1,
                                LayoutOrder = 1,
                                Size = UDim2.fromScale(0.9, 0.9),
                                Image = v17,
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.fromScale(0.5, 0.5)
                            }, { u3.createElement("UIAspectRatioConstraint", {
                                    AspectRatio = 1
                                }), u3.createElement(TooltipContainer, {}, { u3.createElement(AutoSizedText, {
                                        Text = "Current Spirit Tier",
                                        TextSize = 16,
                                        Font = Enum.Font.SourceSansBold,
                                        Limits = Vector2.new(300, 60)
                                    }) }) })
                        }),
                        AttackSpirits = u3.createElement("Frame", {
                            BackgroundTransparency = 1,
                            LayoutOrder = 2,
                            Size = UDim2.fromScale(1, 0.3)
                        }, {
                            AttackSpiritContainer = u3.createElement("Frame", {
                                Size = UDim2.fromScale(0.8, 0.9),
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.fromScale(0.5, 0.5),
                                BackgroundTransparency = v14 == SummonedSpiritType.ATTACK and 0.5 or 1,
                                BackgroundColor3 = v16
                            }, {
                                u3.createElement("UIStroke", {
                                    Thickness = 2,
                                    Color = ColorUtil.WHITE,
                                    Transparency = v14 == SummonedSpiritType.ATTACK and 0.5 or 1
                                }),
                                u3.createElement("UICorner", {
                                    CornerRadius = UDim.new(0, 6)
                                }),
                                u3.createElement("ImageLabel", {
                                    BackgroundTransparency = 1,
                                    Size = UDim2.fromScale(0.45, 1),
                                    Image = BedwarsImageId.ATTACK_SPIRIT_ICON,
                                    AnchorPoint = Vector2.new(0, 0.5),
                                    Position = UDim2.fromScale(0.05, 0.5)
                                }, { u3.createElement(TooltipContainer, {}, { u3.createElement(AutoSizedText, {
                                            Text = "Ready Attack Spirits",
                                            TextSize = 16,
                                            Font = Enum.Font.SourceSansBold,
                                            Limits = Vector2.new(300, 60)
                                        }) }), u3.createElement("UIAspectRatioConstraint", {
                                        AspectRatio = 1
                                    }) }),
                                u3.createElement("TextLabel", {
                                    BackgroundTransparency = 1,
                                    TextScaled = true,
                                    Size = UDim2.fromScale(0.45, 0.45),
                                    Text = tostring(v10),
                                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                                    TextColor3 = ColorUtil.WHITE,
                                    AnchorPoint = Vector2.new(1, 0.5),
                                    Position = UDim2.fromScale(0.95, 0.5)
                                })
                            })
                        }),
                        HealSpirits = u3.createElement("Frame", {
                            BackgroundTransparency = 1,
                            LayoutOrder = 2,
                            Size = UDim2.fromScale(1, 0.3)
                        }, {
                            HealSpiritContainer = u3.createElement("Frame", {
                                Size = UDim2.fromScale(0.8, 0.9),
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.fromScale(0.5, 0.5),
                                BackgroundTransparency = v14 == SummonedSpiritType.HEAL and 0.5 or 1,
                                BackgroundColor3 = v16
                            }, {
                                u3.createElement("UIStroke", {
                                    Thickness = 2,
                                    Color = ColorUtil.WHITE,
                                    Transparency = v14 == SummonedSpiritType.HEAL and 0.5 or 1
                                }),
                                u3.createElement("UICorner", {
                                    CornerRadius = UDim.new(0, 6)
                                }),
                                u3.createElement("ImageLabel", {
                                    BackgroundTransparency = 1,
                                    Size = UDim2.fromScale(0.45, 1),
                                    AnchorPoint = Vector2.new(0, 0.5),
                                    Position = UDim2.fromScale(0.05, 0.5),
                                    Image = BedwarsImageId.HEAL_SPIRIT_ICON
                                }, { u3.createElement(TooltipContainer, {}, { u3.createElement(AutoSizedText, {
                                            Text = "Ready Heal Spirits",
                                            TextSize = 16,
                                            Font = Enum.Font.SourceSansBold,
                                            Limits = Vector2.new(300, 60)
                                        }) }), u3.createElement("UIAspectRatioConstraint", {
                                        AspectRatio = 1
                                    }) }),
                                u3.createElement("TextLabel", {
                                    BackgroundTransparency = 1,
                                    TextScaled = true,
                                    Size = UDim2.fromScale(0.45, 0.45),
                                    AnchorPoint = Vector2.new(1, 0.5),
                                    Position = UDim2.fromScale(0.95, 0.5),
                                    Text = tostring(v12),
                                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                                    TextColor3 = ColorUtil.WHITE
                                })
                            })
                        })
                    })
                }) })
        });
    end)
};
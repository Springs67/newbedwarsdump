-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ScaleComponent = v1.ScaleComponent;
local SlideIn = v1.SlideIn;
local WidgetComponent = v1.WidgetComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local EngineerFilmEffect = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "watcher", "ui", "engineer-film-effect").EngineerFilmEffect;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local EnchantItemGrid = RuntimeLib.import(script, script.Parent, "enchant-table-left", "enchant-item-grid").EnchantItemGrid;
local EnchantActionButton = RuntimeLib.import(script, script.Parent, "enchant-table-right", "enchants-action-button").EnchantActionButton;
local EnchantTableUIUtil = RuntimeLib.import(script, script.Parent, "enchant-table-ui-util").EnchantTableUIUtil;
local v15 = v3.new(u2)(function(p5, p6) -- Line: 21
    -- upvalues: EnchantTableUIUtil (copy), u2 (copy), TweenService (copy), DeviceUtil (copy), DarkBackground (copy), ItemType (copy), EngineerFilmEffect (copy), SlideIn (copy), ScaleComponent (copy), WidgetComponent (copy), Empty (copy), Theme (copy), ColorUtil (copy), EnchantItemGrid (copy), EnchantActionButton (copy)
    local _ = p6.useState;
    local useEffect = p6.useEffect;
    local v7 = p5.ThemeColor or EnchantTableUIUtil.getThemeColor(p5.EnchantTableType);
    local u8 = u2.createRef();
    useEffect(function() -- Line: 26
        -- upvalues: u8 (copy), TweenService (ref)
        local u9 = u8:getValue();

        if u9 then
            local u10 = TweenService:Create(u9, TweenInfo.new(5, Enum.EasingStyle.Linear), {
                Offset = Vector2.new(-1, 0)
            });
            u10:Play();
            u10.Completed:Connect(function() -- Line: 33
                -- upvalues: u9 (copy), u10 (copy)
                if u9.Rotation == 180 then
                    u9.Rotation = 0;
                    u9.Offset = Vector2.new(1, 0);
                else
                    u9.Rotation = 180;
                    u9.Offset = Vector2.new(1, 0);
                end;

                u10:Play();
            end);
        end;
    end, {});
    local v11 = {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v12 = { u2.createElement(DarkBackground, {
            BackgroundTransparency = 0.4,
            AppId = p5.AppId
        }) };
    local v13 = #v12;
    local v14;

    if p5.EnchantTableType == ItemType.ENCHANT_TABLE_GLITCHED then
        v14 = u2.createElement(EngineerFilmEffect, {
            transparency = 0.95
        });
    else
        v14 = false;
    end;

    if v14 then
        v12[v13 + 1] = v14;
    end;

    v12[#v12 + 1] = u2.createElement(SlideIn, {}, { u2.createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(622, 380)
        }, { u2.createElement(ScaleComponent, {
                MaximumSize = Vector2.new(889, 543),
                ScreenPadding = Vector2.new(24, 24)
            }), u2.createElement(WidgetComponent, {
                Title = "Enchanting Table",
                AppId = p5.AppId,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                ContentUIPadding = u2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 0),
                    PaddingRight = UDim.new(0, 0),
                    PaddingTop = UDim.new(0, 0),
                    PaddingBottom = UDim.new(0, 0)
                }),
                CornerFillerProps = {
                    TopLeft = false,
                    TopRight = true
                }
            }, { u2.createElement(Empty, {
                    Size = UDim2.fromScale(1, 1)
                }, {
                    u2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Top,
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }),
                    Top = u2.createElement("Frame", {
                        LayoutOrder = 1,
                        BorderSizePixel = 0,
                        Size = UDim2.fromScale(1, 0.2),
                        BackgroundColor3 = Theme.backgroundTertiary
                    }, {
                        u2.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0.08, 0),
                            PaddingRight = UDim.new(0.08, 0),
                            PaddingTop = UDim.new(0.1, 0),
                            PaddingBottom = UDim.new(0.05, 0)
                        }),
                        u2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical,
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            VerticalAlignment = Enum.VerticalAlignment.Top,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = UDim.new(0.02, 0)
                        }),
                        TitleContainer1 = u2.createElement("Frame", {
                            BackgroundTransparency = 0.7,
                            BorderSizePixel = 0,
                            LayoutOrder = 1,
                            Size = UDim2.fromScale(1, 0.3),
                            BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        }, {
                            u2.createElement("UICorner", {
                                CornerRadius = UDim.new(0.1, 0)
                            }),
                            Title = u2.createElement("TextLabel", {
                                Text = "Description",
                                TextScaled = true,
                                BackgroundTransparency = 1,
                                Size = UDim2.fromScale(0.9, 0.8),
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.fromScale(0.5, 0.5),
                                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                                TextColor3 = Color3.fromRGB(255, 255, 255)
                            })
                        }),
                        Description = u2.createElement("TextLabel", {
                            TextTransparency = 0.3,
                            TextScaled = true,
                            RichText = true,
                            TextXAlignment = "Center",
                            TextYAlignment = "Center",
                            BackgroundTransparency = 1,
                            LayoutOrder = 2,
                            Size = UDim2.fromScale(1, 0.7),
                            Position = UDim2.fromScale(0.5, 0.5),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Text = "Apply a random enchant to your weapons. " .. (DeviceUtil.isMobileControls() and "Tap" or "Hover") .. " enchant below to read description.",
                            TextColor3 = ColorUtil.WHITE
                        }, { u2.createElement("UITextSizeConstraint", {
                                MaxTextSize = DeviceUtil.isSmallScreen() and 10 or 13
                            }) })
                    }),
                    Bottom = u2.createElement("Frame", {
                        LayoutOrder = 2,
                        BorderSizePixel = 0,
                        Size = UDim2.fromScale(1, 0.8),
                        BackgroundColor3 = Theme.backgroundTertiary
                    }, {
                        u2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal,
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            VerticalAlignment = Enum.VerticalAlignment.Top,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = UDim.new(0.02, 0)
                        }),
                        u2.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0.08, 0),
                            PaddingRight = UDim.new(0.08, 0),
                            PaddingTop = UDim.new(0.05, 0),
                            PaddingBottom = UDim.new(0.05, 0)
                        }),
                        ["Weapon Enchants"] = u2.createElement("Frame", {
                            LayoutOrder = 1,
                            BackgroundTransparency = 0.7,
                            BorderSizePixel = 0,
                            ZIndex = 1,
                            Size = UDim2.fromScale(0.5, 1),
                            BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        }, {
                            u2.createElement("ImageLabel", {
                                ScaleType = "Fit",
                                Image = "rbxassetid://121940241866220",
                                BackgroundTransparency = 1,
                                ZIndex = 10,
                                Size = UDim2.fromScale(0.25, 0.25),
                                Position = UDim2.fromScale(0.5, 0),
                                AnchorPoint = Vector2.new(0.5, 0.5)
                            }),
                            u2.createElement("UICorner", {
                                CornerRadius = UDim.new(0.1, 0)
                            }),
                            GradientOverlay = u2.createElement("Frame", {
                                BorderSizePixel = 0,
                                ZIndex = 2,
                                Size = UDim2.fromScale(1, 1),
                                BackgroundColor3 = ColorUtil.WHITE
                            }, { u2.createElement("UICorner", {
                                    CornerRadius = UDim.new(0.1, 0)
                                }), u2.createElement("UIGradient", {
                                    Rotation = -90,
                                    Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.darken(v7, 0.6)), ColorSequenceKeypoint.new(0.5, ColorUtil.darken(v7, 0.7)), ColorSequenceKeypoint.new(1, ColorUtil.darken(v7, 0.8)) }),
                                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.3), NumberSequenceKeypoint.new(0.6, 1), NumberSequenceKeypoint.new(1, 1) })
                                }) }),
                            WeaponEnchantFrame = u2.createElement("Frame", {
                                LayoutOrder = 1,
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                Size = UDim2.fromScale(1, 1)
                            }, {
                                u2.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Vertical,
                                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                                    VerticalAlignment = Enum.VerticalAlignment.Top,
                                    SortOrder = Enum.SortOrder.LayoutOrder,
                                    Padding = UDim.new(0.02, 0)
                                }),
                                u2.createElement("UIPadding", {
                                    PaddingLeft = UDim.new(0.08, 0),
                                    PaddingRight = UDim.new(0.08, 0),
                                    PaddingTop = UDim.new(0.05, 0),
                                    PaddingBottom = UDim.new(0.05, 0)
                                }),
                                TitleContainer2 = u2.createElement("Frame", {
                                    BackgroundTransparency = 0.7,
                                    BorderSizePixel = 0,
                                    LayoutOrder = 1,
                                    Size = UDim2.fromScale(0.9, 0.1),
                                    BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                                }, {
                                    u2.createElement("UICorner", {
                                        CornerRadius = UDim.new(0.1, 0)
                                    }),
                                    Title = u2.createElement("TextLabel", {
                                        Text = "Weapon Enchants",
                                        TextScaled = true,
                                        BackgroundTransparency = 1,
                                        Size = UDim2.fromScale(0.9, 1),
                                        AnchorPoint = Vector2.new(0.5, 0.5),
                                        Position = UDim2.fromScale(0.5, 0.5),
                                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                                        TextColor3 = Color3.fromRGB(255, 255, 255)
                                    })
                                }),
                                EnchantItemGrid = u2.createElement("Frame", {
                                    BackgroundTransparency = 1,
                                    BorderSizePixel = 0,
                                    LayoutOrder = 2,
                                    ZIndex = 100,
                                    Size = UDim2.fromScale(1, 0.7)
                                }, { u2.createElement(EnchantItemGrid, {
                                        LayoutOrder = 3,
                                        EnchantTableType = p5.EnchantTableType,
                                        Size = UDim2.fromScale(1, 1)
                                    }) }),
                                EnchantItemButton = u2.createElement("Frame", {
                                    BorderSizePixel = 0,
                                    LayoutOrder = 5,
                                    BackgroundTransparency = 0.7,
                                    ZIndex = 10,
                                    Size = UDim2.fromScale(1, 0.15),
                                    BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                }, { u2.createElement(EnchantActionButton, {
                                        LayoutOrder = 6,
                                        Size = UDim2.fromScale(1, 1)
                                    }) })
                            })
                        })
                    })
                }) }) }) });

    return u2.createElement("ScreenGui", v11, v12);
end);

return {
    EnchantApp = v4.connect(function(p16, p17) -- Line: 290
        local v18 = {};

        for i, v in p17 do
            v18[i] = v;
        end;

        return v18;
    end)(v15)
};
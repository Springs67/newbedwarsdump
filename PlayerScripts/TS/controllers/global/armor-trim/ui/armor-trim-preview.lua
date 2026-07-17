-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local Empty = v1.Empty;
local Padding = v1.Padding;
local StringUtil = v1.StringUtil;
local TooltipContainer = v1.TooltipContainer;
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "color-util").ColorUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local ArmorTrimPackTypeMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta").ArmorTrimPackTypeMeta;
local ArmorTrimEffectRank = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank").ArmorTrimEffectRank;
local ArmorTrimPackType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimPackType;
local armorTrimUnlockDefinition = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-unlock-definition").armorTrimUnlockDefinition;
local ArmorTrimUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ArmorTrimPlayerViewport = RuntimeLib.import(script, script.Parent, "armor-trim-player-viewport").ArmorTrimPlayerViewport;

return {
    ArmorTrimPreview = v4.new(u3)(function(u5, p6) -- Line: 23
        -- upvalues: u3 (copy), u2 (copy), ArmorTrimPackType (copy), ArmorTrimPackTypeMeta (copy), ArmorTrimUtil (copy), armorTrimUnlockDefinition (copy), TweenService (copy), ColorUtil (copy), Empty (copy), Padding (copy), StringUtil (copy), ArmorTrimPlayerViewport (copy), BedwarsKit (copy), ArmorTrimEffectRank (copy), Theme (copy), TooltipContainer (copy), AutoSizedText (copy), BedwarsImageId (copy)
        local useEffect = p6.useEffect;
        local u7, u8 = p6.useState(false);
        local u9 = u3.createRef();
        local v10 = u2.values(ArmorTrimPackType);

        local function _(p11) -- Line: 29
            -- upvalues: ArmorTrimPackTypeMeta (ref), ArmorTrimUtil (ref), u5 (copy)
            return {
                pack = p11,
                packDisplayName = ArmorTrimPackTypeMeta[p11].displayName,
                rate = ArmorTrimUtil.getArmorTrimRate(u5.ArmorTrimType, u5.ArmorTrimProgressData, p11)
            };
        end;

        local v12 = table.create(#v10);

        for i, v in v10 do
            local _ = i - 1;
            v12[i] = {
                pack = v,
                packDisplayName = ArmorTrimPackTypeMeta[v].displayName,
                rate = ArmorTrimUtil.getArmorTrimRate(u5.ArmorTrimType, u5.ArmorTrimProgressData, v)
            };
        end;

        local v13 = armorTrimUnlockDefinition[u5.ArmorTrimType];
        local v14;

        if v13 == nil then
            v14 = v13;
        else
            v14 = v13.limited;

            if v14 ~= nil then
                v14 = v14.endTime;
            end;
        end;

        local v15 = v14 ~= nil;
        local v16;

        if v15 and u5.ArmorTrimType then
            v16 = v13.limited.endTime < os.time();
        else
            v16 = false;
        end;

        local v17, v18, v19;

        if v15 then
            v17 = v13.limited.endTime;
            local v20 = v17 - os.time();
            v18 = v20 <= 86400;

            if v20 <= 604800 then
                v19 = true;
            else
                v19 = false;
            end;
        else
            v17 = 0;
            v18 = false;
            v19 = false;
        end;

        useEffect(function() -- Line: 62
            -- upvalues: u9 (copy), TweenService (ref), u7 (copy)
            local v21 = u9:getValue();

            if not v21 then
                return nil;
            end;

            TweenService:Create(v21, TweenInfo.new(1), {
                Rotation = u7 and 10 or 0
            }):Play();
        end, { u7 });
        local v22 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = u5.Size
        };
        local v23 = {};
        local v24 = #v23;
        local v25 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1)
        };
        local v26 = {
            u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }),
            ArmorTrimPreviewName = u3.createElement("TextLabel", {
                BackgroundTransparency = 1,
                LayoutOrder = 0,
                TextScaled = true,
                Size = UDim2.fromScale(1, 0.1),
                Text = u5.Name,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            })
        };
        local v27 = {
            LayoutOrder = 1,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0.9)
        };
        local v28 = {};
        local v29 = #v28;

        if v16 then
            v15 = u3.createElement(Empty, {
                Position = UDim2.fromScale(1, 0),
                AnchorPoint = Vector2.new(1, 0),
                Size = UDim2.fromScale(0.5, 0.1)
            }, { u3.createElement(Padding, {
                    Padding = {
                        Top = 5,
                        Right = 5
                    }
                }), u3.createElement("Frame", {
                    ZIndex = 4,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = Color3.fromRGB(110, 110, 110)
                }, { u3.createElement("UICorner", {
                        CornerRadius = UDim.new(0.1, 0)
                    }), u3.createElement("UIStroke", {
                        Thickness = 1,
                        Color = ColorUtil.WHITE
                    }), u3.createElement("TextLabel", {
                        Text = "Unobtainable",
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        ZIndex = 4,
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        TextColor3 = ColorUtil.WHITE,
                        Size = UDim2.fromScale(0.9, 0.9)
                    }) }) });
        elseif v15 then
            v15 = u3.createElement(Empty, {
                Size = UDim2.fromScale(1, 0.2)
            }, { u3.createElement(Padding, {
                    Padding = {
                        Top = 5,
                        Left = 5
                    }
                }), u3.createElement("TextLabel", {
                    TextTransparency = 0.05,
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    ZIndex = 4,
                    Position = UDim2.fromScale(1, 0.5),
                    AnchorPoint = Vector2.new(1, 0),
                    Size = UDim2.fromScale(0.5, 0.5),
                    Text = StringUtil.fromNow(v17, {
                        hideIfZero = true,
                        seconds = v18,
                        minutes = v18,
                        hours = v18,
                        days = v19,
                        long = not v18
                    }) .. "left",
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = ColorUtil.WHITE,
                    TextXAlignment = Enum.TextXAlignment.Right
                }), u3.createElement(Empty, {
                    Position = UDim2.fromScale(1, 0),
                    AnchorPoint = Vector2.new(1, 0),
                    Size = UDim2.fromScale(0.35, 0.5)
                }, { u3.createElement(Padding, {
                        Padding = {
                            Top = 5,
                            Right = 5
                        }
                    }), u3.createElement("Frame", {
                        Size = UDim2.fromScale(1, 1),
                        BackgroundColor3 = Color3.fromRGB(255, 100, 100),
                        ZIndex = 4,
                        [u3.Ref] = u9
                    }, { u3.createElement("UICorner", {
                            CornerRadius = UDim.new(0.1, 0)
                        }), u3.createElement("UIStroke", {
                            Thickness = 1,
                            Color = ColorUtil.WHITE
                        }), u3.createElement("TextLabel", {
                            Text = "LIMITED",
                            TextScaled = true,
                            BackgroundTransparency = 1,
                            ZIndex = 4,
                            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            TextColor3 = ColorUtil.WHITE,
                            Size = UDim2.fromScale(0.9, 0.9)
                        }) }) }) });
        end;

        if v15 then
            v28[v29 + 1] = v15;
        end;

        local v30 = #v28;
        v28[v30 + 1] = u3.createElement(Empty, {
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),

            [u3.Event.MouseEnter] = function() -- Line: 217
                -- upvalues: u8 (copy)
                u8(true);
            end,

            [u3.Event.MouseLeave] = function() -- Line: 220
                -- upvalues: u8 (copy)
                u8(false);
            end
        }, { u3.createElement(ArmorTrimPlayerViewport, {
                ButtonMode = "NONE",
                SelectedKit = BedwarsKit.NONE,
                ArmorTrimType = u5.ArmorTrimType,
                ArmorTrimEffectRank = ArmorTrimEffectRank.T7,
                ViewportProps = {
                    BackgroundTransparency = 0.5,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = Theme.backgroundPrimary
                },
                StartingSelection = {
                    armorSet = "IRON",
                    armorTrimColor = ColorUtil.WHITE
                }
            }) });
        local v31;

        if u5.State == "LOCKED" then
            v31 = u3.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = ColorUtil.WHITE
            }, { u3.createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0)),
                    Transparency = NumberSequence.new(1, 0)
                }) });
        else
            v31 = false;
        end;

        if v31 then
            v28[v30 + 2] = v31;
        end;

        v26[#v26 + 1] = u3.createElement("Frame", v27, v28);
        v23[v24 + 1] = u3.createElement("Frame", v25, v26);
        local v32 = u5.State == "LOCKED";

        if v32 then
            local function v34(p33) -- Line: 258
                -- upvalues: u3 (ref), ColorUtil (ref)
                if p33.rate > 0 then
                    return u3.createFragment({
                        ArmorTrimProbability = u3.createElement("Frame", {
                            BackgroundTransparency = 0.8,
                            BorderSizePixel = 0,
                            Size = UDim2.fromScale(0.7, 0.3),
                            AnchorPoint = Vector2.new(0, 1),
                            BackgroundColor3 = ColorUtil.WHITE,
                            LayoutOrder = p33.pack
                        }, { u3.createElement("TextLabel", {
                                BackgroundTransparency = 1,
                                TextScaled = true,
                                Size = UDim2.fromScale(0.8, 0.8),
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.fromScale(0.5, 0.5),
                                Text = p33.packDisplayName .. ": " .. tostring(p33.rate) .. "%",
                                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                                TextColor3 = ColorUtil.WHITE
                            }), u3.createElement("UIAspectRatioConstraint", {
                                AspectRatio = 1
                            }), u3.createElement("UICorner", {
                                CornerRadius = UDim.new(1, 0)
                            }) })
                    });
                end;

                return nil;
            end;

            local v35 = 0;
            local v36 = {};

            for i, v in v12 do
                local v37 = v34(v, i - 1, v12);

                if v37 ~= nil then
                    v35 = v35 + 1;
                    v36[v35] = v37;
                end;
            end;

            local v38 = {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.3, 1),
                AnchorPoint = Vector2.new(0, 1),
                Position = UDim2.fromScale(0.05, 0.97),
                BackgroundColor3 = ColorUtil.WHITE
            };
            local v39 = { u3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Bottom,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 10)
                }), u3.createElement(TooltipContainer, {}, { u3.createElement(AutoSizedText, {
                        Text = "Unlock Probability",
                        TextSize = 16,
                        Font = Enum.Font.SourceSansBold,
                        Limits = Vector2.new(300, 60)
                    }) }) };
            local v40 = #v39;

            for i, v in v36 do
                v39[v40 + i] = v;
            end;

            v32 = u3.createFragment({
                ArmorTrimProbabilities = u3.createElement("Frame", v38, v39)
            });
        end;

        if v32 then
            v23[v24 + 2] = v32;
        end;

        local v41 = #v23;
        local v42;

        if u5.State == "LOCKED" then
            v42 = u3.createFragment({
                ArmorTrimLocked = u3.createElement("Frame", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(0.2, 0.2),
                    AnchorPoint = Vector2.new(1, 1),
                    Position = UDim2.fromScale(0.95, 0.95)
                }, { u3.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(1, 1),
                        Image = BedwarsImageId.LOCK_SOLID,
                        ImageColor3 = ColorUtil.WHITE,
                        ScaleType = Enum.ScaleType.Fit
                    }), u3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) })
            });
        else
            v42 = false;
        end;

        if v42 then
            v23[v41 + 1] = v42;
        end;

        return u3.createElement("Frame", v22, v23);
    end)
};
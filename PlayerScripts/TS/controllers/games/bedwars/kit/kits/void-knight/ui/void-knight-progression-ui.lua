-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "void-knight-balance");
local getVoidKnightDefinitionForTier = v4.getVoidKnightDefinitionForTier;
local VoidKnightBalance = v4.VoidKnightBalance;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    VoidKnightSidebar = v3.new(u2)(function(u5, p6) -- Line: 15
        -- upvalues: u2 (copy), getVoidKnightDefinitionForTier (copy), VoidKnightBalance (copy), TooltipContainer (copy), AutoSizedText (copy), DeviceUtil (copy), BedwarsImageId (copy), Empty (copy)
        local _ = p6.useState;
        local _ = p6.useEffect;
        local v7 = u2.createRef();

        local function v15(p8) -- Line: 19
            -- upvalues: u5 (copy), getVoidKnightDefinitionForTier (ref), VoidKnightBalance (ref), u2 (ref), TooltipContainer (ref), AutoSizedText (ref)
            local v9 = p8 <= u5.tier;
            local v10 = getVoidKnightDefinitionForTier(p8);
            local v11 = "";

            if p8 ~= VoidKnightBalance.ProgressTiers.BASE and p8 ~= VoidKnightBalance.ProgressTiers.ENHANCED then
                v11 = p8 == VoidKnightBalance.ProgressTiers.EMPOWERED and ": Unlocks Void Decay Passive" or (p8 == VoidKnightBalance.ProgressTiers.CORRUPTED and ": Unlocks Void Shield Passive" or (p8 == VoidKnightBalance.ProgressTiers.CHOSEN and ": Unlocks Void Ascension Ability" or v11));
            end;

            local createElement = u2.createElement;
            local v12 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ScaleType = "Fit",
                LayoutOrder = 5 - p8,
                Image = v10.icon
            };
            local v13;

            if p8 == VoidKnightBalance.ProgressTiers.CHOSEN then
                v13 = UDim2.fromScale(1, 1);
            else
                v13 = UDim2.fromScale(0.9, 0.25);
            end;

            v12.Size = v13;
            local v14;

            if v9 then
                v14 = Color3.fromRGB(255, 255, 255);
            else
                v14 = Color3.fromRGB(41, 41, 41);
            end;

            v12.ImageColor3 = v14;
            v12.ImageTransparency = v9 and 0 or 0.5;

            return createElement("ImageLabel", v12, { u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                        TextSize = 16,
                        Text = v10.name .. v11,
                        Font = Enum.Font.SourceSansBold,
                        Limits = Vector2.new(300, 60)
                    }) }) });
        end;

        local function v27(p16) -- Line: 64
            -- upvalues: u5 (copy), VoidKnightBalance (ref), getVoidKnightDefinitionForTier (ref), u2 (ref)
            local v17 = u5.tier == VoidKnightBalance.ProgressTiers.CHOSEN;
            local progressionRequirements = getVoidKnightDefinitionForTier(p16).progressionRequirements;

            if progressionRequirements ~= nil then
                progressionRequirements = progressionRequirements.resourceCount;
            end;

            local v18 = u5.tier < p16;
            local v19 = p16 < u5.tier and true or v17;
            local createFragment = u2.createFragment;
            local v20 = {};
            local v21 = "OuterProgressBar_" .. tostring(p16);
            local createElement = u2.createElement;
            local v22 = {
                Transparency = 0.2,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.3, 0.21875),
                Position = UDim2.fromScale(0.5, 0.52),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            };
            local v23 = { (u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                })) };
            local v24 = "InnerProgressBar_" .. tostring(p16);
            local createElement2 = u2.createElement;
            local v25 = {
                Transparency = 0.1,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.5, (v18 and 0 or (v19 and 1 or math.clamp(u5.progress / (progressionRequirements == nil and 1 or progressionRequirements), 0, 1))) * 0.97),
                Position = UDim2.fromScale(0.25, 0.985),
                AnchorPoint = Vector2.new(0, 1)
            };
            local v26;

            if v17 then
                v26 = Color3.fromRGB(237, 171, 74);
            else
                v26 = Color3.fromRGB(220, 163, 255);
            end;

            v25.BackgroundColor3 = v26;
            v23[v24] = createElement2("Frame", v25, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                }) });
            v20[v21] = createElement("Frame", v22, v23);

            return createFragment(v20);
        end;

        local function v39(p28) -- Line: 104
            -- upvalues: u5 (copy), VoidKnightBalance (ref), getVoidKnightDefinitionForTier (ref), u2 (ref)
            local v29 = u5.tier == VoidKnightBalance.ProgressTiers.CHOSEN;
            local progressionRequirements = getVoidKnightDefinitionForTier(p28).progressionRequirements;

            if progressionRequirements ~= nil then
                progressionRequirements = progressionRequirements.killsAssists;
            end;

            local v30 = u5.tier < p28;
            local v31 = p28 < u5.tier and true or v29;
            local createFragment = u2.createFragment;
            local v32 = {};
            local v33 = "OuterProgressBar_" .. tostring(p28);
            local createElement = u2.createElement;
            local v34 = {
                Transparency = 0.2,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.3, 0.21875),
                Position = UDim2.fromScale(0.5, 0.52),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            };
            local v35 = { (u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                })) };
            local v36 = "InnerProgressBar_" .. tostring(p28);
            local createElement2 = u2.createElement;
            local v37 = {
                Transparency = 0.1,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.5, (v30 and 0 or (v31 and 1 or math.clamp(u5.kills / (progressionRequirements == nil and 1 or progressionRequirements), 0, 1))) * 0.97),
                Position = UDim2.fromScale(0.25, 0.985),
                AnchorPoint = Vector2.new(0, 1)
            };
            local v38;

            if v29 then
                v38 = Color3.fromRGB(237, 171, 74);
            else
                v38 = Color3.fromRGB(220, 100, 100);
            end;

            v37.BackgroundColor3 = v38;
            v35[v36] = createElement2("Frame", v37, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                }) });
            v32[v33] = createElement("Frame", v34, v35);

            return createFragment(v32);
        end;

        return u2.createFragment({
            VoidKnightSidebar = u2.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u2.createElement("Frame", {
                    Transparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(0.2, 0.34),
                    Position = UDim2.fromScale(0.025, DeviceUtil.isMobileControls() and 0.25 or 0.3)
                }, {
                    OuterContainer = u2.createElement("ImageLabel", {
                        ImageTransparency = 0.3,
                        BorderSizePixel = 3,
                        BackgroundTransparency = 1,
                        ScaleType = "Crop",
                        Image = BedwarsImageId.VOID_BG,
                        ImageColor3 = Color3.fromRGB(90, 27, 160),
                        Size = UDim2.fromScale(0.5, 1)
                    }, {
                        u2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        }),
                        u2.createElement("UIStroke", {
                            Thickness = 2,
                            Transparency = 0.1,
                            Color = Color3.fromRGB(63, 29, 101)
                        }),
                        u2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical,
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            VerticalAlignment = Enum.VerticalAlignment.Center,
                            Padding = UDim.new(0.02),
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }),
                        u2.createElement(Empty, {
                            Size = UDim2.fromScale(1, 0.15)
                        }, { v15(VoidKnightBalance.ProgressTiers.CHOSEN) }),
                        u2.createElement(Empty, {
                            Size = UDim2.fromScale(1, 0.8)
                        }, {
                            u2.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Horizontal,
                                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                                Padding = UDim.new(0.02),
                                SortOrder = Enum.SortOrder.LayoutOrder
                            }),
                            ContainerLeft = u2.createElement("Frame", {
                                LayoutOrder = 1,
                                [u2.Ref] = v7,
                                Size = UDim2.fromScale(0.5, 0.95),
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                ClipsDescendants = false
                            }, {
                                u2.createElement("UICorner", {
                                    CornerRadius = UDim.new(0, 8)
                                }),
                                u2.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Vertical,
                                    HorizontalAlignment = Enum.HorizontalAlignment.Right,
                                    Padding = UDim.new(0.02),
                                    SortOrder = Enum.SortOrder.LayoutOrder
                                }),
                                v15(VoidKnightBalance.ProgressTiers.CORRUPTED),
                                v15(VoidKnightBalance.ProgressTiers.EMPOWERED),
                                v15(VoidKnightBalance.ProgressTiers.ENHANCED),
                                v15(VoidKnightBalance.ProgressTiers.BASE)
                            }),
                            ContainerMiddle = u2.createElement("Frame", {
                                LayoutOrder = 2,
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                ClipsDescendants = false,
                                Size = UDim2.fromScale(0.25, 0.99)
                            }, {
                                u2.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Vertical,
                                    HorizontalAlignment = Enum.HorizontalAlignment.Right,
                                    VerticalAlignment = Enum.VerticalAlignment.Center,
                                    Padding = UDim.new(0.03),
                                    SortOrder = Enum.SortOrder.LayoutOrder
                                }),
                                v27(VoidKnightBalance.ProgressTiers.CORRUPTED),
                                v27(VoidKnightBalance.ProgressTiers.EMPOWERED),
                                v27(VoidKnightBalance.ProgressTiers.ENHANCED),
                                v27(VoidKnightBalance.ProgressTiers.BASE)
                            }),
                            ContainerRight = u2.createElement("Frame", {
                                LayoutOrder = 3,
                                BackgroundTransparency = 1,
                                BorderSizePixel = 0,
                                ClipsDescendants = false,
                                Size = UDim2.fromScale(0.25, 0.99)
                            }, {
                                u2.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Vertical,
                                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                                    VerticalAlignment = Enum.VerticalAlignment.Center,
                                    Padding = UDim.new(0.03),
                                    SortOrder = Enum.SortOrder.LayoutOrder
                                }),
                                v39(VoidKnightBalance.ProgressTiers.CORRUPTED),
                                v39(VoidKnightBalance.ProgressTiers.EMPOWERED),
                                v39(VoidKnightBalance.ProgressTiers.ENHANCED),
                                v39(VoidKnightBalance.ProgressTiers.BASE)
                            })
                        })
                    }),
                    u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 0.75
                    })
                }) })
        });
    end)
};
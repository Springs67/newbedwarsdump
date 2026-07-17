-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ArmorTrimMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta").ArmorTrimMeta;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank");
local ArmorTrimEffectRank = v5.ArmorTrimEffectRank;
local ArmorTrimEffectRankMeta = v5.ArmorTrimEffectRankMeta;
local ArmorTrimProgressUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "progress", "armor-trim-progress-util").ArmorTrimProgressUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    ArmorTrimProgressBar = v4.new(u3)(function(p6, p7) -- Line: 18
        -- upvalues: ArmorTrimProgressUtil (copy), u2 (copy), ArmorTrimEffectRank (copy), u3 (copy), ColorUtil (copy), Theme (copy), Empty (copy), ArmorTrimMeta (copy), BedwarsImageId (copy), TooltipContainer (copy), AutoSizedText (copy), ArmorTrimEffectRankMeta (copy)
        local _ = p7.useState;
        local _ = p7.useEffect;
        local v8 = ArmorTrimProgressUtil.getTier(p6.xp);
        local v9 = #u2.values(ArmorTrimEffectRank) - 1;
        local v10 = math.min(v8, v9);
        local v11 = ArmorTrimProgressUtil.getTierProgress(p6.xp);
        local v12 = #u2.values(ArmorTrimEffectRank) - 1;
        local v13 = math.min(v11, v12);
        local v14 = v13 - v10;
        local v15 = u2.values(ArmorTrimEffectRank);
        table.sort(v15, function(p16, p17) -- Line: 26
            return p16 < p17;
        end);
        local v18 = #v15 + 1;
        local v19 = ArmorTrimProgressUtil.getXpAtTier(v10 + 1);
        local v20 = math.min(v19, ArmorTrimProgressUtil.getXpAtTier(ArmorTrimProgressUtil.getMaxTier()));

        local function _(p21) -- Line: 33
            if p21 > 1000 then
                local v22 = math.round(p21) / 1000;

                return tostring(v22) .. "k";
            end;

            local v23 = math.round(p21);

            return tostring(v23);
        end;

        local v24 = false;
        local v25 = 0;
        local v26 = {};

        while true do
            if v24 then
                v25 = v25 + 1;
            else
                v24 = true;
            end;

            if v25 >= v18 then
                local v27 = {};

                for i, v in p6 do
                    v27[i] = v;
                end;

                v27.xp = nil;
                v27.unlocked = nil;
                v27.ArmorTrimType = nil;
                v27.SelectedKit = nil;
                local v28 = {};

                for i, v in v27 do
                    v28[i] = v;
                end;

                v28.BackgroundTransparency = 1;
                v28.BorderSizePixel = 0;
                local v29 = {};
                local v30 = {
                    Size = UDim2.fromScale(1, 1)
                };
                local v31 = {};
                local v32 = #v31;
                local v33 = not p6.unlocked and u3.createElement("Frame", {
                    ZIndex = 100,
                    Transparency = 0.4,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = ColorUtil.BLACK
                }, { u3.createElement("UIGradient", {
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1),
                            NumberSequenceKeypoint.new(0.1, 0),
                            NumberSequenceKeypoint.new(0.5, 0),
                            NumberSequenceKeypoint.new(0.9, 0),
                            NumberSequenceKeypoint.new(1, 1)
                        })
                    }), u3.createElement("TextLabel", {
                        Text = "Equip a trim to view",
                        Transparency = 0.1,
                        BackgroundTransparency = 1,
                        TextScaled = true,
                        ZIndex = 100,
                        Size = UDim2.fromScale(1, 0.4),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        TextColor3 = ColorUtil.WHITE,
                        Font = Enum.Font.SourceSansBold,
                        TextXAlignment = Enum.TextXAlignment.Center,
                        TextYAlignment = Enum.TextYAlignment.Center
                    }) });

                if v33 then
                    v31[v32 + 1] = v33;
                end;

                local v34 = {
                    Size = UDim2.fromScale(1, 1)
                };
                local v35 = { u3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }) };
                local v36 = #v35;

                for i, v in v26 do
                    v35[v36 + i] = v;
                end;

                v31[#v31 + 1] = u3.createElement(Empty, v34, v35);
                v29[#v29 + 1] = u3.createElement(Empty, v30, v31);

                return u3.createFragment({
                    ArmorTrimProgress = u3.createElement("Frame", v28, v29)
                });
            end;

            local v37 = v25 == v18 - 1;
            local v38 = {
                Size = UDim2.fromScale(1 / v18, 1),
                LayoutOrder = v25
            };
            local v39 = {};
            local v40 = #v39;
            local v41;

            if v25 == ArmorTrimProgressUtil.NEXT_ARMOR_TRIM_TIER_UNLOCK then
                v41 = u3.createElement("Frame", {
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(0.1, 1),
                    Position = UDim2.fromScale(1, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = ColorUtil.brighten(Theme.backgroundSecondary, 0.3)
                }, { u3.createElement("UIGradient", {
                        Rotation = 90,
                        Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1),
                            NumberSequenceKeypoint.new(0.15, 1),
                            NumberSequenceKeypoint.new(0.45, 0),
                            NumberSequenceKeypoint.new(0.5, 0),
                            NumberSequenceKeypoint.new(0.55, 0),
                            NumberSequenceKeypoint.new(0.85, 1),
                            NumberSequenceKeypoint.new(1, 1)
                        })
                    }) });
            else
                v41 = false;
            end;

            if v41 then
                v39[v40 + 1] = v41;
            end;

            local v42 = #v39;
            local v43;

            if v25 == v10 + 1 then
                local createElement = u3.createElement;
                local v44 = {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    Position = UDim2.fromScale(v25 == #v15 and 0 or 1, 0.33),
                    Size = UDim2.fromScale(1, 0.1),
                    AnchorPoint = Vector2.new(0.5, 1)
                };
                local xp = p6.xp;
                local v45;

                if xp > 1000 then
                    local v46 = math.round(xp) / 1000;
                    v45 = tostring(v46) .. "k";
                else
                    local v47 = math.round(xp);
                    v45 = tostring(v47);
                end;

                local v48;

                if v20 > 1000 then
                    local v49 = math.round(v20) / 1000;
                    v48 = tostring(v49) .. "k";
                else
                    local v50 = math.round(v20);
                    v48 = tostring(v50);
                end;

                v44.Text = v45 .. "/" .. v48 .. " XP";
                v44.TextColor3 = ColorUtil.WHITE;
                v44.Font = Enum.Font.SourceSansBold;
                v44.TextXAlignment = Enum.TextXAlignment.Center;
                v44.TextYAlignment = Enum.TextYAlignment.Bottom;
                v43 = createElement("TextLabel", v44, { u3.createElement("UITextSizeConstraint", {
                        MaxTextSize = 26,
                        MinTextSize = 8
                    }) });
            else
                v43 = false;
            end;

            if v43 then
                v39[v42 + 1] = v43;
            end;

            local v51 = #v39;
            local v52 = {
                Size = UDim2.new(1, 0, 0, 12),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            };
            local v53 = {};
            local v54 = #v53;
            local v55;

            if v25 == 0 or v37 then
                v55 = u3.createElement("Frame", {
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = Theme.Gray
                }, { u3.createElement("UIGradient", {
                        Rotation = v37 and 180 or 0,
                        Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
                    }) });
            else
                v55 = v37;
            end;

            if v55 then
                v53[v54 + 1] = v55;
            end;

            v53[#v53 + 1] = u3.createElement("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = Theme.Gray
            }, { u3.createElement("Frame", {
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(math.min((v10 + 1 > v25 or v25 > v13 + 1) and (v25 <= v13 + 1 and 1 or (v25 == #v15 and v25 <= v13 + 1 and 1 or 0)) or v14, 1), 1),
                    BackgroundColor3 = Theme.backgroundSuccess
                }) });
            v39[v51 + 1] = u3.createElement(Empty, v52, v53);
            local v56 = not v37;

            if v56 then
                local createElement = u3.createElement;
                local v57 = {
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    Size = UDim2.new(0, 20, 0, 20),
                    Position = UDim2.fromScale(1, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                };
                local v58;

                if v10 <= v25 and v25 <= v13 then
                    v58 = Theme.backgroundSuccess;
                elseif v25 <= v13 then
                    v58 = Theme.backgroundSuccess;
                elseif v25 == #v15 - 1 and v25 <= v13 then
                    v58 = Theme.backgroundSuccess;
                elseif v25 == 0 then
                    v58 = Theme.backgroundSuccess;
                else
                    v58 = Theme.Gray;
                end;

                v57.BackgroundColor3 = v58;
                v56 = createElement("Frame", v57, { u3.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    }) });
            end;

            if v56 then
                v39[v51 + 2] = v56;
            end;

            local v59 = #v39;
            local v60 = v25 < v18 - 1;

            if v60 then
                local v61 = {
                    Size = UDim2.fromScale(1, 1)
                };
                local v62 = {};
                local v63 = #v62;
                local v64 = {
                    Size = UDim2.fromScale(0.4, 0.4),
                    Position = UDim2.fromScale(1, 0.825),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                };
                local v65 = {};
                local v66 = p6.ArmorTrimType ~= nil;

                if v66 then
                    local effects = ArmorTrimMeta[p6.ArmorTrimType].effects;

                    if effects ~= nil then
                        effects = effects.tierOverrides;
                    end;

                    v66 = table.find(effects == nil and { -1 } or effects, v25) ~= nil and u3.createElement(Empty, {
                        Size = UDim2.fromScale(1, 1),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    }, { u3.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }), u3.createElement("ImageLabel", {
                            ZIndex = 2,
                            BackgroundTransparency = 1,
                            Size = UDim2.fromScale(0.3, 0.3),
                            Position = UDim2.fromScale(1.1, 0.9),
                            AnchorPoint = Vector2.new(1, 1),
                            Image = BedwarsImageId.STAR_SOLID
                        }), u3.createElement(TooltipContainer, {}, { u3.createElement(AutoSizedText, {
                                Text = "Special Effect",
                                TextSize = 26,
                                Font = Enum.Font.SourceSansBold,
                                Limits = Vector2.new(300, 60)
                            }) }) });
                end;

                local v67 = {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1),
                    Text = ArmorTrimEffectRankMeta[v15[v25 + 1]].text,
                    TextColor3 = ColorUtil.brighten(ArmorTrimEffectRankMeta[v15[v25 + 1]].color, 0.65),
                    Font = Enum.Font.SourceSansBold,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Bottom
                };
                local v68 = {};
                local v69 = #v68;

                if v66 then
                    v68[v69 + 1] = v66;
                end;

                v65[#v65 + 1] = u3.createElement("TextLabel", v67, v68);
                v62[v63 + 1] = u3.createElement(Empty, v64, v65);
                local v70;

                if v25 == ArmorTrimProgressUtil.NEXT_ARMOR_TRIM_TIER_UNLOCK then
                    v70 = not ArmorTrimProgressUtil.isNextArmorTrimUnlockable(p6.xp) and u3.createElement(Empty, {
                        Size = UDim2.fromScale(0.4, 0.4),
                        Position = UDim2.fromScale(1, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    }, { u3.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1
                        }), u3.createElement("ImageLabel", {
                            ZIndex = 2,
                            BackgroundTransparency = 1,
                            Size = UDim2.fromScale(0.6, 0.6),
                            Position = UDim2.fromScale(0.5, 0.5),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Image = BedwarsImageId.LOCK_SOLID
                        }), u3.createElement(TooltipContainer, {}, { u3.createElement(AutoSizedText, {
                                Text = "Next Trim Unlock",
                                TextSize = 26,
                                Font = Enum.Font.SourceSansBold,
                                Limits = Vector2.new(300, 60)
                            }) }) });
                else
                    v70 = false;
                end;

                if v70 then
                    v62[v63 + 2] = v70;
                end;

                v60 = u3.createElement(Empty, v61, v62);
            end;

            if v60 then
                v39[v59 + 1] = v60;
            end;

            local v71 = u3.createElement(Empty, v38, v39);
            table.insert(v26, v71);
        end;
    end)
};
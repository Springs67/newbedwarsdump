-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local getCrateItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-meta").getCrateItemMeta;
local getCrateItemRarityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity-meta").getCrateItemRarityMeta;
local CrateStarTierColors = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-tier-types").CrateStarTierColors;

return {
    CratePickerRewardTile = v3.new(u2)(function(p4, p5) -- Line: 14
        -- upvalues: getCrateItemMeta (copy), getCrateItemRarityMeta (copy), CrateStarTierColors (copy), u2 (copy), BedwarsImageId (copy), ColorUtil (copy), AutoSizedText (copy), TooltipContainer (copy), Empty (copy)
        local _ = p5.useState;
        local v6 = getCrateItemMeta(p4.CrateEntry.itemType);
        local v7 = getCrateItemRarityMeta(p4.CrateEntry.rarity);
        local v8 = CrateStarTierColors[v7.tier];
        local v9 = false;
        local v10 = 0;
        local v11 = {};

        while true do
            if v9 then
                v10 = v10 + 1;
            else
                v9 = true;
            end;

            if v10 >= v7.stars then
                local v12 = {
                    BorderSizePixel = 0,
                    BackgroundColor3 = ColorUtil.WHITE
                };
                local v13 = { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    }), u2.createElement("UIGradient", {
                        Rotation = 90,
                        Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v7.gradient.colorTop), ColorSequenceKeypoint.new(1, v7.gradient.colorBottom) })
                    }) };
                local v14 = {
                    Size = UDim2.fromScale(1, 1)
                };
                local v15 = {};
                local v16 = #v15;
                local v17 = { u2.createElement(AutoSizedText, {
                        TextSize = 16,
                        Text = v6.displayName,
                        Font = Enum.Font.SourceSansBold,
                        Limits = Vector2.new(300, 60)
                    }), u2.createElement(AutoSizedText, {
                        TextSize = 14,
                        Text = string.upper(v7.id),
                        Font = Enum.Font.SourceSans,
                        TextColor3 = v7.gradient.colorTop,
                        Limits = Vector2.new(300, 60)
                    }) };
                local v18 = #v17;
                local v19;

                if v6.description == nil then
                    v19 = false;
                else
                    v19 = u2.createElement(AutoSizedText, {
                        TextSize = 14,
                        Text = v6.description,
                        Font = Enum.Font.SourceSans,
                        TextColor3 = Color3.fromRGB(191, 191, 191),
                        Limits = Vector2.new(300, 60)
                    });
                end;

                if v19 then
                    v17[v18 + 1] = v19;
                end;

                v15[v16 + 1] = u2.createElement(TooltipContainer, {}, v17);
                local v20;

                if v6.itemDisplay.image == nil then
                    v20 = false;
                else
                    v20 = u2.createFragment({
                        RewardImage = u2.createElement("ImageLabel", {
                            ScaleType = "Fit",
                            BackgroundTransparency = 1,
                            ZIndex = 10,
                            Size = UDim2.fromScale(0.8, 0.6),
                            Position = UDim2.fromScale(0.5, 0.4),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Image = v6.itemDisplay.image
                        })
                    });
                end;

                if v20 then
                    v15[v16 + 2] = v20;
                end;

                local v21 = #v15;
                local v22;

                if v6.itemDisplay.text == nil then
                    v22 = false;
                else
                    v22 = u2.createFragment({
                        RewardText = u2.createElement("TextLabel", {
                            RichText = true,
                            TextScaled = true,
                            BackgroundTransparency = 1,
                            ZIndex = 10,
                            Size = UDim2.fromScale(0.8, 0.4),
                            Position = UDim2.fromScale(0.5, 0.4),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Text = "<b>" .. v6.itemDisplay.text.richText .. "</b>",
                            TextColor3 = v6.itemDisplay.text.color or Color3.fromRGB(255, 255, 255)
                        })
                    });
                end;

                if v22 then
                    v15[v21 + 1] = v22;
                end;

                local _ = #v15;
                local v23 = {
                    Size = UDim2.fromScale(0.9, 0.2),
                    Position = UDim2.fromScale(0.5, 0.73),
                    AnchorPoint = Vector2.new(0.5, 1)
                };
                local v24 = { u2.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        HorizontalAlignment = "Center",
                        Padding = UDim.new(0, 1)
                    }) };
                local v25 = #v24;

                for i, v in v11 do
                    v24[v25 + i] = v;
                end;

                v15.Stars = u2.createElement(Empty, v23, v24);
                v15.RewardNameContainer = u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    ZIndex = 12,
                    Size = UDim2.fromScale(1, 0.25),
                    Position = UDim2.fromScale(0.5, 1),
                    AnchorPoint = Vector2.new(0.5, 1),
                    BackgroundColor3 = ColorUtil.WHITE
                }, { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    }), u2.createElement("TextLabel", {
                        TextScaled = true,
                        BackgroundTransparency = 1,
                        ZIndex = 12,
                        Size = UDim2.fromScale(0.95, 0.9),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Text = v6.displayName,
                        TextColor3 = Color3.fromRGB(39, 39, 39),
                        Font = Enum.Font.GothamBold
                    }) });
                v13[#v13 + 1] = u2.createElement(Empty, v14, v15);

                return u2.createFragment({
                    RewardFrame = u2.createElement("Frame", v12, v13)
                });
            end;

            local v26 = u2.createElement("ImageLabel", {
                SizeConstraint = "RelativeYY",
                BackgroundTransparency = 1,
                ZIndex = 11,
                Size = UDim2.fromScale(1, 1),
                Image = BedwarsImageId.STAR_SOLID,
                ImageColor3 = v8
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) });
            table.insert(v11, v26);
        end;
    end)
};
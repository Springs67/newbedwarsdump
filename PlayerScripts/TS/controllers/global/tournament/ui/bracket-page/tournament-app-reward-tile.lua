-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local PlayerViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "misc", "player-viewport").PlayerViewport;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local TitleMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta;

return {
    TournamentAppRewardTile = v3.new(u2)(function(p4, p5) -- Line: 16
        -- upvalues: BedwarsImageId (copy), EmoteMeta (copy), TitleMeta (copy), ColorUtil (copy), u2 (copy), GameAnimationUtil (copy), ReplicatedStorage (copy), PlayerViewport (copy), Empty (copy), TooltipContainer (copy), AutoSizedText (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;
        local v6 = false;
        local v7 = false;
        local v8 = nil;
        local v9 = false;
        local v10 = "";
        local v11 = Color3.fromRGB(255, 255, 255);
        local bedCoins = p4.reward.bedCoins;
        local v12, v13;

        if bedCoins == 0 or (bedCoins ~= bedCoins or not bedCoins) then
            v12 = "";
            v13 = nil;
        else
            v13 = BedwarsImageId.BED_COIN_ICON;
            v12 = tostring(p4.reward.bedCoins) .. " Bed Coins";
        end;

        if p4.reward.emote then
            v13 = EmoteMeta[p4.reward.emote].image;
            v8 = EmoteMeta[p4.reward.emote];
            v6 = EmoteMeta[p4.reward.emote].animation and true or v6;
            v7 = EmoteMeta[p4.reward.emote].limited and true or v7;
            v12 = EmoteMeta[p4.reward.emote].name .. " Emote";
        end;

        if p4.reward.title then
            v10 = TitleMeta[p4.reward.title].text;
            v11 = TitleMeta[p4.reward.title].color;
            v7 = TitleMeta[p4.reward.title].limited and true or v7;
            v9 = true;
            v12 = "Tournament Title";
        end;

        local v14 = {
            BorderSizePixel = 0,
            ZIndex = 3
        };
        local v15;

        if p4.rewardTier == 3 then
            v15 = UDim2.fromScale(0.325, 0.65);
        else
            v15 = UDim2.fromScale(0.35, 0.7);
        end;

        v14.Size = v15;
        v14.BackgroundColor3 = ColorUtil.WHITE;
        v14.LayoutOrder = p4.LayoutOrder;
        v14.BackgroundTransparency = p4.unWinnable and 0.7 or 0;
        local v16 = { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }) };
        local v17 = #v16;
        local v18 = {
            Rotation = 90
        };
        local v19;

        if v9 then
            v19 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#4075ff")), ColorSequenceKeypoint.new(1, Color3.fromHex("#5ec5ff")) });
        else
            local bedCoins2 = p4.reward.bedCoins;

            if bedCoins2 == 0 or (bedCoins2 ~= bedCoins2 or not bedCoins2) then
                v19 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#ffa438")), ColorSequenceKeypoint.new(1, Color3.fromHex("#ffe600")) });
            else
                v19 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#d55eff")), ColorSequenceKeypoint.new(1, Color3.fromHex("#a259ff")) });
            end;
        end;

        v18.Color = v19;
        v16[v17 + 1] = u2.createElement("UIGradient", v18);
        local v20 = not (v6 or v9) and u2.createFragment({
            RewardImage = u2.createElement("ImageLabel", {
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                ZIndex = 5,
                LayoutOrder = 1,
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(0.8, 0.6),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = v13,
                ImageTransparency = p4.unWinnable and 0.7 or 0
            })
        });

        if v20 then
            v16[v17 + 2] = v20;
        end;

        local v21 = #v16;
        local v22;

        if v9 then
            v22 = u2.createFragment({
                RewardImage = u2.createElement("TextLabel", {
                    RichText = true,
                    TextScaled = true,
                    Font = "Roboto",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    ZIndex = 5,
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(0.8, 0.6),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Text = "<b>" .. v10 .. "</b>",
                    TextColor3 = v11,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    TextTransparency = p4.unWinnable and 0.7 or 0
                })
            });
        else
            v22 = v9;
        end;

        if v22 then
            v16[v21 + 1] = v22;
        end;

        local v23 = #v16;

        if v6 then
            if v8 then
                v6 = v8.animation;
            else
                v6 = v8;
            end;
        end;

        if v6 then
            local v24 = {
                LayoutOrder = 2,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Animation = GameAnimationUtil:getAssetId(v8.animation.type),
                Size = UDim2.fromScale(0.8, 0.6),
                Position = UDim2.fromScale(0.5, 0.5),
                PreviewItemTypes = v8.animation.previewItems
            };
            local previewReplicatedStorageAssets = v8.animation.previewReplicatedStorageAssets;
            local v25;

            if previewReplicatedStorageAssets == nil then
                v25 = previewReplicatedStorageAssets;
            else
                local function v31(p26) -- Line: 133
                    -- upvalues: ReplicatedStorage (ref)
                    local v27 = string.split(p26, "/");
                    local Assets = ReplicatedStorage.Assets;

                    local function _(p28) -- Line: 136
                        -- upvalues: Assets (ref)
                        local v29 = Assets;

                        if v29 ~= nil then
                            v29 = v29:FindFirstChild(p28);
                        end;

                        if v29 then
                            Assets = v29;
                        end;
                    end;

                    for i, v in v27 do
                        local _ = i - 1;
                        local v30 = Assets;

                        if v30 ~= nil then
                            v30 = v30:FindFirstChild(v);
                        end;

                        if v30 then
                            Assets = v30;
                        end;
                    end;

                    return Assets;
                end;

                local v32 = 0;
                v25 = {};

                for i, v in previewReplicatedStorageAssets do
                    local v33 = v31(v, i - 1, previewReplicatedStorageAssets);

                    if v33 ~= nil then
                        v32 = v32 + 1;
                        v25[v32] = v33;
                    end;
                end;
            end;

            v24.PreviewAccessories = v25;
            v24.ImageTransparency = 0;
            v24.ZIndex = 5;
            v6 = u2.createFragment({
                RewardEmote = u2.createElement(PlayerViewport, v24)
            });
        end;

        if v6 then
            v16[v23 + 1] = v6;
        end;

        local v34 = #v16;
        local v35;

        if v7 then
            v35 = u2.createFragment({
                RewardAmountTitle = u2.createElement("TextLabel", {
                    RichText = true,
                    TextScaled = true,
                    Text = "<b>LIMITED</b>",
                    Font = "Roboto",
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    ZIndex = 2,
                    Size = UDim2.fromScale(1, 0.2),
                    Position = UDim2.fromScale(0, -0.2),
                    TextColor3 = Color3.fromHex("#FFF48E"),
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    TextTransparency = p4.unWinnable and 0.7 or 0
                })
            });
        else
            v35 = v7;
        end;

        if v35 then
            v16[v34 + 1] = v35;
        end;

        local v36 = #v16;
        local v37 = not v9;

        if v37 then
            if v7 then
                v37 = u2.createElement(Empty, {
                    Size = UDim2.fromScale(1, 1)
                }, { u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                            Text = "Exclusive Emote",
                            TextSize = 16,
                            Font = Enum.Font.SourceSansBold,
                            TextColor3 = Color3.fromHex("#ffe600"),
                            Limits = Vector2.new(300, 60)
                        }), u2.createElement(AutoSizedText, {
                            Text = "This emote expires two weeks after the tournament ends.",
                            TextSize = 14,
                            Font = Enum.Font.SourceSans,
                            TextColor3 = Color3.fromRGB(191, 191, 191),
                            Limits = Vector2.new(300, 60)
                        }) }) });
            else
                v37 = v7;
            end;
        end;

        if v37 then
            v16[v36 + 1] = v37;
        end;

        local v38 = #v16;

        if v9 then
            if v7 then
                v7 = u2.createElement(Empty, {
                    Size = UDim2.fromScale(1, 1)
                }, { u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                            Text = "Exclusive Title",
                            TextSize = 16,
                            Font = Enum.Font.SourceSansBold,
                            TextColor3 = Color3.fromHex("#5ec5ff"),
                            Limits = Vector2.new(300, 60)
                        }), u2.createElement(AutoSizedText, {
                            Text = "This Title expires two weeks after the tournament ends.",
                            TextSize = 14,
                            Font = Enum.Font.SourceSans,
                            TextColor3 = Color3.fromRGB(191, 191, 191),
                            Limits = Vector2.new(300, 60)
                        }) }) });
            end;
        else
            v7 = v9;
        end;

        if v7 then
            v16[v38 + 1] = v7;
        end;

        local _ = #v16;
        v16.RewardNameContainer = u2.createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = 4,
            Size = UDim2.fromScale(1, 0.25),
            Position = UDim2.fromScale(0.5, 1),
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = ColorUtil.WHITE,
            BackgroundTransparency = p4.unWinnable and 0.7 or 0
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }), u2.createElement("TextLabel", {
                TextScaled = true,
                BackgroundTransparency = 1,
                ZIndex = 4,
                Size = UDim2.fromScale(0.95, 0.9),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Text = v12,
                TextColor3 = Color3.fromRGB(39, 39, 39),
                Font = Enum.Font.GothamBold,
                TextTransparency = p4.unWinnable and 0.7 or 0
            }) });

        return u2.createFragment({
            RewardFrame = u2.createElement("Frame", v14, v16)
        });
    end)
};
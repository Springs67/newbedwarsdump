-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ItemSkinViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lobby", "collection", "item-skins", "item-skin-viewport").ItemSkinViewport;
local LobbyTitle = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lobby", "title", "ui", "lobby-title").LobbyTitle;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local RewardUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils;
local BedCoinShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent, "battle-pass", "ui", "RewardShowcase", "bed-coin-showcase").BedCoinShowcase;
local ClanTagChatColorShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent, "clan", "RewardShowcase", "clan-tag-chat-color-showcase").ClanTagChatColorShowcase;
local EmoteShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent, "battle-pass", "ui", "RewardShowcase", "emote-showcase").EmoteShowcase;
local KitViewport = RuntimeLib.import(script, script.Parent.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport;

return {
    RewardShowcase = v3.new(u2)(function(p4, p5) -- Line: 19
        -- upvalues: u2 (copy), RewardUtils (copy), AutoSizedText (copy), TooltipContainer (copy), LobbyTitle (copy), KitViewport (copy), BedwarsKitSkinMeta (copy), EmoteShowcase (copy), DeviceUtil (copy), ItemSkinViewport (copy), BedCoinShowcase (copy), ColorUtil (copy), ClanTagChatColorShowcase (copy), Empty (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;
        local v6 = {};

        for i, v in p4 do
            v6[i] = v;
        end;

        v6.Reward = nil;
        v6.GroupTransparency = nil;
        v6.DisableTooltip = nil;
        v6[u2.Children] = nil;
        local v7 = -1;
        local clanShopContribution = p4.Reward.clanShopContribution;

        if clanShopContribution == 0 or (clanShopContribution ~= clanShopContribution or not clanShopContribution) then
            local consumable = p4.Reward.consumable;

            if consumable ~= nil then
                consumable = consumable.amount;
            end;

            if consumable == 0 or (consumable ~= consumable or not consumable) then
                local eventCurrency = p4.Reward.eventCurrency;

                if eventCurrency ~= nil then
                    eventCurrency = eventCurrency.amount;
                end;

                if eventCurrency == 0 or (eventCurrency ~= eventCurrency or not eventCurrency) then
                    local battlepassXP = p4.Reward.battlepassXP;

                    if battlepassXP ~= nil then
                        battlepassXP = battlepassXP.amount;
                    end;

                    if battlepassXP ~= 0 and (battlepassXP == battlepassXP and battlepassXP) then
                        v7 = p4.Reward.battlepassXP;

                        if v7 ~= nil then
                            v7 = v7.amount;
                        end;
                    end;
                else
                    v7 = p4.Reward.eventCurrency;

                    if v7 ~= nil then
                        v7 = v7.amount;
                    end;
                end;
            else
                v7 = p4.Reward.consumable;

                if v7 ~= nil then
                    v7 = v7.amount;
                end;
            end;
        else
            v7 = p4.Reward.clanShopContribution;
        end;

        local v8 = {
            Size = UDim2.fromScale(1, 1)
        };

        for i, v in v6 do
            v8[i] = v;
        end;

        local v9 = not p4.DisableTooltip;

        if v9 then
            local v10 = {};
            local v11 = #v10;
            local v12 = {};
            local comingSoonReward = p4.Reward.comingSoonReward;

            if comingSoonReward ~= nil then
                comingSoonReward = comingSoonReward.text;
            end;

            if comingSoonReward == nil then
                local v13 = RewardUtils.getRewardName(p4.Reward);
                comingSoonReward = v13 == nil and "" or v13;
            end;

            v12.Text = comingSoonReward;
            v12.Font = Enum.Font.SourceSansBold;
            v12.TextSize = 16;
            v12.Limits = Vector2.new(300, 60);
            v10[v11 + 1] = u2.createElement(AutoSizedText, v12);
            local v14 = RewardUtils.getRewardType(p4.Reward) ~= "";

            if v14 then
                local v15 = {};
                local v16 = RewardUtils.getRewardType(p4.Reward);
                v15.Text = v16 == nil and "" or v16;
                v15.Font = Enum.Font.SourceSans;
                v15.TextColor3 = Color3.fromRGB(191, 191, 191);
                v15.TextSize = 14;
                v15.Limits = Vector2.new(300, 60);
                v14 = u2.createElement(AutoSizedText, v15);
            end;

            if v14 then
                v10[v11 + 2] = v14;
            end;

            v9 = u2.createElement(TooltipContainer, {}, v10);
        end;

        local v17 = {};
        local v18 = #v17;

        if v9 then
            v17[v18 + 1] = v9;
        end;

        local v19;

        if p4.Reward.title then
            local v20 = {
                TitleType = p4.Reward.title
            };
            local v21 = {};
            local GroupTransparency = p4.GroupTransparency;
            v21.TextTransparency = GroupTransparency == nil and 0 or GroupTransparency;
            v21.ZIndex = p4.ZIndex;
            v20.TextLabelProps = v21;
            v19 = u2.createElement(LobbyTitle, v20);
        elseif p4.Reward.kit then
            v19 = u2.createElement(KitViewport, {
                Kit = p4.Reward.kit,
                ImageTransparency = p4.GroupTransparency,
                ZIndex = p4.ZIndex
            });
        elseif p4.Reward.kitSkin then
            v19 = u2.createElement(KitViewport, {
                Kit = BedwarsKitSkinMeta[p4.Reward.kitSkin].kit,
                Skin = p4.Reward.kitSkin,
                ImageTransparency = p4.GroupTransparency,
                ZIndex = p4.ZIndex
            });
        elseif p4.Reward.emote then
            v19 = u2.createElement(EmoteShowcase, {
                PlaySound = true,
                Size = UDim2.fromScale(1, 1),
                Emote = p4.Reward.emote,
                Transparency = p4.GroupTransparency,
                ZIndex = p4.ZIndex
            });
        elseif p4.Reward.itemSkin and not DeviceUtil.isHoarceKat() then
            v19 = u2.createElement(ItemSkinViewport, {
                ItemSkin = p4.Reward.itemSkin,
                ViewportTransparency = p4.GroupTransparency
            });
        else
            local bedCoins = p4.Reward.bedCoins;

            if bedCoins == 0 or (bedCoins ~= bedCoins or not bedCoins) then
                if p4.Reward.comingSoonReward then
                    v19 = u2.createFragment({
                        ComingSoon = u2.createElement("TextLabel", {
                            BackgroundTransparency = 1,
                            TextScaled = true,
                            BorderSizePixel = 0,
                            AutoLocalize = true,
                            Text = p4.Reward.comingSoonReward.text,
                            Size = UDim2.fromScale(1, 1),
                            TextColor3 = ColorUtil.WHITE,
                            FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Regular),
                            ZIndex = p4.ZIndex
                        })
                    });
                elseif p4.Reward.clanTagChatColor == nil then
                    local v22 = RewardUtils.getRewardImageId(p4.Reward);

                    if v22 == "" or not v22 then
                        v19 = u2.createFragment({
                            RewardText = u2.createElement("TextLabel", {
                                RichText = true,
                                TextScaled = true,
                                BackgroundTransparency = 1,
                                Size = UDim2.fromScale(0.8, 0.4),
                                Position = UDim2.fromScale(0.5, 0.5),
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Text = "<b>" .. RewardUtils.getRewardName(p4.Reward) .. "</b>",
                                TextColor3 = Color3.fromRGB(255, 255, 255),
                                TextTransparency = p4.GroupTransparency,
                                ZIndex = p4.ZIndex
                            })
                        });
                    else
                        v19 = u2.createFragment({
                            RewardShowcase = u2.createElement("ImageLabel", {
                                BackgroundTransparency = 1,
                                Image = RewardUtils.getRewardImageId(p4.Reward),
                                Size = UDim2.fromScale(1, 1),
                                ScaleType = Enum.ScaleType.Fit,
                                ImageTransparency = p4.GroupTransparency,
                                ZIndex = p4.ZIndex
                            }, { u2.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Horizontal,
                                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                                    VerticalAlignment = Enum.VerticalAlignment.Center
                                }) })
                        });
                    end;
                else
                    v19 = u2.createElement(ClanTagChatColorShowcase, {
                        ClanTagChatColor = p4.Reward.clanTagChatColor,
                        Transparency = p4.GroupTransparency,
                        ZIndex = p4.ZIndex
                    });
                end;
            else
                v19 = u2.createElement(BedCoinShowcase, {
                    showText = true,
                    amount = p4.Reward.bedCoins,
                    Transparency = p4.GroupTransparency,
                    ZIndex = p4.ZIndex
                });
            end;
        end;

        v17[#v17 + 1] = v19;
        local v23 = #v17;
        local v24;

        if v7 > 0 then
            v24 = u2.createFragment({
                RewardText = u2.createElement("TextLabel", {
                    TextScaled = true,
                    TextXAlignment = "Right",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 0.275),
                    Position = UDim2.fromScale(1, 1),
                    AnchorPoint = Vector2.new(1, 1),
                    Text = "x" .. tostring(v7),
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    ZIndex = p4.ZIndex
                }, { u2.createElement("UIStroke", {
                        Thickness = 2,
                        Transparency = 0.4,
                        Color = Color3.fromRGB(0, 0, 0)
                    }) })
            });
        else
            v24 = false;
        end;

        if v24 then
            v17[v23 + 1] = v24;
        end;

        local v25 = #v17;
        local v26 = p4[u2.Children];

        if v26 then
            for i, v in v26 do
                if type(i) == "number" then
                    v17[v25 + i] = v;
                else
                    v17[i] = v;
                end;
            end;
        end;

        return u2.createFragment({
            RewardShowcase = u2.createElement(Empty, v8, v17)
        });
    end)
};
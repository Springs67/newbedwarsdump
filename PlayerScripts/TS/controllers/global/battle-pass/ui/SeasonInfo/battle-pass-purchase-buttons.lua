-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local StringUtil = v1.StringUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BPRewardDisplayMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-meta").BPRewardDisplayMeta;
local BattlePassRewards = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-rewards").BattlePassRewards;
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local GiftType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local RewardDisplayType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-display-type").RewardDisplayType;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    BattlePassPurchaseButtons = v3.new(u2)(function(p4) -- Line: 19
        -- upvalues: BattlePassRewards (copy), RewardDisplayType (copy), EmoteMeta (copy), StringUtil (copy), ColorUtil (copy), BPRewardDisplayMeta (copy), u2 (copy), BattlePassUtils (copy), ButtonComponent (copy), KnitClient (copy), Theme (copy), Flamework (copy), BedwarsAppIds (copy), GiftType (copy)
        local v5 = {};

        for i, v in p4 do
            v5[i] = v;
        end;

        v5.store = nil;
        v5.battlepass = nil;
        local v6 = BattlePassRewards[p4.battlepass];

        local function v10(p7, p8) -- Line: 28
            -- upvalues: RewardDisplayType (ref), EmoteMeta (ref)
            local emote = p8.emote;

            if not emote then
                local comingSoon = p8.comingSoon;

                if comingSoon ~= nil then
                    comingSoon = comingSoon.rewardDisplayType;
                end;

                emote = comingSoon == RewardDisplayType.EMOTE;
            end;

            if emote then
                local v9 = EmoteMeta[p8.emote];

                if v9 and not v9.animation then
                    p7.imageEmotes = p7.imageEmotes + 1;

                    return p7;
                end;

                p7.animatedEmotes = p7.animatedEmotes + 1;

                return p7;
            end;

            local killEffect = p8.killEffect;

            if not killEffect then
                local comingSoon = p8.comingSoon;

                if comingSoon ~= nil then
                    comingSoon = comingSoon.rewardDisplayType;
                end;

                killEffect = comingSoon == RewardDisplayType.KILL_EFFECT;
            end;

            if killEffect then
                p7.killEffects = p7.killEffects + 1;

                return p7;
            end;

            local kit = p8.kit;

            if not kit then
                local comingSoon = p8.comingSoon;

                if comingSoon ~= nil then
                    comingSoon = comingSoon.rewardDisplayType;
                end;

                kit = comingSoon == RewardDisplayType.KIT;
            end;

            if kit then
                p7.kits = p7.kits + 1;

                return p7;
            end;

            local kitSkin = p8.kitSkin;

            if not kitSkin then
                local comingSoon = p8.comingSoon;

                if comingSoon ~= nil then
                    comingSoon = comingSoon.rewardDisplayType;
                end;

                kitSkin = comingSoon == RewardDisplayType.KIT_SKIN;
            end;

            if kitSkin then
                p7.kitSkins = p7.kitSkins + 1;

                return p7;
            end;

            local lobbyGadget = p8.lobbyGadget;

            if not lobbyGadget then
                local comingSoon = p8.comingSoon;

                if comingSoon ~= nil then
                    comingSoon = comingSoon.rewardDisplayType;
                end;

                lobbyGadget = comingSoon == RewardDisplayType.LOBBY_GADGET;
            end;

            if lobbyGadget then
                p7.lobbyGadgets = p7.lobbyGadgets + 1;

                return p7;
            end;

            if p8.title then
                p7.titles = p7.titles + 1;

                return p7;
            end;

            local bedBreakEffect = p8.bedBreakEffect;

            if not bedBreakEffect then
                local comingSoon = p8.comingSoon;

                if comingSoon ~= nil then
                    comingSoon = comingSoon.rewardDisplayType;
                end;

                bedBreakEffect = comingSoon == RewardDisplayType.BED_BREAK_EFFECT;
            end;

            if bedBreakEffect then
                p7.bedBreakEffects = p7.bedBreakEffects + 1;

                return p7;
            end;

            local winEffect = p8.winEffect;

            if not winEffect then
                local comingSoon = p8.comingSoon;

                if comingSoon ~= nil then
                    comingSoon = comingSoon.rewardDisplayType;
                end;

                winEffect = comingSoon == RewardDisplayType.WIN_EFFECT;
            end;

            if winEffect then
                p7.winEffects = p7.winEffects + 1;

                return p7;
            end;

            local crate = p8.crate;

            if not crate then
                local comingSoon = p8.comingSoon;

                if comingSoon ~= nil then
                    comingSoon = comingSoon.rewardDisplayType;
                end;

                crate = comingSoon == RewardDisplayType.CRATE;
            end;

            if crate then
                p7.crates = p7.crates + 1;

                return p7;
            end;

            local bedSkin = p8.bedSkin;

            if not bedSkin then
                local comingSoon = p8.comingSoon;

                if comingSoon ~= nil then
                    comingSoon = comingSoon.rewardDisplayType;
                end;

                bedSkin = comingSoon == RewardDisplayType.BED_SKIN;
            end;

            if bedSkin then
                p7.bedSkins = p7.bedSkins + 1;

                return p7;
            end;

            local itemSkin = p8.itemSkin;

            if not itemSkin then
                local comingSoon = p8.comingSoon;

                if comingSoon ~= nil then
                    comingSoon = comingSoon.rewardDisplayType;
                end;

                itemSkin = comingSoon == RewardDisplayType.ITEM_SKIN;
            end;

            if itemSkin then
                p7.itemSkins = p7.itemSkins + 1;

                return p7;
            end;

            if p8.bedCoins ~= nil then
                local bedCoins = p8.bedCoins;
                p7.bedCoins = p7.bedCoins + (bedCoins == nil and 0 or bedCoins);
            end;

            return p7;
        end;

        local v11 = {
            titles = 0,
            killEffects = 0,
            bedBreakEffects = 0,
            winEffects = 0,
            imageEmotes = 0,
            animatedEmotes = 0,
            kitSkins = 0,
            kits = 0,
            lobbyGadgets = 0,
            crates = 0,
            bedSkins = 0,
            itemSkins = 0,
            bedCoins = 0
        };

        for i = 1, #v6 do
            v11 = v10(v11, v6[i], i - 1, v6);
        end;

        local u12 = {};

        local function _(p13, p14, p15, p16) -- Line: 186
            -- upvalues: StringUtil (ref), ColorUtil (ref), u12 (copy)
            if p13 <= 0 then
                return nil;
            end;

            local v17 = StringUtil.formatNumberWithCommas(p13);

            if p13 == 1 then
                p15 = p14;
            end;

            local v18 = v17 .. " " .. p15;

            if p16 then
                v18 = "<font color=\"" .. ColorUtil.richTextColor(p16) .. "\">" .. v18 .. "</font>";
            end;

            table.insert(u12, v18);
        end;

        local bedCoins = v11.bedCoins;
        local borderColor = BPRewardDisplayMeta[RewardDisplayType.BED_COINS].borderColor;

        if bedCoins > 0 then
            local v19 = StringUtil.formatNumberWithCommas(bedCoins) .. " " .. (bedCoins == 1 and "BedCoin" or "BedCoins");

            if borderColor then
                v19 = "<font color=\"" .. ColorUtil.richTextColor(borderColor) .. "\">" .. v19 .. "</font>";
            end;

            table.insert(u12, v19);
        end;

        local kits = v11.kits;
        local borderColor2 = BPRewardDisplayMeta[RewardDisplayType.KIT].borderColor;

        if kits > 0 then
            local v20 = StringUtil.formatNumberWithCommas(kits) .. " " .. (kits == 1 and "Kit" or "Kits");

            if borderColor2 then
                v20 = "<font color=\"" .. ColorUtil.richTextColor(borderColor2) .. "\">" .. v20 .. "</font>";
            end;

            table.insert(u12, v20);
        end;

        local kitSkins = v11.kitSkins;
        local borderColor3 = BPRewardDisplayMeta[RewardDisplayType.KIT_SKIN].borderColor;

        if kitSkins > 0 then
            local v21 = StringUtil.formatNumberWithCommas(kitSkins) .. " " .. (kitSkins == 1 and "Kit Skin" or "Kit Skins");

            if borderColor3 then
                v21 = "<font color=\"" .. ColorUtil.richTextColor(borderColor3) .. "\">" .. v21 .. "</font>";
            end;

            table.insert(u12, v21);
        end;

        local crates = v11.crates;
        local borderColor4 = BPRewardDisplayMeta[RewardDisplayType.CRATE].borderColor;

        if crates > 0 then
            local v22 = StringUtil.formatNumberWithCommas(crates) .. " " .. (crates == 1 and "Crate" or "Crates");

            if borderColor4 then
                v22 = "<font color=\"" .. ColorUtil.richTextColor(borderColor4) .. "\">" .. v22 .. "</font>";
            end;

            table.insert(u12, v22);
        end;

        local killEffects = v11.killEffects;
        local borderColor5 = BPRewardDisplayMeta[RewardDisplayType.KILL_EFFECT].borderColor;

        if killEffects > 0 then
            local v23 = StringUtil.formatNumberWithCommas(killEffects) .. " " .. (killEffects == 1 and "Kill Effect" or "Kill Effects");

            if borderColor5 then
                v23 = "<font color=\"" .. ColorUtil.richTextColor(borderColor5) .. "\">" .. v23 .. "</font>";
            end;

            table.insert(u12, v23);
        end;

        local bedBreakEffects = v11.bedBreakEffects;
        local borderColor6 = BPRewardDisplayMeta[RewardDisplayType.BED_BREAK_EFFECT].borderColor;

        if bedBreakEffects > 0 then
            local v24 = StringUtil.formatNumberWithCommas(bedBreakEffects) .. " " .. (bedBreakEffects == 1 and "Bed Break Effect" or "Bed Break Effects");

            if borderColor6 then
                v24 = "<font color=\"" .. ColorUtil.richTextColor(borderColor6) .. "\">" .. v24 .. "</font>";
            end;

            table.insert(u12, v24);
        end;

        local winEffects = v11.winEffects;
        local borderColor7 = BPRewardDisplayMeta[RewardDisplayType.WIN_EFFECT].borderColor;

        if winEffects > 0 then
            local v25 = StringUtil.formatNumberWithCommas(winEffects) .. " " .. (winEffects == 1 and "Win Effect" or "Win Effects");

            if borderColor7 then
                v25 = "<font color=\"" .. ColorUtil.richTextColor(borderColor7) .. "\">" .. v25 .. "</font>";
            end;

            table.insert(u12, v25);
        end;

        local lobbyGadgets = v11.lobbyGadgets;
        local borderColor8 = BPRewardDisplayMeta[RewardDisplayType.LOBBY_GADGET].borderColor;

        if lobbyGadgets > 0 then
            local v26 = StringUtil.formatNumberWithCommas(lobbyGadgets) .. " " .. (lobbyGadgets == 1 and "Lobby Gadget" or "Lobby Gadgets");

            if borderColor8 then
                v26 = "<font color=\"" .. ColorUtil.richTextColor(borderColor8) .. "\">" .. v26 .. "</font>";
            end;

            table.insert(u12, v26);
        end;

        local bedSkins = v11.bedSkins;
        local borderColor9 = BPRewardDisplayMeta[RewardDisplayType.BED_SKIN].borderColor;

        if bedSkins > 0 then
            local v27 = StringUtil.formatNumberWithCommas(bedSkins) .. " " .. (bedSkins == 1 and "Bed Skin" or "Bed Skins");

            if borderColor9 then
                v27 = "<font color=\"" .. ColorUtil.richTextColor(borderColor9) .. "\">" .. v27 .. "</font>";
            end;

            table.insert(u12, v27);
        end;

        local itemSkins = v11.itemSkins;
        local borderColor10 = BPRewardDisplayMeta[RewardDisplayType.ITEM_SKIN].borderColor;

        if itemSkins > 0 then
            local v28 = StringUtil.formatNumberWithCommas(itemSkins) .. " " .. (itemSkins == 1 and "Item Skin" or "Item Skins");

            if borderColor10 then
                v28 = "<font color=\"" .. ColorUtil.richTextColor(borderColor10) .. "\">" .. v28 .. "</font>";
            end;

            table.insert(u12, v28);
        end;

        local animatedEmotes = v11.animatedEmotes;
        local borderColor11 = BPRewardDisplayMeta[RewardDisplayType.EMOTE].borderColor;

        if animatedEmotes > 0 then
            local v29 = StringUtil.formatNumberWithCommas(animatedEmotes) .. " " .. (animatedEmotes == 1 and "Animated Emote" or "Animated Emotes");

            if borderColor11 then
                v29 = "<font color=\"" .. ColorUtil.richTextColor(borderColor11) .. "\">" .. v29 .. "</font>";
            end;

            table.insert(u12, v29);
        end;

        local imageEmotes = v11.imageEmotes;
        local borderColor12 = BPRewardDisplayMeta[RewardDisplayType.EMOTE].borderColor;

        if imageEmotes > 0 then
            local v30 = StringUtil.formatNumberWithCommas(imageEmotes) .. " " .. (imageEmotes == 1 and "Image Emote" or "Image Emotes");

            if borderColor12 then
                v30 = "<font color=\"" .. ColorUtil.richTextColor(borderColor12) .. "\">" .. v30 .. "</font>";
            end;

            table.insert(u12, v30);
        end;

        local titles = v11.titles;

        if titles > 0 then
            local v31 = StringUtil.formatNumberWithCommas(titles);
            table.insert(u12, v31 .. " " .. (titles == 1 and "Title" or "Titles"));
        end;

        local v36 = (function() -- Line: 208
            -- upvalues: u12 (copy)
            if #u12 == 0 then
                return "";
            end;

            if #u12 == 1 then
                return u12[1] .. "!";
            end;

            if #u12 == 2 then
                return u12[1] .. " & " .. u12[2] .. "!";
            end;

            local function _(p32, p33) -- Line: 218
                -- upvalues: u12 (ref)
                return p33 < #u12 - 1;
            end;

            local v34 = 0;
            local v35 = {};

            for i, v in u12 do
                if i - 1 < #u12 - 1 == true then
                    v34 = v34 + 1;
                    v35[v34] = v;
                end;
            end;

            return table.concat(v35, ", ") .. ", & " .. u12[#u12 - 1 + 1] .. "!";
        end)();
        local v37 = {
            BackgroundTransparency = 1,
            Size = p4.Size
        };

        for i, v in v5 do
            v37[i] = v;
        end;

        local v38 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Bottom,
                Padding = UDim.new(0, 6)
            }), u2.createElement("TextLabel", {
                TextXAlignment = "Center",
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.4),
                Text = "<b>" .. v36 .. "</b>",
                TextColor3 = ColorUtil.WHITE
            }) };
        local v39 = #v38;
        local v40 = not p4.store.BattlePass.paid and BattlePassUtils.isActiveBattlePassPaid() and u2.createElement(ButtonComponent, {
            Text = "🎟️  BUY BATTLE PASS",
            TextSize = 18,
            Size = UDim2.new(1, 0, 0, 32),

            OnClick = function() -- Line: 261, Name: OnClick
                -- upvalues: KnitClient (ref)
                KnitClient.Controllers.BattlePassController:promptBattlePassPurchase();
            end,

            CornerRadius = UDim.new(0, 5),
            BackgroundColor3 = Theme.backgroundSuccess
        });

        if v40 then
            v38[v39 + 1] = v40;
        end;

        local v41 = #v38;
        local v42 = BattlePassUtils.isActiveBattlePassPaid() and u2.createElement(ButtonComponent, {
            Text = "🎁  GIFT BATTLE PASS",
            TextSize = 18,
            Size = UDim2.new(1, 0, 0, 32),

            OnClick = function() -- Line: 275, Name: OnClick
                -- upvalues: Flamework (ref), BedwarsAppIds (ref), GiftType (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.GIFTING, {
                    GiftType = GiftType.BattlePass
                });
            end,

            CornerRadius = UDim.new(0, 5),
            BackgroundColor3 = ColorUtil.hexColor(13934614)
        });

        if v42 then
            v38[v41 + 1] = v42;
        end;

        return u2.createFragment({
            BattlePassPurchaseButtons = u2.createElement("Frame", v37, v38)
        });
    end)
};
-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local IconButton = v1.IconButton;
local TooltipContainer = v1.TooltipContainer;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local BPRewardDisplayMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-meta").BPRewardDisplayMeta;
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local RewardDisplayType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-display-type").RewardDisplayType;
local RewardUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    BattlePassRewardInfoCard = v4.new(u3)(function(u5, p6) -- Line: 23
        -- upvalues: BattlePassUtils (copy), RewardUtils (copy), u2 (copy), RewardDisplayType (copy), BPRewardDisplayMeta (copy), ColorUtil (copy), u3 (copy), Theme (copy), Empty (copy), ButtonComponent (copy), KnitClient (copy), IconButton (copy), Flamework (copy), BedwarsAppIds (copy), BedwarsImageId (copy), TooltipContainer (copy), AutoSizedText (copy), getBedwarsKitMeta (copy)
        local v7 = u5.Reward.level <= u5.BattlePass.level;
        local v8 = u5.Reward.level > BattlePassUtils.MAX_LEVEL;

        local function _() -- Line: 26
            -- upvalues: u5 (copy), RewardUtils (ref)
            return u5.Reward.comingSoon and "Coming Soon" or RewardUtils.getRewardName(u5.Reward);
        end;

        local function v11() -- Line: 32
            -- upvalues: u5 (copy), u2 (ref), RewardDisplayType (ref), BPRewardDisplayMeta (ref), RewardUtils (ref)
            local comingSoon = u5.Reward.comingSoon;

            if comingSoon then
                local function _(p9) -- Line: 36
                    -- upvalues: comingSoon (copy)
                    return comingSoon.rewardDisplayType == p9;
                end;

                local v10 = nil;

                for i, v in u2.values(RewardDisplayType) do
                    local _ = i - 1;

                    if comingSoon.rewardDisplayType == v == true then
                        v10 = v;
                        break;
                    end;
                end;

                if v10 then
                    return BPRewardDisplayMeta[v10].name;
                end;
            end;

            return RewardUtils.getRewardType(u5.Reward);
        end;

        local v12 = {};

        for i, v in u5 do
            v12[i] = v;
        end;

        v12.BattlePass = nil;
        v12.Reward = nil;
        local v13 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 0.4,
            ZIndex = 100,
            BackgroundColor3 = ColorUtil.BLACK
        };

        for i, v in v12 do
            v13[i] = v;
        end;

        local v14 = { u3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 16),
                PaddingBottom = UDim.new(0, 16),
                PaddingLeft = UDim.new(0, 16),
                PaddingRight = UDim.new(0, 16)
            }), u3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }) };
        local _ = #v14;
        local v15 = {
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y
        };
        local v16 = {};
        local v17 = u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 4)
        });
        local createElement = u3.createElement;
        local v18 = {
            BackgroundTransparency = 1,
            TextSize = 18,
            LayoutOrder = 1,
            ZIndex = 100,
            Size = UDim2.new(1, 0, 0, 18),
            AutomaticSize = Enum.AutomaticSize.X
        };
        local v19 = v11();
        v18.Text = tostring(v19);
        v18.TextXAlignment = Enum.TextXAlignment.Left;
        v18.TextColor3 = Theme.textPrimary;
        v18.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
        v16[1], v16[2], v16[3] = v17, createElement("TextLabel", v18), u3.createElement("TextLabel", {
    BackgroundTransparency = 1,
    TextSize = 22,
    LayoutOrder = 2,
    ZIndex = 100,
    Size = UDim2.new(1, 0, 0, 18),
    AutomaticSize = Enum.AutomaticSize.X,
    Text = u5.Reward.comingSoon and "Coming Soon" or RewardUtils.getRewardName(u5.Reward),
    TextXAlignment = Enum.TextXAlignment.Left,
    TextColor3 = ColorUtil.WHITE,
    FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
});
        local v20 = {
            BackgroundTransparency = 1,
            LayoutOrder = 3,
            Size = UDim2.new(1, 0, 0, 18),
            AutomaticSize = Enum.AutomaticSize.XY
        };
        local v21 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0)
            }) };
        local v22 = #v21;
        local v23 = not v7 and u3.createFragment({
            RequiresLevelText = u3.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextTransparency = 0.3,
                TextSize = 16,
                LayoutOrder = 1,
                ZIndex = 100,
                Size = UDim2.new(1, 0, 0, 16),
                AutomaticSize = Enum.AutomaticSize.X,
                Text = "Requires Level " .. tostring(u5.Reward.level),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextColor3 = ColorUtil.WHITE,
                Font = Enum.Font.Roboto
            })
        });

        if v23 then
            v21[v22 + 1] = v23;
        end;

        v21[#v21 + 1] = u3.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextTransparency = 0.3,
            TextSize = 16,
            LayoutOrder = 2,
            ZIndex = 100,
            Size = UDim2.new(1, 0, 0, 16),
            AutomaticSize = Enum.AutomaticSize.X,
            Text = (u5.BattlePass.paid or not u5.Reward.paid) and (v7 and "Claimed" or "") or "Requires Battle Pass",
            TextXAlignment = Enum.TextXAlignment.Left,
            TextColor3 = ColorUtil.WHITE,
            Font = Enum.Font.Roboto
        });
        v16[#v16 + 1] = u3.createElement("Frame", v20, v21);
        v14.CardInfo = u3.createElement(Empty, v15, v16);
        local v24 = {
            ZIndex = 120,
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.new(0, 0, 1, 0),
            Size = UDim2.new(1, 0, 0, 32),
            AutomaticSize = Enum.AutomaticSize.Y
        };
        local v25 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0.05, 0)
            }) };
        local v26 = #v25;
        local v27 = u5.BattlePass.paid and not (v7 or v8) and u3.createElement(ButtonComponent, {
            TextSize = 14,
            LayoutOrder = 1,
            ZIndex = 120,
            Selectable = true,
            Text = "PURCHASE " .. tostring(u5.Reward.level - u5.BattlePass.level) .. " LEVELS",
            Size = UDim2.new(0.85, 0, 0, 32),

            OnClick = function() -- Line: 191, Name: OnClick
                -- upvalues: KnitClient (ref), u5 (copy)
                KnitClient.Controllers.BattlePassController:promptPurchaseToLevel(u5.Reward.level);
            end,

            CornerRadius = UDim.new(0, 5),
            BackgroundColor3 = Theme.backgroundSuccess
        });

        if v27 then
            v25[v26 + 1] = v27;
        end;

        local v28 = #v25;
        local v29 = not u5.BattlePass.paid and u5.Reward.paid and u3.createElement(ButtonComponent, {
            Text = "PURCHASE BATTLE PASS",
            TextSize = 14,
            LayoutOrder = 1,
            ZIndex = 120,
            Selectable = true,
            Size = UDim2.new(0.85, 0, 0, 32),

            OnClick = function() -- Line: 208, Name: OnClick
                -- upvalues: KnitClient (ref)
                KnitClient.Controllers.BattlePassController:promptBattlePassPurchase();
            end,

            CornerRadius = UDim.new(0, 5),
            BackgroundColor3 = Theme.backgroundSuccess
        });

        if v29 then
            v25[v28 + 1] = v29;
        end;

        local v30 = #v25;
        local v31 = u5.Reward.kit and u3.createElement(IconButton, {
            ZIndex = 120,
            LayoutOrder = 2,
            Selectable = true,
            Size = UDim2.new(0.1, 0, 0, 32),

            OnClick = function() -- Line: 224, Name: OnClick
                -- upvalues: Flamework (ref), BedwarsAppIds (ref), u5 (copy)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.KIT_DETAILS_APP, {
                    SelectedKit = u5.Reward.kit
                });
            end,

            Image = BedwarsImageId.EYE_REGULAR,
            IconProps = {
                ScaleType = "Fit"
            }
        }, { u3.createElement(TooltipContainer, {}, { u3.createElement(AutoSizedText, {
                    Text = "Open Kit Shop",
                    TextSize = 16,
                    Font = Enum.Font.SourceSansBold,
                    Limits = Vector2.new(300, 60)
                }), u3.createElement(AutoSizedText, {
                    TextSize = 14,
                    Text = getBedwarsKitMeta(u5.Reward.kit).name,
                    Font = Enum.Font.SourceSansSemibold,
                    Limits = Vector2.new(300, 500)
                }) }) });

        if v31 then
            v25[v30 + 1] = v31;
        end;

        v14.CardButtons = u3.createElement(Empty, v24, v25);

        return u3.createFragment({
            RewardInfoCard = u3.createElement("Frame", v13, v14)
        });
    end)
};
-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local CornerFiller = v1.CornerFiller;
local GetTarmacAsset = v1.GetTarmacAsset;
local ImageId = v1.ImageId;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local BPRewardDisplayMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-meta").BPRewardDisplayMeta;
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local EmoteMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta;
local RewardDisplayType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-display-type").RewardDisplayType;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local BattlePassRewardsListReward = RuntimeLib.import(script, script.Parent, "battle-pass-rewards-list-reward").BattlePassRewardsListReward;
GetTarmacAsset("CrownIcon");
local v4 = u3.Component:extend("BattlePassLevelRewardsListLevelCard");

function v4.init(p5) -- Line: 20
end;

function v4.shouldUpdate(p6, p7, p8) -- Line: 22
    if p6.props.BattlePass.experience ~= p7.BattlePass.experience and (p6.props.Level >= p6.props.BattlePass.level and p6.props.Level <= p7.BattlePass.level) then
        return true;
    end;

    if p6.props.Active == p7.Active then
        return false;
    end;

    return table.find(p6.props.LevelRewards, p7.Active) ~= nil or table.find(p6.props.LevelRewards, p6.props.Active) ~= nil;
end;

function v4.render(u9) -- Line: 41
    -- upvalues: RewardDisplayType (copy), EmoteMeta (copy), BPRewardDisplayMeta (copy), Theme (copy), u3 (copy), ColorUtil (copy), CornerFiller (copy), BattlePassUtils (copy), ImageId (copy), u2 (copy), BattlePassRewardsListReward (copy)
    local v10 = u9.props.BattlePass.level == u9.props.Level;
    local u11 = u9.props.BattlePass.level < u9.props.Level;

    local function _(p12) -- Line: 45
        return not p12.paid;
    end;

    local v13 = 0;
    local v14 = {};

    for i, v in u9.props.LevelRewards do
        local _ = i - 1;

        if not v.paid == true then
            v13 = v13 + 1;
            v14[v13] = v;
        end;
    end;

    local function _(p15) -- Line: 60
        return p15.paid;
    end;

    local v16 = 0;
    local v17 = {};

    for i, v in u9.props.LevelRewards do
        local _ = i - 1;

        if v.paid == true then
            v16 = v16 + 1;
            v17[v16] = v;
        end;
    end;

    local v18 = not u11;
    local v19 = v18 and #v14 or v18;
    local v20 = not u11;

    if v20 then
        local paid = u9.props.BattlePass.paid;
        v20 = paid and #v17 or paid;
    end;

    local v21 = u9.props.Level > 50;
    local v35 = (function() -- Line: 77
        -- upvalues: u9 (copy), RewardDisplayType (ref), EmoteMeta (ref), BPRewardDisplayMeta (ref), Theme (ref)
        local u22 = false;
        local u23 = false;
        local u24 = false;
        local u25 = false;
        local u26 = false;
        local u27 = false;
        local LevelRewards = u9.props.LevelRewards;

        local function v34(p28) -- Line: 85
            -- upvalues: RewardDisplayType (ref), u22 (ref), u23 (ref), u24 (ref), u25 (ref), EmoteMeta (ref), u26 (ref), u27 (ref)
            local v29 = p28.kit ~= nil;

            if not v29 then
                local comingSoon = p28.comingSoon;

                if comingSoon ~= nil then
                    comingSoon = comingSoon.rewardDisplayType;
                end;

                v29 = comingSoon == RewardDisplayType.KIT;
            end;

            if v29 then
                u22 = true;

                return;
            end;

            local v30 = p28.kitSkin ~= nil;

            if not v30 then
                local comingSoon = p28.comingSoon;

                if comingSoon ~= nil then
                    comingSoon = comingSoon.rewardDisplayType;
                end;

                v30 = comingSoon == RewardDisplayType.KIT_SKIN;
            end;

            if v30 then
                u23 = true;

                return;
            end;

            local v31 = p28.killEffect ~= nil;

            if not v31 then
                local comingSoon = p28.comingSoon;

                if comingSoon ~= nil then
                    comingSoon = comingSoon.rewardDisplayType;
                end;

                v31 = comingSoon == RewardDisplayType.KILL_EFFECT;
            end;

            if v31 then
                u24 = true;

                return;
            end;

            local v32 = p28.lobbyGadget ~= nil;

            if not v32 then
                local comingSoon = p28.comingSoon;

                if comingSoon ~= nil then
                    comingSoon = comingSoon.rewardDisplayType;
                end;

                v32 = comingSoon == RewardDisplayType.LOBBY_GADGET;
            end;

            if v32 then
                u25 = true;

                return;
            end;

            local v33 = p28.emote ~= nil;

            if not v33 then
                local comingSoon = p28.comingSoon;

                if comingSoon ~= nil then
                    comingSoon = comingSoon.rewardDisplayType;
                end;

                v33 = comingSoon == RewardDisplayType.EMOTE;
            end;

            if v33 then
                if p28.emote then
                    if not EmoteMeta[p28.emote].animation then
                        return nil;
                    end;

                    u26 = true;
                end;
            elseif p28.crate ~= nil then
                u27 = true;
            end;
        end;

        for i, v in LevelRewards do
            v34(v, i - 1, LevelRewards);
        end;

        if u22 then
            return BPRewardDisplayMeta.kit.backgroundColor;
        end;

        if u23 then
            return BPRewardDisplayMeta.kitSkin.backgroundColor;
        end;

        if u24 then
            return BPRewardDisplayMeta.killEffect.backgroundColor;
        end;

        if u25 then
            return BPRewardDisplayMeta.lobbyGadget.backgroundColor;
        end;

        if u26 then
            return BPRewardDisplayMeta.emote.backgroundColor;
        end;

        if u27 then
            return BPRewardDisplayMeta.crate.backgroundColor;
        end;

        return Theme.backgroundTertiary;
    end)();

    local function v36() -- Line: 174
        -- upvalues: u9 (copy)
        if u9.props.Level == 51 then
            return ColorSequence.new(Color3.fromRGB(255, 210, 0), Color3.fromRGB(247, 151, 30));
        end;

        if u9.props.Level == 52 then
            return ColorSequence.new(Color3.fromRGB(255, 210, 0), Color3.fromRGB(247, 151, 30));
        end;

        if u9.props.Level == 53 then
            return ColorSequence.new(Color3.fromRGB(255, 210, 0), Color3.fromRGB(247, 151, 30));
        end;

        if u9.props.Level == 54 then
            return ColorSequence.new(Color3.fromRGB(255, 210, 0), Color3.fromRGB(247, 151, 30));
        end;

        if u9.props.Level == 55 then
            return ColorSequence.new(Color3.fromRGB(0, 158, 189), Color3.fromRGB(255, 153, 255));
        end;
    end;

    local v37 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 0,
        Size = UDim2.new(u9.props.Size.X.Scale, u9.props.Size.X.Offset, u9.props.Size.Y.Scale, u9.props.Size.Y.Scale),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Theme.backgroundSecondary,
        LayoutOrder = u9.props.LayoutOrder
    };
    local v38 = {};
    local v39 = #v38;
    local v40;

    if v10 then
        v40 = u3.createElement("UIStroke", {
            Thickness = 1,
            Color = ColorUtil.WHITE
        });
    else
        v40 = v10;
    end;

    if v40 then
        v38[v39 + 1] = v40;
    end;

    local v41 = #v38;
    v38[v41 + 1] = u3.createElement("UISizeConstraint", {
        MinSize = Vector2.new(90, 0)
    });
    v38[v41 + 2] = u3.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4)
    });
    local v42 = {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        Size = UDim2.fromScale(1, 0.1),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = v35
    };
    local v43 = { u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 5)
        }), u3.createElement(CornerFiller, {
            BottomRight = true,
            BottomLeft = true
        }) };
    local v44 = #v43;
    local v45 = not u11;

    if v45 then
        local createFragment = u3.createFragment;
        local v46 = {};
        local createFragment2 = u3.createFragment;
        local v47 = {};
        local createElement = u3.createElement;
        local v48 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
            LayoutOrder = 1,
            ZIndex = 100,
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(0, 1)
        };
        local new = UDim2.new;
        local v49;

        if v10 then
            local v50 = BattlePassUtils.getCurrExperienceProgression(u9.props.BattlePass.experience, u9.props.BattlePass.level) / BattlePassUtils.getExperienceForLevel(u9.props.BattlePass.level + 1);
            v49 = math.min(v50, 1);
        else
            v49 = 1;
        end;

        v48.Size = new(v49, 0, 0, 3);
        v48.BackgroundColor3 = Theme.backgroundSuccess;
        v47.BottomBorderProgress = createElement("Frame", v48, { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center
            }) });
        v46.BottomBorderProgress = createFragment2(v47);
        v46.BottomBorderBG = u3.createFragment({
            BottomBorderBG = u3.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 0.6,
                LayoutOrder = 1,
                ZIndex = 99,
                AnchorPoint = Vector2.new(0, 1),
                Position = UDim2.fromScale(0, 1),
                Size = UDim2.new(1, 0, 0, 3),
                BackgroundColor3 = ColorUtil.WHITE
            }, { u3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }) })
        });
        v45 = createFragment(v46);
    end;

    if v45 then
        v43[v44 + 1] = v45;
    end;

    local v51 = #v43;
    local v52;

    if v21 then
        v52 = u3.createFragment({
            BattlePassIcon = u3.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Rotation = -25,
                Position = UDim2.fromOffset(-10, -12),
                Size = UDim2.fromOffset(28, 22.8),
                Image = BattlePassUtils.BATTLE_PASS_SEASON_ICON,
                ScaleType = Enum.ScaleType.Fit
            })
        });
    else
        v52 = v21;
    end;

    if v52 then
        v43[v51 + 1] = v52;
    end;

    local _ = #v43;
    local createElement = u3.createElement;
    local v53 = {
        BackgroundTransparency = 1,
        TextSize = 16,
        Size = UDim2.fromScale(0, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        TextTransparency = v21 and 0 or (u11 and 0.3 or 0),
        Text = (v21 and "EPILOGUE: " or "") .. tostring(u9.props.Level),
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center
    };
    local v54;

    if v21 then
        v54 = Color3.fromRGB(43, 43, 0);
    else
        v54 = ColorUtil.WHITE;
    end;

    v53.TextColor3 = v54;
    v53.FontFace = Font.new(v21 and "RobotoMono" or "Roboto", Enum.FontWeight.Bold);
    v43.LevelText = createElement("TextLabel", v53);
    v38.LevelColumnHeader = u3.createElement("Frame", v42, v43);
    local v55 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 0,
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, 0.4),
        AutomaticSize = Enum.AutomaticSize.X
    };
    local v56;

    if v21 then
        v56 = Color3.fromRGB(255, 255, 255);
    else
        v56 = ColorUtil.darken(Theme.backgroundPrimary, 0.9);
    end;

    v55.BackgroundColor3 = v56;
    local v57 = {};
    local v58 = #v57;
    local v59;

    if v21 then
        v59 = u3.createElement("UIGradient", {
            Rotation = 245,
            Color = v36()
        });
    else
        v59 = v21;
    end;

    if v59 then
        v57[v58 + 1] = v59;
    end;

    local v60 = #v57;
    v57[v60 + 1] = u3.createElement("UICorner", {
        CornerRadius = UDim.new(0, 5)
    });
    v57[v60 + 2] = u3.createElement("UIPadding", {
        PaddingLeft = UDim.new(0, 16),
        PaddingRight = UDim.new(0, 16)
    });
    local createElement2 = u3.createElement;
    local v61 = {
        BackgroundTransparency = 1,
        ScaleType = "Fit",
        ZIndex = 200,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(1, 0, 0, 8),
        Size = UDim2.fromOffset(16, 16)
    };
    local v62;

    if u11 then
        v62 = ImageId.LOCK_SOLID;
    elseif v19 == 0 or (v19 ~= v19 or not v19) then
        v62 = nil;
    else
        v62 = ImageId.CHECK_CIRCLE_SOLID;
    end;

    v61.Image = v62;
    v61.ImageTransparency = (v19 == 0 or (v19 ~= v19 or not v19)) and 0.4 or 0;
    v57[v60 + 3] = createElement2("ImageLabel", v61);

    local function v67(u63, p64) -- Line: 338
        -- upvalues: u2 (ref), RewardDisplayType (ref), u3 (ref), BattlePassRewardsListReward (ref), u9 (copy), u11 (copy)
        local function _(p65) -- Line: 340
            -- upvalues: u63 (copy)
            return u63[p65] ~= nil;
        end;

        local v66 = nil;

        for i, v in u2.values(RewardDisplayType) do
            local _ = i - 1;

            if u63[v] ~= nil == true then
                v66 = v;
                break;
            end;
        end;

        return u3.createElement(BattlePassRewardsListReward, {
            Reward = u63,
            SetReward = u9.props.SetReward,
            RewardDisplayType = v66,
            SetActive = u9.props.SetActive,
            Active = u9.props.Active,
            LayoutOrder = p64,
            Locked = u11,
            GamepadShouldAutoSelect = u9.props.Level == u63.level
        });
    end;

    local v68 = table.create(#v14);

    for i, v in v14 do
        v68[i] = v67(v, i - 1, v14);
    end;

    local v69 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1)
    };
    local v70 = { u3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 8)
        }) };
    local v71 = #v70;

    for i, v in v68 do
        v70[v71 + i] = v;
    end;

    v57[v60 + 4] = u3.createElement("Frame", v69, v70);
    v38.FreePassRewards = u3.createElement("Frame", v55, v57);
    local v72 = BattlePassUtils.isActiveBattlePassPaid();

    if v72 then
        local v73 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
            LayoutOrder = 3,
            Size = UDim2.new(1, 0, 0.5, -8),
            AutomaticSize = Enum.AutomaticSize.X
        };
        local v74;

        if v21 then
            v74 = Color3.fromRGB(255, 255, 255);
        else
            v74 = Theme.backgroundPrimary;
        end;

        v73.BackgroundColor3 = v74;
        local v75 = {};
        local v76 = #v75;

        if v21 then
            v21 = u3.createElement("UIGradient", {
                Rotation = 245,
                Color = v36()
            });
        end;

        if v21 then
            v75[v76 + 1] = v21;
        end;

        local v77 = #v75;
        v75[v77 + 1] = u3.createElement("UICorner", {
            CornerRadius = UDim.new(0, 5)
        });
        v75[v77 + 2] = u3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 16),
            PaddingRight = UDim.new(0, 16)
        });
        local createElement3 = u3.createElement;
        local v78 = {
            BackgroundTransparency = 1,
            ScaleType = "Fit",
            ZIndex = 200,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.new(1, 0, 0, 8),
            Size = UDim2.fromOffset(16, 16)
        };
        local v79;

        if u11 or not u9.props.BattlePass.paid then
            v79 = ImageId.LOCK_SOLID;
        elseif v20 == 0 or (v20 ~= v20 or not v20) then
            v79 = nil;
        else
            v79 = ImageId.CHECK_CIRCLE_SOLID;
        end;

        v78.Image = v79;
        v78.ImageTransparency = (v20 == 0 or (v20 ~= v20 or not v20)) and 0.4 or 0;
        v75[v77 + 3] = createElement3("ImageLabel", v78);

        local function v84(u80, p81) -- Line: 426
            -- upvalues: u2 (ref), RewardDisplayType (ref), u3 (ref), BattlePassRewardsListReward (ref), u9 (copy), u11 (copy)
            local function _(p82) -- Line: 428
                -- upvalues: u80 (copy)
                return u80[p82] ~= nil;
            end;

            local v83 = nil;

            for i, v in u2.values(RewardDisplayType) do
                local _ = i - 1;

                if u80[v] ~= nil == true then
                    v83 = v;
                    break;
                end;
            end;

            return u3.createElement(BattlePassRewardsListReward, {
                Reward = u80,
                SetReward = u9.props.SetReward,
                RewardDisplayType = v83,
                SetActive = u9.props.SetActive,
                Active = u9.props.Active,
                LayoutOrder = p81,
                Locked = u11 or not u9.props.BattlePass.paid,
                GamepadShouldAutoSelect = u9.props.Level == u80.level
            });
        end;

        local v85 = table.create(#v17);

        for i, v in v17 do
            v85[i] = v84(v, i - 1, v17);
        end;

        local v86 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1)
        };
        local v87 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 8)
            }) };
        local v88 = #v87;

        for i, v in v85 do
            v87[v88 + i] = v;
        end;

        v75[v77 + 4] = u3.createElement("Frame", v86, v87);
        v72 = u3.createFragment({
            BattlePassRewards = u3.createElement("Frame", v73, v75)
        });
    end;

    if v72 then
        v38[v41 + 3] = v72;
    end;

    return u3.createFragment({
        LevelRewardsCardContainer = u3.createElement("Frame", v37, v38)
    });
end;

return {
    BattlePassLevelRewardsListLevelCard = v4
};
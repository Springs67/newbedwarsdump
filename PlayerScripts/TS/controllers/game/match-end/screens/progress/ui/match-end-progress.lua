-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local UIUtil = v1.UIUtil;
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "color-util").ColorUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local MatchEndScreensMeta = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "match-end-screen-meta").MatchEndScreensMeta;
local MatchEndArmorTrimXp = RuntimeLib.import(script, script.Parent, "armor-trim", "match-end-armor-trim-xp").MatchEndArmorTrimXp;
local MatchEndCurrencyEarned = RuntimeLib.import(script, script.Parent, "currency", "match-end-currency-earned").MatchEndCurrencyEarned;
local KitContractProgress = RuntimeLib.import(script, script.Parent, "kit-contract", "kit-contract-progress").KitContractProgress;
local MatchOutcome = RuntimeLib.import(script, script.Parent, "match-outcome").MatchOutcome;
local MatchEndMissionProgress = RuntimeLib.import(script, script.Parent, "mission", "match-end-mission-progress").MatchEndMissionProgress;
local BattlePassProgression = RuntimeLib.import(script, script.Parent, "progression", "battle-pass-progression").BattlePassProgression;
local PlayerLevelProgression = RuntimeLib.import(script, script.Parent, "progression", "player-level-progression").PlayerLevelProgression;
local RankedSummary = RuntimeLib.import(script, script.Parent, "ranked", "ranked-summary").RankedSummary;
local u4 = nil;

local function MatchEndProgressWrapper(p5) -- Line: 271
    -- upvalues: u2 (copy), DeviceUtil (copy), u4 (ref)
    local v6 = {};
    local v7 = {
        Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, 110),
        BackgroundTransparency = 1
    };
    v6[#v6 + 1] = u2.createElement("Frame", v7, { u2.createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(DeviceUtil.isSmallScreen() and 0.98 or 0.8, 1),
            Position = UDim2.new(0.5, 0, 0.5, DeviceUtil.isSmallScreen() and 35 or 50),
            AnchorPoint = Vector2.new(0.5, 0.5)
        }, { u2.createElement(u4, {
                RankChangeData = p5.RankChangeData,
                WinningTeamId = p5.WinningTeamId,
                PlayerMatchExperienceEarned = p5.PlayerMatchExperienceEarned,
                BattlePassMatchExperienceEarned = p5.BattlePassMatchExperienceEarned,
                BedCoinsEarned = p5.BedCoinsEarned,
                ClanContributionEarned = p5.ClanContributionEarned,
                MissionProgress = p5.MissionProgress,
                DisableAnimation = p5.DisableAnimation,
                ArmorTrimXpEarned = p5.ArmorTrimXpEarned,
                KitStatsDelta = p5.KitStatsDelta,
                EquippedKit = p5.EquippedKit
            }) }) });

    return u2.createElement("ScreenGui", {
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        DisplayOrder = 101
    }, v6);
end;

u4 = v3.new(u2)(function(u8, p9) -- Line: 22
    -- upvalues: u2 (copy), DeviceUtil (copy), TweenService (copy), UIUtil (copy), MatchEndScreensMeta (copy), MatchOutcome (copy), ColorUtil (copy), PlayerLevelProgression (copy), BattlePassProgression (copy), RankedSummary (copy), MatchEndCurrencyEarned (copy), MatchEndArmorTrimXp (copy), KitContractProgress (copy), MatchEndMissionProgress (copy)
    local _ = p9.useState;
    local useEffect = p9.useEffect;
    local v10 = u8.BattlePassMatchExperienceEarned ~= nil and true or u8.PlayerMatchExperienceEarned ~= nil;
    local v11 = u8.ArmorTrimXpEarned ~= nil and true or u8.KitStatsDelta ~= nil;
    local u12 = u2.createRef();
    local u13 = u2.createRef();
    useEffect(function() -- Line: 30
        -- upvalues: u13 (copy), u12 (copy), u8 (copy), DeviceUtil (ref), TweenService (ref), UIUtil (ref), MatchEndScreensMeta (ref)
        task.spawn(function() -- Line: 31
            -- upvalues: u13 (ref), u12 (ref), u8 (ref), DeviceUtil (ref), TweenService (ref), UIUtil (ref), MatchEndScreensMeta (ref)
            local u14 = u13:getValue();
            local u15 = u12:getValue();

            if u8.DisableAnimation then
                u15.Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 0.8 or 0.75);

                return nil;
            end;

            if DeviceUtil.isHoarceKat() then
                task.wait(0.1);
            end;

            local v16 = TweenInfo.new(0.4, Enum.EasingStyle.Cubic);
            TweenService:Create(u15, v16, {
                Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 0.8 or 0.75)
            }):Play();
            UIUtil:setContainerTransparency(u14, 1, {
                onSetTweenInfo = TweenInfo.new(0),
                onCleanUpTweenInfo = v16
            }):DoCleaning();
            local displaySecs = MatchEndScreensMeta[4].displaySecs;
            local u17 = TweenInfo.new(0.4, Enum.EasingStyle.Cubic);
            task.delay((displaySecs == nil and 1 or displaySecs) - 0.4, function() -- Line: 57
                -- upvalues: TweenService (ref), u15 (copy), u17 (copy), UIUtil (ref), u14 (copy)
                TweenService:Create(u15, u17, {
                    Size = UDim2.fromScale(1, 0)
                }):Play();
                UIUtil:setContainerTransparency(u14, 1, {
                    onSetTweenInfo = u17
                });
            end);
        end);
    end);
    local v18 = {
        Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, DeviceUtil.isSmallScreen() and 0 or 80),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.05),
        BackgroundTransparency = 1,
        Visible = u8.Visible,
        [u2.Ref] = u13
    };
    local v19 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.05, 0)
        }), u2.createElement(MatchOutcome, {
            LayoutOrder = 0,
            WinningTeamId = u8.WinningTeamId,
            Size = UDim2.fromScale(0.5, 0.2)
        }) };
    local _ = #v19;
    local v20 = {
        Size = UDim2.fromScale(1, 0),
        BackgroundTransparency = 0.7,
        BackgroundColor3 = ColorUtil.BLACK,
        LayoutOrder = 1,
        [u2.Ref] = u12
    };
    local v21 = { u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 10)
        }), u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10)
        }) };
    local _ = #v21;
    local v22 = {
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 0.3 or 0.2),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0),
        Visible = v10
    };
    local v23 = {};
    local _ = #v23;
    local v24 = {
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5)
    };
    local v25 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.05, 0)
        }) };
    local v26 = #v25;
    local v27 = u8.PlayerMatchExperienceEarned and u2.createElement(PlayerLevelProgression, {
        LayoutOrder = 0,
        Size = UDim2.fromScale(0.43, 1),
        MatchExperienceEarned = u8.PlayerMatchExperienceEarned,
        DisableAnimation = u8.DisableAnimation
    });

    if v27 then
        v25[v26 + 1] = v27;
    end;

    local v28 = #v25;
    local v29 = u8.BattlePassMatchExperienceEarned and u2.createElement(BattlePassProgression, {
        LayoutOrder = 1,
        Size = UDim2.fromScale(0.43, 1),
        MatchExperienceEarned = u8.BattlePassMatchExperienceEarned,
        DisableAnimation = u8.DisableAnimation
    });

    if v29 then
        v25[v28 + 1] = v29;
    end;

    v23.MatchExperienceProgression = u2.createElement("Frame", v24, v25);
    v21.PrimaryProgressionWrapper = u2.createElement("Frame", v22, v23);
    local v30 = {
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Size = UDim2.fromScale(1, v10 and 0.6 or 0.8)
    };
    local v31 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 0)
        }) };
    local v32 = {
        BackgroundTransparency = 1,
        LayoutOrder = 0,
        Size = UDim2.fromScale(0.2, 1),
        Visible = u8.RankChangeData ~= nil
    };
    local v33 = {};
    local v34 = #v33;
    local v35 = u8.RankChangeData and u2.createElement(RankedSummary, {
        RankChangeData = u8.RankChangeData
    });

    if v35 then
        v33[v34 + 1] = v35;
    end;

    v31.RankedWrapper = u2.createElement("Frame", v32, v33);
    local v36 = {
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Size = UDim2.fromScale(0.14, 1)
    };
    local v37 = {};
    local v38 = #v37;
    local v39;

    if u8.BedCoinsEarned == nil and u8.ClanContributionEarned == 0 then
        v39 = false;
    else
        v39 = u2.createElement(MatchEndCurrencyEarned, {
            BedCoinsEarned = u8.BedCoinsEarned,
            ClanContributionEarned = u8.ClanContributionEarned,
            FrameProps = {
                LayoutOrder = 0,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            }
        });
    end;

    if v39 then
        v37[v38 + 1] = v39;
    end;

    v31.CurrencyEarnedWrapper = u2.createElement("Frame", v36, v37);
    local v40 = {
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Size = UDim2.fromScale(0.2, 1),
        Visible = v11
    };
    local v41 = {};
    local _ = #v41;
    local v42 = {
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.9, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    };
    local v43 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            Padding = UDim.new(0.05, 0),
            SortOrder = Enum.SortOrder.LayoutOrder
        }) };
    local v44 = #v43;
    local v45 = u8.ArmorTrimXpEarned and u2.createElement(MatchEndArmorTrimXp, {
        ArmorTrimXpEarned = u8.ArmorTrimXpEarned,
        FrameProps = {
            LayoutOrder = 0,
            Size = UDim2.fromScale(1, 1)
        }
    });

    if v45 then
        v43[v44 + 1] = v45;
    end;

    local v46 = #v43;
    local v47 = u8.KitStatsDelta and u2.createElement(KitContractProgress, {
        KitStatsDelta = u8.KitStatsDelta,
        EquippedKit = u8.EquippedKit,
        FrameProps = {
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, 1)
        }
    });

    if v47 then
        v43[v46 + 1] = v47;
    end;

    v41.MiscProgression = u2.createElement("Frame", v42, v43);
    v31.MiscProgressionWrapper = u2.createElement("Frame", v40, v41);
    v31[#v31 + 1] = u2.createElement(MatchEndMissionProgress, {
        LayoutOrder = 3,
        Size = UDim2.fromScale(0.95 - ((u8.RankChangeData and 0.2 or 0) + 0.14 + (v11 and 0.2 or 0)), 1),
        Missions = u8.MissionProgress or {}
    });
    v21.SecondaryProgressionWrapper = u2.createElement("Frame", v30, v31);
    v19.MatchSummaryProgressionContainer = u2.createElement("Frame", v20, v21);

    return u2.createFragment({
        MatchSummaryProgressionWrapper = u2.createElement("Frame", v18, v19)
    });
end);

return {
    MatchEndProgressWrapper = MatchEndProgressWrapper,
    MatchEndProgress = u4
};
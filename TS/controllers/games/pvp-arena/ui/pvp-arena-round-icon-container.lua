-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local PvPArenaConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-config").PvPArenaConfig;
local PvPArenaStageType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-types").PvPArenaStageType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PvPArenaRoundIcon = RuntimeLib.import(script, script.Parent, "pvp-arena-round-icon").PvPArenaRoundIcon;

return {
    PvPArenaRoundIconContainer = v3.new(u2)(function(u4, p5) -- Line: 15
        -- upvalues: PvPArenaConfig (copy), u2 (copy), PvPArenaRoundIcon (copy), TooltipContainer (copy), AutoSizedText (copy), PvPArenaStageType (copy), BedwarsImageId (copy), Theme (copy), Empty (copy), ColorUtil (copy)
        local useEffect = p5.useEffect;
        local v6, u7 = p5.useState("");
        useEffect(function() -- Line: 19
            -- upvalues: u7 (copy), PvPArenaConfig (ref), u4 (copy)
            u7(PvPArenaConfig.getIconType(PvPArenaConfig.getStageType(u4.stageNumber)));
        end, { u4.stageNumber });
        local v8 = {};
        local FrameProps = u4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v8[i] = v;
            end;
        end;

        local v9 = {};
        local v10 = #v9;
        local v11 = {
            iconImage = v6,
            ImageTransparency = u4.ImageTransparency,
            ImageColor3 = u4.ImageColor3,
            Position = UDim2.fromScale(0.5, 0.5)
        };
        local FrameProps2 = u4.FrameProps;

        if FrameProps2 ~= nil then
            FrameProps2 = FrameProps2.ZIndex;
        end;

        v11.ZIndex = FrameProps2;
        v9[v10 + 1] = u2.createElement(PvPArenaRoundIcon, v11);
        local v12 = PvPArenaConfig.isIntermissionStage(u4.stageNumber) and u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                RichText = true,
                Text = PvPArenaConfig.getStageType(u4.stageNumber) == PvPArenaStageType.INTERMISSON and "<u>Intermission</u>\nPurchase items from the shop with your gold." or "<u>Relic Selection</u>\nSelect your relic to become stronger.\nPurchase items from the shop with your gold.",
                TextXAlignment = Enum.TextXAlignment.Left
            }) });

        if v12 then
            v9[v10 + 2] = v12;
        end;

        local v13 = #v9;
        local v14 = not PvPArenaConfig.isIntermissionStage(u4.stageNumber);

        if v14 then
            local v15 = {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1)
            };
            local FrameProps3 = u4.FrameProps;

            if FrameProps3 ~= nil then
                FrameProps3 = FrameProps3.ZIndex;
            end;

            v15.ZIndex = FrameProps3;
            local v16 = PvPArenaConfig.isRewardRound(u4.roundNumber);

            if v16 then
                local v17 = {
                    Size = UDim2.fromScale(0.8, 0.8),
                    Position = UDim2.fromScale(1, 1),
                    AnchorPoint = Vector2.new(0.75, 0.75)
                };
                local FrameProps4 = u4.FrameProps;

                if FrameProps4 ~= nil then
                    FrameProps4 = FrameProps4.ZIndex;
                end;

                v17.ZIndex = FrameProps4;
                local v18 = {};
                local v19 = #v18;
                local v20 = {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = BedwarsImageId.STAR_SOLID,
                    ImageColor3 = Theme.mcGold
                };
                local FrameProps5 = u4.FrameProps;

                if FrameProps5 ~= nil then
                    FrameProps5 = FrameProps5.ZIndex;
                end;

                v20.ZIndex = FrameProps5;
                v18[v19 + 1] = u2.createElement("ImageLabel", v20, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) });
                local v21 = {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.75, 0.75),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = BedwarsImageId.STAR_SOLID,
                    ImageColor3 = Theme.mcYellow
                };
                local FrameProps6 = u4.FrameProps;

                if FrameProps6 ~= nil then
                    FrameProps6 = FrameProps6.ZIndex;
                end;

                v21.ZIndex = FrameProps6;
                v18[v19 + 2] = u2.createElement("ImageLabel", v21, { u2.createElement("UIAspectRatioConstraint", {
                        AspectRatio = 1
                    }) });
                v16 = u2.createElement(Empty, v17, v18);
            end;

            local v22 = { u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                        RichText = true,
                        Text = "<u>Round: " .. tostring(u4.roundNumber) .. "</u>\n" .. (not PvPArenaConfig.isRewardRound(u4.roundNumber) and "" or "<b>Winning Team:</b>\n\t<font color=\"" .. ColorUtil.richTextColor(Theme.mcGreen) .. "\">+" .. tostring(PvPArenaConfig.ROUND_TEAM_HEAL_AMOUNT) .. "</font> Team Health\n\t<font color=\"" .. ColorUtil.richTextColor(Theme.mcGreen) .. "\">+1</font> Reroll\n") .. "<b>Losing Team:</b> <font color=\"" .. ColorUtil.richTextColor(Theme.mcRed) .. "\">-" .. tostring(PvPArenaConfig.getTeamDamage(u4.roundNumber)) .. "</font> Team Health",
                        TextXAlignment = Enum.TextXAlignment.Left
                    }) }) };
            local v23 = #v22;

            if v16 then
                v22[v23 + 1] = v16;
            end;

            v14 = u2.createElement(Empty, v15, v22);
        end;

        if v14 then
            v9[v13 + 1] = v14;
        end;

        return u2.createElement(Empty, v8, v9);
    end)
};
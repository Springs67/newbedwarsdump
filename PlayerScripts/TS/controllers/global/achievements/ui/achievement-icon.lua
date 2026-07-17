-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local AchievementRank = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-rank").AchievementRank;
local AchievementUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil;

return {
    AchievementIcon = v3.new(u2)(function(u4, p5) -- Line: 12
        -- upvalues: u2 (copy), AchievementUtil (copy), AchievementRank (copy), ColorUtil (copy), Empty (copy), AutoSizedText (copy), TooltipContainer (copy)
        local _ = p5.useState;

        if not u4.Id then
            return u2.createFragment();
        end;

        local v6 = AchievementUtil.getMeta(u4.Id);

        if not v6 then
            return u2.createFragment();
        end;

        local v7 = AchievementUtil.getRankMeta(v6.rank or AchievementRank.COMMON);
        local v8 = AchievementUtil.getTierGroup(u4.Id);
        local v9;

        if v8 == nil then
            v9 = v8;
        else
            local function _(p10) -- Line: 25
                -- upvalues: u4 (copy)
                return p10 == u4.Id;
            end;

            v9 = -1;

            for i, v in v8 do
                local _ = i - 1;

                if v == u4.Id == true then
                    v9 = i - 1;
                    break;
                end;
            end;
        end;

        if v9 == 0 then
            v7 = AchievementUtil.getRankMeta(AchievementRank.RARE);
        else
            local v11;

            if v8 == nil then
                v11 = v8;
            else
                local function _(p12) -- Line: 44
                    -- upvalues: u4 (copy)
                    return p12 == u4.Id;
                end;

                v11 = -1;

                for i, v in v8 do
                    local _ = i - 1;

                    if v == u4.Id == true then
                        v11 = i - 1;
                        break;
                    end;
                end;
            end;

            if v11 == 1 then
                v7 = AchievementUtil.getRankMeta(AchievementRank.EPIC);
            else
                if v8 ~= nil then
                    local function _(p13) -- Line: 63
                        -- upvalues: u4 (copy)
                        return p13 == u4.Id;
                    end;

                    v8 = -1;

                    for i, v in v8 do
                        local _ = i - 1;

                        if v == u4.Id == true then
                            v8 = i - 1;
                            break;
                        end;
                    end;
                end;

                if v8 == 2 then
                    v7 = AchievementUtil.getRankMeta(AchievementRank.LEGENDARY);
                end;
            end;
        end;

        local icon = v6.icon;

        if icon ~= nil then
            icon = icon.image;
        end;

        if icon == nil then
            icon = AchievementUtil.DEFAULT_ICON;
        end;

        local v14;

        if v6.icon then
            v14 = v6.icon;

            if v14 ~= nil then
                v14 = v14.full;
            end;
        else
            v14 = true;
        end;

        local frame = v7.frame;
        local background = v7.background;
        local v15 = {
            Size = UDim2.fromScale(1, 1)
        };
        local FrameProps = u4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v15[i] = v;
            end;
        end;

        local v16;

        if v14 then
            local v17 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Image = icon,
                ScaleType = Enum.ScaleType.Fit,
                ImageColor3 = ColorUtil.BLACK,
                Visible = u4.Darkened
            };
            local FrameProps2 = u4.FrameProps;

            if FrameProps2 ~= nil then
                FrameProps2 = FrameProps2.ZIndex;
            end;

            v17.ZIndex = FrameProps2 == nil and 3 or FrameProps2;
            v16 = u2.createFragment({
                AchievementIconDark = u2.createElement("ImageLabel", v17)
            });
        else
            v16 = v14;
        end;

        local v18 = { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) };
        local v19 = #v18;

        if v16 then
            v18[v19 + 1] = v16;
        end;

        local v20 = #v18;
        local v21;

        if v14 then
            local v22 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Image = icon,
                ImageTransparency = u4.Darkened and 0.5 or 0,
                ScaleType = Enum.ScaleType.Fit
            };
            local FrameProps2 = u4.FrameProps;

            if FrameProps2 ~= nil then
                FrameProps2 = FrameProps2.ZIndex;
            end;

            v22.ZIndex = (FrameProps2 == nil and 0 or FrameProps2) + 2;
            v21 = u2.createFragment({
                AchievementIconImage = u2.createElement("ImageLabel", v22)
            });
        else
            v21 = v14;
        end;

        if v21 then
            v18[v20 + 1] = v21;
        end;

        local v23 = #v18;
        local v24 = not v14;

        if v24 then
            local v25 = {
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            };
            local v26 = {};
            local _ = #v26;
            local v27 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Image = icon,
                ImageTransparency = u4.Darkened and 0.5 or 0,
                ScaleType = Enum.ScaleType.Fit
            };
            local FrameProps2 = u4.FrameProps;

            if FrameProps2 ~= nil then
                FrameProps2 = FrameProps2.ZIndex;
            end;

            v27.ZIndex = (FrameProps2 == nil and 0 or FrameProps2) + (u4.Darkened and 4 or 3);
            v26.AchievementIconSymbol = u2.createElement("ImageLabel", v27);
            local v28 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Image = icon,
                ImageColor3 = ColorUtil.BLACK,
                ScaleType = Enum.ScaleType.Fit,
                Visible = u4.Darkened
            };
            local FrameProps3 = u4.FrameProps;

            if FrameProps3 ~= nil then
                FrameProps3 = FrameProps3.ZIndex;
            end;

            v28.ZIndex = (FrameProps3 == nil and 0 or FrameProps3) + 3;
            v26.AchievementIconSymbolDark = u2.createElement("ImageLabel", v28);
            local v29 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Image = frame,
                ImageTransparency = u4.Darkened and 0.5 or 0,
                ScaleType = Enum.ScaleType.Fit
            };
            local FrameProps4 = u4.FrameProps;

            if FrameProps4 ~= nil then
                FrameProps4 = FrameProps4.ZIndex;
            end;

            v29.ZIndex = (FrameProps4 == nil and 0 or FrameProps4) + (u4.Darkened and 3 or 2);
            v26.AchievementIconFrame = u2.createElement("ImageLabel", v29);
            local v30 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Image = frame,
                ImageColor3 = ColorUtil.BLACK,
                ScaleType = Enum.ScaleType.Fit,
                Visible = u4.Darkened
            };
            local FrameProps5 = u4.FrameProps;

            if FrameProps5 ~= nil then
                FrameProps5 = FrameProps5.ZIndex;
            end;

            v30.ZIndex = (FrameProps5 == nil and 0 or FrameProps5) + 2;
            v26.AchievementIconFrameDark = u2.createElement("ImageLabel", v30);
            local v31 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Image = background,
                ImageTransparency = u4.Darkened and 0.5 or 0,
                ScaleType = Enum.ScaleType.Fit
            };
            local FrameProps6 = u4.FrameProps;

            if FrameProps6 ~= nil then
                FrameProps6 = FrameProps6.ZIndex;
            end;

            v31.ZIndex = (FrameProps6 == nil and 0 or FrameProps6) + 2;
            v26.AchievementIconBackground = u2.createElement("ImageLabel", v31);
            local v32 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Image = background,
                ImageColor3 = ColorUtil.BLACK,
                ScaleType = Enum.ScaleType.Fit,
                Visible = u4.Darkened
            };
            local FrameProps7 = u4.FrameProps;

            if FrameProps7 ~= nil then
                FrameProps7 = FrameProps7.ZIndex;
            end;

            v32.ZIndex = (FrameProps7 == nil and 0 or FrameProps7) + 1;
            v26.AchievementIconBackgroundDark = u2.createElement("ImageLabel", v32);
            v24 = u2.createElement(Empty, v25, v26);
        end;

        if v24 then
            v18[v23 + 1] = v24;
        end;

        local v33 = #v18;
        local v34 = {
            Size = UDim2.fromScale(1, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5) + UDim2.fromOffset(10, 15)
        };

        if v14 then
            frame = icon;
        end;

        v34.Image = frame;
        v34.BackgroundTransparency = 1;
        v34.ScaleType = Enum.ScaleType.Fit;
        v34.ImageColor3 = ColorUtil.BLACK;
        v34.ImageTransparency = 0.6;
        local FrameProps2 = u4.FrameProps;

        if FrameProps2 ~= nil then
            FrameProps2 = FrameProps2.ZIndex;
        end;

        v34.ZIndex = (FrameProps2 == nil and 0 or FrameProps2) + 1;
        v34.Visible = not u4.Simple;
        v18.AchievementIconShadow = u2.createElement("ImageLabel", v34);
        local ShowTooltip = u4.ShowTooltip;

        if ShowTooltip then
            local v35 = {};
            local v36 = #v35;
            local v37 = {};
            local v38;

            if v6 == nil then
                v38 = v6;
            else
                v38 = v6.title;
            end;

            v37.Text = v38;
            v37.Font = Enum.Font.SourceSansBold;
            v37.TextSize = 16;
            v37.Limits = Vector2.new(300, 60);
            v35[v36 + 1] = u2.createElement(AutoSizedText, v37);
            local v39 = {};

            if v6 ~= nil then
                local v40;

                if v6 == nil then
                    v40 = v6;
                else
                    v40 = v6.goal;

                    if v40 ~= nil then
                        v40 = v40.value;
                    end;
                end;

                v6 = v6.description(v40);
            end;

            v39.Text = v6;
            v39.Font = Enum.Font.SourceSans;
            v39.TextColor3 = Color3.fromRGB(191, 191, 191);
            v39.TextSize = 14;
            v39.TextXAlignment = Enum.TextXAlignment.Left;
            v39.Limits = Vector2.new(300, 60);
            v35[v36 + 2] = u2.createElement(AutoSizedText, v39);
            ShowTooltip = u2.createElement(TooltipContainer, {}, v35);
        end;

        if ShowTooltip then
            v18[v33 + 1] = ShowTooltip;
        end;

        return u2.createFragment({
            AchievementIcon = u2.createElement(Empty, v15, v18)
        });
    end)
};
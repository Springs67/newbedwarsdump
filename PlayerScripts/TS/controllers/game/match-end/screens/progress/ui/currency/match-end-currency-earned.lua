-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedCoinConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "bed-coin", "bed-coin-constants").BedCoinConstants;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    MatchEndCurrencyEarned = v2.new(u1)(function(p3, p4) -- Line: 8
        -- upvalues: BedwarsImageId (copy), BedCoinConstants (copy), u1 (copy), ColorUtil (copy)
        local _ = p4.useState;
        local _ = p4.useEffect;
        local v5 = {};
        local BedCoinsEarned = p3.BedCoinsEarned;

        if BedCoinsEarned then
            table.insert(v5, {
                hasCap = true,
                icon = BedwarsImageId.BED_COIN_ICON,
                earned = BedCoinsEarned.matchAmountEarned,
                capProgress = BedCoinsEarned.dailyAmountEarned,
                capMax = BedCoinConstants.DAILY_CURRENCY_CAP,
                reachedTotalCap = BedCoinsEarned.reachedTotalCap
            });
        end;

        local ClanContributionEarned = p3.ClanContributionEarned;

        if ClanContributionEarned ~= 0 and (ClanContributionEarned == ClanContributionEarned and ClanContributionEarned) then
            table.insert(v5, {
                icon = BedwarsImageId.CLAN_CP_COIN,
                earned = ClanContributionEarned
            });
        end;

        local v6 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1
        };
        local FrameProps = p3.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v6[i] = v;
            end;
        end;

        local function v14(p7) -- Line: 44
            -- upvalues: u1 (ref), ColorUtil (ref)
            local v8 = {
                BackgroundTransparency = 1,
                LayoutOrder = 0,
                Size = UDim2.fromScale(1, 1)
            };
            local v9 = { u1.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 3.5
                }), u1.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new((1 / 0), 50)
                }), u1.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.3, 0.9),
                    AnchorPoint = Vector2.new(0, 0.5),
                    Position = UDim2.fromScale(0, 0.5),
                    ScaleType = Enum.ScaleType.Fit,
                    Image = p7.icon
                }) };
            local v10 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(0.68, 1),
                AnchorPoint = Vector2.new(1, 0),
                Position = UDim2.fromScale(1, 0)
            };
            local v11 = { u1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), u1.createElement("TextLabel", {
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    LayoutOrder = 0,
                    Size = UDim2.fromScale(1, 0.6),
                    Text = "+" .. tostring(p7.earned),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = ColorUtil.WHITE
                }) };
            local v12 = #v11;
            local v13 = p7.hasCap and u1.createElement("TextLabel", {
                TextTransparency = 0.5,
                TextScaled = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.4),
                Text = p7.reachedTotalCap and "MAX" or "(" .. tostring(p7.capProgress) .. "/" .. tostring(p7.capMax) .. ")",
                TextXAlignment = Enum.TextXAlignment.Left,
                FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            });

            if v13 then
                v11[v12 + 1] = v13;
            end;

            v9[#v9 + 1] = u1.createElement("Frame", v10, v11);

            return u1.createElement("Frame", v8, v9);
        end;

        local v15 = table.create(#v5);

        for i, v in v5 do
            v15[i] = v14(v, i - 1, v5);
        end;

        local v16 = { u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                Padding = UDim.new(0.02, 0),
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v17 = #v16;

        for i, v in v15 do
            v16[v17 + i] = v;
        end;

        return u1.createElement("Frame", v6, v16);
    end)
};
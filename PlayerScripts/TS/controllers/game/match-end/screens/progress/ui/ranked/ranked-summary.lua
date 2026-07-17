-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local RankMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;

return {
    RankedSummary = v3.new(u2)(function(p4, p5) -- Line: 9
        -- upvalues: RankMeta (copy), ColorUtil (copy), u2 (copy), DeviceUtil (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;
        local v6 = RankMeta[p4.RankChangeData.newDivision.division];
        local WHITE = ColorUtil.WHITE;

        if p4.RankChangeData.rpDelta > 0 then
            WHITE = ColorUtil.hexColor(10419264);
        elseif p4.RankChangeData.rpDelta < 0 then
            WHITE = ColorUtil.hexColor(16737380);
        end;

        local v7 = p4.RankChangeData.oldDivision.division < p4.RankChangeData.newDivision.division;
        local v8 = p4.RankChangeData.oldDivision.division > p4.RankChangeData.newDivision.division;
        local v9 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1)
        };
        local v10 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0)
            }) };
        local v11 = #v10;

        if v7 or v8 then
            v8 = u2.createFragment({
                RankDivision = u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    RichText = true,
                    LayoutOrder = 0,
                    Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 0.12 or 0.09),
                    Text = v7 and "PROMOTION" or "DEMOTION",
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = WHITE
                })
            });
        end;

        if v8 then
            v10[v11 + 1] = v8;
        end;

        local _ = #v10;
        v10.RankIcon = u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 0.5 or 0.45),
            ScaleType = Enum.ScaleType.Fit,
            Image = v6.image
        });
        v10.RankDivision = u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            RichText = true,
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 0.2 or 0.14),
            Text = "<font color=\"" .. ColorUtil.richTextColor(WHITE) .. "\">" .. (p4.RankChangeData.rpDelta >= 0 and "+" or "") .. tostring(p4.RankChangeData.rpDelta) .. "</font> LP",
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        });
        v10.RankTitle = u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextTransparency = 0.3,
            TextScaled = true,
            LayoutOrder = 4,
            Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 0.1 or 0.08),
            Text = v6.name,
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        });

        return u2.createElement("Frame", v9, v10);
    end)
};
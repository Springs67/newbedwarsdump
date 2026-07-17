-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local NumberCounter = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "number-counter").NumberCounter;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    LobbyHudCurrency = v3.new(u2)(function(p4, p5) -- Line: 15
        -- upvalues: DeviceUtil (copy), BedwarsImageId (copy), Theme (copy), ColorUtil (copy), u2 (copy), TooltipContainer (copy), AutoSizedText (copy), Padding (copy), NumberCounter (copy), Empty (copy)
        local _ = p5.useState;
        local v6;

        if DeviceUtil.isSmallScreen() then
            v6 = UDim2.fromOffset(170, 25);
        else
            v6 = UDim2.fromOffset(170, 30);
        end;

        local v7 = UDim.new(0.05, 0);
        local v8 = UDim2.fromScale(0.2, 0.8);
        local v9 = UDim2.fromScale(0.7, 0.7);
        local BED_COIN_ICON = BedwarsImageId.BED_COIN_ICON;
        local v10 = Color3.fromRGB(76, 78, 132);
        local backgroundPrimary = Theme.backgroundPrimary;
        local v11 = {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Size = v6,
            BackgroundColor3 = ColorUtil.WHITE
        };
        local FrameProps = p4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v11[i] = v;
            end;
        end;

        local v12 = { u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                    Text = "Bed Coins",
                    TextSize = 16,
                    Font = Enum.Font.SourceSansBold,
                    Limits = Vector2.new(300, 60)
                }) }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }), u2.createElement("UIGradient", {
                Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v10), ColorSequenceKeypoint.new(1, backgroundPrimary) })
            }) };
        local v13 = #v12;
        local v14 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1)
        };
        local v15 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = v7
            }), u2.createElement(Padding, {
                Padding = UDim.new(0.03, 0)
            }), u2.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Image = BED_COIN_ICON,
                Size = v8,
                ScaleType = Enum.ScaleType.Fit
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) }) };
        local _ = #v15;
        local v16 = {};
        local BedCoins = p4.BedCoins;
        v16.Value = BedCoins == nil and 0 or BedCoins;
        local v17 = {};
        local BedCoins2 = p4.BedCoins;
        v17.Text = tostring(BedCoins2 == nil and 0 or BedCoins2);
        v17.Size = v9;
        v17.TextColor3 = ColorUtil.WHITE;
        v17.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
        v17.TextScaled = true;
        v17.BackgroundTransparency = 1;
        v17.TextXAlignment = Enum.TextXAlignment.Left;
        v16.TextLabelProps = v17;
        v15.CurrencyAmount = u2.createElement(NumberCounter, v16);
        v12.Container = u2.createElement(Empty, v14, v15);
        local v18 = p4[u2.Children];

        if v18 then
            for i, v in v18 do
                if type(i) == "number" then
                    v12[v13 + i] = v;
                else
                    v12[i] = v;
                end;
            end;
        end;

        return u2.createFragment({
            LobbyHudCurrency = u2.createElement("Frame", v11, v12)
        });
    end)
};
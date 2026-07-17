-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local TooltipContainer = v1.TooltipContainer;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    LobbyHudLargeButton = v3.new(u2)(function(u4, p5) -- Line: 15
        -- upvalues: Theme (copy), DeviceUtil (copy), ColorUtil (copy), u2 (copy), SoundManager (copy), GameSound (copy), TooltipContainer (copy), AutoSizedText (copy), Padding (copy), Empty (copy)
        local _ = p5.useState;
        local FrameProps = u4.FrameProps;

        if FrameProps ~= nil then
            FrameProps = FrameProps.BackgroundColor3;
        end;

        if FrameProps == nil then
            FrameProps = Theme.backgroundPrimary;
        end;

        local v6;

        if DeviceUtil.isSmallScreen() then
            v6 = UDim2.fromOffset(70, 70);
        else
            v6 = UDim2.fromOffset(80, 80);
        end;

        local Vertical = Enum.FillDirection.Vertical;
        local v7 = UDim.new(0.1, 0);
        local Center = Enum.HorizontalAlignment.Center;
        local v8 = UDim2.fromScale(0.8, 0.5);
        local v9 = UDim2.fromScale(1, 0.2);
        local v10 = {
            BorderSizePixel = 0,
            Size = v6,
            BackgroundColor3 = ColorUtil.WHITE,
            Image = u4.BackgroundImage,
            ScaleType = Enum.ScaleType.Crop,
            BackgroundTransparency = u4.RemoveBackgroundColoring and 1 or 0
        };
        local FrameProps2 = u4.FrameProps;

        if FrameProps2 then
            for i, v in FrameProps2 do
                v10[i] = v;
            end;
        end;

        v10[u2.Event.Activated] = function() -- Line: 47
            -- upvalues: SoundManager (ref), GameSound (ref), u4 (copy)
            SoundManager:playSound(GameSound.UI_CLICK_2);
            u4.OnClick();
        end;

        local v11 = { u2.createElement(TooltipContainer, {}, { u2.createElement(AutoSizedText, {
                    TextSize = 16,
                    Text = u4.Text,
                    Font = Enum.Font.SourceSansBold,
                    Limits = Vector2.new(300, 60)
                }) }), u2.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }) };
        local v12 = #v11;
        local v13 = not u4.RemoveBackgroundColoring and u2.createElement("UIGradient", {
            Rotation = 90,
            Color = u4.BackgroundGradient or ColorSequence.new(FrameProps, Color3.fromRGB(76, 78, 132))
        });

        if v13 then
            v11[v12 + 1] = v13;
        end;

        local v14 = #v11;
        local v15 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1)
        };
        local v16 = { u2.createElement("UIListLayout", {
                VerticalAlignment = "Center",
                FillDirection = Vertical,
                HorizontalAlignment = Center,
                Padding = v7
            }) };
        local v17 = #v16;
        local v18 = {
            SizeConstraint = "RelativeYY",
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = u4.Icon,
            Size = v8
        };
        local IconProps = u4.IconProps;

        if IconProps then
            for i, v in IconProps do
                v18[i] = v;
            end;
        end;

        v16[v17 + 1] = u2.createElement("ImageLabel", v18, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        local v19 = {
            RichText = true,
            Font = "GothamBold",
            BackgroundTransparency = 1,
            Text = "<b>" .. string.upper(u4.Text) .. "</b>",
            Size = v9,
            TextColor3 = ColorUtil.WHITE,
            TextSize = DeviceUtil.isSmallScreen() and 18 or 24
        };
        local TextLabelProps = u4.TextLabelProps;

        if TextLabelProps then
            for i, v in TextLabelProps do
                v19[i] = v;
            end;
        end;

        v16[v17 + 2] = u2.createElement("TextLabel", v19);
        local v20 = {};
        local ButtonPadding = u4.ButtonPadding;
        v20.Padding = UDim.new(0, ButtonPadding == nil and 8 or ButtonPadding);
        v16[v17 + 3] = u2.createElement(Padding, v20);
        v11.Container = u2.createElement(Empty, v15, v16);
        local v21 = u4[u2.Children];

        if v21 then
            for i, v in v21 do
                if type(i) == "number" then
                    v11[v14 + i] = v;
                else
                    v11[i] = v;
                end;
            end;
        end;

        return u2.createFragment({
            ["LobbyHudSideButton_" .. u4.Text] = u2.createElement("ImageButton", v10, v11)
        });
    end)
};
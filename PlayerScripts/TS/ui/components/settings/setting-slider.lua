-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local SliderComponent = v1.SliderComponent;
local StringUtil = v1.StringUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    SettingSlider = v3.new(u2)(function(u4, p5) -- Line: 10
        -- upvalues: Theme (copy), u2 (copy), StringUtil (copy), ColorUtil (copy), SliderComponent (copy)
        local v6, u7 = p5.useState(u4.Value);
        local v8 = {
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Theme.backgroundTertiary
        };
        local FrameProps = u4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v8[i] = v;
            end;
        end;

        local v9 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Center",
                Padding = UDim.new(0.05, 0)
            }) };
        local v10 = #v9;
        local v11 = {
            Size = UDim2.fromScale(0.2, 1)
        };
        local v12 = string.split(tostring(u4.StepSize), ".")[2];
        local v13 = v12 ~= nil and #v12 or v12;
        v11.Text = StringUtil.roundNumber(v6, v13 == nil and 0 or v13);
        v11.BackgroundTransparency = 1;
        v11.TextColor3 = ColorUtil.WHITE;
        v11.TextXAlignment = "Left";
        v11.TextScaled = true;
        v11.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
        v9[v10 + 1] = u2.createElement("TextLabel", v11, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = 18
            }) });
        v9[v10 + 2] = u2.createElement(SliderComponent, {
            Size = UDim2.fromScale(0.5, 0.3),

            OnChange = function(p14) -- Line: 58, Name: OnChange
                -- upvalues: u7 (copy)
                u7(p14);
            end,

            OnInputEnd = function(p15) -- Line: 61, Name: OnInputEnd
                -- upvalues: u4 (copy)
                u4.SetValue(p15);
            end,

            InitialValue = u4.Value,
            ThemeColor = u4.ThemeColor or Theme.textPrimary,
            BarColor = Theme.backgroundSecondary,
            StepSize = u4.StepSize,
            Max = u4.Max,
            Min = u4.Min
        });

        return u2.createElement("Frame", v8, v9);
    end)
};
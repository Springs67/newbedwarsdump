-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Checkbox = v1.Checkbox;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local SectionDivider = RuntimeLib.import(script, script.Parent, "section-divider").SectionDivider;

return {
    SectionTitle = v3.new(u2)(function(p4, p5) -- Line: 10
        -- upvalues: u2 (copy), Theme (copy), Checkbox (copy), Empty (copy), SectionDivider (copy)
        local v6 = {
            AutomaticSize = "Y",
            Size = UDim2.new(1, 0, 0, 0)
        };
        local v7 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 4)
            }) };
        local v8 = #v7;
        local v9 = {
            Size = UDim2.new(1, 0, 0, 18)
        };
        local v10 = { u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextSize = 18,
                BorderSizePixel = 0,
                Text = p4.title,
                TextColor3 = Theme.textPrimary,
                TextXAlignment = Enum.TextXAlignment.Left,
                AutomaticSize = Enum.AutomaticSize.Y,
                Size = UDim2.fromScale(1, 1),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            }) };
        local v11 = #v10;
        local v12 = p4.Checkbox and u2.createElement(Checkbox, {
            AspectRatio = 8.333333333333334,
            Text = "<b>" .. p4.Checkbox.Text .. "</b>",
            Value = p4.Checkbox.Value,
            SetValue = p4.Checkbox.SetValue,
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(1, 0),
            Size = UDim2.new(0, 140, 1, 0),
            BoxColor = Theme.backgroundSecondary
        });

        if v12 then
            v10[v11 + 1] = v12;
        end;

        v7[v8 + 1] = u2.createElement(Empty, v9, v10);
        local v13 = p4.SectionDivider and u2.createElement(SectionDivider);

        if v13 then
            v7[v8 + 2] = v13;
        end;

        return u2.createElement(Empty, v6, v7);
    end)
};
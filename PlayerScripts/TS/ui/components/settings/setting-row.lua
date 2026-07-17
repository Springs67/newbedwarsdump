-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    SettingRow = v3.new(u2)(function(p4, p5) -- Line: 9
        -- upvalues: u2 (copy), Theme (copy), ColorUtil (copy), Empty (copy)
        local _ = p5.useState;
        local v6 = {
            Size = UDim2.new(1, 0, 0, 50)
        };
        local FrameProps = p4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v6[i] = v;
            end;
        end;

        local v7 = { u2.createElement(
                "UIListLayout",
                {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder"
                }
            ) };
        local v8 = #v7;
        local v9 = {
            Size = p4.LeftSize or UDim2.fromScale(0.6, 1),
            BackgroundColor3 = p4.ThemeColor or Theme.backgroundSecondary
        };
        local FrameProps2 = p4.FrameProps;

        if FrameProps2 ~= nil then
            FrameProps2 = FrameProps2.BackgroundTransparency;
        end;

        v9.BackgroundTransparency = FrameProps2;
        v9.BorderSizePixel = 0;
        v9.LayoutOrder = 1;
        local v10 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center"
            }), u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.2, 0),
                PaddingBottom = UDim.new(0.2, 0),
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0)
            }) };
        local v11 = {
            Font = "Roboto",
            Size = UDim2.fromScale(1, 1),
            TextColor3 = ColorUtil.WHITE
        };
        local Hint = p4.Hint;
        v11.Text = "<b>" .. p4.Name .. "</b>" .. ((Hint == "" or not Hint) and "" or "  <font transparency=\'.4\'><i>" .. p4.Hint .. "</i></font>");
        v11.TextXAlignment = "Left";
        v11.TextScaled = true;
        v11.RichText = true;
        v11.BackgroundTransparency = 1;
        v10[#v10 + 1] = u2.createElement("TextLabel", v11, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = 18
            }) });
        v7[v8 + 1] = u2.createElement("Frame", v9, v10);
        local v12 = {
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            Size = p4.RightSize or UDim2.fromScale(0.4, 1)
        };
        local v13 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = p4.ListLayoutPadding
            }) };
        local v14 = #v13;
        local v15 = p4[u2.Children];

        if v15 then
            for i, v in v15 do
                if type(i) == "number" then
                    v13[v14 + i] = v;
                else
                    v13[i] = v;
                end;
            end;
        end;

        v7[v8 + 2] = u2.createElement("Frame", v12, v13);

        return u2.createElement(Empty, v6, v7);
    end)
};
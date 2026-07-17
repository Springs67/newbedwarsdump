-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    HostPanelSetting = v3.new(u2)(function(p4, p5) -- Line: 9
        -- upvalues: u2 (copy), Theme (copy), ColorUtil (copy), Empty (copy)
        local _ = p5.useState;
        local v6 = {};

        for i, v in p4 do
            v6[i] = v;
        end;

        v6.Name = nil;
        v6.Hint = nil;
        v6.LeftSize = nil;
        v6.RightSize = nil;
        v6[u2.Children] = nil;
        local v7 = {
            Size = UDim2.new(1, 0, 0, 50)
        };

        for i, v in v6 do
            v7[i] = v;
        end;

        local v8 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                SortOrder = "LayoutOrder"
            }) };
        local v9 = #v8;
        local v10 = {
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Size = p4.LeftSize or UDim2.fromScale(0.6, 1),
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local v11 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center"
            }), u2.createElement("UIPadding", {
                PaddingTop = UDim.new(0.2, 0),
                PaddingBottom = UDim.new(0.2, 0),
                PaddingLeft = UDim.new(0.05, 0),
                PaddingRight = UDim.new(0.05, 0)
            }) };
        local v12 = {
            Font = "Roboto",
            Size = UDim2.fromScale(1, 1),
            TextColor3 = ColorUtil.WHITE
        };
        local Hint = p4.Hint;
        v12.Text = "<b>" .. p4.Name .. "</b>" .. ((Hint == "" or not Hint) and "" or "  <font transparency=\'.4\'><i>" .. p4.Hint .. "</i></font>");
        v12.TextXAlignment = "Left";
        v12.TextScaled = true;
        v12.RichText = true;
        v12.BackgroundTransparency = 1;
        v11[#v11 + 1] = u2.createElement("TextLabel", v12, { u2.createElement("UITextSizeConstraint", {
                MaxTextSize = 18
            }) });
        v8[v9 + 1] = u2.createElement("Frame", v10, v11);
        local v13 = {
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            Size = p4.RightSize or UDim2.fromScale(0.4, 1)
        };
        local v14 = { u2.createElement(
                "UIListLayout",
                {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder"
                }
            ) };
        local v15 = #v14;
        local v16 = p4[u2.Children];

        if v16 then
            for i, v in v16 do
                if type(i) == "number" then
                    v14[v15 + i] = v;
                else
                    v14[i] = v;
                end;
            end;
        end;

        v8[v9 + 2] = u2.createElement("Frame", v13, v14);

        return u2.createElement(Empty, v7, v8);
    end)
};
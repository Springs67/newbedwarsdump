-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    SettingsSection = v2.new(u1)(function(p3, p4) -- Line: 7
        -- upvalues: u1 (copy), Theme (copy), Empty (copy)
        local _ = p4.useState;
        local v5 = {
            AutomaticSize = "Y",
            Size = UDim2.fromScale(1, 0)
        };
        local FrameProps = p3.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v5[i] = v;
            end;
        end;

        local v6 = { u1.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 2)
            }), u1.createElement("TextLabel", {
                AutomaticSize = "Y",
                SizeConstraint = "RelativeXX",
                TextScaled = true,
                TextXAlignment = "Left",
                TextYAlignment = "Center",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0),
                Text = p3.Title,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextColor3 = Theme.textPrimary
            }, { u1.createElement("UITextSizeConstraint", {
                    MaxTextSize = 20
                }) }) };
        local v7 = #v6;
        local v8 = p3[u1.Children];

        if v8 then
            for i, v in v8 do
                if type(i) == "number" then
                    v6[v7 + i] = v;
                else
                    v6[i] = v;
                end;
            end;
        end;

        return u1.createElement(Empty, v5, v6);
    end)
};
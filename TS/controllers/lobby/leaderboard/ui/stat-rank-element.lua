-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    StatRankElement = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(p2, p3) -- Line: 6
        -- upvalues: u1 (copy), Empty (copy)
        local _ = p3.useState;
        local v4 = {
            Size = UDim2.fromScale(0, 1),
            AutomaticSize = Enum.AutomaticSize.X,
            LayoutOrder = p2.LayoutOrder
        };
        local v5 = { u1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 6)
            }) };
        local v6 = #v5;
        local v7;

        if p2.StatRank.image == nil then
            v7 = false;
        else
            v7 = u1.createElement("ImageLabel", {
                ScaleType = "Fit",
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 24, 0, 24),
                Image = p2.StatRank.image
            });
        end;

        if v7 then
            v5[v6 + 1] = v7;
        end;

        v5[#v5 + 1] = u1.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextSize = 14,
            LayoutOrder = 1,
            Text = p2.StatRank.rankName,
            AutomaticSize = Enum.AutomaticSize.XY,
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
            TextXAlignment = Enum.TextXAlignment.Right,
            TextColor3 = Color3.fromRGB(255, 255, 255)
        });

        return u1.createElement(Empty, v4, v5);
    end)
};
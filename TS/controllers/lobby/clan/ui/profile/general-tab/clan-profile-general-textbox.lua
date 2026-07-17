-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    ClanProfileGeneralTextBox = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p3, p4) -- Line: 8
        -- upvalues: u2 (copy), Empty (copy), ColorUtil (copy)
        local _ = p4.useState;
        local v5 = {};

        for i, v in p3 do
            v5[i] = v;
        end;

        v5.Title = nil;
        v5.Text = nil;
        v5.BorderBottom = nil;
        v5[u2.Children] = nil;
        local v6 = {};

        for i, v in v5 do
            v6[i] = v;
        end;

        local v7 = { u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 1)
            }, {
                u2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0.05, 0),
                    PaddingRight = UDim.new(0.05, 0),
                    PaddingBottom = UDim.new(0.1, 0),
                    PaddingTop = UDim.new(0.1, 0)
                }),
                u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.05, 0)
                }),
                u2.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    SizeConstraint = "RelativeXX",
                    Font = "Roboto",
                    TextXAlignment = "Left",
                    TextYAlignment = "Top",
                    TextScaled = true,
                    RichText = true,
                    BackgroundTransparency = 1,
                    LayoutOrder = 2,
                    Size = UDim2.fromScale(1, 0),
                    TextColor3 = ColorUtil.WHITE,
                    Text = "<b>" .. p3.Title .. "</b>"
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 18
                    }) }),
                u2.createElement("TextLabel", {
                    Font = "Roboto",
                    TextXAlignment = "Left",
                    TextYAlignment = "Top",
                    TextScaled = true,
                    RichText = true,
                    TextTransparency = 0.3,
                    BackgroundTransparency = 1,
                    LayoutOrder = 3,
                    Size = UDim2.fromScale(1, 0.9),
                    TextColor3 = ColorUtil.WHITE,
                    Text = p3.Text
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 18
                    }) })
            }) };
        local v8 = #v7;
        local v9 = p3.BorderBottom and u2.createElement("Frame", {
            BackgroundTransparency = 0.8,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0, 1),
            Position = UDim2.fromScale(0, 1),
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = ColorUtil.WHITE
        });

        if v9 then
            v7[v8 + 1] = v9;
        end;

        return u2.createElement("Frame", v6, v7);
    end)
};
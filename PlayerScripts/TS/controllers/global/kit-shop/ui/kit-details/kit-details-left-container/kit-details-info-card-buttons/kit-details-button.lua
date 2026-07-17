-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local ProgressBar = v1.ProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    KitDetailsButton = v3.new(u2)(function(p4, p5) -- Line: 10
        -- upvalues: u2 (copy), ColorUtil (copy), Empty (copy), ProgressBar (copy), Theme (copy)
        local _ = p5.useState;
        local v6 = {};

        for i, v in p4 do
            v6[i] = v;
        end;

        v6.Title = nil;
        v6.Subtitle = nil;
        v6.OnClick = nil;
        v6.Progress = nil;
        v6[u2.Children] = nil;
        local v7 = {};

        for i, v in v6 do
            v7[i] = v;
        end;

        local v8 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 3)
            }) };
        local v9 = #v8;
        local v10 = {
            Size = UDim2.fromScale(1, 0.5),
            BackgroundColor3 = p4.ButtonColor3 or Color3.fromRGB(45, 45, 45),
            Text = "",
            [u2.Event.MouseButton1Click] = p4.OnClick
        };
        local v11 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 4)
            }), u2.createElement("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = ColorUtil.WHITE
            }, { u2.createElement("UIGradient", {
                    Rotation = -90,
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 0.9) })
                }), u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                }) }), u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 1)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder
                }),
                u2.createElement("UIPadding", {
                    PaddingRight = UDim.new(0.15, 0),
                    PaddingLeft = UDim.new(0.15, 0)
                }),
                u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    TextTransparency = 0.5,
                    Size = UDim2.fromScale(1, 0.5),
                    Text = p4.Title,
                    TextColor3 = ColorUtil.WHITE,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center
                }),
                u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    TextScaled = true,
                    Size = UDim2.fromScale(1, 0.5),
                    Text = p4.Subtitle,
                    TextColor3 = ColorUtil.WHITE,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center
                })
            }) };
        local v12 = #v11;
        local v13 = p4[u2.Children];

        if v13 then
            for i, v in v13 do
                if type(i) == "number" then
                    v11[v12 + i] = v;
                else
                    v11[i] = v;
                end;
            end;
        end;

        v8[v9 + 1] = u2.createElement("TextButton", v10, v11);
        local v14;

        if p4.Progress == nil then
            v14 = u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 0.1)
            });
        else
            v14 = u2.createElement(ProgressBar, {
                BarBackgroundTransparency = 0,
                Size = UDim2.fromScale(1, 0.1),
                Progress = p4.Progress,
                BarCornerRadius = UDim.new(1, 0),
                BarColor = Theme.mcGreen,
                BarBackgroundColor = Color3.fromRGB(45, 45, 45)
            }, { u2.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = ColorUtil.WHITE
                }, { u2.createElement("UIGradient", {
                        Rotation = -90,
                        Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 1), NumberSequenceKeypoint.new(1, 0.9) })
                    }), u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }) }) });
        end;

        v8[v9 + 2] = v14;

        return u2.createElement(Empty, v7, v8);
    end)
};
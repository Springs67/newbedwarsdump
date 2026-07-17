-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    TagPillList = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(p3, p4) -- Line: 9
        -- upvalues: u2 (copy), ColorUtil (copy), Padding (copy), Empty (copy)
        local _ = p4.useState;
        local v5 = {
            LayoutOrder = 3,
            BackgroundTransparency = 0,
            Size = UDim2.fromScale(1, 0.275)
        };
        local FrameProps = p3.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v5[i] = v;
            end;
        end;

        local Tags = p3.Tags;

        local function v7(p6) -- Line: 23
            -- upvalues: u2 (ref), ColorUtil (ref), Padding (ref)
            return u2.createFragment({
                TagPill = u2.createElement("Frame", {
                    AutomaticSize = "X",
                    BackgroundTransparency = 0.3,
                    Size = UDim2.fromScale(0, 1),
                    BackgroundColor3 = ColorUtil.BLACK
                }, {
                    u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0.5, 0)
                    }),
                    u2.createElement(Padding, {
                        Padding = {
                            Vertical = 3,
                            Horizontal = 6
                        }
                    }),
                    Tag = u2.createElement("TextLabel", {
                        AutomaticSize = "X",
                        TextSize = 7,
                        RichText = true,
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(0, 1),
                        Text = string.upper(p6),
                        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        TextColor3 = ColorUtil.WHITE
                    })
                })
            });
        end;

        local v8 = table.create(#Tags);

        for i, v in Tags do
            v8[i] = v7(v, i - 1, Tags);
        end;

        local v9 = { u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Left",
                VerticalAlignment = "Center",
                Padding = UDim.new(0.005, 0)
            }) };
        local v10 = #v9;

        for i, v in v8 do
            v9[v10 + i] = v;
        end;

        return u2.createFragment({
            Tags = u2.createElement(Empty, v5, v9)
        });
    end)
};
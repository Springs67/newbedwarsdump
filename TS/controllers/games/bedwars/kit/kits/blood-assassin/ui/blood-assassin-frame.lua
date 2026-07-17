-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    BloodAssassinFrame = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(p2, p3) -- Line: 6
        -- upvalues: u1 (copy), ColorUtil (copy)
        local _ = p3.useState;
        local v4 = {
            AutoButtonColor = false,
            Active = true,
            Modal = true,
            Size = p2.Size,
            Position = p2.Position,
            AnchorPoint = p2.AnchorPoint
        };
        local v5 = { u1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 4)
            }), u1.createElement("UIGradient", {
                Rotation = 25,
                Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 0.25), NumberSequenceKeypoint.new(1, 0.7) }),
                Color = ColorSequence.new(ColorUtil.hexColor(1910065))
            }), u1.createElement("Frame", {
                BackgroundTransparency = 0.7,
                Size = UDim2.new(1, 0, 0, p2.HeaderSizePixels),
                BackgroundColor3 = ColorUtil.BLACK
            }, { u1.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }), u1.createElement("TextLabel", {
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Text = p2.Title,
                    Size = UDim2.fromScale(1, 0.65),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    TextColor3 = ColorUtil.hexColor(16729156),
                    Font = Enum.Font.ArialBold
                }) }) };
        local v6 = {
            Image = "rbxassetid://12504906446",
            BackgroundTransparency = 1,
            ImageTransparency = 0.9,
            Size = UDim2.new(1, 0, 1, -p2.HeaderSizePixels),
            Position = UDim2.fromOffset(0, p2.HeaderSizePixels)
        };
        local v7 = { u1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }) };
        local v8 = #v7;
        local v9 = p2[u1.Children];

        if v9 then
            for i, v in v9 do
                if type(i) == "number" then
                    v7[v8 + i] = v;
                else
                    v7[i] = v;
                end;
            end;
        end;

        v5[#v5 + 1] = u1.createElement("ImageLabel", v6, v7);

        return u1.createElement("ImageButton", v4, v5);
    end)
};
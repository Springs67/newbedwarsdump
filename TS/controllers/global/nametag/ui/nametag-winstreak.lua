-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    NameTagWinStreak = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(p2, p3) -- Line: 5
        -- upvalues: u1 (copy)
        local _ = p3.useState;
        local v4 = {};

        for i, v in p2 do
            v4[i] = v;
        end;

        v4.WinStreak = nil;
        local v5 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Visible = true,
            LayoutOrder = 3
        };

        for i, v in v4 do
            v5[i] = v;
        end;

        return u1.createFragment({
            WinStreakCounter = u1.createElement("Frame", v5, {
                WinStreakFire = u1.createElement("ImageLabel", {
                    Image = "rbxassetid://7101948108",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = 1,
                    Size = UDim2.fromScale(1, 1),
                    SizeConstraint = Enum.SizeConstraint.RelativeYY,
                    ScaleType = Enum.ScaleType.Fit
                }),
                WinStreakValue = u1.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    LayoutOrder = 2,
                    TextStrokeTransparency = 0.5,
                    AutoLocalize = false,
                    Text = tostring(p2.WinStreak),
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.fromScale(0.5, 0.375),
                    Size = UDim2.fromScale(0.8, 0.9),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                    TextXAlignment = Enum.TextXAlignment.Center
                })
            })
        });
    end)
};
-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    RageBladeWinCount = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(p2) -- Line: 5
        -- upvalues: u1 (copy)
        return u1.createFragment({
            RageBladeEmoteGui = u1.createElement("BillboardGui", {
                StudsOffsetWorldSpace = Vector3.new(1.5, 0.4, 0),
                Size = UDim2.fromScale(6, 3),
                Adornee = p2.Adornee
            }, {
                WinCount = u1.createElement("TextLabel", {
                    TextXAlignment = "Center",
                    TextYAlignment = "Center",
                    TextStrokeTransparency = 0,
                    RichText = true,
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Text = "🔥" .. tostring(p2.WinCount),
                    Font = Enum.Font.Roboto,
                    Size = UDim2.fromScale(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                    TextColor3 = Color3.fromRGB(237, 82, 26)
                })
            })
        });
    end)
};
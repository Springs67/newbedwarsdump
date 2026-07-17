-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    LoreReaderToolbar = v2.new(u1)(function(p3, p4) -- Line: 7
        -- upvalues: u1 (copy), ColorUtil (copy), BedwarsImageId (copy)
        local _ = p4.useState;

        return u1.createElement("Frame", {
            BorderSizePixel = 0,
            Size = p3.Size,
            BackgroundColor3 = ColorUtil.hexColor(3092550)
        }, {
            GoBackIcon = u1.createElement("ImageButton", {
                Size = UDim2.fromScale(0.75, 0.75),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.new(0, 15, 0.5, 0),
                Image = BedwarsImageId.ARROW_LEFT,
                SizeConstraint = Enum.SizeConstraint.RelativeYY,
                ScaleType = Enum.ScaleType.Fit,
                ImageTransparency = 0.2,
                BackgroundTransparency = 1,
                [u1.Event.Activated] = p3.OnBack
            })
        });
    end)
};
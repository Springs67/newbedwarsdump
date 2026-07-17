-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    PvPArenaRoundIcon = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(p2, p3) -- Line: 6
        -- upvalues: ColorUtil (copy), u1 (copy)
        local _ = p3.useState;
        local v4 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Position = p2.Position,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = p2.iconImage
        };
        local v5;

        if p2.ImageColor3 then
            v5 = p2.ImageColor3;
        else
            v5 = ColorUtil.WHITE;
        end;

        v4.ImageColor3 = v5;
        local ImageTransparency = p2.ImageTransparency;
        v4.ImageTransparency = (ImageTransparency == 0 or (ImageTransparency ~= ImageTransparency or not ImageTransparency)) and 0 or p2.ImageTransparency;
        v4.ZIndex = p2.ZIndex;

        return u1.createElement("ImageLabel", v4);
    end)
};
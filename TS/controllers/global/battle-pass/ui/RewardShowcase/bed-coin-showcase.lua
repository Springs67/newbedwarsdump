-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    BedCoinShowcase = v2.new(u1)(function(p3, p4) -- Line: 7
        -- upvalues: BedwarsImageId (copy), u1 (copy), ColorUtil (copy)
        local _ = p4.useEffect;
        local v5 = {
            ScaleType = "Fit",
            BackgroundTransparency = 1,
            Image = BedwarsImageId.BED_COIN_ICON,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = p3.Size or UDim2.fromScale(1, 1),
            ImageTransparency = p3.Transparency,
            LayoutOrder = p3.LayoutOrder,
            ZIndex = p3.ZIndex
        };
        local v6 = {};
        local v7 = #v6;
        local v8 = p3.showText and u1.createFragment({
            BedCoinAmount = u1.createElement("TextLabel", {
                TextScaled = true,
                BackgroundTransparency = 1,
                TextStrokeTransparency = 0.7,
                Text = tostring(p3.amount),
                AnchorPoint = Vector2.new(1, 1),
                Position = UDim2.fromScale(1, 1),
                Size = UDim2.fromScale(1, 0.25),
                Font = Enum.Font.LuckiestGuy,
                TextColor3 = ColorUtil.WHITE,
                TextTransparency = p3.Transparency,
                ZIndex = p3.ZIndex
            })
        });

        if v8 then
            v6[v7 + 1] = v8;
        end;

        return u1.createFragment({
            RewardShowcase = u1.createElement("ImageLabel", v5, v6)
        });
    end)
};
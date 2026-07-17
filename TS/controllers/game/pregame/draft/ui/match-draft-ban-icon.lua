-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta;

return {
    MatchDraftBanIcon = v3.new(u2)(function(p4) -- Line: 9
        -- upvalues: u2 (copy), Empty (copy), BedwarsKitMeta (copy), ColorUtil (copy)
        local v5 = {};

        for i, v in p4 do
            v5[i] = v;
        end;

        v5.Kit = nil;
        v5.imageLabelRef = nil;

        if not p4.Kit then
            return u2.createFragment();
        end;

        local v6 = {};

        for i, v in v5 do
            v6[i] = v;
        end;

        return u2.createElement(Empty, v6, {
            u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }),
            u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 5),
                PaddingRight = UDim.new(0, 5)
            }),
            KitImage = u2.createElement("ImageLabel", {
                Image = BedwarsKitMeta[p4.Kit].renderImage,
                BorderSizePixel = 0,
                ScaleType = Enum.ScaleType.Fit,
                BackgroundTransparency = 1,
                BackgroundColor3 = ColorUtil.BLACK,
                ImageTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                SizeConstraint = Enum.SizeConstraint.RelativeXY,
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.fromScale(0.5, -1),
                [u2.Ref] = p4.imageLabelRef
            }, { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }), u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.1, 0)
                }) })
        });
    end)
};
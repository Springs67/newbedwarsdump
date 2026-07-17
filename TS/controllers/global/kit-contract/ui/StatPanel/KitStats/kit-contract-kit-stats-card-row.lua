-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    KitContractKitStatsCardRow = v2.new(u1)(function(p3, p4) -- Line: 7
        -- upvalues: u1 (copy), BedwarsImageId (copy), ColorUtil (copy)
        local _ = p4.useState;
        local v5 = {};

        for i, v in p3 do
            v5[i] = v;
        end;

        v5.StatTitle = nil;
        v5.StatValue = nil;
        v5.BackgroundColor3 = nil;
        v5.BackgroundTransparency = nil;
        v5.StatImage = nil;
        local v6 = {};

        for i, v in v5 do
            v6[i] = v;
        end;

        v6.BackgroundColor3 = p3.BackgroundColor3 or Color3.fromRGB(34, 34, 34);
        local BackgroundTransparency = p3.BackgroundTransparency;
        v6.BackgroundTransparency = BackgroundTransparency == nil and 0.6 or BackgroundTransparency;
        local v7 = { u1.createElement("UICorner", {
                CornerRadius = UDim.new(0, 4)
            }), u1.createElement("UIPadding", {
                PaddingRight = UDim.new(0.04, 0),
                PaddingLeft = UDim.new(0.04, 0),
                PaddingTop = UDim.new(0.1, 0),
                PaddingBottom = UDim.new(0.1, 0)
            }) };
        local v8 = #v7;
        local v9 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.075, 0.9),
            Position = UDim2.fromScale(0, 0.5),
            AnchorPoint = Vector2.new(0, 0.5)
        };
        local StatImage = p3.StatImage;

        if StatImage == nil then
            StatImage = BedwarsImageId.STAR_SOLID;
        end;

        v9.Image = StatImage;
        v7[v8 + 1] = u1.createElement("ImageLabel", v9, { u1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
        v7[v8 + 2] = u1.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            LayoutOrder = 0,
            Size = UDim2.fromScale(0.6625, 0.8),
            Position = UDim2.fromScale(0.075, 0.5),
            AnchorPoint = Vector2.new(0, 0.5),
            Text = "  " .. p3.StatTitle,
            TextColor3 = ColorUtil.darken(ColorUtil.WHITE, 0.75),
            FontFace = Font.fromName("Roboto"),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Center
        });
        v7[v8 + 3] = u1.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            LayoutOrder = 0,
            Size = UDim2.fromScale(0.2625, 0.9),
            Position = UDim2.fromScale(1, 0.5),
            AnchorPoint = Vector2.new(1, 0.5),
            Text = p3.StatValue,
            TextColor3 = ColorUtil.WHITE,
            FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
            TextXAlignment = Enum.TextXAlignment.Right,
            TextYAlignment = Enum.TextYAlignment.Center
        });

        return u1.createElement("Frame", v6, v7);
    end)
};
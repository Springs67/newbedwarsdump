-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    IngredientBox = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(p2, p3) -- Line: 6
        -- upvalues: u1 (copy), ColorUtil (copy)
        local _ = p3.useState;
        local v4 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.3, 1)
        };
        local v5 = { u1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }), u1.createElement("UIStroke", {
                Thickness = 2,
                Color = ColorUtil.WHITE
            }), u1.createElement("UICorner", {
                CornerRadius = UDim.new(0.1, 0)
            }) };
        local v6 = #v5;
        local v7;

        if p2.Image == nil then
            v7 = false;
        else
            v7 = u1.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Image = p2.Image,
                Size = UDim2.fromScale(0.8, 0.8)
            });
        end;

        if v7 then
            v5[v6 + 1] = v7;
        end;

        local v8 = #v5;
        local v9;

        if p2.Amount == nil then
            v9 = false;
        else
            v9 = u1.createElement("TextLabel", {
                SizeConstraint = "RelativeYY",
                TextXAlignment = "Right",
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.2),
                AnchorPoint = Vector2.new(1, 1),
                Position = UDim2.fromScale(0.9, 0.95),
                Text = "<b>" .. tostring(p2.Amount) .. "</b>",
                TextColor3 = ColorUtil.WHITE
            });
        end;

        if v9 then
            v5[v8 + 1] = v9;
        end;

        return u1.createFragment({
            IngredientBox = u1.createElement("Frame", v4, v5)
        });
    end)
};
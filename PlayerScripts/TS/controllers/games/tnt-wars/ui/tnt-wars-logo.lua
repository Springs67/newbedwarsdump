-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local TNT_WARS_IMAGE_ID = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "tnt-wars-constants").TNT_WARS_IMAGE_ID;
local v2 = u1.Component:extend("TNTWarsLogo");

function v2.init(p3) -- Line: 8
end;

function v2.render(p4) -- Line: 10
    -- upvalues: u1 (copy), TNT_WARS_IMAGE_ID (copy)
    return u1.createFragment({ u1.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = TNT_WARS_IMAGE_ID.LOGO,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, -0.27),
            SizeConstraint = Enum.SizeConstraint.RelativeXX,
            Size = UDim2.fromScale(0.1, 0.1)
        }), u1.createElement("TextLabel", {
            Text = "WARS!",
            TextScaled = true,
            RichText = true,
            BackgroundTransparency = 1,
            Rotation = -21,
            TextStrokeTransparency = 0,
            ZIndex = 4,
            Position = UDim2.fromScale(0.535, -0.205),
            Size = UDim2.fromScale(0.1, 0.1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Font = Enum.Font.Arcade,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        }) });
end;

return {
    TNTWarsLogo = v2
};
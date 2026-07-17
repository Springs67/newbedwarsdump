-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ImageId = v1.ImageId;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    CloseButton = v3.new(u2)(function(u4, p5) -- Line: 9
        -- upvalues: u2 (copy), SoundManager (copy), GameSound (copy), ImageId (copy)
        local _ = p5.useState;
        local v6 = {
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),

            [u2.Event.Activated] = function() -- Line: 14
                -- upvalues: u4 (copy), SoundManager (ref), GameSound (ref)
                u4.OnClick();
                SoundManager:playSound(GameSound.UI_CLOSE_2);
            end
        };
        local ButtonProps = u4.ButtonProps;

        if ButtonProps then
            for i, v in ButtonProps do
                v6[i] = v;
            end;
        end;

        local v7 = {};
        local v8 = #v7;
        local v9 = not u4.DisableAspectRatio and u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1.853658536585366
        });

        if v9 then
            v7[v8 + 1] = v9;
        end;

        local v10 = #v7;
        v7[v10 + 1] = u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 4)
        });
        v7[v10 + 2] = u2.createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 123, 123)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 86, 86)) })
        });
        v7[v10 + 3] = u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0.75),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = ImageId.X,
            ImageColor3 = Color3.fromRGB(52, 52, 52)
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });

        return u2.createElement("ImageButton", v6, v7);
    end)
};
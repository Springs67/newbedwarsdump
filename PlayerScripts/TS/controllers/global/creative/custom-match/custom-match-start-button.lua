-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    CustomMatchStartButton = v3.new(u2)(function(p4, p5) -- Line: 13
        -- upvalues: u2 (copy), Empty (copy), Button (copy), ColorUtil (copy), Theme (copy), SoundManager (copy), GameSound (copy), default (copy)
        local u6, u7 = p5.useState(false);
        local createElement = u2.createElement;
        local v8 = {
            Size = UDim2.fromScale(1, 1),
            LayoutOrder = p4.LayoutOrder
        };
        local v9 = {};
        local v10 = u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 4,
            DominantAxis = "Height"
        });
        local createElement2 = u2.createElement;
        local v11 = {
            Text = "<b>START MATCH</b>",
            Size = UDim2.fromScale(1, 1)
        };
        local v12;

        if u6 then
            v12 = ColorUtil.brighten(Theme.Gray, 0.5);
        else
            v12 = Theme.backgroundSuccess;
        end;

        v11.BackgroundColor3 = v12;

        function v11.OnClick() -- Line: 28
            -- upvalues: u6 (copy), u7 (copy), SoundManager (ref), GameSound (ref), default (ref), Theme (ref)
            if u6 then
                SoundManager:playSound(Theme.sound.uiDisabled);

                return;
            end;

            u7(true);
            SoundManager:playSound(GameSound.UI_CLICK);
            default.Client:GetNamespace("CustomMatches"):Get("StartGame"):CallServerAsync():andThen(function(p13) -- Line: 33
            end);
        end;

        v9[1], v9[2] = v10, createElement2(Button, v11);

        return createElement(Empty, v8, v9);
    end)
};
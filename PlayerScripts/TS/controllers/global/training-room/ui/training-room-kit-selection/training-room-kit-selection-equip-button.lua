-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    TrainingRoomKitSelectionEquipButton = v3.new(u2)(function(u4, p5) -- Line: 9
        -- upvalues: u2 (copy), Empty (copy), Button (copy), Theme (copy)
        local _ = p5.useState;

        return u2.createElement(Empty, {
            Size = u4.Size or UDim2.fromScale(1, 1)
        }, { u2.createElement(Button, {
                Text = "<b>ENTER TRAINING!</b>",
                Selectable = false,
                LayoutOrder = 3,
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = Theme.backgroundSuccess,

                OnClick = function() -- Line: 11
                    -- upvalues: u4 (copy)
                    u4.EquipKit();
                end,

                TextLabel = {
                    Size = UDim2.fromScale(0, 0.5),
                    AutomaticSize = Enum.AutomaticSize.X
                }
            }) });
    end)
};
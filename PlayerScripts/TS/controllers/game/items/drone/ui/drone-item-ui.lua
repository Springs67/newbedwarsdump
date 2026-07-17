-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ActionButton = v1.ActionButton;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    DroneItemUi = v3.new(u2)(function(u4, p5) -- Line: 10
        -- upvalues: u2 (copy), Theme (copy), UIUtil (copy), ActionButton (copy), default (copy)
        local _ = p5.useState;

        return u2.createFragment({ u2.createElement("TextLabel", {
                BackgroundTransparency = 1,
                TextScaled = true,
                AnchorPoint = Vector2.new(0.5, 1),
                LayoutOrder = Theme.abilityActionBarPriority,
                Position = UIUtil:getActionBarPosition(),
                Text = tostring(u4.amount),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextStrokeColor3 = Color3.fromRGB(0, 0, 0),
                Size = Theme.actionBarButtonSize
            }), u2.createElement(ActionButton, {
                actionName = "release-item",
                text = "Release Item",
                priority = 50,

                onActivated = function() -- Line: 26, Name: onActivated
                    -- upvalues: default (ref), u4 (copy)
                    default.Client:Get("DropDroneItem"):SendToServer({
                        position = u4.drone:GetPrimaryPartCFrame().Position,
                        direction = u4.drone:GetPrimaryPartCFrame().LookVector
                    });
                end,

                interactionKey = Enum.KeyCode.X
            }) });
    end)
};
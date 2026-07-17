-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local UIUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").UIUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v3 = u2.Component:extend("UnmountDodoApp");

function v3.init(p4) -- Line: 11
    -- upvalues: u1 (copy)
    p4.maid = u1.new();
end;

function v3.render(u5) -- Line: 14
    -- upvalues: u2 (copy), Theme (copy), UIUtil (copy)
    return u2.createElement("ImageButton", {
        Size = Theme.actionBarButtonSize,
        Position = UIUtil:getActionBarPosition(),
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.6,
        BorderSizePixel = 0,

        [u2.Event.Activated] = function() -- Line: 22
            -- upvalues: u5 (copy)
            u5.props.unmountCallback();
        end
    }, { u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 4.675675675675675
        }), u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Font = "Roboto",
            RichText = true,
            TextScaled = true,
            Size = UDim2.fromScale(0.8, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Text = "<b>Dismount (" .. u5.props.interactionKey.Name .. ")</b>",
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }) });
end;

function v3.didMount(u6) -- Line: 43
    -- upvalues: UserInputService (copy)
    u6.maid:GiveTask(UserInputService.InputEnded:Connect(function(p7, p8) -- Line: 44
        -- upvalues: u6 (copy)
        if p7.KeyCode == u6.props.interactionKey and not p8 then
            u6.props.unmountCallback();
        end;
    end));
end;

function v3.willUnmount(p9) -- Line: 50
    p9.maid:DoCleaning();
end;

return {
    UnmountDodoApp = v3
};
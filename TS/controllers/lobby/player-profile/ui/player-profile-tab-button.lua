-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local DeviceUtil = v1.DeviceUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    PlayerProfileTabButton = v3.new(u2)(function(p4, p5) -- Line: 9
        -- upvalues: u2 (copy), Button (copy), DeviceUtil (copy), Theme (copy)
        local _ = p5.useState;
        local createElement = u2.createElement;
        local v6 = {
            Size = p4.Size or UDim2.fromScale(DeviceUtil.isSmallScreen() and 0.16 or 0.13, 1),
            LayoutOrder = p4.LayoutOrder,
            Text = "<b>" .. p4.Text .. "</b>",
            OnClick = p4.OnClick,
            CornerRadius = UDim.new(0, 0)
        };
        local v7;

        if p4.Tab == p4.ActiveTab then
            v7 = Theme.backgroundTertiaryCard;
        else
            v7 = Theme.backgroundTertiary;
        end;

        v6.BackgroundColor3 = v7;

        return createElement(Button, v6);
    end)
};
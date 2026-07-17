-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ProgressBar = v1.ProgressBar;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u3 = nil;

local function VoidDragonUi(p4) -- Line: 11
    -- upvalues: Players (copy), Theme (copy), u2 (copy), u3 (ref), ProgressBar (copy), ColorUtil (copy)
    local voidDragonProgress = p4.store.Kit.voidDragonProgress;
    local v5 = math.max(0.01, voidDragonProgress == nil and 0 or voidDragonProgress);
    local v6 = math.min(1, v5);
    local v7 = v6 >= 1;

    if v7 then
        local v8 = Players.LocalPlayer:GetAttribute("VoidDragon");

        if v8 == 0 or v8 ~= v8 then
            v8 = false;
        elseif v8 == "" then
            v8 = false;
        end;

        v7 = not v8;
    end;

    if not v7 then
        return u2.createElement(ProgressBar, {
            Size = Theme.actionBarProgressBarSize,
            Progress = v6,
            BarGradient = ColorSequence.new(ColorUtil.hexColor(14363435), ColorUtil.hexColor(14573407))
        });
    end;

    local v9 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 1),
        Size = Theme.actionBarButtonSize
    };
    local v10 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.05, 0)
        }) };
    local v11 = {};

    for i, v in p4 do
        v11[i] = v;
    end;

    v10[#v10 + 1] = u2.createElement(u3, v11);

    return u2.createElement("Frame", v9, v10);
end;

u3 = function(p12) -- Line: 57, Name: ActiveButton
    -- upvalues: u2 (copy), UIUtil (copy)
    local VoidDragonActive = p12.VoidDragonActive;

    return u2.createElement("ImageButton", {
        Size = UDim2.fromScale(1, 1),
        Position = UIUtil:getActionBarPosition(),
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.6,
        BorderSizePixel = 0,

        [u2.Event.Activated] = function() -- Line: 66
            -- upvalues: VoidDragonActive (copy)
            VoidDragonActive();
        end
    }, { u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 4.675675675675675
        }), u2.createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = "Transform [v]",
            Font = "Roboto",
            RichText = true,
            TextScaled = true,
            Size = UDim2.fromScale(0.8, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }) });
end;

return {
    VoidDragonUi = VoidDragonUi
};
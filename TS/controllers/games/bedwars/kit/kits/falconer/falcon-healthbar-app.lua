-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local FalconHealthbar = RuntimeLib.import(script, script.Parent, "falcon-healthbar").FalconHealthbar;
local u3 = u2.Component:extend("FalconHealthbarApp");

function u3.init(p4, p5) -- Line: 10
    -- upvalues: u1 (copy)
    p4.maid = u1.new();
end;

function u3.didMount(p6) -- Line: 13
end;

function u3.willUnmount(p7) -- Line: 15
    p7.maid:DoCleaning();
end;

function u3.render(p8) -- Line: 18
    -- upvalues: u2 (copy), DeviceUtil (copy), FalconHealthbar (copy)
    return u2.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.6, DeviceUtil.isSmallScreen() and 0.13 or 0.08),
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, DeviceUtil.isSmallScreen() and 0.95 or 0.99)
    }, { u2.createElement("UIAspectRatioConstraint", {
            AspectRatio = 9
        }), u2.createElement(FalconHealthbar, {
            instance = p8.props.instance
        }) });
end;

return {
    FalconHealthbarAppWrapper = function(p9) -- Line: 35, Name: FalconHealthbarAppWrapper
        -- upvalues: u2 (copy), u3 (ref)
        return u2.createElement("ScreenGui", {
            DisplayOrder = 9,
            ResetOnSpawn = false
        }, { u2.createElement(u3, {
                store = p9.store,
                instance = p9.instance
            }) });
    end,

    FalconHealthbarApp = u3
};
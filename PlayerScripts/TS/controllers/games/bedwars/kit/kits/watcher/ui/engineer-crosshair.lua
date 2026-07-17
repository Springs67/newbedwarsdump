-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local u2 = u1.Component:extend("EngineerCrosshair");

function u2.init(p3) -- Line: 8
end;

function u2.render(p4) -- Line: 10
    -- upvalues: u1 (copy), BedwarsImageId (copy)
    return u1.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.08, 0.08),
        Image = BedwarsImageId.TURRET_CROSSHAIR
    }, { u1.createElement("UIAspectRatioConstraint") });
end;

return {
    EngineerCrosshairWrapper = function() -- Line: 22, Name: EngineerCrosshairWrapper
        -- upvalues: u1 (copy), u2 (ref)
        return u1.createElement("ScreenGui", {
            ResetOnSpawn = false,
            IgnoreGuiInset = true
        }, { u1.createElement(u2) });
    end,

    EngineerCrosshair = u2
};
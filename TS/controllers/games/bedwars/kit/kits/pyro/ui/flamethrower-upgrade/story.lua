-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local FlamethrowerComponent = RuntimeLib.import(script, script.Parent, "flamethrower-component").FlamethrowerComponent;

return function(p2) -- Line: 5
    -- upvalues: u1 (copy), FlamethrowerComponent (copy)
    local u3 = u1.mount(u1.createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.8, 0.8)
    }, { u1.createElement("UIAspectRatioConstraint", {
            AspectRatio = 1.7735849056603774
        }), u1.createElement(FlamethrowerComponent, {
            tool = nil
        }) }), p2);

    return function() -- Line: 19
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;
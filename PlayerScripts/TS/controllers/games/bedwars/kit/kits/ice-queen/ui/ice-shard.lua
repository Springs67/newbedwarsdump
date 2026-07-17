-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local v2 = u1.Component:extend("IceShard");

function v2.init(p3) -- Line: 8
    -- upvalues: u1 (copy)
    p3.imageRef = u1.createRef();
    p3.gradientRef = u1.createRef();
end;

function v2.render(u4) -- Line: 12
    -- upvalues: u1 (copy)
    return u1.createFragment({
        [u4.props.barNumber] = u1.createElement("ImageLabel", {
            [u1.Ref] = u4.imageRef,
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Image = u4.props.shard.Image,
            ImageRectSize = u4.props.shard.ImageRectSize,
            ImageRectOffset = u4.props.shard.ImageRectOffset,
            Visible = u4.props.currentBar:map(function(p5) -- Line: 21
                -- upvalues: u4 (copy)
                return p5 - 1 >= u4.props.barNumber;
            end)
        }, { u1.createElement("UIGradient", {
                Rotation = 90,
                Color = u4.props.gradient or ColorSequence.new(Color3.fromRGB(5, 167, 226), Color3.fromRGB(84, 237, 253)),
                Offset = Vector2.new(0, 0.1)
            }) })
    });
end;

function v2.didUpdate(u6) -- Line: 33
    -- upvalues: TweenService (copy)
    if u6.props.currentBar:getValue() >= 4 then
        task.delay(0.2, function() -- Line: 35
            -- upvalues: u6 (copy), TweenService (ref)
            local v7 = u6.imageRef:getValue();
            local v8 = u6.gradientRef:getValue();

            if v7 and v8 then
                TweenService:Create(v7, TweenInfo.new(0.12), {
                    ImageTransparency = 1
                }):Play();
                TweenService:Create(v8, TweenInfo.new(0.12), {
                    ImageTransparency = 1
                }):Play();
            end;
        end);
    end;
end;

return {
    IceShard = v2
};
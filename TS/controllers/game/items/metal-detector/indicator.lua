-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local useSpring = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-flipper", "src").useSpring;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local GetTarmacAsset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset;

return {
    Indicator = v3.new(u2)(function(u4, p5) -- Line: 8
        -- upvalues: useSpring (copy), u1 (copy), GetTarmacAsset (copy), u2 (copy)
        local u6 = p5.useValue(4);
        local v7, u8 = useSpring(p5, 1);
        p5.useEffect(function() -- Line: 11
            -- upvalues: u8 (copy), u1 (ref), u6 (copy), u4 (copy)
            u8:onComplete(function() -- Line: 12
                -- upvalues: u8 (ref), u1 (ref), u6 (ref)
                if u8:getValue() == 0 then
                    u8:setGoal(u1.Spring.new(1, {
                        dampingRatio = 0.75,
                        frequency = u6.value
                    }));
                end;
            end);
            local u10 = u4.activatedSignal:Connect(function(p9) -- Line: 20
                -- upvalues: u6 (ref), u8 (ref), u1 (ref)
                u6.value = p9;
                u8:setGoal(u1.Spring.new(0, {
                    dampingRatio = 0.75,
                    frequency = p9
                }));
            end);

            return function() -- Line: 27
                -- upvalues: u10 (copy)
                u10:Disconnect();
            end;
        end);
        local v11 = GetTarmacAsset("Indicator");

        return u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.05, 0.05),
            Position = u4.position,
            Rotation = u4.rotation:map(function(p12) -- Line: 37
                return p12 + 90;
            end),
            ImageTransparency = v7,
            Image = v11.Image,
            ImageColor3 = Color3.fromRGB(255, 255, 255),
            ImageRectOffset = v11.ImageRectOffset,
            ImageRectSize = v11.ImageRectSize
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
    end)
};
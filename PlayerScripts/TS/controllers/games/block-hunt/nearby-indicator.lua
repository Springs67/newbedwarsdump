-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local useSpring = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-flipper", "src").useSpring;

return {
    NearbyIndicator = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u2)(function(u3, p4) -- Line: 7
        -- upvalues: useSpring (copy), u1 (copy), u2 (copy)
        local u5 = p4.useValue(4);
        local v6, u7 = useSpring(p4, 1);
        p4.useEffect(function() -- Line: 10
            -- upvalues: u7 (copy), u1 (ref), u5 (copy), u3 (copy)
            u7:onComplete(function() -- Line: 11
                -- upvalues: u7 (ref), u1 (ref), u5 (ref)
                if u7:getValue() == 0 then
                    u7:setGoal(u1.Spring.new(1, {
                        dampingRatio = 0.75,
                        frequency = u5.value
                    }));
                end;
            end);
            local u9 = u3.activatedSignal:Connect(function(p8) -- Line: 19
                -- upvalues: u5 (ref), u7 (ref), u1 (ref)
                u5.value = p8;
                u7:setGoal(u1.Spring.new(0, {
                    dampingRatio = 0.75,
                    frequency = p8
                }));
            end);

            return function() -- Line: 26
                -- upvalues: u9 (copy)
                u9:Disconnect();
            end;
        end);

        return u2.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://14915499193",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(1, 0.15),
            Position = UDim2.fromScale(0.5, 0.4),
            ImageTransparency = v6,
            ImageColor3 = Color3.fromRGB(56, 168, 59)
        }, { u2.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            }) });
    end)
};
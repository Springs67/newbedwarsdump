-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local VendingMachineState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-state").VendingMachineState;
local VendingMachineIdle = RuntimeLib.import(script, script.Parent, "idle", "vending-machine-idle").VendingMachineIdle;
local VendingMachineRoll = RuntimeLib.import(script, script.Parent, "roll", "vending-machine-roll").VendingMachineRoll;

return {
    VendingMachineApp = v2.new(u1)(function(p3, p4) -- Line: 8
        -- upvalues: u1 (copy), VendingMachineState (copy), VendingMachineIdle (copy), VendingMachineRoll (copy)
        local _ = p4.useState;
        local useEffect = p4.useEffect;
        local u5 = u1.createRef();
        useEffect(function() -- Line: 12
            -- upvalues: u5 (copy)
            local u6 = true;
            task.spawn(function() -- Line: 14
                -- upvalues: u6 (ref), u5 (ref)
                while u6 do
                    local u7 = u5:getValue();

                    if not u7 then
                        return nil;
                    end;

                    u7.Position = UDim2.fromScale(0.5 + math.random() * 0.05, 0.5 + math.random() * 0.05);
                    task.delay(0.01, function() -- Line: 21
                        -- upvalues: u6 (ref), u7 (copy)
                        if u6 then
                            u7.Position = UDim2.fromScale(0.5, 0.5);
                        end;
                    end);
                    task.wait(math.random(20, 150) / 100);
                end;
            end);

            return function() -- Line: 29
                -- upvalues: u6 (ref)
                u6 = false;
            end;
        end, {});
        local v8 = {
            BorderSizePixel = 0,
            ClipsDescendants = true,
            Size = UDim2.fromScale(1, 1)
        };
        local v9 = { u1.createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new(Color3.fromHex("D730F2"), Color3.fromHex("C167E3"))
            }), u1.createElement("ImageLabel", {
                [u1.Ref] = u5,
                Image = "rbxassetid://9111090691",
                Size = UDim2.fromScale(1.5, 1.5),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                ImageTransparency = 0.7,
                BackgroundTransparency = 1
            }) };
        local v10 = #v9;
        local v11;

        if p3.vendingMachineState == VendingMachineState.IDLE then
            v11 = u1.createElement(VendingMachineIdle);
        else
            v11 = false;
        end;

        if v11 then
            v9[v10 + 1] = v11;
        end;

        local v12 = #v9;
        local v13;

        if p3.vendingMachineState == VendingMachineState.ROLLING then
            v13 = u1.createElement(VendingMachineRoll, {
                choosenReward = p3.choosenReward,
                soundPosition = p3.soundPosition,
                dispenseTime = p3.dispenseTime
            });
        else
            v13 = false;
        end;

        if v13 then
            v9[v12 + 1] = v13;
        end;

        return u1.createElement("Frame", v8, v9);
    end)
};
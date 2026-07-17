-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local VendingMachineApp = RuntimeLib.import(script, script.Parent, "vending-machine-app").VendingMachineApp;

return {
    VendingMachineAppWrapper = v3.new(u2)(function(u4, p5) -- Line: 7
        -- upvalues: u1 (copy), u2 (copy), VendingMachineApp (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local v6, u7 = useState(u4.vendingMachine:GetAttribute("VendingMachineState"));
        local v8, u9 = useState(u4.vendingMachine:GetAttribute("ChoosenReward"));
        local v10, u11 = useState(u4.vendingMachine:GetAttribute("VendingMachineDispenseTime"));
        useEffect(function() -- Line: 13
            -- upvalues: u1 (ref), u4 (copy), u7 (copy), u9 (copy), u11 (copy)
            local u12 = u1.new();
            u12:GiveTask(u4.vendingMachine:GetAttributeChangedSignal("VendingMachineState"):Connect(function() -- Line: 15
                -- upvalues: u7 (ref), u4 (ref)
                u7(u4.vendingMachine:GetAttribute("VendingMachineState"));
            end));
            u12:GiveTask(u4.vendingMachine:GetAttributeChangedSignal("ChoosenReward"):Connect(function() -- Line: 18
                -- upvalues: u9 (ref), u4 (ref)
                u9(u4.vendingMachine:GetAttribute("ChoosenReward"));
            end));
            u12:GiveTask(u4.vendingMachine:GetAttributeChangedSignal("VendingMachineDispenseTime"):Connect(function() -- Line: 21
                -- upvalues: u11 (ref), u4 (ref)
                u11(u4.vendingMachine:GetAttribute("VendingMachineDispenseTime"));
            end));

            return function() -- Line: 24
                -- upvalues: u12 (copy)
                u12:DoCleaning();
            end;
        end, {});

        return u2.createElement(VendingMachineApp, {
            vendingMachineState = v6,
            choosenReward = v8,
            soundPosition = u4.vendingMachine.Position,
            dispenseTime = v10
        });
    end)
};
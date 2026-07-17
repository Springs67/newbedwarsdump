-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local VendingMachineRewardId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-reward").VendingMachineRewardId;
local VendingMachineState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "vending-machine", "vending-machine-state").VendingMachineState;
local VendingMachineApp = RuntimeLib.import(script, script.Parent, "ui", "vending-machine-app").VendingMachineApp;
local u8 = v2.new(u1)(function(p3, p4) -- Line: 10
    -- upvalues: VendingMachineState (copy), VendingMachineRewardId (copy), u1 (copy), VendingMachineApp (copy), Workspace (copy)
    local useState = p4.useState;
    local useEffect = p4.useEffect;
    local v5, _ = useState(VendingMachineState.IDLE);
    local v6, _ = useState(VendingMachineRewardId.DODO_BIRD);
    useEffect(function() -- Line: 15
        local u7 = true;

        return function() -- Line: 22
            -- upvalues: u7 (ref)
            u7 = false;
        end;
    end);

    return u1.createElement(VendingMachineApp, {
        vendingMachineState = v5,
        choosenReward = v6,
        dispenseTime = Workspace:GetServerTimeNow() + 4
    });
end);

return function(p9) -- Line: 33
    -- upvalues: u1 (copy), Empty (copy), u8 (copy)
    local u10 = u1.mount(u1.createElement(Empty, {
        Size = UDim2.fromScale(0.8, 0.8)
    }, { u1.createElement("UIAspectRatioConstraint", {
            AspectRatio = 0.7727110794442466
        }), u1.createElement(u8) }), p9);

    return function() -- Line: 42
        -- upvalues: u1 (ref), u10 (copy)
        u1.unmount(u10);
    end;
end;
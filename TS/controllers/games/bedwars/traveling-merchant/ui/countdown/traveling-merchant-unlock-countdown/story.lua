-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local TravelingMerchantUnlockCountdown = RuntimeLib.import(script, script.Parent, "traveling-merchant-unlock-countdown").TravelingMerchantUnlockCountdown;

return function(p3) -- Line: 7
    -- upvalues: u1 (copy), Workspace (copy), u2 (copy), TravelingMerchantUnlockCountdown (copy)
    local u4 = u1("MeshPart", {
        Position = Vector3.new(0, 0, 0),
        Size = Vector3.new(1, 1, 1),
        Anchored = true,
        CanCollide = false,
        CanTouch = false,
        Parent = Workspace
    });
    local u5 = u2.mount(u2.createElement(TravelingMerchantUnlockCountdown, {
        shopOpensIn = 20,
        wagonInstance = u4
    }), p3);

    return function() -- Line: 24
        -- upvalues: u2 (ref), u5 (copy), u4 (copy)
        u2.unmount(u5);
        u4:Destroy();
    end;
end;
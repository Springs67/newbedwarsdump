-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local BedHealthBarUi = RuntimeLib.import(script, script.Parent, "bed-health-bar-ui").BedHealthBarUi;

return function(p3) -- Line: 7
    -- upvalues: u1 (copy), Workspace (copy), u2 (copy), BedHealthBarUi (copy)
    local u4 = u1("Part", {
        Children = { (u1("BillboardGui", {
                StudsOffsetWorldSpace = Vector3.new(0, 3, 0),
                MaxDistance = 110,
                Size = UDim2.fromScale(10, 3)
            })) },
        Parent = Workspace
    });
    u4:SetAttribute("BedPlatingAmount", 80);
    u4:SetAttribute("BedPlatingTotal", 100);
    u4:SetAttribute("Health", 100);
    u4:SetAttribute("MaxHealth", 100);
    local u5 = u2.mount(u2.createElement(BedHealthBarUi, {
        ShieldExpireTime = 20,
        BedBlock = u4,
        PlatingExpireTime = os.time() + 300
    }), u4);

    return function() -- Line: 26
        -- upvalues: u2 (ref), u5 (copy), u4 (copy)
        u2.unmount(u5);
        u4:Destroy();
    end;
end;
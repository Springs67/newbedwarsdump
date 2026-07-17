-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local EnemyHealthbar = RuntimeLib.import(script, script.Parent, "enemy-healthbar").EnemyHealthbar;

return function(p3) -- Line: 8
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), u1 (copy), EnemyHealthbar (copy)
    local u4 = ReplicatedStorage.Assets.Misc.SkeletonChristmas:Clone();
    u4:SetPrimaryPartCFrame(CFrame.new(0, 0, 0));
    u4.Parent = Workspace;
    local u5 = u1.mount(u1.createElement("BillboardGui", {
        ExtentsOffsetWorldSpace = Vector3.new(0, 18, 0),
        MaxDistance = 200,
        Adornee = u4.PrimaryPart,
        Size = UDim2.new(0, 200, 0, 100)
    }, { u1.createElement(EnemyHealthbar, {
            health = 500,
            maxHealth = 1000
        }) }), u4.PrimaryPart);

    return function() -- Line: 23
        -- upvalues: u4 (copy), u1 (ref), u5 (copy)
        u4:Destroy();
        u1.unmount(u5);
    end;
end;
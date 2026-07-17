-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local GooseWorldIndicatorComponent = RuntimeLib.import(script, script.Parent, "goose-world-indicator-component").GooseWorldIndicatorComponent;

return function(p4) -- Line: 9
    -- upvalues: u1 (copy), ReplicatedStorage (copy), Workspace (copy), u2 (copy), GooseWorldIndicatorComponent (copy)
    local u5 = u1.new();
    local v6 = ReplicatedStorage.Assets.Misc.GoldenGoose:Clone();
    u5:GiveTask(v6);
    v6.Parent = Workspace;
    v6:PivotTo(CFrame.new(Workspace.CurrentCamera.CFrame * Vector3.new(0, 0, -10)));
    local u7 = u2.mount(u2.createElement(GooseWorldIndicatorComponent, {
        gooseHolderTeamId = nil,
        despawnTime = Workspace:GetServerTimeNow() + 60,
        billboardAdornee = v6.PrimaryPart
    }), v6.PrimaryPart);
    u5:GiveTask(function() -- Line: 23
        -- upvalues: u2 (ref), u7 (copy)
        return u2.unmount(u7);
    end);

    return function() -- Line: 26
        -- upvalues: u5 (copy)
        return u5:DoCleaning();
    end;
end;
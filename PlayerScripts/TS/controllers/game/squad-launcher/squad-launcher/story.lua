-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local SquadLauncherUI = RuntimeLib.import(script, script.Parent, "squad-launcher-ui").SquadLauncherUI;

return function(p2) -- Line: 6
    -- upvalues: u1 (copy), SquadLauncherUI (copy), Workspace (copy)
    local u3 = u1.mount(u1.createElement(SquadLauncherUI, {
        StartTime = Workspace:GetServerTimeNow(),
        EndTime = Workspace:GetServerTimeNow() + 8
    }), p2);

    return function() -- Line: 11
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;
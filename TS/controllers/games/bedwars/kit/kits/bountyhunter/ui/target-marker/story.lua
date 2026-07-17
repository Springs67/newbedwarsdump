-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local TargetMarker = RuntimeLib.import(script, script.Parent, "target-marker").TargetMarker;

return function(p2) -- Line: 7
    -- upvalues: CreateRoduxApp (copy), TargetMarker (copy), Players (copy), u1 (copy)
    local u3 = CreateRoduxApp("TargetMarker", TargetMarker, {
        player = Players.LocalPlayer or {
            UserId = 87365146
        }
    }, {}, {
        Parent = p2
    });

    return function() -- Line: 15
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;
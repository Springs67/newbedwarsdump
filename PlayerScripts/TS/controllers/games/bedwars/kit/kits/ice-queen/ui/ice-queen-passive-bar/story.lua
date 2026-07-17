-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local StarterGui = v2.StarterGui;
local Workspace = v2.Workspace;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local IceQueenPassiveBarWrapper = RuntimeLib.import(script, script.Parent, "ice-queen-passive-bar").IceQueenPassiveBarWrapper;

return function(p3) -- Line: 9
    -- upvalues: Workspace (copy), u1 (copy), CreateRoduxApp (copy), IceQueenPassiveBarWrapper (copy), StarterGui (copy)
    local Part = Instance.new("Part");
    Part.Parent = Workspace;
    local u4 = CreateRoduxApp("ice-queen-passive-bar", IceQueenPassiveBarWrapper, {
        bar = u1.createBinding(3),
        adornee = Part
    }, {}, {
        Parent = StarterGui
    });

    return function() -- Line: 19
        -- upvalues: u1 (ref), u4 (copy), Part (copy)
        u1.unmount(u4);
        Part:Destroy();
    end;
end;
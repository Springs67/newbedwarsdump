-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local FishermanMinigameApp = RuntimeLib.import(script, script.Parent, "fisherman-minigame-app").FishermanMinigameApp;

return function(p2) -- Line: 6
    -- upvalues: CreateRoduxApp (copy), FishermanMinigameApp (copy), u1 (copy)
    local u3 = CreateRoduxApp("FishermanMinigameApp", FishermanMinigameApp, {}, {}, {
        Parent = p2
    });

    return function() -- Line: 10
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;
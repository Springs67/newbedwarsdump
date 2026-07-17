-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out");
local default = v1.default;
local Logger = v1.Logger;
local SceneManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system").SceneManager;
local pirateBuildupScene = RuntimeLib.import(script, script.Parent).pirateBuildupScene;

return function(p2) -- Line: 8
    -- upvalues: default (copy), Logger (copy), SceneManager (copy), pirateBuildupScene (copy)
    default.SetLogger(Logger:configure():WriteTo(default.RobloxOutput()):Create());
    local u3 = SceneManager.new();
    u3:loadScene(pirateBuildupScene);
    local u4 = u3:begin();

    return function() -- Line: 13
        -- upvalues: u3 (copy), u4 (copy)
        u3:cleanAllState();
        u4:DoCleaning();
    end;
end;
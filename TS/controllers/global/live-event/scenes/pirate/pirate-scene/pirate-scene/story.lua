-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out");
local default = v1.default;
local Logger = v1.Logger;
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local pirateScene = RuntimeLib.import(script, script.Parent).pirateScene;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system");
local SceneManager = v2.SceneManager;
local TimeConfig = v2.TimeConfig;
local pirateBuildupScene = RuntimeLib.import(script, script.Parent.Parent, "pirate-buildup-scene").pirateBuildupScene;

return function(p3) -- Line: 12
    -- upvalues: default (copy), Logger (copy), RunService (copy), SceneManager (copy), pirateBuildupScene (copy), TimeConfig (copy), pirateScene (copy)
    default.SetLogger(Logger:configure():WriteTo(default.RobloxOutput()):Create());
    task.spawn(function() -- Line: 14
        -- upvalues: RunService (ref)
        RunService:Run();
    end);
    local v4 = DateTime.fromUnixTimestamp(DateTime.now().UnixTimestamp + 2);
    local u5 = SceneManager.new();
    pirateBuildupScene:overrideTimeConfig(TimeConfig.betweenDates({
        startDate = DateTime.now(),
        endDate = v4
    }));
    pirateScene:overrideTimeConfig(TimeConfig.startDateAndLength({
        length = 145,
        startDate = v4
    }));
    u5:loadChainedScenes(pirateBuildupScene, pirateScene);
    local u6 = u5:begin();

    return function() -- Line: 29
        -- upvalues: u5 (copy), u6 (copy), RunService (ref)
        u5:cleanAllState();
        u6:DoCleaning();
        task.spawn(function() -- Line: 32
            -- upvalues: RunService (ref)
            RunService:Stop();
        end);
    end;
end;
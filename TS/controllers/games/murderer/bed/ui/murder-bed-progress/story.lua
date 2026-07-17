-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local MurderBedState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murderer-costants").MurderBedState;
local MurderBed = RuntimeLib.import(script, script.Parent, "murder-bed-progress").MurderBed;

return function(p4) -- Line: 10
    -- upvalues: u1 (copy), ReplicatedStorage (copy), Workspace (copy), u2 (copy), MurderBed (copy), MurderBedState (copy)
    local u5 = u1.new();
    local u6 = ReplicatedStorage.Assets.Misc.Bed_Red:Clone();
    u6.Parent = Workspace;
    u5:GiveTask(function() -- Line: 14
        -- upvalues: u6 (copy)
        u6:Destroy();
    end);
    local u7 = u2.mount(u2.createElement(MurderBed, {
        BedStage = 1,
        Progress = 1,
        Adornee = u6,
        BedState = MurderBedState.IDLE
    }), p4);

    return function() -- Line: 23
        -- upvalues: u2 (ref), u7 (copy), u5 (copy)
        u2.unmount(u7);
        u5:DoCleaning();
    end;
end;
-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ResetTime = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ResetTime;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ServerStorage = v2.ServerStorage;
local Workspace = v2.Workspace;
local OneForAllUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "one-for-all", "one-for-all-util").OneForAllUtil;
local OneForAllBoard = RuntimeLib.import(script, script.Parent, "one-for-all-board").OneForAllBoard;

return function(p3) -- Line: 10
    -- upvalues: ServerStorage (copy), Workspace (copy), ResetTime (copy), OneForAllUtil (copy), u1 (copy), OneForAllBoard (copy)
    local u4 = ServerStorage.Assets.Villagers.smoke:Clone();
    u4.PrimaryPart.Anchored = true;
    u4.Name = "ONE_FOR_ALL_ADORNEE";
    u4.Parent = Workspace;
    u4:PivotTo(CFrame.new(30.913, 306.437, 469.703));
    local v5 = ResetTime.new(OneForAllUtil.getCurrTimestamp());
    local v6 = OneForAllUtil.pickRandomKit();
    local v7 = v5:getNextResetTime(OneForAllUtil.pickInterval);
    local u8 = u1.mount(u1.createElement(OneForAllBoard, {
        Adornee = u4.PrimaryPart,
        BedwarsKit = v6,
        EndTime = v7
    }), u4);

    return function() -- Line: 28
        -- upvalues: u4 (copy), u1 (ref), u8 (copy)
        u4:Destroy();
        u1.unmount(u8);
    end;
end;
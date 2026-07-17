-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local EventType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType;
local EggHunt2026EggMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "egg-hunt-types", "egg-hunt-2026-eggs").EggHunt2026EggMeta;
local EggHunt2026MilestoneMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "egg-hunt-types", "egg-hunt-2026-milestone-meta").EggHunt2026MilestoneMeta;
local Easter2026MilestoneRewardMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "egg-hunt-types", "egg-hunt-2026-milestone-reward-meta").Easter2026MilestoneRewardMeta;
local EggHuntLobbyController = RuntimeLib.import(script, script.Parent, "egg-hunt-lobby-controller").EggHuntLobbyController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "Easter2026Controller";
    end,

    __index = EggHuntLobbyController
});
u1.__index = u1;

function u1.new(...) -- Line: 20
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 24
    -- upvalues: EggHuntLobbyController (copy), EventType (copy), EggHunt2026EggMeta (copy), EggHunt2026MilestoneMeta (copy), Easter2026MilestoneRewardMeta (copy), ReplicatedStorage (copy)
    EggHuntLobbyController.constructor(p3, EventType.EGG_HUNT_2026, EggHunt2026EggMeta, EggHunt2026MilestoneMeta, Easter2026MilestoneRewardMeta, ReplicatedStorage.Assets.Misc.Easter2026.Eggs);
    p3.Name = "Easter2026Controller";
end;

function u1.KnitStart(p4) -- Line: 28
    -- upvalues: EggHuntLobbyController (copy)
    EggHuntLobbyController.KnitStart(p4);
end;

KnitClient.CreateController(u1.new());

return nil;
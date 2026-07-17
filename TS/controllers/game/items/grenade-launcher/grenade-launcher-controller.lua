-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "GrenadeLauncherController";
    end,

    __index = HandKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p4);
    p4.Name = "GrenadeLauncherController";
end;

function u2.isRelevantItem(p5, p6) -- Line: 30
    -- upvalues: ItemType (copy)
    return p6.itemType == ItemType.GRENADE_LAUNCHER;
end;

function u2.onEnable(p7, p8, p9) -- Line: 33
    -- upvalues: u1 (copy), Flamework (copy), CooldownId (copy)
    p7:setupYield(function() -- Line: 34
        -- upvalues: u1 (ref), Flamework (ref), CooldownId (ref)
        local u10 = u1.new();
        u10:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(CooldownId.GRENADE_LAUNCHER));

        return function() -- Line: 37
            -- upvalues: u10 (copy)
            u10:DoCleaning();
        end;
    end);
end;

function u2.onDisable(p11) -- Line: 42
end;

function u2.KnitStart(p12) -- Line: 44
    -- upvalues: HandKnitController (copy), KnitClient (copy), ItemType (copy), AnimationType (copy), GameSound (copy), ClientSyncEvents (copy)
    HandKnitController.KnitStart(p12);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.GRENADE_LAUNCHER, {
        animations = { AnimationType.ROCKET_LAUNCHER_IDLE, AnimationType.ROCKET_LAUNCHER_SHOT },
        sounds = { GameSound.CARROT_LAUNCHER_FIRE }
    });
    ClientSyncEvents.ProjectileLaunched:connect(function(p13) -- Line: 50
        if p13:isLocalShooter() then
            local _ = p13.projectileType == "stun_grenade";
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;
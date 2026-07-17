-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ProjectileSourceController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "OilProjectileController";
    end,

    __index = ProjectileSourceController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, ...) -- Line: 27
    -- upvalues: ProjectileSourceController (copy), u1 (copy)
    ProjectileSourceController.constructor(p4, ...);
    p4.Name = "OilProjectileController";
    p4.Client = {};
    p4.eatingMaid = u1.new();
end;

function u2.KnitStart(p5) -- Line: 33
    -- upvalues: ProjectileSourceController (copy), ClientSyncEvents (copy), SoundManager (copy), GameSound (copy)
    ProjectileSourceController.KnitStart(p5);
    ClientSyncEvents.ProjectileLaunched:connect(function(p6) -- Line: 35
        -- upvalues: SoundManager (ref), GameSound (ref)
        if p6.projectileType == "oil_projectile" then
            SoundManager:playSound(GameSound.GOO_SPIT, {
                rollOffMaxDistance = 150,
                position = p6.origin
            });
        end;
    end);
end;

function u2.isRelevantItem(p7, p8) -- Line: 44
    -- upvalues: ItemType (copy)
    return p8.itemType == ItemType.OIL_CONSUMABLE;
end;

function u2.onStartCharging(p9) -- Line: 47
    -- upvalues: SoundManager (copy), GameSound (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy)
    local GOO_EAT = GameSound.GOO_EAT;
    local v10 = {};
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:GetPrimaryPartCFrame().Position;
    end;

    v10.position = Character;
    v10.parent = Players.LocalPlayer.Character;
    v10.rollOffMaxDistance = 100;
    v10.looped = true;
    local u11 = SoundManager:playSound(GOO_EAT, v10);

    if u11 then
        p9.eatingMaid:GiveTask(function() -- Line: 62
            -- upvalues: u11 (copy)
            u11:Stop();
            u11:Destroy();
        end);
    end;

    local u12 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.OIL_EAT, {
        looped = true
    });

    if u12 then
        p9.eatingMaid:GiveTask(function() -- Line: 71
            -- upvalues: u12 (copy)
            u12:Stop();
        end);
    end;
end;

function u2.onStopCharging(p13) -- Line: 76
    p13.eatingMaid:DoCleaning();
end;

function u2.onLaunch(p14) -- Line: 79
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy)
    GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.OIL_SPIT, {
        looped = false
    });
end;

function u2.onStartReload(p15) -- Line: 84
end;

function u2.onMaxCharge(p16) -- Line: 86
end;

KnitClient.CreateController(u2.new());

return nil;
-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "TornadoLauncherController";
    end,

    __index = HandKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 24
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 28
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p4);
    p4.Name = "TornadoLauncherController";
end;

function u2.KnitStart(p5) -- Line: 32
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), Flamework (copy), CooldownId (copy), getItemMeta (copy), ItemType (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), AnimationType (copy)
    HandKnitController.KnitStart(p5);
    ClientSyncEvents.ProjectileRender:connect(function(p6) -- Line: 34
        if p6.projectile.Name == "tornado_missile" then
            p6.cframe = p6.cframe * CFrame.Angles(0, p6.totalTime * 5 * 2 * 3.141592653589793, 0);
        end;
    end);
    ClientSyncEvents.ProjectileLaunched:connect(function(p7) -- Line: 41
        -- upvalues: Flamework (ref), CooldownId (ref), getItemMeta (ref), ItemType (ref)
        if p7:isLocalShooter() and p7.projectileType == "tornado_missile" then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.TORNADO_LAUNCHER, getItemMeta(ItemType.TORNADO_LAUNCHER).projectileSource.fireDelaySec);
        end;
    end);
    ClientSyncEvents.ProjectileLaunched:connect(function(p8) -- Line: 46
        -- upvalues: SoundManager (ref), GameSound (ref)
        if p8.projectileType == "tornado_missile" then
            local v9 = SoundManager:createSound(GameSound.TORNADO_LOOP);

            if not v9 then
                return nil;
            end;

            v9.Looped = true;
            v9.Parent = p8.projectile.PrimaryPart;
            v9:Play();
        end;
    end);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.TORNADO_LAUNCHER, {
        animations = { AnimationType.TORNADO_LAUNCHER_SHOOT, AnimationType.TORNADO_LAUNCHER_HOLD },
        sounds = { GameSound.TORNADO_LAUNCHER_SHOOT, GameSound.TORNADO_LOOP }
    });
end;

function u2.isRelevantItem(p10, p11) -- Line: 62
    -- upvalues: ItemType (copy)
    return p11.itemType == ItemType.TORNADO_LAUNCHER;
end;

function u2.onEnable(p12, p13, p14) -- Line: 65
    -- upvalues: u1 (copy), Flamework (copy), CooldownId (copy)
    p12:setupYield(function() -- Line: 66
        -- upvalues: u1 (ref), Flamework (ref), CooldownId (ref)
        local u15 = u1.new();
        u15:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(CooldownId.TORNADO_LAUNCHER));

        return function() -- Line: 69
            -- upvalues: u15 (copy)
            u15:DoCleaning();
        end;
    end);
end;

function u2.onDisable(p16) -- Line: 74
end;

KnitClient.CreateController(u2.new());

return nil;
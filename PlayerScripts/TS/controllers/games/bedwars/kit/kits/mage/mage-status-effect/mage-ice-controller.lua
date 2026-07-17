-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "MageIceController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 23
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "MageIceController";
end;

function u1.KnitStart(u4) -- Line: 31
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), EntityUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy)
    KnitController.KnitStart(u4);
    ClientSyncEvents.ProjectileHit:connect(function(p5) -- Line: 33
        -- upvalues: EntityUtil (ref), StatusEffectUtil (ref), StatusEffectType (ref), u4 (copy)
        if p5:isCancelled() then
            return nil;
        end;

        if p5.projectileType ~= "mage_spell_ice" then
            return nil;
        end;

        if p5.shooter == nil then
            return nil;
        end;

        local v6 = p5.shooter:getInstance();

        if not v6 then
            return nil;
        end;

        local v7 = EntityUtil:getPlayerFromEntityInstance(v6);

        if not v7 then
            return nil;
        end;

        local hitEntity = p5.hitEntity;

        if hitEntity ~= nil then
            hitEntity = hitEntity:getInstance();
        end;

        if not hitEntity then
            return nil;
        end;

        if StatusEffectUtil:isActive(v6, StatusEffectType.MAGE_ICE_ELEMENT) then
            u4:playIceExplosionEffect(v7, p5.hitData.hitCFrame.Position);
        end;
    end);
end;

function u1.playIceExplosionEffect(p8, p9, p10) -- Line: 64
    -- upvalues: ReplicatedStorage (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy)
    local u11 = ReplicatedStorage.Assets.Effects.SnowBlast:Clone();
    u11.Transparency = 1;
    u11:PivotTo(CFrame.new(p10));
    EffectUtil:playEffects(u11:GetChildren(), nil, {});
    task.delay(1.5, function() -- Line: 69
        -- upvalues: u11 (copy)
        u11:Destroy();
    end);
    SoundManager:playSound(GameSound.WINTER_BOSS_ICICLE_IMPACT, {
        position = p10
    });
end;

KnitClient.CreateController(u1.new());

return nil;
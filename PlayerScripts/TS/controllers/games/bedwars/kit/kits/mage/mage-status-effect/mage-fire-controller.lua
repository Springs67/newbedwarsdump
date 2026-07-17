-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "MageFireController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 28
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 32
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p5);
    p5.Name = "MageFireController";
    p5.maid = u1.new();
end;

function u3.KnitStart(u6) -- Line: 37
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), EntityUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy)
    KnitController.KnitStart(u6);
    ClientSyncEvents.ProjectileHit:connect(function(p7) -- Line: 39
        -- upvalues: EntityUtil (ref), StatusEffectUtil (ref), StatusEffectType (ref), u6 (copy)
        if p7:isCancelled() then
            return nil;
        end;

        if p7.projectileType ~= "mage_spell_fire" then
            return nil;
        end;

        if p7.shooter == nil then
            return nil;
        end;

        local v8 = p7.shooter:getInstance();

        if not v8 then
            return nil;
        end;

        local v9 = EntityUtil:getPlayerFromEntityInstance(v8);

        if not v9 then
            return nil;
        end;

        local hitEntity = p7.hitEntity;

        if hitEntity ~= nil then
            hitEntity = hitEntity:getInstance();
        end;

        if not hitEntity then
            return nil;
        end;

        if StatusEffectUtil:isActive(v8, StatusEffectType.MAGE_FIRE_ELEMENT) then
            u6:playFireElementExplosion(v9, p7.hitData.hitCFrame.Position);
            u6:applyBurnParticles(hitEntity);
        end;
    end);
end;

function u3.playFireElementExplosion(p10, p11, p12) -- Line: 71
    -- upvalues: ReplicatedStorage (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy)
    local u13 = ReplicatedStorage.Assets.Effects.Explosion:Clone();
    u13.Transparency = 1;
    u13:PivotTo(CFrame.new(p12));
    EffectUtil:playEffects({ u13 }, nil, {
        sizeMultiplier = 0.5,
        particleMultiplier = 0.5
    });
    SoundManager:playSound(GameSound.BURN_HIT, {
        position = p12
    });
    task.delay(1.5, function() -- Line: 82
        -- upvalues: u13 (copy)
        u13:Destroy();
    end);
end;

function u3.applyBurnParticles(u14, p15) -- Line: 86
    -- upvalues: Players (copy), ReplicatedStorage (copy), CollectionService (copy), SoundManager (copy), GameSound (copy), BalanceFile (copy)
    if p15.PrimaryPart == nil then
        return nil;
    end;

    local v16 = p15 == Players.LocalPlayer.Character;
    local UpperTorso = p15:FindFirstChild("UpperTorso");

    if not UpperTorso then
        return nil;
    end;

    local u17 = {};

    for _, child in ReplicatedStorage.Assets.Effects.Burn:GetChildren() do
        local v18 = child:Clone();
        v18.Parent = UpperTorso;

        if v16 and (v18:IsA("ParticleEmitter") or v18:IsA("Beam")) then
            CollectionService:AddTag(v18, "FirstPersonHidden");
        end;

        table.insert(u17, v18);
    end;

    local BURN_LOOP = GameSound.BURN_LOOP;
    local v19 = {
        looped = true
    };
    local v20;

    if v16 then
        v20 = nil;
    else
        v20 = p15.PrimaryPart.Position;
    end;

    v19.position = v20;
    local v21;

    if v16 then
        v21 = nil;
    else
        v21 = p15.PrimaryPart;
    end;

    v19.parent = v21;
    local u22 = SoundManager:playSound(BURN_LOOP, v19);
    u14.maid:GiveTask(function() -- Line: 114
        -- upvalues: u22 (copy), u17 (copy)
        local v23 = u22;

        if v23 ~= nil then
            v23:Stop();
        end;

        local v24 = u17;

        local function v26(u25) -- Line: 120
            if not u25:IsA("ParticleEmitter") then
                u25:Destroy();

                return;
            end;

            u25.Enabled = false;
            task.delay(0.5, function() -- Line: 123
                -- upvalues: u25 (copy)
                u25:Destroy();
            end);
        end;

        for i, v in v24 do
            v26(v, i - 1, v24);
        end;
    end);
    task.delay(BalanceFile.MAGE_BURN_DURATION, function() -- Line: 134
        -- upvalues: u14 (copy)
        u14.maid:DoCleaning();
    end);
end;

KnitClient.CreateController(u3.new());

return nil;
-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local isDagger = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "weapons", "dagger-util").isDagger;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "DaggerController";
    end,

    __index = HandKnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 27
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 31
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p3);
    p3.Name = "DaggerController";
    p3.isHolding = false;
end;

function u1.isRelevantItem(p4, p5) -- Line: 36
    -- upvalues: isDagger (copy)
    return isDagger(p5.itemType);
end;

function u1.onEnable(p6, p7, p8) -- Line: 39
    -- upvalues: Players (copy), Flamework (copy), AbilityId (copy)
    p6.isHolding = true;
    local v9 = Players.LocalPlayer:GetAttribute("DaggerCoolDown");

    if v9 == 0 or (v9 ~= v9 or (v9 == "" or not v9)) then
        p6:enableInticator();
    end;

    p6:setupDestroyableYield(function() -- Line: 45
        -- upvalues: Flamework (ref), AbilityId (ref)
        return Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.DAGGER_DASH, nil):expect();
    end);
end;

function u1.onDisable(p10) -- Line: 49
    p10.isHolding = false;
    p10:disableIndicator();
end;

function u1.KnitStart(u11) -- Line: 53
    -- upvalues: HandKnitController (copy), KnitClient (copy), AnimationType (copy), GameSound (copy), Players (copy), ClientSyncEvents (copy), isDagger (copy), EntityUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy), BLOCK_SIZE (copy)
    HandKnitController.KnitStart(u11);
    KnitClient.Controllers.PreloadController:runPreload({
        animations = {
            AnimationType.DAGGER_SWING_1,
            AnimationType.DAGGER_SWING_2,
            AnimationType.DAGGER_SWING_FP,
            AnimationType.DAGGER_SWING_2_FP
        },
        sounds = {
            GameSound.DAGGER_SWING_1,
            GameSound.DAGGER_SWING_2,
            GameSound.DAGGER_SWING_3,
            GameSound.DAGGER_SWING_4,
            GameSound.DAGGER_READY
        }
    });
    Players.LocalPlayer:GetAttributeChangedSignal("DaggerCoolDown"):Connect(function() -- Line: 59
        -- upvalues: Players (ref), u11 (copy)
        local v12 = Players.LocalPlayer:GetAttribute("DaggerCoolDown");

        if v12 == 0 or v12 ~= v12 then
            v12 = false;
        elseif v12 == "" then
            v12 = false;
        end;

        if not v12 and u11.isHolding then
            u11:enableInticator();

            return;
        end;

        local v13 = Players.LocalPlayer:GetAttribute("DaggerCoolDown");

        if v13 ~= 0 and (v13 == v13 and (v13 ~= "" and v13)) then
            u11:disableIndicator();
        end;
    end);
    ClientSyncEvents.BeforeSwordSwing:connect(function(p14) -- Line: 74
        -- upvalues: isDagger (ref), Players (ref), EntityUtil (ref), StatusEffectUtil (ref), StatusEffectType (ref), BLOCK_SIZE (ref)
        if not isDagger(p14.swordType) then
            return nil;
        end;

        local v15 = Players.LocalPlayer:GetAttribute("DaggerCoolDown");

        if v15 ~= 0 and (v15 == v15 and (v15 ~= "" and v15)) then
            return nil;
        end;

        local v16 = EntityUtil:getLocalPlayerEntity();

        if not v16 or StatusEffectUtil:isActive(v16:getInstance(), StatusEffectType.GROUNDED) then
            return nil;
        end;

        if not v16 or StatusEffectUtil:isActive(v16:getInstance(), StatusEffectType.FROSTED) then
            return nil;
        end;

        local weaponMetaClone = p14.weaponMetaClone;

        if weaponMetaClone ~= nil then
            weaponMetaClone = weaponMetaClone.sword;

            if weaponMetaClone ~= nil then
                weaponMetaClone = weaponMetaClone.attackRange;
            end;
        end;

        if weaponMetaClone ~= 0 and (weaponMetaClone == weaponMetaClone and weaponMetaClone) then
            p14.weaponMetaClone.sword.attackRange = 6.5 * BLOCK_SIZE;
        end;
    end);
end;

function u1.enableInticator(p17) -- Line: 113
    -- upvalues: EntityUtil (copy), Players (copy), isDagger (copy), SoundManager (copy), GameSound (copy)
    local v18 = EntityUtil:getEntity(Players.LocalPlayer);

    if v18 ~= nil then
        v18 = v18:getHandItemInstanceFromCharacter();
    end;

    if v18 and isDagger(v18.Name) then
        local Handle = v18:FindFirstChild("Handle");

        if Handle ~= nil then
            Handle = Handle:FindFirstChild("Pulse");
        end;

        if Handle then
            Handle:Emit(1);
            SoundManager:playSound(GameSound.DAGGER_READY);
        end;
    end;
end;

function u1.disableIndicator(p19) -- Line: 132
end;

KnitClient.CreateController(u1.new());

return nil;
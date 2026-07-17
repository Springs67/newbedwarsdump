-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local MagicalGirlRapierBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "magical-girl-rapier-balance").MagicalGirlRapierBalance;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v3 = {};
local u4 = setmetatable({}, {
    __index = v3
});
u4.HERO_BASIC = 0;
v3[0] = "HERO_BASIC";
u4.HERO_ENHANCED = 1;
v3[1] = "HERO_ENHANCED";
u4.VILLAIN_BASIC = 2;
v3[2] = "VILLAIN_BASIC";
u4.VILLAIN_ENHANCED = 3;
v3[3] = "VILLAIN_ENHANCED";
local u5 = {
    [u4.HERO_BASIC] = {
        fpAnimation = { AnimationType.GREAT_HAMMER_SWING_1_FP, AnimationType.GREAT_HAMMER_SWING_2_FP },
        animation = { AnimationType.GREAT_HAMMER_SWING_1, AnimationType.GREAT_HAMMER_SWING_2 },
        impactSound = {
            GameSound.RAPIER_HIT_1,
            GameSound.RAPIER_HIT_2,
            GameSound.RAPIER_HIT_3,
            GameSound.RAPIER_HIT_4
        },
        swingSound = {
            GameSound.HERO_RAPIER_SWING_1,
            GameSound.HERO_RAPIER_SWING_2,
            GameSound.HERO_RAPIER_SWING_3,
            GameSound.HERO_RAPIER_SWING_4
        }
    },
    [u4.HERO_ENHANCED] = {
        fpAnimation = { AnimationType.FP_TWIRLBLADE_ATTACK_1, AnimationType.FP_TWIRLBLADE_ATTACK_2 },
        animation = { AnimationType.RAPIER_THRUST_1, AnimationType.RAPIER_THRUST_2 },
        impactSound = {
            GameSound.RAPIER_HIT_1,
            GameSound.RAPIER_HIT_2,
            GameSound.RAPIER_HIT_3,
            GameSound.RAPIER_HIT_4
        },
        swingSound = { GameSound.HERO_RAPIER_THRUST_1, GameSound.HERO_RAPIER_THRUST_2 }
    },
    [u4.VILLAIN_BASIC] = {
        fpAnimation = { AnimationType.GREAT_HAMMER_SWING_1_FP, AnimationType.GREAT_HAMMER_SWING_2_FP },
        animation = { AnimationType.GREAT_HAMMER_SWING_1, AnimationType.GREAT_HAMMER_SWING_2 },
        impactSound = {
            GameSound.RAPIER_HIT_1,
            GameSound.RAPIER_HIT_2,
            GameSound.RAPIER_HIT_3,
            GameSound.RAPIER_HIT_4
        },
        swingSound = {
            GameSound.VILLAIN_RAPIER_SWING_1,
            GameSound.VILLAIN_RAPIER_SWING_2,
            GameSound.VILLAIN_RAPIER_SWING_3,
            GameSound.VILLAIN_RAPIER_SWING_4
        }
    },
    [u4.VILLAIN_ENHANCED] = {
        fpAnimation = { AnimationType.FP_TWIRLBLADE_ATTACK_1, AnimationType.FP_TWIRLBLADE_ATTACK_2 },
        animation = { AnimationType.RAPIER_THRUST_1, AnimationType.RAPIER_THRUST_2 },
        impactSound = {
            GameSound.RAPIER_HIT_1,
            GameSound.RAPIER_HIT_2,
            GameSound.RAPIER_HIT_3,
            GameSound.RAPIER_HIT_4
        },
        swingSound = { GameSound.VILLAIN_RAPIER_THRUST_1, GameSound.VILLAIN_RAPIER_THRUST_2 }
    }
};
local u6 = {
    AnimationType.GREAT_HAMMER_SWING_1_FP,
    AnimationType.GREAT_HAMMER_SWING_2_FP,
    AnimationType.FP_TWIRLBLADE_ATTACK_1,
    AnimationType.FP_TWIRLBLADE_ATTACK_2,
    AnimationType.GREAT_HAMMER_SWING_1,
    AnimationType.GREAT_HAMMER_SWING_2,
    AnimationType.RAPIER_THRUST_1,
    AnimationType.RAPIER_THRUST_2
};
local u7 = {
    GameSound.RAPIER_HIT_1,
    GameSound.RAPIER_HIT_2,
    GameSound.RAPIER_HIT_3,
    GameSound.RAPIER_HIT_4,
    GameSound.RAPIER_PROJECTILE_HIT,
    GameSound.HERO_RAPIER_SWING_1,
    GameSound.HERO_RAPIER_SWING_2,
    GameSound.HERO_RAPIER_SWING_3,
    GameSound.HERO_RAPIER_SWING_4,
    GameSound.HERO_RAPIER_THRUST_1,
    GameSound.HERO_RAPIER_THRUST_2,
    GameSound.VILLAIN_RAPIER_SWING_1,
    GameSound.VILLAIN_RAPIER_SWING_2,
    GameSound.VILLAIN_RAPIER_SWING_3,
    GameSound.VILLAIN_RAPIER_SWING_4,
    GameSound.VILLAIN_RAPIER_THRUST_1,
    GameSound.VILLAIN_RAPIER_THRUST_2
};
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 68, Name: __tostring
        return "MagicalGirlRapierController";
    end,

    __index = HandKnitController
});
u8.__index = u8;

function u8.new(...) -- Line: 74
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 78
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p10);
    p10.Name = "MagicalGirlRapierController";
    p10.readyTime = -1;
end;

function u8.KnitStart(u11) -- Line: 83
    -- upvalues: HandKnitController (copy), KnitClient (copy), ItemType (copy), u6 (copy), u7 (copy), ClientSyncEvents (copy), Workspace (copy), EntityUtil (copy), Players (copy), MagicalGirlRapierBalance (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), default (copy)
    HandKnitController.KnitStart(u11);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.HERO_MAGICAL_GIRL_RAPIER, {
        animations = u6,
        sounds = u7
    });
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.VILLAIN_MAGICAL_GIRL_RAPIER, {
        animations = u6,
        sounds = u7
    });
    ClientSyncEvents.SwordSwing:connect(function(p12) -- Line: 93
        -- upvalues: u11 (copy), Workspace (ref), EntityUtil (ref), Players (ref), ItemType (ref), MagicalGirlRapierBalance (ref)
        if p12:isCancelled() then
            return nil;
        end;

        if u11.readyTime > Workspace:GetServerTimeNow() then
            return nil;
        end;

        local v13 = EntityUtil:getEntity(Players.LocalPlayer);

        if not v13 then
            return nil;
        end;

        local v14 = v13:getItemInHand();

        if not v14 then
            return nil;
        end;

        if v14.Name ~= ItemType.HERO_MAGICAL_GIRL_RAPIER and v14.Name ~= ItemType.VILLAIN_MAGICAL_GIRL_RAPIER then
            return nil;
        end;

        local v15 = u11:isHero(v14.Name);
        u11.readyTime = Workspace:GetServerTimeNow() + MagicalGirlRapierBalance.RAPIER_ATTACK_COOLDOWN;
        local v16 = Players.LocalPlayer:GetAttribute("RapierAttackIndex");
        local v17 = (v16 == nil and 0 or v16) % 3;
        u11:playAttackSequenceLocalAnimation(v17, v15);
        u11:playLocalSwingSound(v17, v15);
    end);
    ClientSyncEvents.ProjectileHit:connect(function(p18) -- Line: 123
        -- upvalues: SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref)
        if p18:isCancelled() then
            return nil;
        end;

        if p18.projectileType ~= "hero_magical_girl_rapier_projectile" and p18.projectileType ~= "villain_magical_girl_rapier_projectile" then
            return nil;
        end;

        if not p18.shooter then
            return nil;
        end;

        SoundManager:playSound(GameSound.RAPIER_PROJECTILE_HIT, {
            volumeMultiplier = 0.6,
            position = p18.hitData.hitCFrame.Position
        });

        if p18.projectileType == "hero_magical_girl_rapier_projectile" then
            local u19 = ReplicatedStorage.Assets.Effects.HeroRapierProjectileHit:Clone();
            u19.CFrame = p18.hitData.hitCFrame;
            u19.Parent = Workspace;

            for _, descendant in u19:GetDescendants() do
                if descendant:IsA("ParticleEmitter") then
                    descendant:Emit(15);
                end;
            end;

            task.delay(4, function() -- Line: 147
                -- upvalues: u19 (copy)
                u19:Destroy();
            end);

            return;
        end;

        local u20 = ReplicatedStorage.Assets.Effects.VillainRapierProjectileHit:Clone();
        u20.CFrame = p18.hitData.hitCFrame;
        u20.Parent = Workspace;
        u20.Outline1:Emit(1);
        u20.DotsRotating:Emit(20);
        task.delay(4, function() -- Line: 156
            -- upvalues: u20 (copy)
            u20:Destroy();
        end);
    end);
    default.Client:OnEvent("RapierSwordHit", function(p21) -- Line: 162
        -- upvalues: EntityUtil (ref), Players (ref), ItemType (ref), u11 (copy)
        local v22 = EntityUtil:getEntity(Players.LocalPlayer);

        if not v22 then
            return nil;
        end;

        local v23 = v22:getItemInHand();

        if not v23 then
            return nil;
        end;

        if v23.Name ~= ItemType.HERO_MAGICAL_GIRL_RAPIER and v23.Name ~= ItemType.VILLAIN_MAGICAL_GIRL_RAPIER then
            return nil;
        end;

        local v24 = u11:isHero(v23.Name);
        u11:playImpactSound(p21.player, p21.attackNumber, v24);
    end);
end;

function u8.isRelevantItem(p25, p26) -- Line: 178
    -- upvalues: ItemType (copy)
    return p26.itemType == ItemType.HERO_MAGICAL_GIRL_RAPIER and true or p26.itemType == ItemType.VILLAIN_MAGICAL_GIRL_RAPIER;
end;

function u8.onEnable(p27, p28, p29) -- Line: 181
end;

function u8.onDisable(p30) -- Line: 183
end;

function u8.isHero(p31, p32) -- Line: 185
    -- upvalues: ItemType (copy)
    return p32 == ItemType.HERO_MAGICAL_GIRL_RAPIER;
end;

function u8.playAttackSequenceLocalAnimation(p33, p34, p35) -- Line: 188
    -- upvalues: RandomUtil (copy), KnitClient (copy), GameAnimationUtil (copy), Players (copy), getItemMeta (copy), ItemType (copy)
    local v36 = p33:getEffects(p34, p35);

    if not v36 then
        return nil;
    end;

    if v36.fpAnimation then
        local v37 = RandomUtil.fromList(unpack(v36.fpAnimation));
        KnitClient.Controllers.ViewmodelController:playAnimation(v37);
    end;

    local v38 = RandomUtil.fromList(unpack(v36.animation));
    local v39 = GameAnimationUtil:playAnimation(Players.LocalPlayer, v38);

    if not v39 then
        return nil;
    end;

    v39.Priority = Enum.AnimationPriority.Action4;
    local sword = getItemMeta(ItemType.HERO_MAGICAL_GIRL_RAPIER).sword;

    if sword ~= nil then
        sword = sword.attackSpeed;
    end;

    local v40;

    if v39 == nil then
        v40 = v39;
    else
        v40 = v39.Length;
    end;

    local v41;

    if v40 == 0 or v40 ~= v40 then
        v41 = v40;
    elseif v40 then
        v41 = sword;
    else
        v41 = v40;
    end;

    if v41 ~= 0 and (v41 == v41 and (v41 and v39 ~= nil)) then
        v39:AdjustSpeed(v40 / sword);
    end;
end;

function u8.getEffects(p42, p43, p44) -- Line: 224
    -- upvalues: u4 (ref), u5 (copy)
    local v45 = (p43 < 0 or p43 >= 3) and 0 or p43;
    local v46 = v45 == 0;

    if v46 or v45 == 1 then
        if p44 then
            return u5[u4.HERO_BASIC];
        end;

        return u5[u4.VILLAIN_BASIC];
    end;

    if v46 or v45 == 2 then
        if p44 then
            return u5[u4.HERO_ENHANCED];
        end;

        return u5[u4.VILLAIN_ENHANCED];
    end;
end;

function u8.playLocalSwingSound(p47, p48, p49) -- Line: 254
    -- upvalues: RandomUtil (copy), SoundManager (copy)
    local v50 = p47:getEffects(p48, p49);

    if not v50 then
        return nil;
    end;

    local swingSound = v50.swingSound;

    if not swingSound or #swingSound == 0 then
        return nil;
    end;

    SoundManager:playSound(RandomUtil.fromList(unpack(swingSound)), {
        volumeMultiplier = 1
    });
end;

function u8.playImpactSound(p51, p52, p53, p54) -- Line: 268
    -- upvalues: RandomUtil (copy), Players (copy), SoundManager (copy)
    local Character = p52.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local v55 = p51:getEffects(p53, p54);

    if not v55 then
        return nil;
    end;

    local impactSound = v55.impactSound;

    if not impactSound or #impactSound == 0 then
        return nil;
    end;

    local v56 = RandomUtil.fromList(unpack(impactSound));

    if v56 == "" or not v56 then
        return nil;
    end;

    if p52 == Players.LocalPlayer then
        SoundManager:playSound(v56, {
            volumeMultiplier = 0.85
        });

        return;
    end;

    SoundManager:playSound(v56, {
        rollOffMaxDistance = 25,
        volumeMultiplier = 0.85,
        position = Character
    });
end;

KnitClient.CreateController(u8.new());

return {
    RapierAttackMeta = u5
};
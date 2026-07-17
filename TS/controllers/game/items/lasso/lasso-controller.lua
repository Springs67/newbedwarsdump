-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ProjectileSourceController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local ProjectileImpactZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").ProjectileImpactZap;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local LassoUpgradeType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "lasso-wars", "lasso-wars-types").LassoUpgradeType;
local LassoWarsUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "lasso-wars", "lasso-wars-util").LassoWarsUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local LassoUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "lasso", "lasso-util").LassoUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "LassoController";
    end,

    __index = ProjectileSourceController
});
u2.__index = u2;

function u2.new(...) -- Line: 32
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, ...) -- Line: 36
    -- upvalues: ProjectileSourceController (copy), u1 (copy)
    ProjectileSourceController.constructor(p4, ...);
    p4.Name = "LassoController";
    p4.stopChargingMaid = u1.new();
end;

function u2.KnitStart(p5) -- Line: 41
    -- upvalues: ProjectileSourceController (copy), ClientSyncEvents (copy), GameSound (copy), EntityUtil (copy), Players (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), SoundManager (copy), getItemMeta (copy), ItemType (copy), LassoWarsUtil (copy), LassoUpgradeType (copy), Flamework (copy), CooldownId (copy), ProjectileImpactZap (copy)
    ProjectileSourceController.KnitStart(p5);
    ClientSyncEvents.ProjectileLaunched:connect(function(p6) -- Line: 43
        -- upvalues: GameSound (ref), EntityUtil (ref), Players (ref), KnitClient (ref), BedwarsKitSkinMeta (ref), SoundManager (ref), getItemMeta (ref), ItemType (ref), LassoWarsUtil (ref), LassoUpgradeType (ref), ClientSyncEvents (ref), Flamework (ref), CooldownId (ref)
        if p6:isLocalShooter() and p6.projectileType == "lasso" then
            local LASSO_THROW = GameSound.LASSO_THROW;
            local v7 = EntityUtil:getEntity(Players.LocalPlayer);

            if v7 ~= nil then
                v7 = v7:getInstance();
            end;

            if v7 then
                local v8 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(v7)];

                if v8.lassy then
                    LASSO_THROW = v8.lassy.lassoThrowSound;
                end;
            end;

            SoundManager:playSound(LASSO_THROW);
            local fireDelaySec = getItemMeta(ItemType.LASSO).projectileSource.fireDelaySec;

            if LassoWarsUtil.isInLassoWarsMode() then
                fireDelaySec = LassoWarsUtil.getModifiedLassoCooldown(0);
                local v9 = KnitClient.Controllers.LassoWarsController:getLassoModifierMapForPlayer(Players.LocalPlayer);

                if v9 ~= nil then
                    v9 = v9[LassoUpgradeType.COOLDOWN];
                end;

                if v9 then
                    fireDelaySec = LassoWarsUtil.getModifiedLassoCooldown(v9.level);
                end;
            end;

            local cooldown = ClientSyncEvents.ItemCooldownModifierCheck:fire(fireDelaySec).cooldown;
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.LASSO_THROW, cooldown);
        end;
    end);
    ProjectileImpactZap.On(function(p10, p11, p12, p13, p14, p15, p16, p17) -- Line: 77
        -- upvalues: Players (ref), GameSound (ref), EntityUtil (ref), KnitClient (ref), BedwarsKitSkinMeta (ref), SoundManager (ref)
        if p12.Name ~= "lasso" then
            return nil;
        end;

        if p15 == Players.LocalPlayer and p11 == 1 then
            local LASSO_HIT = GameSound.LASSO_HIT;
            local v18 = EntityUtil:getEntity(Players.LocalPlayer);

            if v18 ~= nil then
                v18 = v18:getInstance();
            end;

            if v18 then
                local v19 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(v18)];

                if v19.lassy then
                    LASSO_HIT = v19.lassy.lassoHitSound;
                end;
            end;

            SoundManager:playSound(LASSO_HIT);
        end;
    end);
end;

function u2.isRelevantItem(p20, p21) -- Line: 102
    -- upvalues: ItemType (copy)
    return p21.itemType == ItemType.LASSO;
end;

function u2.onEnable(p22, p23, p24) -- Line: 105
    -- upvalues: ProjectileSourceController (copy), u1 (copy), Flamework (copy), CooldownId (copy)
    ProjectileSourceController.onEnable(p22, p23, p24);
    p22:setupYield(function() -- Line: 107
        -- upvalues: u1 (ref), Flamework (ref), CooldownId (ref)
        local u25 = u1.new();
        u25:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(CooldownId.LASSO_THROW));

        return function() -- Line: 110
            -- upvalues: u25 (copy)
            u25:DoCleaning();
        end;
    end);
end;

function u2.onStartCharging(p26) -- Line: 115
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy), GameSound (copy), EntityUtil (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), SoundManager (copy)
    local u27 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.LASSO_CHARGE, {
        looped = true
    });
    local LASSO_SWING = GameSound.LASSO_SWING;
    local v28 = EntityUtil:getEntity(Players.LocalPlayer);

    if v28 ~= nil then
        v28 = v28:getInstance();
    end;

    if v28 then
        local v29 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(v28)];

        if v29.lassy then
            LASSO_SWING = v29.lassy.lassoSwingSound;
        end;
    end;

    if u27 then
        local u30 = SoundManager:playSound(LASSO_SWING, {
            looped = true
        });
        p26.stopChargingMaid:GiveTask(function() -- Line: 136
            -- upvalues: u30 (copy)
            return u30:Stop();
        end);
        p26.stopChargingMaid:GiveTask(function() -- Line: 139
            -- upvalues: u27 (copy)
            u27:Stop();
        end);
    end;
end;

function u2.onStopCharging(p31) -- Line: 144
    p31.stopChargingMaid:DoCleaning();
end;

function u2.onLaunch(p32) -- Line: 147
    return true;
end;

function u2.onStartReload(p33) -- Line: 150
end;

function u2.getProjectileOverrides(p34) -- Line: 152
    -- upvalues: LassoUtil (copy), Players (copy)
    return LassoUtil.getProjectileOverrides(Players.LocalPlayer);
end;

KnitClient.CreateController(u2.new());

return nil;
-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ProjectileSourceController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local SpiritSummonerProjectile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "spirit-summoner-projectiles").SpiritSummonerProjectile;
local SummonedSpiritType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "summoned-spirit-type").SummonedSpiritType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "SpiritStaffProjectileController";
    end,

    __index = ProjectileSourceController
});
u3.__index = u3;

function u3.new(...) -- Line: 23
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, ...) -- Line: 27
    -- upvalues: ProjectileSourceController (copy)
    ProjectileSourceController.constructor(p5, ...);
    p5.Name = "SpiritStaffProjectileController";
    p5.Client = {};
end;

function u3.KnitStart(p6) -- Line: 32
    -- upvalues: ProjectileSourceController (copy)
    ProjectileSourceController.KnitStart(p6);
end;

function u3.isRelevantItem(p7, p8) -- Line: 35
    -- upvalues: ItemType (copy)
    return p8.itemType == ItemType.SPIRIT_STAFF;
end;

function u3.getProjectileSource(p9, p10) -- Line: 38
    -- upvalues: Players (copy), SpiritSummonerProjectile (copy), SummonedSpiritType (copy), KnitClient (copy), BedwarsKitSkinMeta (copy)
    local v11 = Players.LocalPlayer:GetAttribute("SpiritSummonerAffinity");
    local v12 = Players.LocalPlayer:GetAttribute("ReadySummonedAttackSpirits");
    local v13 = Players.LocalPlayer:GetAttribute("ReadySummonedHealSpirits");
    local v14 = SpiritSummonerProjectile[SummonedSpiritType.ATTACK];

    if v11 == SummonedSpiritType.ATTACK and v12 > 0 then
        v14 = SpiritSummonerProjectile[SummonedSpiritType.ATTACK];
    elseif v11 == SummonedSpiritType.HEAL and v13 > 0 then
        v14 = SpiritSummonerProjectile[SummonedSpiritType.HEAL];
    elseif v12 > 0 then
        v14 = SpiritSummonerProjectile[SummonedSpiritType.ATTACK];
    elseif v13 > 0 then
        v14 = SpiritSummonerProjectile[SummonedSpiritType.HEAL];
    end;

    local uma = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(Players.LocalPlayer)].uma;

    if uma then
        local v15 = v14.projectileType(nil);

        if v15 == "heal_spirit" then
            v14.launchSound = { uma.healSpiritThrowSound };

            return v14;
        end;

        if v15 == "attack_spirit" then
            v14.launchSound = { uma.attackSpiritThrowSound };
        end;
    end;

    return v14;
end;

function u3.onLaunch(p16, u17) -- Line: 64
    -- upvalues: u2 (copy), KnitClient (copy), RuntimeLib (copy), KnitClient2 (copy)
    local u18 = p16:getHandItem();
    local projectileHandler = p16.projectileHandler;
    local u19 = p16:getProjectileSource(u18);
    local u20 = u2.new();
    u20:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
        blockSprint = true,
        moveSpeedMultiplier = u19.walkSpeedMultiplier
    }));
    RuntimeLib.Promise.defer(function() -- Line: 73
        -- upvalues: u17 (copy), KnitClient2 (ref), u18 (copy), projectileHandler (copy), u19 (copy), u20 (copy)
        if u17() then
            KnitClient2.Controllers.ProjectileController:launchProjectile(u18.itemType, nil, projectileHandler, u18.tool, u19);
        end;

        u20:DoCleaning();
    end);
end;

function u3.onStartCharging(p21) -- Line: 80
end;

function u3.onStopCharging(p22) -- Line: 82
end;

function u3.onStartReload(p23, p24) -- Line: 84
end;

KnitClient.CreateController(u3.new());

return nil;
-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ProjectileSourceController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemUpgradeTierAttr = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").ItemUpgradeTierAttr;
local MagicalGirlScepterUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "magical-girl-scepter", "magical-girl-scepter-util").MagicalGirlScepterUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local GetAttribute = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute;
local MagicalGirlScepterProgressBar = RuntimeLib.import(script, script.Parent, "magical-girl-scepter-progress-bar").MagicalGirlScepterProgressBar;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "MagicalGirlScepterProjectileController";
    end,

    __index = ProjectileSourceController
});
u5.__index = u5;

function u5.new(...) -- Line: 32
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, ...) -- Line: 36
    -- upvalues: ProjectileSourceController (copy), u2 (copy)
    ProjectileSourceController.constructor(p7, ...);
    p7.Name = "MagicalGirlScepterProjectileController";
    p7.Client = {};
    p7.chargeMaid = u2.new();
    p7.overchargeStartTime = 0;
end;

function u5.KnitStart(p8) -- Line: 43
    -- upvalues: ProjectileSourceController (copy), KnitClient (copy), ItemType (copy), GameSound (copy)
    ProjectileSourceController.KnitStart(p8);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.HERO_MAGICAL_GIRL_SCEPTER, {
        sounds = {
            GameSound.HERO_SCEPTER_SHOT_1,
            GameSound.HERO_SCEPTER_SHOT_2,
            GameSound.HERO_SCEPTER_SHOT_3,
            GameSound.HERO_SCEPTER_SHOT_4,
            GameSound.HERO_SCEPTER_CHARGE,
            GameSound.SOLAR_FLARE_AFTERSHOCK_1,
            GameSound.SOLAR_FLARE_AFTERSHOCK_2,
            GameSound.SOLAR_FLARE_AFTERSHOCK_3,
            GameSound.SOLAR_FLARE_AFTERSHOCK_4,
            GameSound.SOLAR_FLARE_EXPLOSION
        }
    });
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.VILLAIN_MAGICAL_GIRL_SCEPTER, {
        sounds = {
            GameSound.VILLAIN_SCEPTER_SHOT_1,
            GameSound.VILLAIN_SCEPTER_SHOT_2,
            GameSound.VILLAIN_SCEPTER_SHOT_3,
            GameSound.VILLAIN_SCEPTER_SHOT_4,
            GameSound.VILLAIN_SCEPTER_CHARGE,
            GameSound.LUNAR_VENOM_TICK_1,
            GameSound.LUNAR_VENOM_TICK_2,
            GameSound.LUNAR_VENOM_TICK_3,
            GameSound.LUNAR_VENOM_TICK_4,
            GameSound.LUNAR_VENOM_INFECTION
        }
    });
end;

function u5.getProjectileSource(p9, p10) -- Line: 52
    -- upvalues: getItemMeta (copy)
    local itemType = p10.itemType;

    if p9:isDoneCharging() then
        local multiProjectileSource = getItemMeta(itemType).multiProjectileSource;

        if multiProjectileSource ~= nil then
            multiProjectileSource = multiProjectileSource.hero_magical_girl_scepter_multi_projectile;
        end;

        if not multiProjectileSource then
            multiProjectileSource = getItemMeta(itemType).multiProjectileSource;

            if multiProjectileSource ~= nil then
                multiProjectileSource = multiProjectileSource.villain_magical_girl_scepter_multi_projectile;
            end;
        end;

        return multiProjectileSource;
    end;

    local multiProjectileSource = getItemMeta(itemType).multiProjectileSource;

    if multiProjectileSource ~= nil then
        multiProjectileSource = multiProjectileSource.hero_magical_girl_scepter_projectile;
    end;

    if not multiProjectileSource then
        multiProjectileSource = getItemMeta(itemType).multiProjectileSource;

        if multiProjectileSource ~= nil then
            multiProjectileSource = multiProjectileSource.villain_magical_girl_scepter_projectile;
        end;
    end;

    return multiProjectileSource;
end;

function u5.isRelevantItem(p11, p12) -- Line: 85
    -- upvalues: ItemType (copy)
    return p12.itemType == ItemType.HERO_MAGICAL_GIRL_SCEPTER and true or p12.itemType == ItemType.VILLAIN_MAGICAL_GIRL_SCEPTER;
end;

function u5.onStartCharging(p13) -- Line: 88
    -- upvalues: ItemType (copy), SoundManager (copy), GameSound (copy), Players (copy)
    local v14;

    if p13:getHandItem().itemType == ItemType.HERO_MAGICAL_GIRL_SCEPTER then
        v14 = SoundManager:playSound(GameSound.HERO_SCEPTER_CHARGE, {
            looped = true,
            parent = Players.LocalPlayer
        });
    else
        v14 = SoundManager:playSound(GameSound.VILLAIN_SCEPTER_CHARGE, {
            looped = true,
            parent = Players.LocalPlayer
        });
    end;

    p13.chargeMaid:GiveTask(v14);
    p13.overchargeStartTime = 0;
end;

function u5.onStopCharging(p15) -- Line: 105
    p15.chargeMaid:DoCleaning();
end;

function u5.isDoneCharging(p16) -- Line: 108
    local v17 = p16:getChargeTime();
    local v18;

    if v17 == 0 then
        v18 = true;
    elseif p16.overchargeStartTime == 0 then
        v18 = false;
    else
        v18 = v17 <= tick() - p16.overchargeStartTime;
    end;

    return v18;
end;

function u5.onLaunch(p19, u20) -- Line: 112
    -- upvalues: Players (copy), GetAttribute (copy), ItemUpgradeTierAttr (copy), u2 (copy), KnitClient2 (copy), MagicalGirlScepterUtil (copy), RuntimeLib (copy), KnitClient (copy), AnimationType (copy), GameAnimationUtil (copy)
    local v21 = p19:getChargeTime();
    local v22;

    if v21 == 0 then
        v22 = true;
    elseif p19.overchargeStartTime == 0 then
        v22 = false;
    else
        v22 = v21 <= tick() - p19.overchargeStartTime;
    end;

    local _ = Players.LocalPlayer.Character;

    if v22 then
        local u23 = p19:getHandItem();
        local u24 = p19:getProjectileSource(u23);
        local projectileHandler = p19.projectileHandler;
        local v25 = GetAttribute(u23.tool, ItemUpgradeTierAttr);
        local v26 = (v25 == 0 or (v25 ~= v25 or not v25)) and 0 or v25;
        local u27 = u2.new();
        u27:GiveTask(KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
            blockSprint = true,
            moveSpeedMultiplier = u24.walkSpeedMultiplier
        }));
        local multiShotDelay = u24.multiShotDelay;
        local u28 = (multiShotDelay == 0 or (multiShotDelay ~= multiShotDelay or not multiShotDelay)) and 0.1 or multiShotDelay;
        local u29;

        if v26 == MagicalGirlScepterUtil.TIERS.EXTRA_PROJECTILES_1 or v26 == MagicalGirlScepterUtil.TIERS.STACKING_EFFECTS then
            u29 = MagicalGirlScepterUtil.NUM_BASE_PROJECTILES + MagicalGirlScepterUtil.NUM_EXTRA_PROJECTILES_1;
        elseif v26 == MagicalGirlScepterUtil.TIERS.EXTRA_PROJECTILES_2 then
            u29 = MagicalGirlScepterUtil.NUM_BASE_PROJECTILES + MagicalGirlScepterUtil.NUM_EXTRA_PROJECTILES_2;
        else
            u29 = MagicalGirlScepterUtil.NUM_BASE_PROJECTILES;
        end;

        RuntimeLib.Promise.defer(function() -- Line: 151
            -- upvalues: u29 (ref), u28 (copy), u20 (copy), KnitClient2 (ref), u23 (copy), projectileHandler (copy), u24 (copy), u27 (copy)
            local v30 = false;
            local v31 = 0;

            while true do
                if v30 then
                    v31 = v31 + 1;
                else
                    v30 = true;
                end;

                if v31 >= u29 - 1 then
                    u27:DoCleaning();

                    return;
                end;

                task.wait(u28);

                if u20() then
                    KnitClient2.Controllers.ProjectileController:launchProjectile(u23.itemType, nil, projectileHandler, u23.tool, u24);
                end;
            end;
        end);
    end;

    local v32 = KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.GREAT_HAMMER_SWING_1_FP);

    if v32 ~= nil then
        v32:AdjustSpeed(1.5);
    end;

    local v33 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.GREAT_HAMMER_SWING_1);

    if v33 ~= nil then
        v33:AdjustSpeed(1.5);
    end;
end;

function u5.onStartReload(p34) -- Line: 184
end;

function u5.getChargeTime(p35) -- Line: 186
    -- upvalues: MagicalGirlScepterUtil (copy)
    return not p35:getHandItem() and 0 or MagicalGirlScepterUtil.MULTI_SHOT_CHARGE_TIME;
end;

function u5.onMaxCharge(p36) -- Line: 193
    -- upvalues: CollectionService (copy), u3 (copy), MagicalGirlScepterProgressBar (copy), Players (copy)
    local v37 = p36:getChargeTime();

    if v37 == 0 then
        return nil;
    end;

    p36.overchargeStartTime = tick();
    local u38 = true;
    p36.chargeMaid:GiveTask(function() -- Line: 200
        -- upvalues: u38 (ref)
        u38 = false;
    end);
    task.delay(v37, function() -- Line: 203
        -- upvalues: u38 (ref), CollectionService (ref)
        if u38 then
            local function _(p39) -- Line: 206
                p39.Color = ColorSequence.new(Color3.fromRGB(112, 219, 255));
            end;

            for i, v in CollectionService:GetTagged("projectile-preview-beam") do
                local _ = i - 1;
                v.Color = ColorSequence.new(Color3.fromRGB(112, 219, 255));
            end;
        end;
    end);
    local u40 = u3.mount(u3.createElement("ScreenGui", {}, { u3.createElement(MagicalGirlScepterProgressBar, {
            title = "Solar Flare",
            chargeTime = v37
        }) }), Players.LocalPlayer:WaitForChild("PlayerGui"), "ChargeMagicalGirlScepter");
    p36.chargeMaid:GiveTask(function() -- Line: 220
        -- upvalues: u3 (ref), u40 (copy)
        u3.unmount(u40);
    end);
end;

KnitClient.CreateController(u5.new());

return nil;
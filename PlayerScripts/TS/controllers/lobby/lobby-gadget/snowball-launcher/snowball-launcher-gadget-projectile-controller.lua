-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local SnowballLauncherProgressBar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "items", "snowball-launcher", "snowball-launcher-progress-bar").SnowballLauncherProgressBar;
local ProjectileSourceController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "snowball-launcher", "snowball-launcher-util");
local SNOWBALL_LAUNCHER_CYCLE = v6.SNOWBALL_LAUNCHER_CYCLE;
local SnowballLauncherMode = v6.SnowballLauncherMode;
local SnowballLauncherUtil = v6.SnowballLauncherUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 30, Name: __tostring
        return "SnowballLauncherGadgetProjectileController";
    end,

    __index = ProjectileSourceController
});
u7.__index = u7;

function u7.new(...) -- Line: 36
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9, ...) -- Line: 40
    -- upvalues: ProjectileSourceController (copy), u3 (copy)
    ProjectileSourceController.constructor(p9, ...);
    p9.Name = "SnowballLauncherGadgetProjectileController";
    p9.Client = {};
    p9.chargeMaid = u3.new();
    p9.overchargeStartTime = 0;
    p9.snowballNum = {};
end;

function u7.KnitStart(u10) -- Line: 48
    -- upvalues: ProjectileSourceController (copy), ClientSyncEvents (copy), SnowballLauncherUtil (copy)
    ProjectileSourceController.KnitStart(u10);
    ClientSyncEvents.ProjectileLaunched:connect(function(p11) -- Line: 51
        -- upvalues: u10 (copy), SnowballLauncherUtil (ref)
        if p11:isCancelled() then
            return nil;
        end;

        if p11.projectileType ~= "spread_frozen_snowball" then
            return nil;
        end;

        if not p11.shooter then
            return nil;
        end;

        if u10.snowballNum[p11.shooter] == nil then
            u10.snowballNum[p11.shooter] = 0;
        end;

        local v12 = u10.snowballNum[p11.shooter];
        local v13 = v12 == nil and 0 or v12;
        local v14 = SnowballLauncherUtil.getForce(p11.projectile, v13);

        if v14 then
            local PrimaryPart = p11.projectile.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart:ApplyImpulse(v14);
            end;
        end;

        u10.snowballNum[p11.shooter] = SnowballLauncherUtil.getNextNum(v13);
    end);
end;

function u7.isRelevantItem(p15, p16) -- Line: 89
    -- upvalues: ItemType (copy)
    return p16.itemType == ItemType.SNOWBALL_LAUNCHER;
end;

function u7.getProjectileSource(p17, p18) -- Line: 92
    -- upvalues: SnowballLauncherUtil (copy), SnowballLauncherMode (copy)
    local v19 = p17:getCurrentMode();

    if p17:isDoneCharging() then
        return SnowballLauncherUtil.SnowballLauncherProjectile[v19];
    end;

    return SnowballLauncherUtil.SnowballLauncherProjectile[SnowballLauncherMode.BASE];
end;

function u7.getAmmoType(p20, p21) -- Line: 100
    -- upvalues: SnowballLauncherUtil (copy)
    return SnowballLauncherUtil.ammoType;
end;

function u7.onStartCharging(p22) -- Line: 103
    -- upvalues: AbilityId (copy), AbilityState (copy)
    p22:setAbilityState(AbilityId.SNOWBALL_LAUNCHER_CYCLE, AbilityState.DISABLED);
    p22.overchargeStartTime = 0;
end;

function u7.onStopCharging(p23) -- Line: 107
    -- upvalues: AbilityId (copy), AbilityState (copy)
    p23:setAbilityState(AbilityId.SNOWBALL_LAUNCHER_CYCLE, AbilityState.READY);
    p23.chargeMaid:DoCleaning();
end;

function u7.onLaunch(p24, u25) -- Line: 111
    -- upvalues: SnowballLauncherMode (copy), Players (copy), SNOWBALL_LAUNCHER_CYCLE (copy), SnowballLauncherUtil (copy), InventoryUtil (copy), u3 (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), RuntimeLib (copy), KnitClient2 (copy)
    local v26 = p24:getCurrentMode();

    if v26 ~= SnowballLauncherMode.BASE then
        Players.LocalPlayer:SetAttribute(SNOWBALL_LAUNCHER_CYCLE, SnowballLauncherUtil.getNextMode(v26));
    end;

    if v26 ~= SnowballLauncherMode.RAPID and v26 ~= SnowballLauncherMode.SPREAD then
        return nil;
    end;

    if p24:isDoneCharging() then
        local u27 = p24:getHandItem();
        local u28 = p24:getAmmoType(u27.itemType);
        local u29;

        if u28 then
            local v30 = InventoryUtil.getToolFromInventory(Players.LocalPlayer, u28);

            if v30 ~= nil then
                v30 = v30.amount;
            end;

            u29 = (v30 == nil and 0 or v30) - 1;
        else
            u29 = 0;
        end;

        local projectileHandler = p24.projectileHandler;
        local u31 = SnowballLauncherUtil.SnowballLauncherProjectile[v26];
        local u32 = u3.new();
        u32:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
            blockSprint = true,
            moveSpeedMultiplier = u31.walkSpeedMultiplier
        }));

        if u31.projectileType(u28) == "spread_frozen_snowball" then
            SoundManager:playSound(GameSound.SNOWBALL_LAUNCHER_SPREAD_SHOT);
        elseif u31.projectileType(u28) == "rapid_frozen_snowball" then
            SoundManager:playSound(GameSound.SNOWBALL_LAUNCHER_RAPID_SHOT);
        end;

        RuntimeLib.Promise.defer(function() -- Line: 147
            -- upvalues: u31 (copy), u25 (copy), u28 (copy), u29 (ref), KnitClient2 (ref), u27 (copy), projectileHandler (copy), u32 (copy)
            local multiShotCount = u31.multiShotCount;
            local v33 = multiShotCount == nil and 3 or multiShotCount;
            local multiShotDelay = u31.multiShotDelay;
            local v34 = multiShotDelay == nil and 0.1 or multiShotDelay;
            local v35 = false;
            local v36 = 0;

            while true do
                if v35 then
                    v36 = v36 + 1;
                else
                    v35 = true;
                end;

                if v36 >= v33 - 1 then
                    break;
                end;

                if v34 ~= 0 then
                    task.wait(v34);
                end;

                if u25() then
                    if u28 and u29 <= 0 then
                        break;
                    end;

                    u29 = u29 - 1;
                    KnitClient2.Controllers.ProjectileController:launchProjectile(u27.itemType, u28, projectileHandler, u27.tool, u31);
                end;
            end;

            u32:DoCleaning();
        end);
    end;
end;

function u7.onStartReload(p37) -- Line: 187
end;

function u7.getChargeTime(p38) -- Line: 189
    -- upvalues: SnowballLauncherUtil (copy)
    local v39 = p38:getCurrentMode();
    local multiShotChargeTime = SnowballLauncherUtil.SnowballLauncherProjectile[v39].multiShotChargeTime;

    return multiShotChargeTime == nil and 0 or multiShotChargeTime;
end;

function u7.isDoneCharging(p40) -- Line: 197
    local v41 = p40:getChargeTime();
    local v42;

    if v41 == 0 then
        v42 = true;
    elseif p40.overchargeStartTime == 0 then
        v42 = false;
    else
        v42 = v41 <= tick() - p40.overchargeStartTime;
    end;

    return v42;
end;

function u7.onMaxCharge(p43) -- Line: 201
    -- upvalues: SoundManager (copy), GameSound (copy), CollectionService (copy), u4 (copy), SnowballLauncherProgressBar (copy), SnowballLauncherUtil (copy), Players (copy)
    local v44 = p43:getChargeTime();

    if v44 == 0 then
        return nil;
    end;

    p43.overchargeStartTime = tick();
    SoundManager:playSound(GameSound.SNOWBALL_LAUNCHER_CHARGE_UP);
    local u45 = true;
    p43.chargeMaid:GiveTask(function() -- Line: 209
        -- upvalues: u45 (ref)
        u45 = false;
    end);
    task.delay(v44, function() -- Line: 212
        -- upvalues: u45 (ref), CollectionService (ref)
        if u45 then
            local function _(p46) -- Line: 215
                p46.Color = ColorSequence.new(Color3.fromRGB(112, 219, 255));
            end;

            for i, v in CollectionService:GetTagged("projectile-preview-beam") do
                local _ = i - 1;
                v.Color = ColorSequence.new(Color3.fromRGB(112, 219, 255));
            end;
        end;
    end);
    local u47 = u4.mount(u4.createElement("ScreenGui", {}, { u4.createElement(SnowballLauncherProgressBar, {
            chargeTime = v44,
            title = SnowballLauncherUtil.getTitle(p43:getCurrentMode())
        }) }), Players.LocalPlayer:WaitForChild("PlayerGui"), "ChargeSnowballLauncher");
    p43.chargeMaid:GiveTask(function() -- Line: 229
        -- upvalues: u4 (ref), u47 (copy)
        u4.unmount(u47);
    end);
end;

function u7.getCurrentMode(p48) -- Line: 233
    -- upvalues: Players (copy), SNOWBALL_LAUNCHER_CYCLE (copy), SnowballLauncherMode (copy)
    local v49 = Players.LocalPlayer:GetAttribute(SNOWBALL_LAUNCHER_CYCLE);

    if v49 == nil then
        v49 = SnowballLauncherMode.POWER;
    end;

    return v49;
end;

function u7.setAbilityState(p50, p51, p52) -- Line: 240
    -- upvalues: Flamework (copy)
    local v53 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(p51);

    if not v53 then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v53, p52);
end;

KnitClient.CreateController(u7.new());

return nil;
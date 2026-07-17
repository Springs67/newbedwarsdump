-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local MobileButton = v1.MobileButton;
local MobileTouchType = v1.MobileTouchType;
local PressMode = v1.PressMode;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v4.ContextActionService;
local HttpService = v4.HttpService;
local Players = v4.Players;
local RunService = v4.RunService;
local UserInputService = v4.UserInputService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local FrostyStaffUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "frosty-gun", "frosty-gun-util").FrostyStaffUtil;
local GrapplingHookFunctions = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "grappling-hook", "grappling-hook-util").GrapplingHookFunctions;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ProjectileMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta;
local Setting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting;
local SharedSyncEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ProjectileController = RuntimeLib.import(script, script.Parent, "projectile-controller").ProjectileController;
local v5 = setmetatable({}, {
    __tostring = function() -- Line: 43, Name: __tostring
        return "ProjectileSourceController";
    end,

    __index = HandKnitController
});
v5.__index = v5;

function v5.constructor(p6, ...) -- Line: 49
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p6, ...);
    p6.maid = u2.new();
    p6.uiMaid = u2.new();
    p6.aimingMaid = u2.new();
    p6.reloadingWeaponSet = {};
end;

function v5.KnitStart(p7) -- Line: 56
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), SyncEventPriority (copy), EntityUtil (copy), StatusEffectUtil (copy), SoundManager (copy), Theme (copy)
    HandKnitController.KnitStart(p7);
    ClientSyncEvents.StartLaunchProjectile:setPriority(SyncEventPriority.HIGH):connect(function(p8) -- Line: 58
        -- upvalues: EntityUtil (ref), StatusEffectUtil (ref), SoundManager (ref), Theme (ref)
        if p8:isCancelled() then
            return nil;
        end;

        local v9 = EntityUtil:getLocalPlayerEntity();

        if not v9 then
            return nil;
        end;

        if not p8.projectileSource.blockingStatusEffects then
            return nil;
        end;

        if StatusEffectUtil:hasAnyActive(v9:getInstance(), p8.projectileSource.blockingStatusEffects) then
            SoundManager:playSound(Theme.sound.uiDisabled);
            p8:setCancelled(true);
        end;
    end);
end;

function v5.onEnable(u10, u11, u12) -- Line: 75
    -- upvalues: getItemMeta (copy), GameAnimationUtil (copy), Players (copy), ClientSyncEvents (copy), Setting (copy), Flamework (copy), HttpService (copy), SharedSyncEvents (copy), RunService (copy), MobileTouchType (copy), UserInputService (copy), ContextActionService (copy), KnitClient (copy)
    u10.maid:DoCleaning();
    local projectileSource = getItemMeta(u11.itemType).projectileSource;

    if projectileSource ~= nil then
        projectileSource = projectileSource.thirdPerson;

        if projectileSource ~= nil then
            projectileSource = projectileSource.idleAnimation;
        end;
    end;

    if projectileSource ~= 0 and (projectileSource == projectileSource and projectileSource) then
        u10:setupYield(function() -- Line: 87
            -- upvalues: GameAnimationUtil (ref), Players (ref), projectileSource (copy), u10 (copy)
            local u13 = GameAnimationUtil:playAnimation(Players.LocalPlayer, projectileSource);
            u10.maid:GiveTask(function() -- Line: 89
                -- upvalues: u13 (copy)
                local v14 = u13;

                if v14 ~= nil then
                    v14:Stop();
                end;
            end);

            return function() -- Line: 95
                -- upvalues: u13 (copy)
                if u13 then
                    u13:Stop();
                end;
            end;
        end);
    end;

    u10.maid:GiveTask(ClientSyncEvents.SettingChanged:connect(function(p15) -- Line: 102
        -- upvalues: Setting (ref), u10 (copy), u12 (copy)
        if p15.setting ~= Setting.MOBILE_PROJECTILE_BUTTON then
            return nil;
        end;

        if not u10:isEnabled() then
            return nil;
        end;

        if p15.value == true then
            u10:displayMobileButton(u12);

            return;
        end;

        u10.uiMaid:DoCleaning();
    end));
    local v16 = u10:getProjectileSource(u11);
    local u17 = u10:getCooldownId(v16, u11.itemType);

    if u10.reloadingWeaponSet[u11.itemType] ~= nil then
        local cooldown = ClientSyncEvents.ItemCooldownModifierCheck:fire(v16.fireDelaySec).cooldown;
        local v18 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController");
        local v19 = {};
        local v20;

        if v16.cooldownBar then
            v20 = {};
            local cooldownBar = v16.cooldownBar;

            if cooldownBar ~= nil then
                cooldownBar = cooldownBar.colorGradient;
            end;

            v20.colorGradient = cooldownBar;
            local cooldownBar2 = v16.cooldownBar;

            if cooldownBar2 ~= nil then
                cooldownBar2 = cooldownBar2.title;
            end;

            v20.title = cooldownBar2;
        else
            v20 = nil;
        end;

        v19.cooldownBar = v20;
        v18:setOnCooldown(u17, cooldown, v19);
        task.spawn(function() -- Line: 150
            -- upvalues: u10 (copy), u12 (copy)
            u10:onStartReload(u12);
        end);
    end;

    local u21 = "projectile-source-" .. HttpService:GenerateGUID(false);
    u10.maid:GiveTask(u10.aimingMaid);
    local u22 = nil;
    SharedSyncEvents.HookFunctionSwapEvent:connect(function(p23) -- Line: 157
        -- upvalues: u10 (copy)
        u10.hookStatus = p23.hookFunction;
    end);
    u10:displayMobileButton(u12);
    local v30 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = u21,

        boundFunction = function(p24, p25, u26) -- Line: 164, Name: boundFunction
            -- upvalues: u10 (copy), u22 (ref), u12 (copy), RunService (ref), u11 (copy), Flamework (ref), u17 (copy)
            if p25 == Enum.UserInputState.Begin then
                if u10.projectileHandler then
                    return nil;
                end;

                if not u10:canLaunch() then
                    return nil;
                end;

                if u26.UserInputType == Enum.UserInputType.Touch then
                    u22 = u26;
                end;

                local function u29() -- Line: 175
                    -- upvalues: u10 (ref), u12 (ref), u26 (copy), RunService (ref), u11 (ref)
                    if u10.projectileHandler then
                        return nil;
                    end;

                    if not u12() then
                        return nil;
                    end;

                    if not u10:canLaunch() then
                        return nil;
                    end;

                    if u26.UserInputState == Enum.UserInputState.End or u26.UserInputState == Enum.UserInputState.Cancel then
                        return nil;
                    end;

                    if u26.UserInputType == Enum.UserInputType.Touch then
                        local u27 = 0;
                        RunService:BindToRenderStep("projectile-mobile-confirm", 250, function(p28) -- Line: 191
                            -- upvalues: u27 (ref), u10 (ref), RunService (ref), u11 (ref), u26 (ref)
                            u27 = u27 + p28;

                            if u27 >= 0.3 then
                                if u10.projectileHandler then
                                    return nil;
                                end;

                                RunService:UnbindFromRenderStep("projectile-mobile-confirm");
                                u10:beginHolding(u11, u26, u10.aimingMaid, false);
                            end;
                        end);

                        return nil;
                    end;

                    u10:beginHolding(u11, nil, u10.aimingMaid, false);
                end;

                if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(u17) then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(u17, "callback", function() -- Line: 206
                        -- upvalues: u29 (copy)
                        u29();
                    end);

                    return nil;
                end;

                u29();
            elseif p25 == Enum.UserInputState.End then
                if u22 and u26 ~= u22 then
                    return nil;
                end;

                u22 = nil;
                u10:releaseChargeInput(u10.aimingMaid, u12, u26);
            end;

            return Enum.ContextActionResult.Pass;
        end,

        mobile = {
            touchType = MobileTouchType.TouchBeginEnd
        },
        priority = Enum.ContextActionPriority.Medium.Value
    });
    u10.maid:GiveTask(v30);
    u10.maid:GiveTask(UserInputService.TouchMoved:Connect(function(p31, p32) -- Line: 227
        -- upvalues: u22 (ref), Players (ref), RunService (ref)
        if p31 ~= u22 then
            return nil;
        end;

        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:FindFirstChildWhichIsA("Humanoid");

            if Character ~= nil then
                Character = Character.MoveDirection;
            end;
        end;

        if Character ~= nil and Character ~= Vector3.new() then
            pcall(function() -- Line: 240
                -- upvalues: RunService (ref)
                return RunService:UnbindFromRenderStep("projectile-mobile-confirm");
            end);
        end;
    end));
    u10.maid:GiveTask(function() -- Line: 245
        -- upvalues: ContextActionService (ref), u21 (copy), KnitClient (ref), u10 (copy), RunService (ref), u22 (ref)
        ContextActionService:UnbindAction(u21);
        KnitClient.Controllers.ProjectileController:disableTargeting();
        u10.projectileHandler = nil;
        pcall(function() -- Line: 249
            -- upvalues: RunService (ref)
            return RunService:UnbindFromRenderStep("projectile-mobile-confirm");
        end);
        u22 = nil;
    end);
end;

function v5.beginHolding(u33, u34, p35, p36, p37) -- Line: 255
    -- upvalues: getItemMeta (copy), ClientSyncEvents (copy), GrapplingHookFunctions (copy), InventoryUtil (copy), Players (copy), EntityUtil (copy), ProjectileMeta (copy), KnitClient (copy), SoundManager (copy), RandomUtil (copy), ProjectileController (copy), Workspace (copy), DeviceUtil (copy), RuntimeLib (copy), RunService (copy)
    local v38 = getItemMeta(u34.itemType);
    local projectileSource = v38.projectileSource;

    if projectileSource ~= nil then
        projectileSource = projectileSource.ammoItemTypes;
    end;

    if projectileSource then
        projectileSource = not u33:getAmmoType(u34.itemType);
    end;

    if projectileSource then
        return false;
    end;

    if ClientSyncEvents.BeginProjectileTargeting:fire(u34, p35):isCancelled() then
        return false;
    end;

    local u39 = u33:getProjectileSource(u34);
    local v40 = u33:getAmmoType(u34.itemType);

    if u39.waitForHit and u33.hookStatus ~= GrapplingHookFunctions.HOOK_CHAMBERED then
        return false;
    end;

    local projectileSource2 = v38.projectileSource;

    if projectileSource2 ~= nil then
        projectileSource2 = projectileSource2.ammoItemTypes;
    end;

    if projectileSource2 ~= nil or v40 ~= nil then
        if v40 == nil then
            return false;
        end;

        if not InventoryUtil.hasEnough(Players.LocalPlayer, v40, 1) then
            return false;
        end;
    end;

    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if Character then
        if not EntityUtil:getEntity(Players.LocalPlayer) then
            return false;
        end;

        u33:onStartCharging();
        p36:GiveTask(function() -- Line: 305
            -- upvalues: u33 (copy)
            return u33:onStopCharging();
        end);
        local walkSpeedMultiplier = u39.walkSpeedMultiplier;

        if walkSpeedMultiplier ~= 0 and (walkSpeedMultiplier == walkSpeedMultiplier and walkSpeedMultiplier) then
            local v41 = ProjectileMeta[u39.projectileType(v40)];
            local v42;

            if v41 == nil then
                v42 = v41;
            else
                v42 = v41.getProjectileOverridesFunction;
            end;

            local v43;

            if v42 then
                v43 = v41.getProjectileOverridesFunction(Players.LocalPlayer);
            else
                v43 = nil;
            end;

            local v44;

            if v43 then
                v44 = v43.walkSpeedMultiplierOverride;
            else
                v44 = v43;
            end;

            if v44 == 0 or (v44 ~= v44 or not v44) then
                p36:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    blockSprint = true,
                    moveSpeedMultiplier = u39.walkSpeedMultiplier
                }));
            else
                local v45 = v43.walkSpeedMultiplierOverride ~= 1;
                p36:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    moveSpeedMultiplier = v43.walkSpeedMultiplierOverride,
                    blockSprint = v45
                }));
            end;
        end;

        local v46 = u39.chargeBeginSound and SoundManager:playSound(RandomUtil.fromList(unpack(u39.chargeBeginSound)));

        if v46 then
            p36:GiveTask(v46);
        end;

        local itemType = u34.itemType;
        local v47 = u39.projectileType(v40);
        local v48 = {};
        local minStrengthScalar = u39.minStrengthScalar;
        v48.initialVelocityMultiplier = minStrengthScalar == nil and 1 or minStrengthScalar;
        local v49;

        if p37 then
            v49 = Workspace.CurrentCamera;

            if v49 ~= nil then
                v49 = v49.ViewportSize / 2 - Vector2.new(0, game:GetService("GuiService"):GetGuiInset().Y / 2);
            end;
        else
            v49 = nil;
        end;

        v48.lockedAimPoint = v49;
        local sword = v38.sword;

        if sword ~= nil then
            sword = sword.chargedAttack;
        end;

        v48.displayBeamDelay = sword and 0.25 or nil;
        local u50 = ProjectileController:enableTargeting(itemType, v47, u39, p35, v48);
        u33.projectileHandler = u50;
        u33.projectileHandler.projectileSourceController = u33;
        u33.projectileHandler.player = Players.LocalPlayer;
        local sword2 = v38.sword;

        if sword2 ~= nil then
            sword2 = sword2.chargedAttack;
        end;

        if sword2 then
            if DeviceUtil.isMobileControls() then
                KnitClient.Controllers.SwordChargeController:startCharging(u34.itemType);
            end;

            task.delay(0.25, function() -- Line: 383
                -- upvalues: KnitClient (ref), u34 (copy)
                if not KnitClient.Controllers.SwordChargeController:isWeaponCharging(u34.itemType) then
                    KnitClient.Controllers.ProjectileController:disableTargeting();
                end;
            end);
        end;

        local maxStrengthChargeSec = u39.maxStrengthChargeSec;

        if maxStrengthChargeSec == 0 or (maxStrengthChargeSec ~= maxStrengthChargeSec or not maxStrengthChargeSec) then
            u33:onMaxCharge();
        else
            local maxChargeTime = ClientSyncEvents.ProjectileMaxChargeTimeModifierCheck:fire(u39.maxStrengthChargeSec).maxChargeTime;
            local u51 = true;
            u33.maid:GiveTask(function() -- Line: 394
                -- upvalues: u51 (ref)
                u51 = false;
            end);
            RuntimeLib.Promise.defer(function() -- Line: 397
                -- upvalues: u50 (copy), u51 (ref), u33 (copy), RunService (ref), maxChargeTime (ref), u39 (copy), ClientSyncEvents (ref), u34 (copy)
                u50.drawDurationSeconds = 0;
                local v52 = false;

                while u51 and u50 == u33.projectileHandler do
                    local v53 = u50;
                    v53.drawDurationSeconds = v53.drawDurationSeconds + RunService.RenderStepped:Wait();
                    local v54 = math.min(1, u50.drawDurationSeconds / maxChargeTime);
                    local minStrengthScalar2 = u39.minStrengthScalar;
                    u50.velocityMultiplier = v54 + (1 - v54) * (minStrengthScalar2 == nil and 0.5 or minStrengthScalar2);

                    if not v52 and v54 >= 1 then
                        ClientSyncEvents.ProjectileMaxCharged:fire(u34.itemType);
                        u33:onMaxCharge();
                        v52 = true;
                    end;
                end;
            end);
        end;
    end;

    return true;
end;

function v5.fireWithCurrentData(u55, p56, u57) -- Line: 422
    -- upvalues: ClientSyncEvents (copy), getItemMeta (copy), DeviceUtil (copy), KnitClient (copy), Flamework (copy)
    if not u55:canLaunch() then
        return nil;
    end;

    if u55.bufferPromise then
        u55.bufferPromise:cancel();
        u55.bufferPromise = nil;
    end;

    u55.aimingMaid:DoCleaning();

    if u55.projectileHandler then
        local u58 = u55:getHandItem();
        local v59 = u55:getProjectileSource(u58);
        local v60 = u55:getAmmoType(u58.itemType);

        if u55:onLaunch(u57) == false then
            return nil;
        end;

        if not u57() then
            return nil;
        end;

        if ClientSyncEvents.ProjectileTargetingEnded:fire(u58, p56):isCancelled() then
            return false;
        end;

        local v61 = getItemMeta(u58.itemType);
        local sword = v61.sword;

        if sword ~= nil then
            sword = sword.chargedAttack;
        end;

        if sword and DeviceUtil.isMobileControls() then
            KnitClient.Controllers.SwordChargeController:stopCharging(u58.itemType);
        end;

        local sword2 = v61.sword;

        if sword2 ~= nil then
            sword2 = sword2.chargedAttack;
        end;

        if sword2 then
            sword2 = v61.projectileSource;
        end;

        if sword2 then
            KnitClient.Controllers.ProjectileController:disableTargeting();

            return nil;
        end;

        KnitClient.Controllers.ProjectileController:launchProjectile(u58.itemType, v60, u55.projectileHandler, u58.tool, v59);
        local cooldown = ClientSyncEvents.ProjectileCooldownModifierCheck:fire(v59.fireDelaySec).cooldown;
        local v62 = u55:getProjectileOverrides();

        if v62 then
            local cooldownOverride = v62.cooldownOverride;

            if cooldownOverride ~= 0 and (cooldownOverride == cooldownOverride and cooldownOverride) then
                cooldown = v62.cooldownOverride;
            end;
        end;

        local v63 = u55:getCooldownId(v59, u58.itemType);
        local v64 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController");
        local v65 = {};
        local v66;

        if v59.cooldownBar then
            v66 = {};
            local cooldownBar = v59.cooldownBar;

            if cooldownBar ~= nil then
                cooldownBar = cooldownBar.colorGradient;
            end;

            v66.colorGradient = cooldownBar;
            local cooldownBar2 = v59.cooldownBar;

            if cooldownBar2 ~= nil then
                cooldownBar2 = cooldownBar2.title;
            end;

            v66.title = cooldownBar2;
        else
            v66 = nil;
        end;

        v65.cooldownBar = v66;
        v64:setOnCooldown(v63, cooldown, v65);
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(v63, "reloading_clear", function() -- Line: 506
            -- upvalues: u55 (copy), u58 (copy)
            u55.reloadingWeaponSet[u58.itemType] = nil;
        end);

        if v59.activeReload == true then
            u55.reloadingWeaponSet[u58.itemType] = true;
        end;

        task.spawn(function() -- Line: 516
            -- upvalues: u55 (copy), u57 (copy)
            u55:onStartReload(u57);
        end);
    end;
end;

function v5.releaseChargeInput(u67, p68, u69, p70) -- Line: 521
    -- upvalues: RunService (copy), ClientSyncEvents (copy), getItemMeta (copy), DeviceUtil (copy), KnitClient (copy), Flamework (copy), SoundManager (copy), RandomUtil (copy)
    if not u67:canLaunch() then
        return nil;
    end;

    if u67.bufferPromise then
        u67.bufferPromise:cancel();
        u67.bufferPromise = nil;
    end;

    pcall(function() -- Line: 529
        -- upvalues: RunService (ref)
        return RunService:UnbindFromRenderStep("projectile-mobile-confirm");
    end);
    p68:DoCleaning();

    if u67.projectileHandler then
        local u71 = u67:getHandItem();
        local v72 = u67:getProjectileSource(u71);
        local v73 = u67:getAmmoType(u71.itemType);

        if u67:onLaunch(u69) == false then
            return nil;
        end;

        if not u69() then
            return nil;
        end;

        if ClientSyncEvents.ProjectileTargetingEnded:fire(u71, p70):isCancelled() then
            return false;
        end;

        local v74 = getItemMeta(u71.itemType);
        local sword = v74.sword;

        if sword ~= nil then
            sword = sword.chargedAttack;
        end;

        if sword and DeviceUtil.isMobileControls() then
            KnitClient.Controllers.SwordChargeController:stopCharging(u71.itemType);
        end;

        local sword2 = v74.sword;

        if sword2 ~= nil then
            sword2 = sword2.chargedAttack;
        end;

        if sword2 then
            sword2 = v74.projectileSource;
        end;

        if sword2 then
            KnitClient.Controllers.ProjectileController:disableTargeting();

            return nil;
        end;

        KnitClient.Controllers.ProjectileController:launchProjectile(u71.itemType, v73, u67.projectileHandler, u71.tool, v72);
        local cooldown = ClientSyncEvents.ProjectileCooldownModifierCheck:fire(v72.fireDelaySec).cooldown;
        local v75 = u67:getProjectileOverrides();

        if v75 then
            local cooldownOverride = v75.cooldownOverride;

            if cooldownOverride ~= 0 and (cooldownOverride == cooldownOverride and cooldownOverride) then
                cooldown = v75.cooldownOverride;
            end;
        end;

        local v76 = u67:getCooldownId(v72, u71.itemType);
        local v77 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController");
        local v78 = {};
        local v79;

        if v72.cooldownBar then
            v79 = {};
            local cooldownBar = v72.cooldownBar;

            if cooldownBar ~= nil then
                cooldownBar = cooldownBar.colorGradient;
            end;

            v79.colorGradient = cooldownBar;
            local cooldownBar2 = v72.cooldownBar;

            if cooldownBar2 ~= nil then
                cooldownBar2 = cooldownBar2.title;
            end;

            v79.title = cooldownBar2;
        else
            v79 = nil;
        end;

        v78.cooldownBar = v79;
        v77:setOnCooldown(v76, cooldown, v78);
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(v76, "reloading_clear", function() -- Line: 607
            -- upvalues: u67 (copy), u71 (copy)
            u67.reloadingWeaponSet[u71.itemType] = nil;
        end);

        if v72.activeReload == true then
            u67.reloadingWeaponSet[u71.itemType] = true;
        end;

        task.spawn(function() -- Line: 617
            -- upvalues: u67 (copy), u69 (copy)
            u67:onStartReload(u69);
        end);
        local reload = v72.reload;

        if reload ~= nil then
            reload = reload.reloadSound;
        end;

        local v80 = reload and SoundManager:playSound(RandomUtil.fromList(unpack(reload)));

        if v80 then
            u67.maid:GiveTask(v80);
        end;
    end;

    KnitClient.Controllers.ProjectileController:disableTargeting();
    u67.projectileHandler = nil;
end;

function v5.onDisable(p81) -- Line: 635
    p81.maid:DoCleaning();
    p81.uiMaid:DoCleaning();
end;

function v5.onMaxCharge(p82) -- Line: 639
end;

function v5.canLaunch(p83) -- Line: 641
    return true;
end;

function v5.getProjectileSource(p84, p85) -- Line: 644
    -- upvalues: getItemMeta (copy)
    return getItemMeta(p85.itemType).projectileSource;
end;

function v5.getAmmoType(p86, p87) -- Line: 647
    -- upvalues: getItemMeta (copy), ClientStore (copy)
    local projectileSource = getItemMeta(p87).projectileSource;

    if projectileSource ~= nil then
        projectileSource = projectileSource.ammoItemTypes;
    end;

    if projectileSource then
        local hotbar = ClientStore:getState().Inventory.observedInventory.hotbar;

        for _, v in projectileSource do
            local function _(p88) -- Line: 659
                -- upvalues: v (copy)
                local item = p88.item;

                if item ~= nil then
                    item = item.itemType;
                end;

                return item == v;
            end;

            local v89 = nil;

            for i, v2 in hotbar do
                local _ = i - 1;
                local item = v2.item;

                if item ~= nil then
                    item = item.itemType;
                end;

                if item == v == true then
                    v89 = v2;
                    break;
                end;
            end;

            if v89 then
                return v;
            end;
        end;

        local inventory = ClientStore:getState().Inventory.observedInventory.inventory;

        for _, v in projectileSource do
            local function _(p90) -- Line: 684
                -- upvalues: v (copy)
                return p90.itemType == v;
            end;

            local v91 = nil;

            for i, v2 in inventory.items do
                local _ = i - 1;

                if v2.itemType == v == true then
                    v91 = v2;
                    break;
                end;
            end;

            if v91 then
                return v;
            end;
        end;
    end;

    return nil;
end;

function v5.displayMobileButton(u92, u93) -- Line: 704
    -- upvalues: KnitClient (copy), Setting (copy), DeviceUtil (copy), u2 (copy), u3 (copy), MobileButton (copy), BedwarsImageId (copy), Flamework (copy), PressMode (copy), FrostyStaffUtil (copy), ItemType (copy), RunService (copy), Players (copy)
    local u94 = u92:getHandItem();

    if not u94 then
        return nil;
    end;

    local u95 = u92:getCooldownId(u92:getProjectileSource(u94), u94.itemType);

    if KnitClient.Controllers.SettingsController:getSetting(Setting.MOBILE_PROJECTILE_BUTTON) and DeviceUtil.isMobileControls() then
        u92:setupYield(function() -- Line: 713
            -- upvalues: KnitClient (ref), u2 (ref), u3 (ref), MobileButton (ref), BedwarsImageId (ref), Flamework (ref), PressMode (ref), u92 (copy), u93 (copy), FrostyStaffUtil (ref), u94 (copy), ItemType (ref), RunService (ref), Players (ref), u95 (copy)
            KnitClient.Controllers.MobileLayoutLoadController:onMobileLayoutLoaded():await();
            local u96 = u2.new();
            local u104 = u3.mount(u3.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u3.createElement(MobileButton, {
                    Image = BedwarsImageId.BOW_MOBILE,
                    Position = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonPosition("FireProjectile"),
                    Size = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonSize("FireProjectile"),
                    PressMode = PressMode.FREE_MOVING_HOLD,

                    OnPressDown = function() -- Line: 724, Name: OnPressDown
                        -- upvalues: u92 (ref), u93 (ref), FrostyStaffUtil (ref), u94 (ref), KnitClient (ref), ItemType (ref), u96 (copy), RunService (ref), Players (ref), Flamework (ref), u95 (ref)
                        if u92.projectileHandler then
                            return nil;
                        end;

                        local function u101() -- Line: 728
                            -- upvalues: u92 (ref), u93 (ref), FrostyStaffUtil (ref), u94 (ref), KnitClient (ref), ItemType (ref), u96 (ref), RunService (ref), Players (ref)
                            if u92.projectileHandler then
                                return nil;
                            end;

                            if not u93() then
                                return nil;
                            end;

                            if not u92:canLaunch() then
                                return nil;
                            end;

                            if FrostyStaffUtil:isFrostyStaff(u94.itemType) and KnitClient.Controllers.FrostyGunController:canSpray() then
                                KnitClient.Controllers.FrostyGunController:beginSprayHolding(true);
                            end;

                            if u94.itemType == ItemType.AQUA_47 then
                                KnitClient.Controllers.RapidWaterGunController:beginHolding(true);
                            end;

                            if not u92:beginHolding(u94, nil, u92.aimingMaid, true) then
                                return nil;
                            end;

                            u96:DoCleaning();
                            local u97 = 0;
                            u96:GiveTask(RunService.RenderStepped:Connect(function(p98) -- Line: 751
                                -- upvalues: u97 (ref), Players (ref)
                                u97 = u97 + p98;
                                local u99 = math.clamp(u97 * 3, 0, 0.8);
                                local Character = Players.LocalPlayer.Character;

                                if Character ~= nil then
                                    local function _(p100) -- Line: 757
                                        -- upvalues: u99 (copy)
                                        if p100:IsA("BasePart") then
                                            p100.LocalTransparencyModifier = math.max(p100.LocalTransparencyModifier, u99);
                                        end;
                                    end;

                                    for i, descendant in Character:GetDescendants() do
                                        local _ = i - 1;

                                        if descendant:IsA("BasePart") then
                                            descendant.LocalTransparencyModifier = math.max(descendant.LocalTransparencyModifier, u99);
                                        end;
                                    end;
                                end;
                            end));
                        end;

                        if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(u95) then
                            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(u95, "callback", function() -- Line: 769
                                -- upvalues: u101 (copy)
                                u101();
                            end);

                            return nil;
                        end;

                        u101();
                    end,

                    OnPressUp = function(p102) -- Line: 776, Name: OnPressUp
                        -- upvalues: u96 (copy), Players (ref), u92 (ref), u93 (ref)
                        u96:DoCleaning();
                        local Character = Players.LocalPlayer.Character;

                        if Character ~= nil then
                            local function _(p103) -- Line: 781
                                if p103:IsA("BasePart") then
                                    p103.LocalTransparencyModifier = 0;
                                end;
                            end;

                            for i, descendant in Character:GetDescendants() do
                                local _ = i - 1;

                                if descendant:IsA("BasePart") then
                                    descendant.LocalTransparencyModifier = 0;
                                end;
                            end;
                        end;

                        u92:releaseChargeInput(u92.aimingMaid, u93, p102);
                    end
                }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));
            u92.uiMaid:GiveTask(function() -- Line: 794
                -- upvalues: u3 (ref), u104 (copy)
                u3.unmount(u104);
            end);

            return function() -- Line: 797
                -- upvalues: u96 (copy), u92 (ref)
                u96:DoCleaning();
                u92.uiMaid:DoCleaning();
            end;
        end);
    end;
end;

function v5.getProjectileHandler(p105) -- Line: 804
    return p105.projectileHandler;
end;

function v5.clearProjectileHandler(p106) -- Line: 807
    -- upvalues: KnitClient (copy)
    KnitClient.Controllers.ProjectileController:disableTargeting();
    p106.projectileHandler = nil;
end;

function v5.getCooldownId(p107, p108, p109) -- Line: 811
    return p108.cooldownId or p109 .. "-proj-source";
end;

function v5.getProjectileOverrides(p110) -- Line: 814
    return {};
end;

return {
    ProjectileSourceController = v5
};
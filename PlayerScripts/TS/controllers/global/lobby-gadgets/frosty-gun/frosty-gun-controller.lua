-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local MobileTouchType = v1.MobileTouchType;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local RunService = v6.RunService;
local TweenService = v6.TweenService;
local UserInputService = v6.UserInputService;
local Workspace = v6.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local VignetteType = RuntimeLib.import(script, script.Parent.Parent.Parent, "effect", "vignette", "vignette-meta").VignetteType;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "frosty-gun", "frosty-gun-util");
local FrostyGunMode = v7.FrostyGunMode;
local FrostyStaffUtil = v7.FrostyStaffUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local MathUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "math-util").MathUtil;
local FrostedCircleProgressBar = RuntimeLib.import(script, script.Parent, "ui", "circle-progress-bar").FrostedCircleProgressBar;
local FrostyGunUiBase = RuntimeLib.import(script, script.Parent, "ui", "frosty-gun-bar-base").FrostyGunUiBase;
local u8 = nil;
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 50, Name: __tostring
        return "FrostyGunController";
    end,

    __index = HandKnitController
});
u9.__index = u9;

function u9.new(...) -- Line: 56
    -- upvalues: u9 (ref)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11) -- Line: 60
    -- upvalues: HandKnitController (copy), FrostyGunMode (copy), u3 (copy), DeviceUtil (copy), default (copy)
    HandKnitController.constructor(p11);
    p11.Name = "FrostyGunController";
    p11.projectileMode = FrostyGunMode.MIST;
    p11.sprayingSpeedMaid = u3.new();
    p11.sprayerModeMaid = u3.new();
    p11.YTargetOffset = DeviceUtil.isMobileControls() and 0.25 or 0.05;
    p11.userVisualEffectMap = {};
    p11.actionRequest = default.Client:Get("FrostyGunFireActionRequest");
    p11.abilityUiMaid = u3.new();
    p11.victimMap = {};
    p11.maid = u3.new();
    p11.tickCount = 0;
    p11.originalWaistPositions = {};
    p11.spraying = false;
end;

function u9.isRelevantItem(p12, p13) -- Line: 76
    -- upvalues: ItemType (copy)
    return (p13.itemType == ItemType.FROST_STAFF_3 or p13.itemType == ItemType.FROST_STAFF_2) and true or p13.itemType == ItemType.FROST_STAFF_1;
end;

function u9.KnitStart(u14) -- Line: 79
    -- upvalues: HandKnitController (copy), WatchCharacter (copy), Players (copy), ClientSyncEvents (copy), FrostyStaffUtil (copy), StatusEffectType (copy), KnitClient (copy), VignetteType (copy), StatusEffectUtil (copy), MathUtil (copy), EntityUtil (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), GameQueryUtil (copy), Workspace (copy), EffectUtil (copy), KnitClient2 (copy), AnimationType (copy), ItemType (copy), AbilityId (copy), FrostyGunMode (copy), ClientStore (copy), default (copy), u8 (ref), TweenService (copy), u3 (copy), u4 (copy)
    HandKnitController.KnitStart(u14);
    WatchCharacter(function(p15, p16) -- Line: 81
        -- upvalues: Players (ref), u14 (copy)
        if Players.LocalPlayer == p15 then
            local UpperTorso = p16:WaitForChild("UpperTorso", 3);

            if UpperTorso ~= nil then
                UpperTorso = UpperTorso:WaitForChild("Waist", 3);
            end;

            if UpperTorso and not u14.originalWaistC0 then
                if UpperTorso ~= nil then
                    UpperTorso = UpperTorso.C0;
                end;

                u14.originalWaistC0 = UpperTorso;
            end;
        else
            local UpperTorso = p16:WaitForChild("UpperTorso", 3);

            if UpperTorso ~= nil then
                UpperTorso = UpperTorso:WaitForChild("Waist", 3);
            end;

            local v17;

            if UpperTorso then
                v17 = not (u14.originalWaistPositions[p15] ~= nil);
            else
                v17 = UpperTorso;
            end;

            if v17 then
                u14.originalWaistPositions[p15] = UpperTorso.C0;
            end;
        end;
    end);
    ClientSyncEvents.ProjectileMaxCharged:connect(function(p18) -- Line: 117
        -- upvalues: FrostyStaffUtil (ref), u14 (copy)
        if FrostyStaffUtil:isFrostyStaff(p18.itemType) then
            u14:maxChargeEffect();
        end;
    end);
    ClientSyncEvents.ProjectileRender:connect(function(p19) -- Line: 122
        if p19.projectile.Name == "frosty_snowball_1" or (p19.projectile.Name == "frosty_snowball_2" or p19.projectile.Name == "frosty_snowball_3") then
            p19.cframe = p19.cframe * CFrame.Angles(0, p19.totalTime * 5 * 3.141592653589793, 0);
        end;
    end);
    ClientSyncEvents.StatusEffectAdded:connect(function(u20) -- Line: 130
        -- upvalues: StatusEffectType (ref), Players (ref), KnitClient (ref), VignetteType (ref), StatusEffectUtil (ref), MathUtil (ref), FrostyStaffUtil (ref), EntityUtil (ref), u14 (copy)
        if u20.statusEffect ~= StatusEffectType.COLD then
            return nil;
        end;

        if u20.entityInstance == Players.LocalPlayer.Character then
            KnitClient.Controllers.VignetteController:createVignette(VignetteType.COLD, {
                transparencyMultiplier = function() -- Line: 136, Name: transparencyMultiplier
                    -- upvalues: StatusEffectUtil (ref), u20 (copy), StatusEffectType (ref), MathUtil (ref), FrostyStaffUtil (ref)
                    local v21 = StatusEffectUtil:getStacks(u20.entityInstance, StatusEffectType.COLD);

                    return MathUtil.convertRange(v21, { 0, FrostyStaffUtil.MAX_COLD_STACK }, { 1.5, 1 });
                end
            });

            return nil;
        end;

        local v22 = EntityUtil:getEntity(u20.entityInstance);
        local v23 = EntityUtil:getLocalPlayerEntity();

        if not (v23 and (v22 and v23:canAttack(v22))) then
            return nil;
        end;

        u14.victimMap[u20.entityInstance] = true;
        u14:createSign(u20.entityInstance);
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p24) -- Line: 154
        -- upvalues: StatusEffectType (ref), u14 (copy), Players (ref), KnitClient (ref), VignetteType (ref)
        if p24.statusEffect ~= StatusEffectType.COLD then
            return nil;
        end;

        u14.victimMap[p24.entityInstance] = nil;
        u14:removeSign(p24.entityInstance);

        if p24.entityInstance == Players.LocalPlayer.Character then
            KnitClient.Controllers.VignetteController:destroyVignette(VignetteType.COLD);

            if u14.slowedSpeedMaid then
                u14.slowedSpeedMaid:Destroy();
                u14.slowedSpeedMaid = nil;
            end;

            return nil;
        end;
    end);
    ClientSyncEvents.StatusEffectChanged:connect(function(p25) -- Line: 174
        -- upvalues: StatusEffectType (ref), EntityUtil (ref), StatusEffectUtil (ref), FrostyStaffUtil (ref), Players (ref), u14 (copy), KnitClient (ref)
        if p25.statusEffect ~= StatusEffectType.COLD then
            return nil;
        end;

        local v26 = EntityUtil:getPlayerFromEntityInstance(p25.entityInstance);
        local v27 = StatusEffectUtil:getStacks(p25.entityInstance, StatusEffectType.COLD) / FrostyStaffUtil.MAX_COLD_STACK * FrostyStaffUtil.MAX_SLOW;

        if Players.LocalPlayer == v26 then
            local slowedSpeedMaid = u14.slowedSpeedMaid;

            if slowedSpeedMaid ~= nil then
                slowedSpeedMaid:Destroy();
            end;

            u14.slowedSpeedMaid = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                blockSprint = false,
                moveSpeedMultiplier = 1 - v27
            });
        end;
    end);
    ClientSyncEvents.StatusEffectAdded:connect(function(p28) -- Line: 194
        -- upvalues: StatusEffectType (ref), SoundManager (ref), GameSound (ref)
        if p28.statusEffect ~= StatusEffectType.FROZEN then
            return nil;
        end;

        local PrimaryPart = p28.entityInstance.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if PrimaryPart then
            SoundManager:playSound(GameSound.FROST_STAFF_FREEZE, {
                position = PrimaryPart
            });
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p29) -- Line: 209
        -- upvalues: StatusEffectType (ref), ReplicatedStorage (ref), GameQueryUtil (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
        if p29.statusEffect ~= StatusEffectType.FROZEN then
            return nil;
        end;

        local PrimaryPart = p29.entityInstance.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if PrimaryPart then
            local u30 = ReplicatedStorage.Assets.Effects.SmallIceBreakEffect:Clone();
            u30.Position = PrimaryPart;
            u30.Transparency = 1;
            u30.CanCollide = false;
            GameQueryUtil:setQueryIgnored(u30, true);
            u30.Parent = Workspace;
            EffectUtil:playEffects({ u30 }, nil, {
                destroyAfterSec = 0.75
            });
            task.delay(1, function() -- Line: 228
                -- upvalues: u30 (copy)
                u30:Destroy();
            end);
            SoundManager:playSound(GameSound.WINTER_MINER_ICE_BREAK, {
                position = PrimaryPart
            });
        end;
    end);
    KnitClient2.Controllers.PreloadController:runPreload({
        animations = { AnimationType.TORNADO_LAUNCHER_HOLD, AnimationType.SPEAR_STAB_1, AnimationType.ICE_MAGE_CHARGE },
        sounds = {
            GameSound.FROST_STAFF_FREEZE,
            GameSound.FROST_STAFF_CHARGE,
            GameSound.FROST_STAFF_SHOOT,
            GameSound.FROST_STAFF_LOOP,
            GameSound.WINTER_MINER_ICE_BREAK
        }
    });
    ClientSyncEvents.BeginProjectileTargeting:connect(function(p31) -- Line: 267
        -- upvalues: ItemType (ref), u14 (copy)
        if p31.handItem.itemType ~= ItemType.FROST_STAFF_3 and (p31.handItem.itemType ~= ItemType.FROST_STAFF_2 and p31.handItem.itemType ~= ItemType.FROST_STAFF_1) then
            return nil;
        end;

        local projectileMode = u14.projectileMode;

        if projectileMode == 0 or (projectileMode ~= projectileMode or not projectileMode) then
            p31:setCancelled(true);
        end;
    end);
    ClientSyncEvents.ProjectileLaunched:connect(function(p32) -- Line: 277
        -- upvalues: u14 (copy)
        if p32.projectileType ~= "frosty_snowball_1" and (p32.projectileType ~= "frosty_snowball_2" and p32.projectileType ~= "frosty_snowball_3") then
            return nil;
        end;

        local projectileMode = u14.projectileMode;

        if projectileMode == 0 or (projectileMode ~= projectileMode or not projectileMode) then
            p32:setCancelled(true);
        end;
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p33) -- Line: 286
        -- upvalues: AbilityId (ref), Players (ref), u14 (copy), FrostyGunMode (ref), ClientStore (ref)
        if p33.ability == AbilityId.FROSTY_GUN_SWAP and p33.userCharacter == Players.LocalPlayer.Character then
            if u14.projectileMode == FrostyGunMode.MIST then
                u14.projectileMode = FrostyGunMode.PROJECTILE;
                ClientStore:dispatch({
                    type = "FrostyGunSetMode",
                    frostyGunMode = u14.projectileMode
                });
                u14:disableSprayerMode();

                return;
            end;

            u14.projectileMode = FrostyGunMode.MIST;
            u14:enableSprayerMode();
            ClientStore:dispatch({
                type = "FrostyGunSetMode",
                frostyGunMode = u14.projectileMode
            });
        end;
    end);
    default.Client:Get("FrostyGunFireEffect"):Connect(function(p34) -- Line: 306
        -- upvalues: Players (ref), u14 (copy), EntityUtil (ref), u8 (ref), TweenService (ref)
        if p34.user == Players.LocalPlayer then
            return nil;
        end;

        local v35 = u14.userVisualEffectMap[p34.user];
        local v36;

        if v35 == nil then
            v36 = v35;
        else
            v36 = v35.maid;
        end;

        if not (v36 and v35) then
            return nil;
        end;

        local v37 = EntityUtil:getEntity(p34.user);

        if v37 ~= nil then
            v37 = v37:getHandItemInstanceFromCharacter();
        end;

        if v37 ~= nil then
            v37 = v37:WaitForChild("Handle", 1);

            if v37 ~= nil then
                v37 = v37:WaitForChild("EffectParticle", 1);
            end;
        end;

        if v37 then
            local Character = p34.user.Character;
            local v38;

            if Character == nil then
                v38 = Character;
            else
                v38 = Character:FindFirstChild("UpperTorso");
            end;

            local v39;

            if v38 == nil then
                v39 = v38;
            else
                v39 = v38:FindFirstChild("Waist");
            end;

            if v38 and v39 then
                local v40, v41 = u8(Character.PrimaryPart.CFrame, p34.targetPoint);
                local v42 = CFrame.new(0, 0, 0) * CFrame.Angles(v40, -3.141592653589793 + v41, 0);
                local v43 = { v39.C0:ToEulerAnglesXYZ() };

                local function _(p44, p45) -- Line: 352
                    return p44 + p45;
                end;

                if #v43 == 0 then
                    error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.");
                end;

                local v46 = v43[1];

                for i = 2, #v43 do
                    local _ = i - 1;
                    v46 = v46 + v43[i];
                end;

                local v47 = { v42:ToEulerAnglesXYZ() };

                local function _(p48, p49) -- Line: 367
                    return p48 + p49;
                end;

                if #v47 == 0 then
                    error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.");
                end;

                local v50 = v47[1];

                for i = 2, #v47 do
                    local _ = i - 1;
                    v50 = v50 + v47[i];
                end;

                if math.abs(v46 - v50) > 1e-6 and v35.originalWaist then
                    TweenService:Create(v39, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                        Transform = v35.originalWaist * v42
                    }):Play();
                end;
            end;

            v37.WorldCFrame = CFrame.new(v37.WorldPosition, p34.targetPoint);
        end;
    end);
    default.Client:Get("FrostyGunFireAction"):Connect(function(p51) -- Line: 391
        -- upvalues: Players (ref), u14 (copy), u3 (ref), TweenService (ref), EntityUtil (ref), u4 (ref), GameSound (ref)
        if p51.user == Players.LocalPlayer then
            return nil;
        end;

        if p51.keyHold then
            local v52 = u14.userVisualEffectMap[p51.user];

            if v52 ~= nil then
                local maid = v52.maid;

                if maid ~= nil then
                    maid:DoCleaning();
                end;
            end;

            local v53 = u3.new();
            local user = p51.user;

            if user ~= nil then
                user = user.Character;

                if user ~= nil then
                    user = user:FindFirstChild("UpperTorso");
                end;
            end;

            if user ~= nil then
                user = user:FindFirstChild("Waist");
            end;

            if user then
                local u54 = u14.originalWaistPositions[p51.user];

                if u54 == nil then
                    u54 = user.C0;
                end;

                v53:GiveTask(function() -- Line: 428
                    -- upvalues: TweenService (ref), user (copy), u54 (copy)
                    TweenService:Create(user, TweenInfo.new(0.085, Enum.EasingStyle.Linear), {
                        Transform = u54
                    }):Play();
                end);
                u14.userVisualEffectMap[p51.user] = {
                    maid = v53,
                    originalWaist = u54
                };
            end;

            local u55 = EntityUtil:getEntity(p51.user);

            if u55 ~= nil then
                u55 = u55:getHandItemInstanceFromCharacter();
            end;

            local v56;

            if u55 == nil then
                v56 = u55;
            else
                v56 = u55:FindFirstChild("Handle");
            end;

            if v56 then
                v53:GiveTask((u4("Sound", {
                    RollOffMinDistance = 20,
                    RollOffMaxDistance = 40,
                    Volume = 0.5,
                    Playing = true,
                    Looped = true,
                    SoundId = GameSound.FROST_STAFF_LOOP,
                    Parent = v56
                })));
            end;

            if u55 ~= nil then
                u55 = u55:WaitForChild("Handle", 1);

                if u55 ~= nil then
                    u55 = u55:WaitForChild("EffectParticle", 1);
                end;
            end;

            if u55 then
                local function _(p57) -- Line: 474
                    if p57:IsA("ParticleEmitter") then
                        p57.Enabled = true;
                    end;
                end;

                for i, child in u55:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("ParticleEmitter") then
                        child.Enabled = true;
                    end;
                end;

                v53:GiveTask(function() -- Line: 482
                    -- upvalues: u55 (copy)
                    local function _(p58) -- Line: 484
                        if p58:IsA("ParticleEmitter") then
                            p58.Enabled = false;
                        end;
                    end;

                    for i, child in u55:GetChildren() do
                        local _ = i - 1;

                        if child:IsA("ParticleEmitter") then
                            child.Enabled = false;
                        end;
                    end;
                end);
            end;
        else
            local v59 = u14.userVisualEffectMap[p51.user];

            if v59 ~= nil then
                v59.maid:DoCleaning();
            end;

            u14.userVisualEffectMap[p51.user] = nil;
        end;
    end);
end;

function u9.onStartCharging(p60) -- Line: 507
end;

function u9.onStopCharging(p61) -- Line: 509
end;

function u9.onLaunch(p62, p63) -- Line: 511
end;

function u9.onStartReload(p64, p65) -- Line: 513
end;

function u9.onEnable(u66, p67, p68) -- Line: 515
    -- upvalues: u3 (copy), Flamework (copy), CooldownId (copy), FrostyGunUiBase (copy), FrostyGunMode (copy)
    u66.stillEnable = p68;
    u66:setupYield(function() -- Line: 518
        -- upvalues: u3 (ref), Flamework (ref), CooldownId (ref), u66 (copy)
        local u69 = u3.new();
        u69:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(CooldownId.TORNADO_LAUNCHER));
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
            action = "ItemPrimary",
            actionId = "frosty-gun-swap",

            boundFunction = function(p70, p71, p72) -- Line: 524, Name: boundFunction
                -- upvalues: u66 (ref)
                if p71 == Enum.UserInputState.Begin then
                    u66:swap();
                end;
            end
        });

        return function() -- Line: 530
            -- upvalues: u69 (copy)
            u69:DoCleaning();
        end;
    end);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "FrostyGunBar",
        app = FrostyGunUiBase
    }, {
        ChangeAbility = function(p73) -- Line: 538, Name: ChangeAbility
            -- upvalues: u66 (copy)
            return u66:swap();
        end,

        Modes = { FrostyGunMode.MIST, FrostyGunMode.PROJECTILE }
    });
    u66.abilityUiMaid:GiveTask(function() -- Line: 543
        -- upvalues: Flamework (ref)
        return Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("FrostyGunBar");
    end);

    if u66.projectileMode == FrostyGunMode.MIST then
        u66:enableSprayerMode();
    else
        u66:disableSprayerMode();
    end;

    u66:enableStacksIndicator();
    u66.maid:GiveTask(u66.sprayerModeMaid);
    u66.maid:GiveTask(u66.sprayingSpeedMaid);
end;

function u9.onDisable(u74) -- Line: 555
    u74:setupYield(function() -- Line: 556
        -- upvalues: u74 (copy)
        u74:cleanUp();

        return function() -- Line: 558
        end;
    end);
    u74.stillEnable = nil;
    u74:clearIndicators();
    u74.abilityUiMaid:DoCleaning();
end;

function u9.beginSprayHolding(u75, p76) -- Line: 571
    -- upvalues: default (copy), Players (copy), KnitClient2 (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), EntityUtil (copy), u4 (copy), GameSound (copy), FrostyStaffUtil (copy), ClientSyncEvents (copy), KnitClient (copy), Workspace (copy)
    if u75.spraying then
        return nil;
    end;

    u75.spraying = true;
    default.Client:Get("FrostyGunFireActionRequest"):SendToServer({
        keyHold = true
    });
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:FindFirstChild("UpperTorso");
    end;

    if Character ~= nil then
        Character = Character:FindFirstChild("Waist");
    end;

    u75.sprayingSpeedMaid:GiveTask(KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
        moveSpeedMultiplier = 0.5,
        blockSprint = true
    }));
    local u77 = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.TORNADO_LAUNCHER_HOLD));
    local v78 = EntityUtil:getEntity(Players.LocalPlayer);

    if v78 ~= nil then
        v78 = v78:getHandItemInstanceFromCharacter();
    end;

    local v79;

    if v78 == nil then
        v79 = v78;
    else
        v79 = v78:FindFirstChild("Handle");
    end;

    if v79 then
        local v80 = u4("Sound", {
            RollOffMinDistance = 20,
            RollOffMaxDistance = 40,
            Volume = 0.5,
            Playing = true,
            Looped = true,
            SoundId = GameSound.FROST_STAFF_LOOP,
            Parent = v79
        });
        u75.sprayingSpeedMaid:GiveTask(v80);
    end;

    local u81;

    if v78 == nil then
        u81 = v78;
    else
        u81 = v78:WaitForChild("Handle", 1);

        if u81 ~= nil then
            u81 = u81:WaitForChild("EffectParticle", 1);
        end;
    end;

    if u81 then
        local function _(p82) -- Line: 632
            if p82:IsA("ParticleEmitter") then
                p82.Enabled = true;
            end;
        end;

        for i, child in u81:GetChildren() do
            local _ = i - 1;

            if child:IsA("ParticleEmitter") then
                child.Enabled = true;
            end;
        end;

        u75.sprayingSpeedMaid:GiveTask(function() -- Line: 640
            -- upvalues: u81 (copy)
            local function _(p83) -- Line: 642
                if p83:IsA("ParticleEmitter") then
                    p83.Enabled = false;
                end;
            end;

            for i, child in u81:GetChildren() do
                local _ = i - 1;

                if child:IsA("ParticleEmitter") then
                    child.Enabled = false;
                end;
            end;
        end);
    end;

    u75:hookAimDirection(p76);
    local v84 = not v78 and 0.25 or FrostyStaffUtil:getWeaponMistDamageCooldown(v78.Name);
    local tickDelay = ClientSyncEvents.AbilityTickDelayModifierCheck:fire(v84).tickDelay;
    u75.sprayingSpeedMaid:GiveTask(task.spawn(function() -- Line: 657
        -- upvalues: Players (ref), u75 (copy), default (ref), tickDelay (ref)
        while true do
            local Character2 = Players.LocalPlayer.Character;

            if Character2 ~= nil then
                Character2 = Character2.PrimaryPart;

                if Character2 ~= nil then
                    Character2 = Character2.Position;
                end;
            end;

            local v85 = u75:getDirection();

            if Character2 then
                default.Client:Get("FrostyGunFire"):SendToServer({
                    userPosition = Character2,
                    direction = v85
                });
                local v86 = u75;
                v86.tickCount = v86.tickCount + 1;
            end;

            local v87 = task.wait(tickDelay + 0.02);

            if v87 == 0 or (v87 ~= v87 or not v87) then
                return;
            end;
        end;
    end));
    u75.sprayingSpeedMaid:GiveTask(function() -- Line: 680
        -- upvalues: u77 (copy)
        local v88 = u77;

        if v88 ~= nil then
            v88:Stop();
        end;

        local v89 = u77;

        if v89 ~= nil then
            v89:Destroy();
        end;
    end);
    local u90 = KnitClient.Controllers.ViewmodelController:getFirstPersonHandItem();

    if u90 ~= nil then
        u90 = u90:WaitForChild("Handle", 1);

        if u90 ~= nil then
            u90 = u90:WaitForChild("EffectParticle", 1);
        end;
    end;

    if u90 then
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame.LookVector;
        end;

        if CurrentCamera then
            local _ = (Players.LocalPlayer.Character:GetPrimaryPartCFrame().Position + CurrentCamera) * 15;
        end;

        local function _(p91) -- Line: 714
            if p91:IsA("ParticleEmitter") then
                p91.Enabled = true;
            end;
        end;

        for i, child in u90:GetChildren() do
            local _ = i - 1;

            if child:IsA("ParticleEmitter") then
                child.Enabled = true;
            end;
        end;

        u75.sprayingSpeedMaid:GiveTask(function() -- Line: 722
            -- upvalues: u90 (copy)
            local function _(p92) -- Line: 724
                if p92:IsA("ParticleEmitter") then
                    p92.Enabled = false;
                end;
            end;

            for i, child in u90:GetChildren() do
                local _ = i - 1;

                if child:IsA("ParticleEmitter") then
                    child.Enabled = false;
                end;
            end;
        end);
    end;
end;

function u9.cleanUp(p93) -- Line: 735
    -- upvalues: RunService (copy), Flamework (copy), CooldownId (copy), Players (copy), TweenService (copy)
    p93.spraying = false;
    p93.sprayingSpeedMaid:DoCleaning();
    pcall(function() -- Line: 738
        -- upvalues: RunService (ref)
        return RunService:UnbindFromRenderStep("frost-staff-mobile-confirm");
    end);

    if p93.tickCount > 0 then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.FROSTY_GUN, 0.5, {
            cooldownBar = {
                color = Color3.new(0.92, 0.22, 0.18)
            }
        });
    end;

    p93.tickCount = 0;
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    local UpperTorso = Character:FindFirstChild("UpperTorso");

    if not UpperTorso then
        return nil;
    end;

    local Waist = UpperTorso:FindFirstChild("Waist");
    p93.actionRequest:SendToServer({
        keyHold = false
    });

    if Waist and p93.originalWaistC0 then
        TweenService:Create(Waist, TweenInfo.new(0.085, Enum.EasingStyle.Linear), {
            Transform = p93.originalWaistC0
        }):Play();
    end;
end;

function u9.getDirection(p94, p95) -- Line: 768
    -- upvalues: Workspace (copy), Players (copy), KnitClient (copy)
    local LookVector = Workspace.CurrentCamera.CFrame.LookVector;
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return LookVector;
    end;

    if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 and LookVector then
        return LookVector;
    end;

    local v96 = Players.LocalPlayer:GetMouse();
    local v97 = Vector2.new(v96.X, v96.Y);

    if p95 and Workspace.CurrentCamera then
        v97 = Workspace.CurrentCamera.ViewportSize / 2 - Vector2.new(0, game:GetService("GuiService"):GetGuiInset().Y / 2);
    end;

    local CFrame2 = Workspace.CurrentCamera.CFrame;
    local Unit = (Workspace.CurrentCamera:ScreenPointToRay(v97.X, v97.Y).Unit.Direction + Vector3.new(0, p94.YTargetOffset, 0)).Unit;
    local v98 = CFrame2.Position + Unit * ((CFrame2.Position - Character).Magnitude * 10);
    local Unit2 = (v98 - Character).Unit;
    local Character2 = Players.LocalPlayer.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;

        if Character2 ~= nil then
            Character2 = Character2.CFrame.LookVector;
        end;
    end;

    if Character2 and not p94:isInFront(v98, Character2, Character) then
        return Character2;
    end;

    return Unit2;
end;

function u9.hookAimDirection(u99, u100) -- Line: 818
    -- upvalues: EntityUtil (copy), Players (copy), RunService (copy), Workspace (copy), u8 (ref), TweenService (copy)
    local u101 = EntityUtil:getEntity(Players.LocalPlayer);

    if u101 ~= nil then
        u101 = u101:getHandItemInstanceFromCharacter();
    end;

    local v102;

    if u101 == nil then
        v102 = u101;
    else
        v102 = u101:WaitForChild("Handle", 1);

        if v102 ~= nil then
            v102 = v102:WaitForChild("EffectParticle", 1);
        end;
    end;

    u99.sprayingSpeedMaid:GiveTask(RunService.Heartbeat:Connect(function(p103) -- Line: 832
        -- upvalues: Players (ref), Workspace (ref), u99 (copy), u100 (copy), u101 (copy), u8 (ref), TweenService (ref)
        local v104 = not Players.LocalPlayer.Character;

        if not v104 then
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character.Parent;
            end;

            v104 = Character ~= Workspace;
        end;

        if v104 then
            return nil;
        end;

        local v105 = Players.LocalPlayer:GetMouse();
        local v106 = Vector2.new(v105.X, v105.Y);
        local Position = Players.LocalPlayer.Character:GetPrimaryPartCFrame().Position;
        local _ = Workspace.CurrentCamera.CFrame;
        local _ = (Workspace.CurrentCamera:ScreenPointToRay(v106.X, v106.Y).Unit.Direction + Vector3.new(0, u99.YTargetOffset, 0)).Unit;
        local v107 = Position + u99:getDirection(u100).Unit * 20;
        local v108 = u101;

        if v108 ~= nil then
            v108 = v108:WaitForChild("Handle", 1);

            if v108 ~= nil then
                v108 = v108:WaitForChild("EffectParticle", 1);
            end;
        end;

        if v108 then
            local Character = Players.LocalPlayer.Character;
            local v109;

            if Character == nil then
                v109 = Character;
            else
                v109 = Character:FindFirstChild("UpperTorso");
            end;

            local v110;

            if v109 == nil then
                v110 = v109;
            else
                v110 = v109:FindFirstChild("Waist");
            end;

            if v109 and v110 then
                local v111, v112 = u8(Character.PrimaryPart.CFrame, v107);
                local v113 = CFrame.new(0, 0, 0) * CFrame.Angles(v111, -3.141592653589793 + v112, 0);
                local v114 = { v110.C0:ToEulerAnglesXYZ() };

                local function _(p115, p116) -- Line: 887
                    return p115 + p116;
                end;

                if #v114 == 0 then
                    error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.");
                end;

                local v117 = v114[1];

                for i = 2, #v114 do
                    local _ = i - 1;
                    v117 = v117 + v114[i];
                end;

                local v118 = { v113:ToEulerAnglesXYZ() };

                local function _(p119, p120) -- Line: 902
                    return p119 + p120;
                end;

                if #v118 == 0 then
                    error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.");
                end;

                local v121 = v118[1];

                for i = 2, #v118 do
                    local _ = i - 1;
                    v121 = v121 + v118[i];
                end;

                if math.abs(v117 - v121) > 1e-6 and u99.originalWaistC0 then
                    TweenService:Create(v110, TweenInfo.new(0.085, Enum.EasingStyle.Linear), {
                        Transform = u99.originalWaistC0 * v113
                    }):Play();
                end;
            end;

            v108.WorldCFrame = CFrame.new(v108.WorldPosition, v107);
        end;
    end));
end;

function u9.enableSprayerMode(u122) -- Line: 926
    -- upvalues: KnitClient2 (copy), Flamework (copy), FrostyGunMode (copy), RunService (copy), CooldownId (copy), MobileTouchType (copy), UserInputService (copy), Players (copy)
    KnitClient2.Controllers.ProjectileController:disableTargeting();
    local u123 = nil;
    u122.sprayerModeMaid = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "Frosty-Gun",

        boundFunction = function(p124, p125, u126) -- Line: 934, Name: boundFunction
            -- upvalues: u122 (copy), FrostyGunMode (ref), u123 (ref), RunService (ref), Flamework (ref), CooldownId (ref)
            if u122.projectileMode == FrostyGunMode.PROJECTILE then
                return nil;
            end;

            if p125 == Enum.UserInputState.Begin then
                if u126.UserInputType == Enum.UserInputType.Touch then
                    u123 = u126;
                end;

                local function u129() -- Line: 950
                    -- upvalues: u122 (ref), FrostyGunMode (ref), u126 (copy), RunService (ref)
                    if not (u122.stillEnable and u122.stillEnable()) then
                        return nil;
                    end;

                    if u122.projectileMode == FrostyGunMode.PROJECTILE then
                        return nil;
                    end;

                    if u126.UserInputState == Enum.UserInputState.End or u126.UserInputState == Enum.UserInputState.Cancel then
                        return nil;
                    end;

                    if u126.UserInputType == Enum.UserInputType.Touch then
                        local u127 = 0;
                        RunService:BindToRenderStep("frost-staff-mobile-confirm", 250, function(p128) -- Line: 963
                            -- upvalues: u127 (ref), u122 (ref), RunService (ref)
                            u127 = u127 + p128;

                            if u127 >= 0.3 then
                                if u122.spraying then
                                    return nil;
                                end;

                                RunService:UnbindFromRenderStep("frost-staff-mobile-confirm");
                                u122:beginSprayHolding();
                            end;
                        end);

                        return nil;
                    end;

                    u122:beginSprayHolding();
                end;

                if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(CooldownId.FROSTY_GUN) then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(CooldownId.FROSTY_GUN, "callback", function() -- Line: 978
                        -- upvalues: u129 (copy)
                        u129();
                    end);

                    return nil;
                end;

                u129();
            elseif p125 == Enum.UserInputState.End then
                if u123 and u126 ~= u123 then
                    return nil;
                end;

                u123 = nil;
                u122:cleanUp();
            end;

            return Enum.ContextActionResult.Pass;
        end,

        mobile = {
            touchType = MobileTouchType.TouchBeginEnd
        },
        priority = Enum.ContextActionPriority.Medium.Value
    });
    u122.sprayerModeMaid:GiveTask(UserInputService.TouchMoved:Connect(function(p130, p131) -- Line: 999
        -- upvalues: u123 (ref), Players (ref), RunService (ref)
        if p130 ~= u123 then
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
            pcall(function() -- Line: 1012
                -- upvalues: RunService (ref)
                return RunService:UnbindFromRenderStep("frost-staff-mobile-confirm");
            end);
        end;
    end));
end;

function u9.disableSprayerMode(p132) -- Line: 1018
    p132.sprayerModeMaid:DoCleaning();
    p132:cleanUp();
end;

function u9.swap(p133) -- Line: 1022
    -- upvalues: Flamework (copy), AbilityId (copy)
    if not p133:isEnabled() then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.FROSTY_GUN_SWAP);
end;

function u9.isInFront(p134, p135, p136, p137, p138) -- Line: 1028
    local _ = p138 == nil;

    return p136:Dot((p135 - p137).Unit) > 0;
end;

function u9.enableStacksIndicator(u139) -- Line: 1041
    local function _(p140) -- Line: 1044
        -- upvalues: u139 (copy)
        u139:createSign(p140);
    end;

    for i in u139.victimMap do
        u139:createSign(i);
    end;
end;

function u9.clearIndicators(u141) -- Line: 1051
    local function _(p142) -- Line: 1053
        -- upvalues: u141 (copy)
        u141:removeSign(p142);
    end;

    for i in u141.victimMap do
        u141:removeSign(i);
    end;
end;

function u9.maxChargeEffect(p143) -- Line: 1060
    -- upvalues: EntityUtil (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), KnitClient (copy), EffectUtil (copy)
    local v144 = EntityUtil:getLocalPlayerEntity();

    if v144 ~= nil then
        v144 = v144:getHandItemInstanceFromCharacter();

        if v144 ~= nil then
            v144 = v144:WaitForChild("Handle");
        end;
    end;

    if not v144 then
        return nil;
    end;

    local EffectParticle = v144:WaitForChild("EffectParticle", 1);

    if not EffectParticle then
        return nil;
    end;

    SoundManager:playSound(GameSound.JUGG_BARB_COOLDOWN_COMPLETE, {
        volumeMultiplier = 1.3,
        playbackSpeedMultiplier = 1.25
    });
    local v145 = ReplicatedStorage.Assets.Effects.PulseEffect:Clone();
    v145.Pulse.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)) });
    v145.Pulse.Orientation = Enum.ParticleOrientation.FacingCamera;
    v145.Position = EffectParticle.WorldCFrame.Position;
    v145.CanQuery = false;

    if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
        local v146 = KnitClient.Controllers.ViewmodelController:getFirstPersonHandItem();

        if v146 ~= nil then
            v146 = v146:FindFirstChild("Handle");
        end;

        v145.Parent = v146;
        local Keypoints = v145.Pulse.Size.Keypoints;

        local function _(p147) -- Line: 1098
            return NumberSequenceKeypoint.new(p147.Time, p147.Value / 4);
        end;

        local v148 = table.create(#Keypoints);

        for i, v in Keypoints do
            local _ = i - 1;
            v148[i] = NumberSequenceKeypoint.new(v.Time, v.Value / 4);
        end;

        v145.Pulse.Size = NumberSequence.new(v148);
    else
        v145.Parent = v144;
    end;

    EffectUtil:playEffects({ v145 }, nil, {
        destroyAfterSec = 1
    });
end;

function u9.createSign(p149, p150) -- Line: 1116
    -- upvalues: StatusEffectUtil (copy), StatusEffectType (copy), FrostyStaffUtil (copy), u5 (copy), FrostedCircleProgressBar (copy)
    p149:removeSign(p150);

    if not p150:FindFirstChild("Head") then
        return nil;
    end;

    local v151 = StatusEffectUtil:getActive(p150, StatusEffectType.COLD);

    if not v151 then
        return nil;
    end;

    local v152 = v151.stacks * 100 / FrostyStaffUtil.MAX_COLD_STACK;

    return u5.mount(u5.createFragment({
        FrostStackSign = u5.createElement("BillboardGui", {
            StudsOffsetWorldSpace = Vector3.new(0, -2, 0),
            ResetOnSpawn = false,
            MaxDistance = 300,
            AlwaysOnTop = true,
            Adornee = p150.Head,
            Size = UDim2.fromScale(2, 2)
        }, { u5.createElement(FrostedCircleProgressBar, {
                progress = v152,
                color = Color3.fromRGB(3, 255, 255),
                entityInstance = p150
            }) })
    }), p150);
end;

function u9.removeSign(p153, p154) -- Line: 1144
    local FrostStackSign = p154:FindFirstChild("FrostStackSign");

    if FrostStackSign ~= nil then
        FrostStackSign:Destroy();
    end;
end;

function u9.canSpray(p155) -- Line: 1150
    -- upvalues: FrostyGunMode (copy)
    if p155.projectileMode == FrostyGunMode.PROJECTILE then
        return false;
    end;

    if p155:isEnabled() then
        return not p155.spraying;
    end;

    return false;
end;

u8 = function(p156, p157) -- Line: 1165, Name: calculateLookAtAngles
    local v158 = p157 - p156.Position;
    local v159 = (-(math.atan(v158.Z / v158.X) + (v158.X > 0 and 3.141592653589793 or 0)) + 1.5707963267948966 - select(2, (p156 - p156.Position):ToEulerAnglesYXZ()) + 1.5707963267948966) % 6.283185307179586 - 1.5707963267948966;

    if math.abs(v159) > 1.7278759594743864 then
        return 0, 3.141592653589793;
    end;

    local v160 = math.clamp(v159, -1.288052987971815, 1.288052987971815) + 3.141592653589793;
    local v161 = math.pow(v158.X, 2) + math.pow(v158.Z, 2);
    local v162 = math.sqrt(v161);
    local v163 = math.atan(v158.Y / v162) - (p156 - p156.Position):ToEulerAnglesYXZ();

    return math.clamp(v163, -0.3141592653589793, 0.3141592653589793), v160;
end;

KnitClient.CreateController(u9.new());

return nil;
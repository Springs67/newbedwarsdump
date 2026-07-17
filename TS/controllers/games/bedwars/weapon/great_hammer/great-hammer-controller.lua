-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ExpireList = v1.ExpireList;
local SoundManager = v1.SoundManager;
local WatchCharacterAnimation = v1.WatchCharacterAnimation;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v5.Lighting;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ScreenShakeUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "screen-shake", "screen-shake-util").ScreenShakeUtil;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ChargeState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedWarsGreatHammers = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-melees").BedWarsGreatHammers;
local HammerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "weapons", "hammer-util").HammerUtil;
local BaseWeaponBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "base-weapon", "base-weapon-balance").BaseWeaponBalance;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 39, Name: __tostring
        return "GreatHammerController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 45
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 49
    -- upvalues: KnitController (copy), ExpireList (copy), BaseWeaponBalance (copy), u3 (copy)
    KnitController.constructor(p8);
    p8.Name = "GreatHammerController";
    p8.effectCooldown = ExpireList.new(BaseWeaponBalance.HAMMER_CHARGE_TIME * 0.9);
    p8.localAnimMaid = u3.new();
end;

function u6.KnitStart(u9) -- Line: 55
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), BedWarsGreatHammers (copy), HammerUtil (copy), EntityUtil (copy), Players (copy), getItemMeta (copy), ChargeState (copy), KnitClient2 (copy), ItemType (copy), GameAnimationUtil (copy), WatchCharacterAnimation (copy), u3 (copy)
    KnitController.KnitStart(u9);
    u9:preloadHammers();
    ClientSyncEvents.SwordSwing:connect(function(u10) -- Line: 58
        -- upvalues: BedWarsGreatHammers (ref), HammerUtil (ref), EntityUtil (ref), Players (ref), u9 (copy)
        if u10:isCancelled() then
            return nil;
        end;

        if table.find(BedWarsGreatHammers, u10.swordType) == nil then
            return nil;
        end;

        local chargedAttack = u10.chargedAttack;

        if chargedAttack ~= nil then
            chargedAttack = chargedAttack.chargeRatio;
        end;

        if chargedAttack ~= 1 then
            return nil;
        end;

        task.delay(HammerUtil.chargedAttackSwingDuration, function() -- Line: 74
            -- upvalues: EntityUtil (ref), Players (ref), u10 (copy), u9 (ref)
            local v11 = EntityUtil:getEntity(Players.LocalPlayer);

            if v11 ~= nil then
                v11 = v11:getHandItemInstanceFromCharacter();
            end;

            if u10.targetEntity and v11 then
                u9:applyChargedHitEffect(u10.targetEntity, v11);
            end;
        end);
    end);
    ClientSyncEvents.SwordChargedSwing:connect(function(p12) -- Line: 86
        -- upvalues: BedWarsGreatHammers (ref), getItemMeta (ref), EntityUtil (ref), u9 (copy)
        if p12:isCancelled() then
            return nil;
        end;

        local Name = p12.weapon.Name;

        if table.find(BedWarsGreatHammers, Name) == nil then
            return nil;
        end;

        if not p12.chargedAttack then
            return nil;
        end;

        local sword = getItemMeta(Name).sword;

        if sword ~= nil then
            sword = sword.chargedAttack;
        end;

        if not sword then
            return nil;
        end;

        if p12.chargedAttack.chargeTime < sword.maxChargeTimeSec then
            return nil;
        end;

        local v13 = EntityUtil:getEntity(p12.fromPlayer);

        if v13 ~= nil then
            v13 = v13:getHandItemInstanceFromCharacter();
        end;

        if not v13 or v13.Name ~= p12.weapon.Name then
            return nil;
        end;

        u9:playChargedAttackEffect(p12.fromPlayer, v13);
    end);
    ClientSyncEvents.SwordCharge:connect(function(u14) -- Line: 120
        -- upvalues: BedWarsGreatHammers (ref), getItemMeta (ref), ChargeState (ref), Players (ref), EntityUtil (ref), u9 (copy), KnitClient2 (ref), ItemType (ref)
        if table.find(BedWarsGreatHammers, u14.itemType) == nil then
            return nil;
        end;

        local v15 = getItemMeta(u14.itemType);
        local chargeState = u14.chargeState;

        if chargeState == ChargeState.Charged then
            local Character = Players.LocalPlayer.Character;

            if Character then
                local v16 = EntityUtil:getEntity(Players.LocalPlayer);

                if v16 ~= nil then
                    v16 = v16:getHandItemInstanceFromCharacter();
                end;

                u9.localAnimMaid:GiveTask(u9:playChargedEffect(Character, u14.itemType, v16));
            end;
        elseif chargeState == ChargeState.Charging then
            if Players.LocalPlayer.Character then
                local u17 = EntityUtil:getEntity(Players.LocalPlayer);

                if u17 ~= nil then
                    u17 = u17:getHandItemInstanceFromCharacter();
                end;

                local sword = v15.sword;

                if sword ~= nil then
                    sword = sword.chargedAttack;
                end;

                if not sword then
                    return nil;
                end;

                local showHoldProgressAfterSec = sword.showHoldProgressAfterSec;
                local u18 = showHoldProgressAfterSec == nil and 0 or showHoldProgressAfterSec;
                task.delay(u18, function() -- Line: 164
                    -- upvalues: u14 (copy), KnitClient2 (ref), sword (copy), u18 (copy), u9 (ref), u17 (copy), ItemType (ref)
                    local refId = u14.refId;

                    if refId == "" or not refId then
                        return nil;
                    end;

                    if not KnitClient2.Controllers.SwordChargeController:isWeaponCharging(u14.itemType) then
                        return nil;
                    end;

                    local v19 = u9:playChargingEffect(u14.itemType, u17, sword.maxChargeTimeSec - u18);

                    if u14.itemType == ItemType.MYTHIC_GREAT_HAMMER then
                        u9:enableMythicHealAura();
                    end;

                    if v19 then
                        u9.localAnimMaid:GiveTask(v19);
                    end;
                end);
            end;
        elseif chargeState == ChargeState.Idle then
            u9.localAnimMaid:DoCleaning();
        end;
    end);

    local function v25(u20, p21) -- Line: 191
        -- upvalues: getItemMeta (ref), GameAnimationUtil (ref)
        local sword = getItemMeta(p21).sword;

        if sword ~= nil then
            sword = sword.chargedAttack;

            if sword ~= nil then
                sword = sword.chargedSwingAnimations;
            end;
        end;

        if sword ~= nil then
            local function _(p22) -- Line: 202
                -- upvalues: u20 (copy), GameAnimationUtil (ref)
                local v23 = GameAnimationUtil:getAssetId(p22);
                table.insert(u20, v23);
            end;

            for i, v in sword do
                local _ = i - 1;
                local v24 = GameAnimationUtil:getAssetId(v);
                table.insert(u20, v24);
            end;
        end;

        return u20;
    end;

    local v26 = {};

    for i = 1, #BedWarsGreatHammers do
        v26 = v25(v26, BedWarsGreatHammers[i], i - 1, BedWarsGreatHammers);
    end;

    WatchCharacterAnimation(v26, function(u27, p28) -- Line: 221
        -- upvalues: u9 (copy), u3 (ref), EntityUtil (ref)
        if not u27.Character then
            return nil;
        end;

        if u9.effectCooldown:has(u27.UserId) then
            return nil;
        end;

        u9.effectCooldown:add(u27.UserId);
        local u29 = u3.new();
        u29:GiveTask(p28.Destroying:Connect(function() -- Line: 232
            -- upvalues: EntityUtil (ref), u27 (copy), u29 (copy)
            local v30 = EntityUtil:getEntity(u27);

            if v30 ~= nil then
                v30 = v30:getHandItemInstanceFromCharacter();
            end;

            u29:DoCleaning();
        end));
    end);
end;

function u6.playChargingEffect(p31, p32, p33, p34) -- Line: 244
    -- upvalues: getItemMeta (copy), u3 (copy), Workspace (copy), TweenService (copy), KnitClient2 (copy)
    local v35 = getItemMeta(p32);
    local sword = v35.sword;

    if sword ~= nil then
        sword = sword.chargedAttack;
    end;

    if not sword then
        return nil;
    end;

    local v36 = u3.new();
    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera then
        if p34 == nil then
            p34 = v35.sword.chargedAttack.maxChargeTimeSec;
        end;

        local u37 = TweenService:Create(CurrentCamera, TweenInfo.new(p34, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            FieldOfView = KnitClient2.Controllers.FovController:getFOV() - 5
        });
        u37:Play();
        v36:GiveTask(function() -- Line: 267
            -- upvalues: u37 (copy), TweenService (ref), CurrentCamera (copy), KnitClient2 (ref)
            u37:Cancel();
            TweenService:Create(CurrentCamera, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
                FieldOfView = KnitClient2.Controllers.FovController:getFOV()
            }):Play();
        end);
    end;

    if p33 ~= nil then
        p33 = p33:FindFirstChild("Handle");
    end;

    if p33 ~= nil then
        p33 = p33:FindFirstChild("StrikePosition");
    end;

    return v36;
end;

function u6.playChargedEffect(u38, p39, p40, u41) -- Line: 290
    -- upvalues: u3 (copy), ReplicatedStorage (copy), EffectUtil (copy), WeldUtil (copy), SoundManager (copy), GameSound (copy), Players (copy)
    local v42 = u3.new();

    if u41 ~= nil then
        u41 = u41:FindFirstChild("Handle");
    end;

    local v43;

    if u41 == nil then
        v43 = u41;
    else
        v43 = u41:FindFirstChild("StrikePosition");
    end;

    if v43 then
        local u44 = ReplicatedStorage.Assets.Effects.PulseEffect:Clone();
        u44.Pulse.Orientation = Enum.ParticleOrientation.FacingCamera;
        u44.Position = v43.WorldCFrame.Position;
        u44.Parent = u41;
        EffectUtil:playEffects({ u44 }, nil, {
            destroyAfterSec = 1
        });
        local u45 = ReplicatedStorage.Assets.Effects.BannerPoint:Clone();

        local function _(p46) -- Line: 313
            p46:SetAttribute("FirstPersonVisible", false);
        end;

        for i, descendant in u45:GetDescendants() do
            local _ = i - 1;
            descendant:SetAttribute("FirstPersonVisible", false);
        end;

        u45.Point.Cubes.Color = ColorSequence.new(Color3.fromRGB(243, 255, 115));
        u45.Point.Gradient.Color = ColorSequence.new(Color3.fromRGB(243, 255, 115));
        u45.Point.Shine.Color = ColorSequence.new(Color3.fromRGB(243, 255, 115));
        u45.Point.PointLight.Color = Color3.fromRGB(243, 255, 115);
        u45.Position = v43.WorldCFrame.Position;
        u45.Parent = u41;
        EffectUtil:playEffects({ u45 }, nil, {
            sizeMultiplier = 3
        });
        WeldUtil:weldParts(u41, u45);
        v42:GiveTask(function() -- Line: 329
            -- upvalues: u44 (copy), u45 (copy)
            u44:Destroy();
            u45:Destroy();
        end);
    end;

    if u41 then
        local u47 = true;
        v42:GiveTask(function() -- Line: 336
            -- upvalues: u47 (ref)
            u47 = false;

            return u47;
        end);
        task.spawn(function() -- Line: 340
            -- upvalues: u38 (copy), u41 (copy), u47 (ref)
            while true do
                u38:flashPart(u41);
                local v48 = task.wait(1);

                if v48 ~= 0 and (v48 == v48 and v48) then
                    v48 = u47;
                end;

                if v48 == 0 or (v48 ~= v48 or not v48) then
                    return;
                end;
            end;
        end);
    end;

    local JUGG_BARB_COOLDOWN_COMPLETE = GameSound.JUGG_BARB_COOLDOWN_COMPLETE;
    local v49 = {
        volumeMultiplier = 2
    };
    local v50;

    if p39 == Players.LocalPlayer.Character then
        v50 = nil;
    else
        v50 = p39:GetPrimaryPartCFrame().Position;
    end;

    v49.position = v50;
    local u51 = SoundManager:playSound(JUGG_BARB_COOLDOWN_COMPLETE, v49);
    v42:GiveTask(function() -- Line: 356
        -- upvalues: u51 (copy)
        local v52 = u51;

        if v52 ~= nil then
            v52:Destroy();
        end;
    end);

    return v42;
end;

function u6.playChargedAttackEffect(p53, p54, p55) -- Line: 364
    -- upvalues: u3 (copy), KnitClient (copy), EntityUtil (copy), SoundManager (copy), GameSound (copy), EffectUtil (copy)
    local u56 = u3.new();
    u56:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
        moveSpeedMultiplier = 0,
        blockSprint = true
    }));
    task.delay(1, function() -- Line: 371
        -- upvalues: u56 (copy)
        local v57 = u56;

        if v57 ~= nil then
            v57:DoCleaning();
        end;
    end);
    local v58 = EntityUtil:getEntity(p54);

    if v58 ~= nil then
        v58 = v58:getHandItemInstanceFromCharacter();
    end;

    if v58 then
        local JUGGERNAUT_ATTACK_SWING_3 = GameSound.JUGGERNAUT_ATTACK_SWING_3;
        local v59 = {};
        local Parent = v58.Parent;

        if Parent ~= nil then
            Parent = Parent.Parent;
        end;

        v59.position = Parent:GetPivot().Position;
        SoundManager:playSound(JUGGERNAUT_ATTACK_SWING_3, v59);
        u56:GiveTask((EffectUtil:enableInstanceEffect(v58)));
    end;

    return u56;
end;

function u6.playSwingAnimEndEffect(p60, p61, p62) -- Line: 399
    -- upvalues: u3 (copy), ReplicatedStorage (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy), Players (copy), u4 (copy), Lighting (copy), default (copy), Linear (copy), ScreenShakeUtil (copy)
    local v63 = u3.new();
    local Handle = p62:FindFirstChild("Handle");
    local v64;

    if Handle == nil then
        v64 = Handle;
    else
        v64 = Handle:FindFirstChild("StrikePosition");
    end;

    if not v64 then
        return v63;
    end;

    local v65 = ReplicatedStorage.Assets.Effects.DefaultLightningImpact:Clone();
    v65.Position = v64.WorldCFrame.Position;
    v65.Parent = Handle;
    EffectUtil:playEffects({ v65 }, nil, {
        destroyAfterSec = 3,
        sizeMultiplier = 0.5
    });
    local JUGGERNAUT_GROUND_SMASH = GameSound.JUGGERNAUT_GROUND_SMASH;
    local v66 = {};
    local v67;

    if p61 == Players.LocalPlayer.Character then
        v67 = nil;
    else
        v67 = p61:GetPrimaryPartCFrame().Position;
    end;

    v66.position = v67;
    SoundManager:playSound(JUGGERNAUT_GROUND_SMASH, v66);

    if Players.LocalPlayer.Character == p61 then
        local u68 = u4("DepthOfFieldEffect", {
            Name = "HammerDepthOfField",
            InFocusRadius = 20,
            FocusDistance = 0,
            FarIntensity = 0,
            Parent = Lighting
        });
        local u70 = default(0.14, Linear, function(p69) -- Line: 430
            -- upvalues: u68 (copy)
            u68.FarIntensity = (math.sqrt(p69) - p69) / 1.2;
        end);
        task.spawn(function() -- Line: 434
            -- upvalues: u70 (copy), u68 (copy)
            u70:Wait();
            u68:Destroy();
        end);
        ScreenShakeUtil.shakeScreenDirection(Vector2.new(1, 1), {
            zMagnitude = 1,
            duration = 0.4
        });
    end;

    return v63;
end;

function u6.applyChargedHitEffect(p71, p72, p73) -- Line: 445
    -- upvalues: u4 (copy), Lighting (copy), default (copy), Linear (copy), ScreenShakeUtil (copy), ReplicatedStorage (copy), EffectUtil (copy)
    local u74 = u4("DepthOfFieldEffect", {
        Name = "ChargedHammerDepthOfField",
        InFocusRadius = 20,
        FocusDistance = 0,
        FarIntensity = 0,
        Parent = Lighting
    });
    local u76 = default(0.14, Linear, function(p75) -- Line: 454
        -- upvalues: u74 (copy)
        u74.FarIntensity = (math.sqrt(p75) - p75) / 1.2;
    end);
    task.spawn(function() -- Line: 458
        -- upvalues: u76 (copy), u74 (copy)
        u76:Wait();
        u74:Destroy();
    end);
    ScreenShakeUtil.shakeScreenDirection(Vector2.new(1, 1), {
        zMagnitude = 1,
        duration = 0.4
    });
    local v77 = ReplicatedStorage.Assets.Effects.SolidOutlinePulse:Clone();
    v77:PivotTo(p72:getInstance():GetPivot());
    v77.Parent = p72:getInstance();
    EffectUtil:enableInstanceEffect(v77);
    EffectUtil:playEffects({ v77 }, p72:getInstance(), {
        destroyAfterSec = 0.5,
        sizeMultiplier = 1
    });
end;

function u6.flashPart(p78, u79, u80, p81) -- Line: 476
    if u80 == nil then
        u80 = Color3.fromRGB(255, 255, 255);
    end;

    local u82 = p81 == nil and 0.1 or p81;

    local function u85(u83) -- Line: 483
        -- upvalues: u80 (ref), u82 (ref)
        if not (u83:IsA("BasePart") or u83:IsA("MeshPart")) then
            return nil;
        end;

        local u84 = not u83:IsA("MeshPart") and "" or u83.TextureID;
        local Material = u83.Material;
        local Color = u83.Color;

        if u83:IsA("MeshPart") then
            u83.TextureID = "";
        end;

        u83.Material = Enum.Material.Neon;
        u83.Color = u80;
        task.delay(u82, function() -- Line: 500
            -- upvalues: u83 (copy), u84 (ref), Material (copy), Color (copy)
            if u83:IsA("MeshPart") then
                u83.TextureID = u84;
            end;

            u83.Material = Material;
            u83.Color = Color;
        end);
    end;

    task.spawn(function() -- Line: 509
        -- upvalues: u85 (copy), u79 (copy)
        u85(u79);

        local function _(p86) -- Line: 512
            -- upvalues: u85 (ref)
            u85(p86);
        end;

        for i, descendant in u79:GetDescendants() do
            local _ = i - 1;
            u85(descendant);
        end;
    end);
end;

function u6.enableMythicHealAura(p87) -- Line: 520
    -- upvalues: Players (copy), SoundManager (copy), GameSound (copy), KnitClient2 (copy), BaseWeaponBalance (copy)
    local Character = Players.LocalPlayer.Character;
    local v88;

    if Character == nil then
        v88 = Character;
    else
        v88 = Character.PrimaryPart;
    end;

    if not v88 then
        return nil;
    end;

    local u89 = SoundManager:playModifiableSound(GameSound.FLAG_BUFF, {
        looped = true,
        position = Character.PrimaryPart:GetPivot().Position,
        parent = Character
    });
    local v90 = KnitClient2.Controllers.PirateFlagController:createBuffCircleIndicator(Character:GetPivot().Position, BaseWeaponBalance.MYTHIC_HAMMER_AURA_HEAL_RADIUS, {
        fadeOutAfterSec = 1,
        transparency = 0.5,
        color = Color3.fromRGB(102, 255, 87)
    });
    v90.Anchored = true;
    p87.localAnimMaid:GiveTask(v90);
    p87.localAnimMaid:GiveTask(function() -- Line: 542
        -- upvalues: u89 (copy), SoundManager (ref)
        if not u89 then
            return nil;
        end;

        SoundManager:tweenSoundVolume(u89, 0, 0.8);
        task.delay(2, function() -- Line: 547
            -- upvalues: u89 (ref)
            u89:Destroy();
        end);
    end);
end;

function u6.disableMythicHealAura(p91) -- Line: 552
    -- upvalues: Players (copy)
    local Character = Players.LocalPlayer.Character;
    local v92;

    if Character == nil then
        v92 = Character;
    else
        v92 = Character.PrimaryPart;
    end;

    if not v92 then
        return nil;
    end;

    local BuffCircle = Character:FindFirstChild("BuffCircle");

    if BuffCircle ~= nil then
        BuffCircle:Destroy();
    end;
end;

function u6.preloadHammers(p93) -- Line: 566
    -- upvalues: getItemMeta (copy), ItemType (copy), AnimationType (copy), KnitClient (copy)
    local sword = getItemMeta(ItemType.WOOD_GREAT_HAMMER).sword;

    if not sword then
        return nil;
    end;

    local v94 = { AnimationType.GREAT_HAMMER_CHARGE, AnimationType.GREAT_HAMMER_CHARGE_FP };
    local v95;

    if sword.swingAnimations then
        v95 = {};
        local v96 = #v95;
        local v97 = #v94;
        table.move(v94, 1, v97, v96 + 1, v95);
        local swingAnimations = sword.swingAnimations;
        table.move(swingAnimations, 1, #swingAnimations, v96 + v97 + 1, v95);
    else
        v95 = v94;
    end;

    local v98;

    if sword.firstPersonSwingAnimations then
        v98 = {};
        local v99 = #v98;
        local v100 = #v95;
        table.move(v95, 1, v100, v99 + 1, v98);
        local firstPersonSwingAnimations = sword.firstPersonSwingAnimations;
        table.move(firstPersonSwingAnimations, 1, #firstPersonSwingAnimations, v99 + v100 + 1, v98);
    else
        v98 = v95;
    end;

    local chargedAttack = sword.chargedAttack;

    if chargedAttack ~= nil then
        chargedAttack = chargedAttack.chargedSwingAnimations;
    end;

    local v101;

    if chargedAttack then
        v101 = {};
        local v102 = #v101;
        local v103 = #v98;
        table.move(v98, 1, v103, v102 + 1, v101);
        local chargedSwingAnimations = sword.chargedAttack.chargedSwingAnimations;
        table.move(chargedSwingAnimations, 1, #chargedSwingAnimations, v102 + v103 + 1, v101);
    else
        v101 = v98;
    end;

    local chargedAttack2 = sword.chargedAttack;

    if chargedAttack2 ~= nil then
        chargedAttack2 = chargedAttack2.firstPersonChargedSwingAnimations;
    end;

    local v104;

    if chargedAttack2 then
        v104 = {};
        local v105 = #v104;
        local v106 = #v101;
        table.move(v101, 1, v106, v105 + 1, v104);
        local firstPersonChargedSwingAnimations = sword.chargedAttack.firstPersonChargedSwingAnimations;
        table.move(firstPersonChargedSwingAnimations, 1, #firstPersonChargedSwingAnimations, v105 + v106 + 1, v104);
    else
        v104 = v101;
    end;

    local v107 = {};
    local v108;

    if sword.swingSounds then
        v108 = {};
        local v109 = #v108;
        local v110 = #v107;
        table.move(v107, 1, v110, v109 + 1, v108);
        local swingSounds = sword.swingSounds;
        table.move(swingSounds, 1, #swingSounds, v109 + v110 + 1, v108);
    else
        v108 = v107;
    end;

    local hitSound = sword.hitSound;
    local v111;

    if hitSound == "" or not hitSound then
        v111 = v108;
    else
        v111 = {};
        local v112 = #v111;
        local v113 = #v108;
        table.move(v108, 1, v113, v112 + 1, v111);
        v111[v112 + v113 + 1] = sword.hitSound;
    end;

    local chargedAttack3 = sword.chargedAttack;

    if chargedAttack3 ~= nil then
        chargedAttack3 = chargedAttack3.chargedSwingSounds;
    end;

    local v114;

    if chargedAttack3 then
        v114 = {};
        local v115 = #v114;
        local v116 = #v111;
        table.move(v111, 1, v116, v115 + 1, v114);
        local chargedSwingSounds = sword.chargedAttack.chargedSwingSounds;
        table.move(chargedSwingSounds, 1, #chargedSwingSounds, v115 + v116 + 1, v114);
    else
        v114 = v111;
    end;

    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.WOOD_GREAT_HAMMER, {
        animations = v104,
        sounds = v114
    });
end;

KnitClient.CreateController(u6.new());

return nil;
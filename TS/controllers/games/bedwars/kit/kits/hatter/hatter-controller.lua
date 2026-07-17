-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v3.Lighting;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local UmbraBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "umbra-balance").UmbraBalance;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "HatterController";
    end,

    __index = BaseKitController
});
u4.__index = u4;

function u4.new(...) -- Line: 44
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 48
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), u1 (copy), Workspace (copy), u2 (copy), TweenService (copy)
    BaseKitController.constructor(p6, BedwarsKit.HATTER);
    p6.Name = "HatterController";
    p6.speedMaid = u1.new();
    p6.teleportMaid = u1.new();
    p6.targetAlertMaid = u1.new();
    p6.peekMaid = u1.new();
    p6.teleportChannelMaid = {};
    p6.currentBorrowedHats = {};
    p6.hatterIsPeeking = false;
    p6.hatterCanUseAbilities = true;
    p6.initialCameraMinZoom = 0;
    p6.initialCameraMaxZoom = 0;
    p6.hatterToHatOrbMap = {};
    p6.camera = Workspace.CurrentCamera;
    p6.peekingFilterTweenDuration = 0.4;
    p6.colorCorrectionEffect = u2("ColorCorrectionEffect", {
        Brightness = 0.3,
        Contrast = 0.8,
        Saturation = -1,
        TintColor = Color3.fromRGB(80, 90, 87)
    });
    p6.tweenColorCorrectionUp = TweenService:Create(p6.colorCorrectionEffect, TweenInfo.new(p6.peekingFilterTweenDuration), {
        Brightness = 0.3,
        Contrast = 0.8,
        Saturation = -1,
        TintColor = Color3.fromRGB(80, 90, 87)
    });
    p6.defaultColorCorrectionTween = {
        Brightness = 0,
        Contrast = 0.05,
        Saturation = 0,
        TintColor = Color3.fromRGB(255, 255, 255)
    };
    p6.bloomEffect = u2("BloomEffect", {
        Intensity = 0.8,
        Size = 31,
        Threshold = 0.95
    });
    p6.tweenBloomUp = TweenService:Create(p6.bloomEffect, TweenInfo.new(p6.peekingFilterTweenDuration), {
        Intensity = 0.8,
        Size = 31,
        Threshold = 0.95
    });
    p6.defaultBloomTween = {
        Intensity = 0,
        Size = 0,
        Threshold = 0
    };
end;

function u4.onKitLocalActivated(p7, p8) -- Line: 98
    -- upvalues: ClientSyncEvents (copy), RuntimeLib (copy), PlayerEntity (copy), UmbraBalance (copy), Flamework (copy), getItemMeta (copy), ItemType (copy), CooldownId (copy)
    p7:onKitEnabled();
    p8:GiveTask(ClientSyncEvents.LocalProjectileImpact:connect(function(p9) -- Line: 101
        -- upvalues: RuntimeLib (ref), PlayerEntity (ref), UmbraBalance (ref), Flamework (ref), getItemMeta (ref), ItemType (ref), CooldownId (ref)
        if p9.projectile.Name ~= "teleport_hat" then
            return nil;
        end;

        if RuntimeLib.instanceof(p9.hitEntity, PlayerEntity) then
            local v10 = p9.hitEntity:getPlayer():GetAttribute("UmbraNumHats");

            if (v10 == nil and 0 or v10) >= UmbraBalance.MAX_HATS_ON_TARGET then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "Maximum Umbra Hats Reached"
                });
                local fireDelaySec = getItemMeta(ItemType.TELEPORT_HAT).projectileSource.fireDelaySec;
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(CooldownId.HAT_TOSS);
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.HAT_TOSS, fireDelaySec * UmbraBalance.HIT_MAX_HAT_TARGET_CD_REDUCTION);
            end;
        end;
    end));
end;

function u4.onKitLocalDeactivated(p11) -- Line: 122
end;

function u4.onKitReplicationActivated(u12, u13) -- Line: 124
    -- upvalues: default2 (copy), Players (copy), u1 (copy), GameAnimationUtil (copy), AnimationType (copy), Workspace (copy), EntityUtil (copy), RuntimeLib (copy), PlayerEntity (copy), ClientStore (copy), ReplicatedStorage (copy), SoundManager (copy), GameSound (copy), EffectUtil (copy), KnitClient (copy)
    u13:GiveTask((default2.Client:Get("EntityDeathEvent"):Connect(function(p14) -- Line: 125
        -- upvalues: Players (ref), u12 (copy)
        local v15 = Players:GetPlayerFromCharacter(p14.entityInstance);

        if not v15 then
            return nil;
        end;

        u12:cleanTargetPlayer(v15);
    end)));
    u13:GiveTask(Players.PlayerRemoving:Connect(function(p16) -- Line: 133
        -- upvalues: u12 (copy)
        if not p16 then
            return nil;
        end;

        u12:cleanTargetPlayer(p16);
    end));
    default2.Client:OnEvent("HatterChannelTeleport", function(p17) -- Line: 140
        -- upvalues: u1 (ref), GameAnimationUtil (ref), AnimationType (ref), u12 (copy), Workspace (ref)
        if not p17.player.Character then
            return nil;
        end;

        local v18 = u1.new();
        local u19 = GameAnimationUtil:playAnimation(p17.player, AnimationType.USE_CROSS, {
            looped = true
        });
        v18:GiveTask(function() -- Line: 149
            -- upvalues: u19 (copy)
            local v20 = u19;

            if v20 ~= nil then
                v20:Stop();
            end;

            local v21 = u19;

            if v21 ~= nil then
                v21:Destroy();
            end;
        end);
        u12.teleportChannelMaid[p17.player.UserId] = v18;
        task.delay(p17.endTime - Workspace:GetServerTimeNow(), function() -- Line: 162
            -- upvalues: u19 (copy)
            local v22 = u19;

            if v22 ~= nil then
                v22:Stop();
            end;

            local v23 = u19;

            if v23 ~= nil then
                v23:Destroy();
            end;
        end);
    end):andThen(function(p24) -- Line: 172
        -- upvalues: u13 (copy)
        u13:GiveTask(p24);
    end);
    default2.Client:OnEvent("HatterChannelCancel", function(p25) -- Line: 175
        -- upvalues: u12 (copy), Players (ref)
        local v26 = u12.teleportChannelMaid[p25.player.UserId];

        if v26 ~= nil then
            v26:DoCleaning();
        end;

        if p25.player == Players.LocalPlayer then
            u12.hatterCanUseAbilities = true;
        end;

        u12:handleTeleportAbilityUI(u12.hatterTarget ~= nil);
        u12:handlePeekAbilityUI(u12.hatterTarget ~= nil);
    end):andThen(function(p27) -- Line: 187
        -- upvalues: u13 (copy)
        u13:GiveTask(p27);
    end);
    default2.Client:OnEvent("HatterUseTeleport", function(p28) -- Line: 190
        -- upvalues: EntityUtil (ref), RuntimeLib (ref), PlayerEntity (ref), u12 (copy), Workspace (ref), Players (ref), ClientStore (ref)
        local v29 = EntityUtil:getEntity(p28.hatterPlayer);

        if not RuntimeLib.instanceof(v29, PlayerEntity) then
            return nil;
        end;

        local hatterPlayer = p28.hatterPlayer;
        local v30 = u12.teleportChannelMaid[hatterPlayer.UserId];

        if v30 ~= nil then
            v30:DoCleaning();
        end;

        local PrimaryPart = v29:getInstance().PrimaryPart;

        if not PrimaryPart then
            return nil;
        end;

        local v31 = u12:generateRandomizedPath(p28.hatterInitialPosition, p28.targetPosition, 4, 1.5, 6);
        local v32 = p28.arriveTime - Workspace:GetServerTimeNow();

        if hatterPlayer.UserId == Players.LocalPlayer.UserId then
            ClientStore:dispatch({
                type = "UnequipItemInHand",
                equip = false
            });
        end;

        u12:updateTargetHatOrb(hatterPlayer);
        u12:traverseTeleportPath(v31, hatterPlayer, PrimaryPart, v32);
    end):andThen(function(p33) -- Line: 220
        -- upvalues: u13 (copy)
        u13:GiveTask(p33);
    end);
    default2.Client:OnEvent("HatterTargetSelected", function(p34) -- Line: 223
        -- upvalues: u12 (copy)
        u12:handleTargetSelected(p34.hatterPlayer, p34.targetPlayer);
    end):andThen(function(p35) -- Line: 225
        -- upvalues: u13 (copy)
        u13:GiveTask(p35);
    end);
    default2.Client:OnEvent("HatterProtectInvulnPlayer", function(p36) -- Line: 228
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref), EffectUtil (ref)
        local PrimaryPart = p36.targetInstance.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if PrimaryPart then
            local v37 = ReplicatedStorage.Assets.Effects.HatterDudEffect:Clone();
            v37.CFrame = CFrame.new(PrimaryPart, PrimaryPart + PrimaryPart);
            v37.Parent = Workspace;
            SoundManager:playSound(GameSound.UMBRA_INVULNERABILITY_HIT, {
                volumeMultiplier = 1.5,
                position = PrimaryPart
            });
            EffectUtil:playEffects({ v37 }, p36.targetInstance, {
                destroyAfterSec = p36.duration
            });
        end;
    end):andThen(function(p38) -- Line: 248
        -- upvalues: u13 (copy)
        u13:GiveTask(p38);
    end);
    default2.Client:OnEvent("HatterTargetArrival", function(p39) -- Line: 252
        -- upvalues: u12 (copy), KnitClient (ref), Players (ref), ClientStore (ref)
        local speedMultiplier = p39.speedMultiplier;
        u12.speedMaid:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
            blockSprint = false,
            moveSpeedMultiplier = speedMultiplier
        }));

        if p39.hatterPlayer.UserId == Players.LocalPlayer.UserId then
            ClientStore:dispatch({
                type = "UnequipItemInHand",
                equip = true
            });
        end;

        if u12.currentBorrowedHats[p39.hatterPlayer.UserId] ~= nil then
            u12.currentBorrowedHats[p39.hatterPlayer.UserId] = nil;
        end;

        if next(u12.currentBorrowedHats) == nil then
            u12:handleTargetAlertAbilityUI(false);
        end;

        task.delay(3, function() -- Line: 275
            -- upvalues: u12 (ref)
            local speedMaid = u12.speedMaid;

            if speedMaid ~= nil then
                speedMaid:DoCleaning();
            end;
        end);

        if u12.hatterToHatOrbMap[p39.hatterPlayer] ~= nil then
            u12.hatterToHatOrbMap[p39.hatterPlayer] = nil;
        end;
    end):andThen(function(p40) -- Line: 289
        -- upvalues: u13 (copy)
        u13:GiveTask(p40);
    end);
end;

function u4.onKitReplicationDeactivated(p41) -- Line: 293
end;

function u4.onInnateAbilityEnabled(p42, p43, p44) -- Line: 295
end;

function u4.onAbilityUsed(p45, p46, p47) -- Line: 297
    -- upvalues: Players (copy), EntityUtil (copy), RuntimeLib (copy), PlayerEntity (copy), AbilityId (copy)
    if p47:isCancelled() then
        return nil;
    end;

    if p46 ~= Players.LocalPlayer.Character then
        return nil;
    end;

    local v48 = EntityUtil:getEntity(p46);

    if not RuntimeLib.instanceof(v48, PlayerEntity) then
        return nil;
    end;

    local ability = p47.ability;

    if ability ~= AbilityId.HATTER_TELEPORT then
        if ability == AbilityId.HATTER_PEEK then
            if p45.hatterCanUseAbilities then
                p45:handleHatterPeek(v48);

                return;
            end;
        else
            local _ = ability == AbilityId.HATTER_TARGET_ALERT;
        end;

        return;
    end;

    p45.hatterCanUseAbilities = false;
    p45:handleTeleportAbilityUI(false);
    p45:handlePeekAbilityUI(false);
    p45:cleanupHatterPeek();
end;

function u4.generateRandomizedPath(p49, p50, p51, p52, p53, p54) -- Line: 329
    local v55 = 1 / p52;
    local v56 = -math.abs(p54);
    local v57 = false;
    local v58 = 1;
    local v59 = { p50 };

    while true do
        if v57 then
            v58 = v58 + 1;
        else
            v57 = true;
        end;

        if v58 >= p52 then
            table.insert(v59, p51);

            return v59;
        end;

        local v60 = v58 * v55;
        local v61 = p50.X + v60 * (p51.X - p50.X) + (math.random() * 2 - 1) * p53 * math.random() * (p54 - v56) + v56;
        local v62 = p50.Y + v60 * (p51.Y - p50.Y) + math.random() * 2 * p53 * p54;
        local v63 = p50.Z + v60 * (p51.Z - p50.Z) + (math.random() * 2 - 1) * p53 * math.random() * (p54 - v56) + v56;
        local v64 = Vector3.new(v61, v62, v63);
        table.insert(v59, v64);
    end;
end;

function u4.traverseTeleportPath(p65, p66, p67, p68, p69) -- Line: 359
    -- upvalues: u1 (copy), ReplicatedStorage (copy), Workspace (copy), GameSound (copy), SoundManager (copy), Players (copy), default (copy), Linear (copy), EffectUtil (copy)
    local v70 = u1.new();
    local v71 = false;
    local v72 = 0;
    local v73 = 0;

    while true do
        if v71 then
            v72 = v72 + 1;
        else
            v71 = true;
        end;

        if v72 >= #p66 - 1 then
            break;
        end;

        v73 = v73 + (p66[v72 + 1] - p66[v72 + 1 + 1]).Magnitude;
    end;

    local TeleportingHatter = ReplicatedStorage.Assets.Misc:FindFirstChild("TeleportingHatter");

    if TeleportingHatter ~= nil then
        TeleportingHatter = TeleportingHatter:Clone();
    end;

    local Root = TeleportingHatter:FindFirstChild("Root");

    if Root ~= nil then
        local EntryEffects = Root:FindFirstChild("EntryEffects");

        if EntryEffects ~= nil then
            local function _(p74) -- Line: 390
                if p74:IsA("ParticleEmitter") then
                    p74.Enabled = true;
                end;

                if p74:IsA("Trail") then
                    p74.Enabled = true;
                end;
            end;

            for i, descendant in EntryEffects:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("ParticleEmitter") then
                    descendant.Enabled = true;
                end;

                if descendant:IsA("Trail") then
                    descendant.Enabled = true;
                end;
            end;
        end;
    end;

    TeleportingHatter.Parent = Workspace;
    local u75 = os.clock();
    local v76 = {
        GameSound.UMBRA_TELEPORT_BOUNCE_1,
        GameSound.UMBRA_TELEPORT_BOUNCE_2,
        GameSound.UMBRA_TELEPORT_BOUNCE_3,
        GameSound.UMBRA_TELEPORT_BOUNCE_4
    };
    local v77 = SoundManager:playSound(GameSound.UMBRA_TELEPORT_LOOP, {
        rollOffMaxDistance = 120,
        rollOffMinDistance = 50,
        looped = true,
        volumeMultiplier = 2,
        parent = TeleportingHatter.PrimaryPart
    });
    local v78, v79;

    if p67 == Players.LocalPlayer then
        local PrimaryPart = TeleportingHatter.PrimaryPart;

        if PrimaryPart then
            p65.camera.CameraSubject = PrimaryPart;
            Players.LocalPlayer.CameraMinZoomDistance = p65.initialCameraMaxZoom;
        end;

        p68.Anchored = true;
        v78 = false;
        v79 = 0;
    else
        v78 = false;
        v79 = 0;
    end;

    while true do
        if v78 then
            v79 = v79 + 1;
        else
            v78 = true;
        end;

        if v79 >= #p66 - 1 then
            v70:DoCleaning();
            debug.profilebegin("hatter-end");

            for _, descendant in TeleportingHatter:GetDescendants() do
                if descendant:IsA("Decal") then
                    descendant.Transparency = 1;
                end;

                if descendant:IsA("BasePart") then
                    descendant.Transparency = 1;
                    descendant.CanCollide = false;
                    descendant.CanQuery = false;
                end;

                if descendant:IsA("ParticleEmitter") then
                    descendant.Enabled = false;
                end;

                if descendant:IsA("PointLight") then
                    descendant.Enabled = false;
                end;

                if descendant:IsA("Trail") then
                    descendant.Enabled = false;
                end;
            end;

            if v77 then
                SoundManager:tweenSoundVolume(v77, 0, 1);
            end;

            if p67 == Players.LocalPlayer then
                p65.hatterTarget = nil;
                p65:resetPeekingEffects();
            end;

            TeleportingHatter:Destroy();
            debug.profileend();

            return;
        end;

        local u80 = p66[v79 + 1];
        local u81 = p66[v79 + 1 + 1];
        local Unit = (u81 - u80).Unit;
        local u82 = nil;
        u82 = default((u80 - u81).Magnitude / v73 * p69, Linear, function(p83) -- Line: 441
            -- upvalues: TeleportingHatter (copy), u82 (ref), u75 (copy), Unit (copy), u80 (copy), u81 (copy)
            local v84 = math.pow(p83, 0.6666666666666666);
            local PrimaryPart = TeleportingHatter.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart.Parent;
            end;

            if not PrimaryPart then
                u82:Cancel();

                return nil;
            end;

            local _ = os.clock() - u75;
            local v85 = CFrame.new(Vector3.new(0, 0, 0), Unit);
            local v86 = math.sin(v84 * 3.141592653589793 * 3 * 2) * 3;
            local v87 = math.sin(v84 * 3.141592653589793 * 2 * 2) * 3;
            local v88 = math.sin(v84 * 3.141592653589793 * 3 * 2) * 3;
            local v89 = v85 * Vector3.new(v86, v87, v88);
            TeleportingHatter:PivotTo(CFrame.new(u80):Lerp(CFrame.new(u81) + v89, v84));
        end);
        u82:Wait();
        debug.profilebegin("hatter-bounce");
        local Root2 = TeleportingHatter:FindFirstChild("Root");

        if Root2 ~= nil then
            Root2 = Root2:FindFirstChild("EntryEffects");

            if Root2 ~= nil then
                Root2 = Root2:FindFirstChild("Blast");
            end;
        end;

        if Root2 then
            EffectUtil:playEffects({ Root2 }, nil);
        end;

        local v90 = #p66 - 2;
        local v91 = v76[1];

        if v90 / 2 < v79 then
            v91 = v76[2];
        end;

        if v90 / 3 < v79 then
            v91 = v76[3];
        end;

        if v79 == #p66 - 1 then
            v91 = v76[4];
        end;

        local v92 = v91 == v76[4] and 1 or v79 / (v90 - 1) * 0.2 + 0.9;
        SoundManager:playSound(v91, {
            rollOffMaxDistance = 120,
            rollOffMinDistance = 50,
            position = TeleportingHatter:GetPrimaryPartCFrame().Position,
            playbackSpeedMultiplier = v92
        });
        debug.profileend();
    end;
end;

function u4.onKitEnabled(p93) -- Line: 525
    -- upvalues: Players (copy), Lighting (copy)
    p93.initialCameraMinZoom = Players.LocalPlayer.CameraMinZoomDistance;
    p93.initialCameraMaxZoom = Players.LocalPlayer.CameraMaxZoomDistance;
    p93.hatterIsPeeking = false;
    table.clear(p93.currentBorrowedHats);
    p93.bloomEffect.Enabled = false;
    p93.bloomEffect.Parent = Lighting;
    p93.colorCorrectionEffect.Enabled = false;
    p93.colorCorrectionEffect.Parent = Lighting;
end;

function u4.resetPeekingEffects(p94) -- Line: 535
    -- upvalues: Players (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:FindFirstChildWhichIsA("Humanoid");
    end;

    p94.camera.CameraSubject = Character;
    Players.LocalPlayer.CameraMinZoomDistance = p94.initialCameraMinZoom;
    p94.colorCorrectionEffect.Brightness = p94.defaultColorCorrectionTween.Brightness;
    p94.colorCorrectionEffect.Contrast = p94.defaultColorCorrectionTween.Contrast;
    p94.colorCorrectionEffect.Saturation = p94.defaultColorCorrectionTween.Saturation;
    p94.colorCorrectionEffect.TintColor = p94.defaultColorCorrectionTween.TintColor;
    p94.bloomEffect.Intensity = p94.defaultBloomTween.Intensity;
    p94.bloomEffect.Size = p94.defaultBloomTween.Size;
    p94.bloomEffect.Threshold = p94.defaultBloomTween.Threshold;
end;

function u4.handleTargetSelected(p95, p96, p97) -- Line: 550
    -- upvalues: Players (copy)
    if Players.LocalPlayer == p96 then
        p95.hatterIsPeeking = false;
        p95.hatterCanUseAbilities = true;
        p95.hatterTarget = p97;
        p95:handleTeleportAbilityUI(true);
        p95:handlePeekAbilityUI(true);
    end;

    if Players.LocalPlayer == p97 then
        p95.currentBorrowedHats[p96.UserId] = true;
        p95:handleTargetAlertAbilityUI(true);
    end;

    p95:refreshBorrowedHats(p96, p97);
end;

function u4.refreshBorrowedHats(p98, p99, u100) -- Line: 568
    -- upvalues: u1 (copy), ReplicatedStorage (copy), WeldUtil (copy)
    local Character = u100.Character;
    local v101;

    if Character == nil then
        v101 = Character;
    else
        v101 = Character.Parent;
    end;

    if not v101 then
        return nil;
    end;

    local u102 = u1.new();
    local v103 = u100:GetAttribute("UmbraNumHats");
    local v104 = v103 == nil and 0 or v103;
    local v105 = false;
    local v106 = 0;

    while true do
        if v105 then
            v106 = v106 + 1;
        else
            v105 = true;
        end;

        if v106 >= v104 then
            u102:GiveTask(u100:GetAttributeChangedSignal("UmbraHatStatus"):Connect(function() -- Line: 623
                -- upvalues: u100 (copy), u102 (copy)
                local v107 = u100:GetAttribute("UmbraHatStatus");

                if v107 == 0 or (v107 ~= v107 or (v107 == "" or not v107)) then
                    u102:DoCleaning();
                end;
            end));

            return;
        end;

        local v108 = ReplicatedStorage.Assets.Effects.TeleportHat:Clone();
        local u109 = nil;

        local function _(p110) -- Line: 599
            -- upvalues: u109 (ref)
            if p110:IsA("BasePart") then
                p110:SetAttribute("NoArmorHide", true);
            end;

            if p110.Name == "Neon2" and p110:IsA("MeshPart") then
                u109 = p110;
            end;
        end;

        for i, descendant in v108:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant:SetAttribute("NoArmorHide", true);
            end;

            if descendant.Name == "Neon2" and descendant:IsA("MeshPart") then
                u109 = descendant;
            end;
        end;

        local HatAttachment = v108.Handle.HatAttachment;

        if u109 ~= nil then
            p98.hatterToHatOrbMap[p99] = u109;
        end;

        v108.Handle.HatAttachment.CFrame = CFrame.new(HatAttachment.CFrame.X, HatAttachment.CFrame.Y - v106, HatAttachment.CFrame.Z);
        v108.Parent = Character;
        WeldUtil:weldAccessory(Character, v108);
        u102:GiveTask(v108);
    end;
end;

function u4.cleanTargetPlayer(p111, p112) -- Line: 630
    -- upvalues: Players (copy)
    if p112 then
        local currentBorrowedHats = p111.currentBorrowedHats;
        local UserId = p112.UserId;
        local v113 = currentBorrowedHats[UserId] ~= nil;
        currentBorrowedHats[UserId] = nil;

        if v113 and next(p111.currentBorrowedHats) == nil then
            p111:handleTargetAlertAbilityUI(false);
        end;

        if p112 == Players.LocalPlayer then
            p111.hatterTarget = nil;
            table.clear(p111.currentBorrowedHats);
            p111:handleTeleportAbilityUI(false);
            p111:handlePeekAbilityUI(false);
            p111:handleTargetAlertAbilityUI(false);
            p111:resetPeekingEffects();

            return nil;
        end;

        if p112 == p111.hatterTarget then
            p111.hatterTarget = nil;
            p111:handleTeleportAbilityUI(false);
            p111:handlePeekAbilityUI(false);
            p111:handleTargetAlertAbilityUI(false);
            p111:resetPeekingEffects();

            return nil;
        end;
    end;
end;

function u4.handleHatterPeek(p114, p115) -- Line: 665
    if p114.hatterTarget then
        if not p114.hatterIsPeeking then
            local Character = p114.hatterTarget.Character;

            if Character ~= nil then
                Character = Character:FindFirstChildWhichIsA("Humanoid");
            end;

            p114.camera.CameraSubject = Character;
            p114.bloomEffect.Enabled = true;
            p114.colorCorrectionEffect.Enabled = true;
            p114.tweenColorCorrectionUp:Play();
            p114.tweenBloomUp:Play();
            p114.hatterIsPeeking = true;

            return;
        end;

        p114:cleanupHatterPeek();
    end;
end;

function u4.cleanupHatterPeek(p116) -- Line: 683
    p116:resetPeekingEffects();
    p116.bloomEffect.Enabled = false;
    p116.colorCorrectionEffect.Enabled = false;
    p116.hatterIsPeeking = false;
end;

function u4.handleTargetAlertAbilityUI(p117, p118) -- Line: 689
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    if p118 then
        local targetAlertMaid = p117.targetAlertMaid;
        local v119 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
        local HATTER_TARGET_ALERT = AbilityId.HATTER_TARGET_ALERT;
        local v120 = {};

        for i, v in AbilityMeta[AbilityId.HATTER_TARGET_ALERT].triggerConfig do
            v120[i] = v;
        end;

        targetAlertMaid:GiveTask(v119:enableAbility(HATTER_TARGET_ALERT, v120):expect());
    else
        local targetAlertMaid = p117.targetAlertMaid;

        if targetAlertMaid ~= nil then
            targetAlertMaid:DoCleaning();
        end;
    end;
end;

function u4.handleTeleportAbilityUI(p121, p122) -- Line: 706
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    if p122 then
        local teleportMaid = p121.teleportMaid;
        local v123 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
        local HATTER_TELEPORT = AbilityId.HATTER_TELEPORT;
        local v124 = {};

        for i, v in AbilityMeta[AbilityId.HATTER_TELEPORT].triggerConfig do
            v124[i] = v;
        end;

        teleportMaid:GiveTask(v123:enableAbility(HATTER_TELEPORT, v124):expect());
    else
        local teleportMaid = p121.teleportMaid;

        if teleportMaid ~= nil then
            teleportMaid:DoCleaning();
        end;
    end;
end;

function u4.handlePeekAbilityUI(p125, p126) -- Line: 723
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    if p126 then
        local peekMaid = p125.peekMaid;
        local v127 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
        local HATTER_PEEK = AbilityId.HATTER_PEEK;
        local v128 = {};

        for i, v in AbilityMeta[AbilityId.HATTER_PEEK].triggerConfig do
            v128[i] = v;
        end;

        peekMaid:GiveTask(v127:enableAbility(HATTER_PEEK, v128):expect());
    else
        local peekMaid = p125.peekMaid;

        if peekMaid ~= nil then
            peekMaid:DoCleaning();
        end;
    end;
end;

function u4.updateTargetHatOrb(p129, p130) -- Line: 740
    local v131 = p129.hatterToHatOrbMap[p130];

    if v131 == nil then
        return nil;
    end;

    v131.Color = Color3.new(0.8902, 0.7294, 0.0353);
end;

KnitClient.CreateController(u4.new());

return nil;
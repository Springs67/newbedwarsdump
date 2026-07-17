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
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-constants", "elk-constants");
local ElkChargeEndReason = v6.ElkChargeEndReason;
local ElkConstants = v6.ElkConstants;
local MountType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-type").MountType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 36, Name: __tostring
        return "ElkMasterController";
    end,

    __index = BaseKitController
});
u7.__index = u7;

function u7.new(...) -- Line: 42
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 46
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p9, BedwarsKit.ELK_MASTER);
    p9.Name = "ElkMasterController";
    p9.chargeSpeed = 0;
    p9.chargeMaidMap = {};
    p9.isMounted = false;
end;

function u7.KnitStart(p10) -- Line: 53
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p10);
end;

function u7.onKitLocalActivated(u11, p12) -- Line: 56
    -- upvalues: ClientSyncEvents (copy), MatchState (copy), Flamework (copy), AbilityId (copy), AbilityState (copy), Players (copy), KnitClient (copy), BedwarsKit (copy), EntityUtil (copy), default (copy)
    p12:GiveTask(ClientSyncEvents.MatchStateChange:connect(function(p13) -- Line: 57
        -- upvalues: MatchState (ref), Flamework (ref), AbilityId (ref), AbilityState (ref)
        if p13.matchState == MatchState.RUNNING then
            local v14 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.ELK_SUMMON);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v14, AbilityState.READY);
        end;
    end));
    p12:GiveTask(ClientSyncEvents.CanUseLocalAbility:connect(function(p15) -- Line: 65
        -- upvalues: Players (ref), KnitClient (ref), BedwarsKit (ref), EntityUtil (ref), AbilityId (ref), u11 (copy)
        if p15.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        if not KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.ELK_MASTER) then
            return nil;
        end;

        local v16 = EntityUtil:getEntity(Players.LocalPlayer);

        if not v16 then
            return nil;
        end;

        if p15.ability == AbilityId.ELK_SUMMON then
            if v16 ~= nil then
                v16 = v16:isAlive();
            end;

            if not v16 then
                p15:setCancelled(true);

                return nil;
            end;

            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character:FindFirstChildWhichIsA("Humanoid");
            end;

            if not Character then
                p15:setCancelled(true);

                return nil;
            end;

            if u11.isMounted == true then
                p15:setCancelled(true);

                return nil;
            end;
        end;
    end));
    p12:GiveTask(default.Client:Get("ElkBelowChargeThreshold"):Connect(function() -- Line: 100
        -- upvalues: Flamework (ref), AbilityId (ref), AbilityState (ref)
        local v17 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.ELK_ANTLER_UPPERCUT);

        if not v17 then
            return nil;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v17, AbilityState.DISABLED);
    end));
    p12:GiveTask(default.Client:Get("ElkAboveChargeThreshold"):Connect(function() -- Line: 107
        -- upvalues: Flamework (ref), AbilityId (ref), AbilityState (ref)
        local v18 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.ELK_ANTLER_UPPERCUT);

        if not v18 then
            return nil;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v18, AbilityState.READY);
    end));
end;

function u7.onKitLocalDeactivated(p19) -- Line: 115
end;

function u7.onKitReplicationActivated(u20, p21) -- Line: 117
    -- upvalues: ClientSyncEvents (copy), MountType (copy), Players (copy), u3 (copy), EntityUtil (copy), RuntimeLib (copy), PlayerEntity (copy), SoundManager (copy), GameSound (copy), Flamework (copy), AbilityId (copy), AbilityState (copy), AbilityMeta (copy), Workspace (copy), KnitClient (copy), default (copy), StatusEffectType (copy), BedwarsKit (copy), u4 (copy), RunService (copy), ElkConstants (copy), ElkChargeEndReason (copy)
    p21:GiveTask(ClientSyncEvents.GenericMountMounted:connect(function(p22) -- Line: 118
        -- upvalues: MountType (ref), Players (ref), u20 (copy), u3 (ref), EntityUtil (ref), RuntimeLib (ref), PlayerEntity (ref), SoundManager (ref), GameSound (ref), Flamework (ref), AbilityId (ref), AbilityState (ref), AbilityMeta (ref), Workspace (ref), KnitClient (ref), ClientSyncEvents (ref)
        if p22.mountType == MountType.ELK and p22.player == Players.LocalPlayer then
            u20.summonAbilityMaid = u3.new();
            local v23 = EntityUtil:getEntity(p22.player);

            if not (v23 and RuntimeLib.instanceof(v23, PlayerEntity)) then
                return nil;
            end;

            local ELK_SUMMON = GameSound.ELK_SUMMON;
            local v24 = {
                rollOffMaxDistance = 100
            };
            local v25;

            if p22.player == Players.LocalPlayer then
                v25 = nil;
            else
                v25 = v23:getInstance():GetPrimaryPartCFrame().Position;
            end;

            v24.position = v25;
            local u26 = SoundManager:playSound(ELK_SUMMON, v24);
            local u27 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.ELK_SUMMON);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u27, AbilityState.DISABLED);
            u20.isMounted = true;
            local u28 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.ELK_DISMISS, AbilityMeta[AbilityId.ELK_DISMISS].triggerConfig):expect();
            local v29 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
            local ELK_ANTLER_UPPERCUT = AbilityId.ELK_ANTLER_UPPERCUT;
            local v30 = {};

            for i, v in AbilityMeta[AbilityId.ELK_ANTLER_UPPERCUT].triggerConfig do
                v30[i] = v;
            end;

            function v30.getExtraData() -- Line: 141
                -- upvalues: Workspace (ref)
                return {
                    direction = Workspace.CurrentCamera.CFrame.LookVector
                };
            end;

            local u31 = v29:enableAbility(ELK_ANTLER_UPPERCUT, v30):expect();
            KnitClient.Controllers.SwordController:toggleSwordSwing(true);
            KnitClient.Controllers.BlockPlacementController:disableBlockPlacer();
            local u33 = ClientSyncEvents.BeginProjectileTargeting:connect(function(p32) -- Line: 149
                p32:setCancelled(true);

                return nil;
            end);
            u20.summonAbilityMaid:GiveTask(function() -- Line: 153
                -- upvalues: KnitClient (ref), u33 (copy)
                KnitClient.Controllers.SwordController:toggleSwordSwing(false);
                KnitClient.Controllers.BlockPlacementController:enableBlockPlacer();
                u33:Destroy();
            end);
            u20.summonAbilityMaid:GiveTask(function() -- Line: 159
                -- upvalues: u28 (copy), Flamework (ref), u27 (copy), AbilityState (ref), u31 (copy), u26 (copy)
                u28.Destroy();
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u27, AbilityState.READY);
                u31.Destroy();
                u26:Destroy();
            end);
        end;
    end));
    p21:GiveTask(ClientSyncEvents.GenericMountDismounted:connect(function(p34) -- Line: 167
        -- upvalues: Players (ref), MountType (ref), EntityUtil (ref), RuntimeLib (ref), PlayerEntity (ref), SoundManager (ref), GameSound (ref), u20 (copy), default (ref)
        if p34.player == Players.LocalPlayer and p34.mountType == MountType.ELK then
            local v35 = EntityUtil:getEntity(p34.player);

            if not (v35 and RuntimeLib.instanceof(v35, PlayerEntity)) then
                return nil;
            end;

            local ELK_DISMISS = GameSound.ELK_DISMISS;
            local v36 = {
                rollOffMaxDistance = 100
            };
            local v37;

            if p34.player == Players.LocalPlayer then
                v37 = nil;
            else
                v37 = v35:getInstance():GetPrimaryPartCFrame().Position;
            end;

            v36.position = v37;
            SoundManager:playSound(ELK_DISMISS, v36);
            local playerModifierMaid = u20.playerModifierMaid;

            if playerModifierMaid ~= nil then
                playerModifierMaid:DoCleaning();
            end;

            local summonAbilityMaid = u20.summonAbilityMaid;

            if summonAbilityMaid ~= nil then
                summonAbilityMaid:DoCleaning();
            end;

            local uppercutAnimationMaid = u20.uppercutAnimationMaid;

            if uppercutAnimationMaid ~= nil then
                uppercutAnimationMaid:DoCleaning();
            end;

            local v38 = u20.chargeMaidMap[p34.player];

            if v38 ~= nil then
                v38:DoCleaning();
            end;

            u20.isMounted = false;
            default.Client:Get("Dismount"):SendToServer({
                mountType = MountType.ELK
            });
        end;
    end));
    p21:GiveTask(ClientSyncEvents.StatusEffectAdded:connect(function(p39) -- Line: 202
        -- upvalues: StatusEffectType (ref), Players (ref), KnitClient (ref), BedwarsKit (ref), u20 (copy), default (ref)
        if p39.statusEffect ~= StatusEffectType.GROUNDED and p39.statusEffect ~= StatusEffectType.FROSTED then
            return nil;
        end;

        local v40 = Players:GetPlayerFromCharacter(p39.entityInstance);

        if not v40 then
            return nil;
        end;

        if not KnitClient.Controllers.KitController:isUsingKit(v40, BedwarsKit.ELK_MASTER) then
            return nil;
        end;

        local v41 = u20.chargeMaidMap[v40];

        if v41 ~= nil then
            v41:DoCleaning();
        end;

        if v40 ~= Players.LocalPlayer then
            return nil;
        end;

        if u20.isMounted then
            default.Client:Get("Dismount"):SendToServer();
        end;
    end));
    p21:GiveTask(ClientSyncEvents.StatusEffectReapplied:connect(function(p42) -- Line: 224
        -- upvalues: StatusEffectType (ref), Players (ref), KnitClient (ref), BedwarsKit (ref), u20 (copy), default (ref)
        if p42.statusEffect ~= StatusEffectType.GROUNDED and p42.statusEffect ~= StatusEffectType.FROSTED then
            return nil;
        end;

        local v43 = Players:GetPlayerFromCharacter(p42.entityInstance);

        if not v43 then
            return nil;
        end;

        if not KnitClient.Controllers.KitController:isUsingKit(v43, BedwarsKit.ELK_MASTER) then
            return nil;
        end;

        local v44 = u20.chargeMaidMap[v43];

        if v44 ~= nil then
            v44:DoCleaning();
        end;

        if v43 ~= Players.LocalPlayer then
            return nil;
        end;

        if u20.isMounted then
            default.Client:Get("Dismount"):SendToServer();
        end;
    end));
    p21:GiveTask(default.Client:Get("SigridBeginCharge"):Connect(function(u45) -- Line: 246
        -- upvalues: u20 (copy), u3 (ref), Players (ref), u4 (ref), KnitClient (ref), RunService (ref), ElkConstants (ref)
        u20:enableChargingEffects(u45.player);
        local Character = u45.player.Character;
        local v46;

        if Character == nil then
            v46 = Character;
        else
            v46 = Character.PrimaryPart;
        end;

        if not v46 then
            return nil;
        end;

        local v47 = u20.chargeMaidMap[u45.player] or u3.new();
        u20.chargeMaidMap[u45.player] = v47;

        if u45.player == Players.LocalPlayer then
            local u48 = u4("Attachment", {
                Parent = Character.PrimaryPart
            });
            local u49 = u4("AngularVelocity", {
                MaxTorque = (1 / 0),
                RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
                Attachment0 = u48,
                Parent = Character.PrimaryPart
            });
            v47:GiveTask(function() -- Line: 278
                -- upvalues: u49 (copy), u48 (copy)
                u49:Destroy();
                u48:Destroy();
            end);
            v47:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                blockSprint = true,
                moveSpeedMultiplier = 0.01
            }));
            u20.chargeSpeed = 0;
            v47:GiveTask(function() -- Line: 288
                -- upvalues: u20 (ref)
                u20.chargeSpeed = 0;
            end);
        end;

        local u50 = 0;
        v47:GiveTask((RunService.Heartbeat:Connect(function(p51) -- Line: 293
            -- upvalues: Character (copy), u50 (ref), ElkConstants (ref), KnitClient (ref), u20 (ref), u45 (copy), Players (ref)
            local v52 = Character;

            if v52 ~= nil then
                v52 = v52.PrimaryPart;
            end;

            if not v52 then
                return nil;
            end;

            u50 = u50 + p51;

            if u50 > ElkConstants.CHARGE_DURATION or KnitClient.Controllers.OwlAbilityController:isLifting() then
                local v53 = u20.chargeMaidMap[u45.player];

                if v53 ~= nil then
                    v53:DoCleaning();
                end;
            end;

            u20.chargeSpeed = math.pow(u50 * 8, 0.5) * 4.8 + 26;

            if Players.LocalPlayer == u45.player and not KnitClient.Controllers.OwlAbilityController:isLifting() then
                local CFrame2 = Character.PrimaryPart.CFrame;
                local v54 = CFrame.new(0, 0, -u20.chargeSpeed * p51);
                Character.PrimaryPart.CFrame = CFrame2 * v54;
            end;
        end)));
    end));
    p21:GiveTask(default.Client:Get("SigridEndCharge"):Connect(function(p55) -- Line: 321
        -- upvalues: u20 (copy), ElkChargeEndReason (ref)
        local v56 = u20.chargeMaidMap[p55.player];

        if v56 ~= nil then
            v56:DoCleaning();
        end;

        if p55.chargeEndReason == ElkChargeEndReason.ENTITY_HIT or p55.chargeEndReason == ElkChargeEndReason.BLOCK_HIT then
            u20:playUppercutAttackEffects(p55.player);
        end;
    end));
end;

function u7.onKitReplicationDeactivated(p57) -- Line: 334
end;

function u7.onInnateAbilityEnabled(p58, p59, p60) -- Line: 336
end;

function u7.onAbilityUsed(p61, p62, p63) -- Line: 338
    -- upvalues: Players (copy), AbilityId (copy), default (copy)
    local v64 = Players:GetPlayerFromCharacter(p62);

    if not v64 then
        return nil;
    end;

    if p63.userCharacter:FindFirstChildOfClass("Humanoid") == nil then
        return nil;
    end;

    if p63.ability == AbilityId.ELK_SUMMON and v64 == Players.LocalPlayer then
        p61:giveSummonModifiers();
    end;

    if p63.ability == AbilityId.ELK_DISMISS and v64 == Players.LocalPlayer then
        default.Client:Get("Dismount"):SendToServer();
    end;

    if p63.ability == AbilityId.ELK_ANTLER_UPPERCUT then
        if v64 ~= Players.LocalPlayer then
            return nil;
        end;

        default.Client:Get("SigridBeginChargeRequest"):CallServer({
            player = v64
        });
    end;
end;

function u7.giveSummonModifiers(p65) -- Line: 366
    -- upvalues: u3 (copy), KnitClient2 (copy), ElkConstants (copy), default (copy)
    p65.playerModifierMaid = u3.new();
    local v66 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
        blockSprint = false,
        moveSpeedMultiplier = ElkConstants.ELK_SUMMON_SPEED_MULTIPLIER
    });
    local v67 = KnitClient2.Controllers.JumpHeightController:getJumpModifier():addModifier({
        jumpHeightMultiplier = ElkConstants.ELK_SUMMON_JUMP_MULTIPLIER
    });
    p65.playerModifierMaid:GiveTask(v66);
    p65.playerModifierMaid:GiveTask(v67);
    default.Client:Get("ElkKitMounted"):SendToServer();
end;

function u7.enableChargingEffects(p68, p69) -- Line: 381
    -- upvalues: KnitClient2 (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), u3 (copy)
    if not p69.Character then
        return nil;
    end;

    local v70 = KnitClient2.Controllers.MountController:getActiveMounts()[p69];

    if v70 ~= nil then
        v70 = v70.model;
    end;

    if v70 then
        local u71 = KnitClient2.Controllers.MountAnimationController:playAnimationInMount(v70, AnimationType.ELK_CHARGING);
        local RightTrailPart = v70:FindFirstChild("body_mesh"):FindFirstChild("RightTrailPart");
        local LeftTrailPart = v70:FindFirstChild("body_mesh"):FindFirstChild("LeftTrailPart");
        local Trail = RightTrailPart:FindFirstChild("Trail");
        local Trail2 = LeftTrailPart:FindFirstChild("Trail");

        if u71 then
            u71.Priority = Enum.AnimationPriority.Action;

            if Trail and Trail2 then
                if Trail.Enabled == false then
                    Trail.Enabled = true;
                end;

                if Trail2.Enabled == false then
                    Trail2.Enabled = true;
                end;
            end;

            local u72 = SoundManager:playSound(GameSound.ELK_CHARGING_LOOP, {
                rollOffMaxDistance = 100,
                looped = true,
                parent = p69.Character.PrimaryPart
            });
            local v73 = p68.chargeMaidMap[p69] or u3.new();
            p68.chargeMaidMap[p69] = v73;
            v73:GiveTask(function() -- Line: 425
                -- upvalues: u71 (copy), Trail (copy), Trail2 (copy), u72 (copy)
                u71:Stop();
                u71:Destroy();

                if Trail and Trail2 then
                    if Trail.Enabled == true then
                        Trail.Enabled = false;
                    end;

                    if Trail2.Enabled == true then
                        Trail2.Enabled = false;
                    end;
                end;

                u72:Destroy();
            end);
        end;
    end;
end;

function u7.playUppercutAttackEffects(u74, p75) -- Line: 441
    -- upvalues: u3 (copy), SoundManager (copy), GameSound (copy), KnitClient2 (copy), AnimationType (copy)
    local Character = p75.Character;
    local v76;

    if Character == nil then
        v76 = Character;
    else
        v76 = Character.PrimaryPart;
    end;

    if v76 then
        u74.uppercutAnimationMaid = u3.new();
        SoundManager:playSound(GameSound.ELK_UPPERCUT, {
            rollOffMaxDistance = 100,
            position = Character.PrimaryPart.Position
        });
        local v77 = KnitClient2.Controllers.MountController:getActiveMounts()[p75];

        if v77 ~= nil then
            v77 = v77.model;
        end;

        local u78 = v77 and KnitClient2.Controllers.MountAnimationController:playAnimationInMount(v77, AnimationType.ELK_UPPERCUT);

        if u78 then
            u78.Priority = Enum.AnimationPriority.Action;
            u74.uppercutAnimationMaid:GiveTask(function() -- Line: 466
                -- upvalues: u78 (copy)
                u78:Stop();
                u78:Destroy();
            end);
            u78:GetMarkerReachedSignal("impact"):Connect(function() -- Line: 470
                -- upvalues: u74 (copy)
                task.delay(0.7, function() -- Line: 471
                    -- upvalues: u74 (ref)
                    local uppercutAnimationMaid = u74.uppercutAnimationMaid;

                    if uppercutAnimationMaid ~= nil then
                        uppercutAnimationMaid:DoCleaning();
                    end;
                end);
            end);
        end;
    end;
end;

KnitClient.CreateController(u7.new());

return nil;
-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local MobileTouchType = v1.MobileTouchType;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local HttpService = v3.HttpService;
local Players = v3.Players;
local RunService = v3.RunService;
local UserInputService = v3.UserInputService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "combat-constant");
local CombatConstant = v4.CombatConstant;
local SwordsConstants = v4.SwordsConstants;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local getItemSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta;
local BaseWeaponBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "base-weapon", "base-weapon-balance").BaseWeaponBalance;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local IdUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "id-util").IdUtil;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 46, Name: __tostring
        return "SwordController";
    end,

    __index = HandKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 52
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 56
    -- upvalues: HandKnitController (copy), u2 (copy), IdUtil (copy)
    HandKnitController.constructor(p7);
    p7.Name = "SwordController";
    p7.maid = u2.new();
    p7.lastAttack = 0;
    p7.lastSwing = 0;
    p7.bufferedMobileAttack = false;
    p7.thirdPersonAnimPlaying = false;
    p7.disableSwingState = false;
    p7.holdAutoSwingMaid = u2.new();
    p7.holdAutoSwingDisabled = false;
    p7.swordActionIdHandler = IdUtil.IncrementingId.new(0, 65535, true);
    p7.activeSwordActionId = p7.swordActionIdHandler:getCurrId();
    p7.swingCounter = 0;
    p7.lastChargedAttackTimeMap = {};
end;

function u5.KnitStart(u8) -- Line: 72
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), SyncEventPriority (copy), getItemMeta (copy), Workspace (copy), SwordsConstants (copy), UserInputService (copy)
    HandKnitController.KnitStart(u8);
    ClientSyncEvents.SwordSwing:setPriority(SyncEventPriority.NORMAL - 1):connect(function(p9) -- Line: 75
        -- upvalues: getItemMeta (ref), Workspace (ref), u8 (copy), SwordsConstants (ref)
        if p9:isCancelled() then
            return nil;
        end;

        local v10 = getItemMeta(p9.swordType);
        local sword = getItemMeta(p9.swordType).sword;
        local attackSpeed = p9.attackSpeed;
        local v11 = Workspace:GetServerTimeNow() - u8.lastAttack;

        if v11 < attackSpeed then
            local v12 = (attackSpeed - v11) * 1.01;
            local v13 = v12 < math.min(attackSpeed * SwordsConstants.swordSwingBufferMultiplier, 0.2);
            local v14 = not (sword.respectAttackSpeedForEffects or sword.applyCooldownOnMiss) and sword.skipSwingEffects ~= true;

            if v14 then
                local config = p9.config;

                if config ~= nil then
                    config = config.respectAttackSpeedOverride;
                end;

                v14 = not config;
            end;

            if v14 then
                local chargedAttack = p9.chargedAttack;

                if chargedAttack ~= nil then
                    chargedAttack = chargedAttack.chargeRatio;
                end;

                local v15 = {};
                local config = p9.config;

                if config ~= nil then
                    config = config.itemSkin;
                end;

                v15.itemSkin = config;
                u8:playSwordEffect(v10, (chargedAttack == nil and 0 or chargedAttack) >= 1, v15);
            end;

            if v13 then
                p9:bufferAttack(v12);
            end;

            p9:setCancelled(true);
        end;
    end);
    UserInputService.GamepadDisconnected:Connect(function() -- Line: 124
        -- upvalues: u8 (copy)
        print("[Sword-Gamepad] Disconnected");
        u8.activeSwordActionId = -1;
        u8.holdAutoSwingMaid:DoCleaning();
    end);
end;

function u5.isRelevantItem(p16, p17) -- Line: 130
    -- upvalues: getItemMeta (copy)
    return getItemMeta(p17.itemType).sword ~= nil;
end;

function u5.bufferMobileAttack(p18) -- Line: 134
    p18.bufferedMobileAttack = true;
end;

function u5.mobileSwingPressed(p19) -- Line: 137
    -- upvalues: Players (copy), ClientSyncEvents (copy), KnitClient (copy), Workspace (copy)
    if p19.disableSwingState then
        return nil;
    end;

    local v20 = Players.LocalPlayer:GetAttribute("IsCasting");

    if v20 ~= 0 and (v20 == v20 and (v20 ~= "" and v20)) then
        return nil;
    end;

    ClientSyncEvents.SwordSwingDown:fire();

    if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
        p19:swingSwordAtViewportPoint(Workspace.CurrentCamera.ViewportSize / 2);

        return;
    end;

    if KnitClient.Controllers.MobileShiftLockController:isEnabled() then
        p19:swingSwordAtViewportPoint(Workspace.CurrentCamera.ViewportSize / 2);

        return;
    end;

    p19:swingSwordAtMouse();
end;

function u5.canSee(p21, p22) -- Line: 156
    -- upvalues: Players (copy), GameQueryUtil (copy), CollectionService (copy)
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return false;
    end;

    if not p22 then
        return false;
    end;

    local v23 = Character:FindFirstChildWhichIsA("Humanoid");

    if v23 ~= nil then
        v23 = v23:FindFirstChild("BodyHeightScale");
    end;

    if v23 ~= nil then
        v23 = v23.Value;
    end;

    local v24 = 5 * (v23 == nil and 1 or v23);

    local function getBottomPosition(p25) -- Line: 178
        if not p25.PrimaryPart then
            return nil;
        end;

        local v26 = p25:FindFirstChildWhichIsA("Humanoid");

        return p25.PrimaryPart.Position + Vector3.new(0, -1 * ((not v26 and 0 or v26.HipHeight) + p25.PrimaryPart.Size.Y / 2), 0);
    end;

    local v27;

    if Character.PrimaryPart then
        local v28 = Character:FindFirstChildWhichIsA("Humanoid");
        v27 = Character.PrimaryPart.Position + Vector3.new(0, -1 * ((not v28 and 0 or v28.HipHeight) + Character.PrimaryPart.Size.Y / 2), 0);
    else
        v27 = nil;
    end;

    local v29 = p22:getInstance();
    local v30;

    if v29.PrimaryPart then
        local v31 = v29:FindFirstChildWhichIsA("Humanoid");
        v30 = v29.PrimaryPart.Position + Vector3.new(0, -1 * ((not v31 and 0 or v31.HipHeight) + v29.PrimaryPart.Size.Y / 2), 0);
    else
        v30 = nil;
    end;

    if not (v27 and v30) then
        return false;
    end;

    local v32 = v27 + Vector3.new(0, v24, 0);
    local v33 = v30 + Vector3.new(0, v24, 0);

    local function isRayBlocked(p34, p35, p36) -- Line: 200
        -- upvalues: GameQueryUtil (ref)
        local v37 = RaycastParams.new();
        v37.FilterDescendantsInstances = p36;
        v37.FilterType = Enum.RaycastFilterType.Blacklist;

        return GameQueryUtil:raycast(p34, p35 - p34, v37) ~= nil;
    end;

    local function isLineSegmentBlocked(p38, p39, p40) -- Line: 211
        -- upvalues: GameQueryUtil (ref)
        local v41 = RaycastParams.new();
        v41.FilterDescendantsInstances = p40;
        v41.FilterType = Enum.RaycastFilterType.Blacklist;
        local v42 = GameQueryUtil:raycast(p38, p39 - p38, v41) ~= nil;

        if not v42 then
            local v43 = RaycastParams.new();
            v43.FilterDescendantsInstances = p40;
            v43.FilterType = Enum.RaycastFilterType.Blacklist;
            v42 = GameQueryUtil:raycast(p39, p38 - p39, v43) ~= nil;
        end;

        return v42;
    end;

    local v44 = { Character, p22:getInstance() };
    local v45 = CollectionService:GetTagged("DontBlockSwordRaycast");
    table.move(v45, 1, #v45, #v44 + 1, v44);
    local v46 = RaycastParams.new();
    v46.FilterDescendantsInstances = v44;
    v46.FilterType = Enum.RaycastFilterType.Blacklist;
    local v47 = GameQueryUtil:raycast(v27, v30 - v27, v46) ~= nil;

    if not v47 then
        local v48 = RaycastParams.new();
        v48.FilterDescendantsInstances = v44;
        v48.FilterType = Enum.RaycastFilterType.Blacklist;
        v47 = GameQueryUtil:raycast(v30, v27 - v30, v48) ~= nil;
    end;

    local v49 = not v47;

    if not v49 then
        local v50 = RaycastParams.new();
        v50.FilterDescendantsInstances = v44;
        v50.FilterType = Enum.RaycastFilterType.Blacklist;
        local v51 = GameQueryUtil:raycast(v32, v33 - v32, v50) ~= nil;

        if not v51 then
            local v52 = RaycastParams.new();
            v52.FilterDescendantsInstances = v44;
            v52.FilterType = Enum.RaycastFilterType.Blacklist;
            v51 = GameQueryUtil:raycast(v33, v32 - v33, v52) ~= nil;
        end;

        v49 = not v51;

        if not v49 then
            local v53 = (v27 + v32) / 2;
            local v54 = (v30 + v33) / 2;
            local v55 = RaycastParams.new();
            v55.FilterDescendantsInstances = v44;
            v55.FilterType = Enum.RaycastFilterType.Blacklist;
            local v56 = GameQueryUtil:raycast(v53, v54 - v53, v55) ~= nil;

            if not v56 then
                local v57 = RaycastParams.new();
                v57.FilterDescendantsInstances = v44;
                v57.FilterType = Enum.RaycastFilterType.Blacklist;
                v56 = GameQueryUtil:raycast(v54, v53 - v54, v57) ~= nil;
            end;

            v49 = not v56;
        end;
    end;

    return v49;
end;

function u5.attackEntity(u58, u59, u60, p61, p62) -- Line: 222
    -- upvalues: Players (copy), Workspace (copy), getItemMeta (copy), ClientSyncEvents (copy), CombatConstant (copy), u2 (copy), Flamework (copy), CooldownId (copy), default (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not (Character and Workspace.CurrentCamera) then
        return false;
    end;

    local v63 = u58:getHandItem();

    if v63 ~= nil then
        v63 = v63.tool;
    end;

    if not v63 then
        return false;
    end;

    local v64 = getItemMeta(v63.Name);
    local weaponMetaClone = ClientSyncEvents.BeforeSwordSwing:fire(v63.Name, v64).weaponMetaClone;

    if weaponMetaClone ~= nil then
        weaponMetaClone = weaponMetaClone.sword;
    end;

    local v65 = v63:GetAttribute("ItemSkin");

    if v65 == "" then
        v65 = nil;
    end;

    if not weaponMetaClone then
        return false;
    end;

    if u59 then
        local v66 = u59:getInstance();

        if not (v66.Parent and v66.PrimaryPart) then
            return false;
        end;

        local v67;

        if weaponMetaClone then
            v67 = weaponMetaClone.attackRange;
        else
            v67 = weaponMetaClone;
        end;

        local v68;

        if v67 == 0 or (v67 ~= v67 or not v67) then
            v68 = CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE;
        else
            v68 = weaponMetaClone.attackRange;
        end;

        if v68 + 2 <= (Players.LocalPlayer.Character.PrimaryPart.Position - v66.PrimaryPart.Position).Magnitude then
            return false;
        end;
    end;

    local v69 = 0;
    local chargedAttack = weaponMetaClone.chargedAttack;

    if chargedAttack then
        if p61 == nil then
            chargedAttack = p61;
        else
            chargedAttack = p61.chargeTime;
        end;
    end;

    if chargedAttack ~= 0 and (chargedAttack == chargedAttack and chargedAttack) then
        local chargedAttack2 = weaponMetaClone.chargedAttack;

        if chargedAttack2 ~= nil then
            chargedAttack2 = chargedAttack2.maxChargeTimeSec;
        end;

        v69 = math.clamp(p61.chargeTime / chargedAttack2, 0, 1);
    end;

    local u70 = ClientSyncEvents.SwordSwing:fire(u59, v63.Name, weaponMetaClone.attackSpeed, v69 ~= 0 and (v69 == v69 and v69) and {
        chargeRatio = v69
    } or nil, {
        itemSkin = v65
    });

    if u70.bufferTime ~= nil then
        local u71 = true;
        u58.maid:GiveTask(function() -- Line: 293
            -- upvalues: u71 (ref)
            u71 = false;
        end);
        task.delay(u70.bufferTime, function() -- Line: 296
            -- upvalues: u71 (ref), u59 (copy), u70 (copy), u58 (copy), u60 (copy)
            if not u71 then
                return nil;
            end;

            if u59 then
                local config = u70.config;

                if config ~= nil then
                    config = config.respectAttackSpeedOverride;
                end;

                local v72 = config == true;

                if u58:attackEntity(u59, u60, nil, {
                    playAnimation = v72,
                    playSound = v72
                }) then
                    return nil;
                end;
            end;

            u58:swingSwordInRegion();
        end);
    end;

    if u70:isCancelled() then
        return false;
    end;

    if ClientSyncEvents.PerformCombat:fire():isCancelled() then
        return false;
    end;

    local sword = v64.sword;

    if sword ~= nil then
        sword = sword.skipSwingEffects;
    end;

    if not sword then
        local v73 = {};
        local v74;

        if p62 == nil then
            v74 = p62;
        else
            v74 = p62.playAnimation;
        end;

        v73.playAnimation = v74;

        if p62 ~= nil then
            p62 = p62.playSound;
        end;

        v73.playSound = p62;
        v73.itemSkin = v65;
        u58:playSwordEffect(v64, v69 >= 1, v73);
    end;

    if weaponMetaClone.cooldown ~= nil then
        if u58.cooldownMaid ~= nil then
            u58.cooldownMaid:DoCleaning();
        end;

        u58.cooldownMaid = u2.new();
        u58.cooldownMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(CooldownId.SWORD));
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.SWORD, getItemMeta(v63.Name).sword.attackSpeed, weaponMetaClone.cooldown);
        u58.cooldownMaid:GiveTask(function() -- Line: 352
            -- upvalues: Flamework (ref), CooldownId (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(CooldownId.SWORD);
        end);
    end;

    if v69 == 1 then
        u58.lastChargedAttackTimeMap[v63.Name] = Workspace:GetServerTimeNow();
    end;

    if u59 then
        u58.lastAttack = Workspace:GetServerTimeNow();
        u58:sendServerRequest(u59, v69, {
            rayDirection = u60
        });
    else
        if weaponMetaClone.applyCooldownOnMiss == true then
            u58.lastAttack = Workspace:GetServerTimeNow();
        end;

        local multiHitCheckDurationSec = weaponMetaClone.multiHitCheckDurationSec;

        if multiHitCheckDurationSec == 0 or (multiHitCheckDurationSec ~= multiHitCheckDurationSec or not multiHitCheckDurationSec) then
            default.Client:Get("SwordSwingMiss"):SendToServer({
                weapon = v63,
                chargeRatio = v69
            });
        end;
    end;

    return true;
end;

function u5.playSwordEffect(u75, u76, p77, u78) -- Line: 383
    -- upvalues: AnimationType (copy), GameSound (copy), getItemSkinMeta (copy), RandomUtil (copy), GameAnimationUtil (copy), Players (copy), KnitClient (copy), SoundManager (copy), getItemMeta (copy)
    local sword = u76.sword;

    if sword ~= nil then
        sword = sword.swingAnimations;
    end;

    local u79 = sword == nil and { AnimationType.SWORD_SWING } or sword;
    local sword2 = u76.sword;

    if sword2 ~= nil then
        sword2 = sword2.firstPersonSwingAnimations;
    end;

    local u80 = sword2 == nil and { AnimationType.FP_SWING_SWORD } or sword2;
    local sword3 = u76.sword;

    if sword3 ~= nil then
        sword3 = sword3.swingSounds;
    end;

    local u81 = sword3 == nil and { GameSound.SWORD_SWING_1, GameSound.SWORD_SWING_2 } or sword3;
    local v82;

    if u78 == nil then
        v82 = u78;
    else
        v82 = u78.itemSkin;
    end;

    if v82 then
        local v83 = getItemSkinMeta(u78.itemSkin);

        if v83 ~= nil then
            v83 = v83.sword;

            if v83 ~= nil then
                v83 = v83.swingSounds;
            end;
        end;

        u81 = v83 or u81;
    end;

    if p77 then
        u79 = { AnimationType.NEW_SWORD_SWING };
        u80 = { AnimationType.NEW_SWORD_SWING_FP };
    end;

    local sword4 = u76.sword;

    if sword4 ~= nil then
        sword4 = sword4.chargedAttack;
    end;

    if sword4 then
        if p77 and sword4.chargedSwingAnimations then
            u79 = sword4.chargedSwingAnimations;
        end;

        if p77 and sword4.firstPersonChargedSwingAnimations then
            u80 = sword4.firstPersonChargedSwingAnimations;
        end;

        if p77 and sword4.chargedSwingSounds then
            u81 = sword4.chargedSwingSounds;
        end;
    end;

    local function v97(p84) -- Line: 451
        -- upvalues: u76 (copy), u75 (copy), u79 (ref), RandomUtil (ref), u78 (copy), GameAnimationUtil (ref), Players (ref), KnitClient (ref), u80 (ref), u81 (ref), SoundManager (ref)
        local v85 = false;
        local sword5 = u76.sword;

        if sword5 ~= nil then
            sword5 = sword5.randomizeSwingAnimations;
        end;

        if sword5 == nil then
            sword5 = false;
        end;

        if not u75.thirdPersonAnimPlaying then
            local _ = u79[1];
            local v86;

            if sword5 then
                v86 = RandomUtil.fromList(unpack(u79));
            else
                v86 = u79[math.min(u75.swingCounter, #u79 - 1) + 1];
            end;

            local sword6 = u76.sword;

            if sword6 ~= nil then
                sword6 = sword6.swingAnimations;
            end;

            if sword6 then
                sword6 = #u76.sword.swingAnimations == 0;
            end;

            if sword6 then
                return nil;
            end;

            v85 = true;
            local v87 = u78;

            if v87 ~= nil then
                v87 = v87.playAnimation;
            end;

            if v87 ~= false then
                local v88 = {
                    fadeSamePriorityTracks = false
                };
                local v89 = u78;

                if v89 ~= nil then
                    v89 = v89.character;
                end;

                local v90;

                if v89 then
                    local v91 = u78;

                    if v91 ~= nil then
                        v91 = v91.character;
                    end;

                    v90 = GameAnimationUtil:playAnimation(v91, v86, v88);
                else
                    v90 = GameAnimationUtil:playAnimation(Players.LocalPlayer, v86, v88);
                end;

                if v90 then
                    v90.Stopped:Connect(function() -- Line: 506
                        -- upvalues: u75 (ref)
                        u75.thirdPersonAnimPlaying = false;
                    end);
                else
                    u75.thirdPersonAnimPlaying = false;
                end;
            end;
        end;

        if KnitClient.Controllers.ViewmodelController:isVisible() then
            v85 = true;
            local _ = u80[1];
            local v92;

            if sword5 then
                v92 = RandomUtil.fromList(unpack(u80));
            else
                v92 = u80[math.min(u75.swingCounter, #u80 - 1) + 1];
            end;

            local v93 = u78;

            if v93 ~= nil then
                v93 = v93.playAnimation;
            end;

            if v93 ~= false then
                KnitClient.Controllers.ViewmodelController:playAnimation(v92);
            end;
        end;

        if v85 then
            if u75.swingCounter + 1 < #u79 then
                local v94 = u75;
                v94.swingCounter = v94.swingCounter + 1;
            else
                u75.swingCounter = 0;
            end;

            local v95 = #u81 ~= 0;

            if v95 then
                local v96 = u78;

                if v96 ~= nil then
                    v96 = v96.playSound;
                end;

                v95 = v96 ~= false;
            end;

            if v95 then
                SoundManager:playSound(RandomUtil.fromList(unpack(u81)));
            end;
        end;
    end;

    local v98 = u75:getHandItem();

    if v98 ~= nil then
        v98 = v98.tool;
    end;

    if not v98 then
        return nil;
    end;

    local chargedAttack = getItemMeta(v98.Name).sword.chargedAttack;

    if chargedAttack ~= nil then
        chargedAttack = chargedAttack.ignoreEffectsOnFullyCharged;
    end;

    if chargedAttack == true and p77 then
        return nil;
    end;

    v97(v98);
end;

function u5.swingSwordAtViewportPoint(p99, p100) -- Line: 573
    -- upvalues: EntityUtil (copy), Players (copy), getItemMeta (copy), Workspace (copy), CombatConstant (copy)
    if p99:isClickingTooFast() then
        return nil;
    end;

    local v101 = p99:getHandItem();

    if not v101 then
        return nil;
    end;

    local v102 = EntityUtil:getEntity(Players.LocalPlayer);

    if not v102 then
        return nil;
    end;

    local sword = getItemMeta(v101.itemType).sword;
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local v103 = Workspace.CurrentCamera:ViewportPointToRay(p100.X, p100.Y);
    local v104 = RaycastParams.new();
    v104.FilterDescendantsInstances = { Players.LocalPlayer.Character };
    v104.FilterType = Enum.RaycastFilterType.Exclude;
    local v105 = Workspace:Raycast(v103.Origin, v103.Direction * 200, v104);
    local v106;

    if v105 == nil then
        v106 = v105;
    else
        v106 = v105.Instance;
    end;

    if v106 then
        local v107;

        if sword then
            v107 = sword.attackRange;
        else
            v107 = sword;
        end;

        local v108;

        if v107 == 0 or (v107 ~= v107 or not v107) then
            v108 = CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE;
        else
            v108 = sword.attackRange;
        end;

        if (Players.LocalPlayer.Character.PrimaryPart.Position - v105.Instance.Position).Magnitude <= v108 then
            local v109 = EntityUtil:getEntity(v105.Instance);

            if v109 and (v102:canAttack(v109) and p99:canSee(v109)) then
                p99:attackEntity(v109, v103.Direction);

                return nil;
            end;
        end;
    end;

    p99:swingSwordInRegion();
end;

function u5.swingSwordAtMouse(p110, p111) -- Line: 622
    -- upvalues: EntityUtil (copy), Players (copy), getItemMeta (copy), Workspace (copy), CombatConstant (copy)
    if p110:isClickingTooFast() then
        return nil;
    end;

    local v112 = p110:getHandItem();

    if not v112 then
        return nil;
    end;

    local v113 = EntityUtil:getEntity(Players.LocalPlayer);

    if not v113 then
        return nil;
    end;

    local sword = getItemMeta(v112.itemType).sword;
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local v114 = RaycastParams.new();
    v114.FilterDescendantsInstances = { Players.LocalPlayer.Character };
    v114.FilterType = Enum.RaycastFilterType.Blacklist;
    local v115 = Players.LocalPlayer:GetMouse();
    local Direction = v115.UnitRay.Direction;
    local v116 = Workspace:Raycast(v115.UnitRay.Origin, Direction * 200, v114);
    local v117;

    if v116 == nil then
        v117 = v116;
    else
        v117 = v116.Instance;
    end;

    if v117 then
        local v118;

        if sword then
            v118 = sword.attackRange;
        else
            v118 = sword;
        end;

        local v119;

        if v118 == 0 or (v118 ~= v118 or not v118) then
            v119 = CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE;
        else
            v119 = sword.attackRange;
        end;

        if (Players.LocalPlayer.Character.PrimaryPart.Position - v116.Instance.Position).Magnitude <= v119 then
            local v120 = EntityUtil:getEntity(v116.Instance);

            if v120 and (v113:canAttack(v120) and p110:canSee(v120)) then
                p110:attackEntity(v120, Direction, p111 ~= 0 and (p111 == p111 and p111) and {
                    chargeTime = p111
                } or nil);

                return nil;
            end;
        end;
    end;

    p110:swingSwordInRegion(p111);
end;

function u5.swingSwordInRegion(p121, p122) -- Line: 672
    -- upvalues: EntityUtil (copy), getItemMeta (copy), BLOCK_SIZE (copy), DeviceUtil (copy), CombatConstant (copy), Workspace (copy)
    if not EntityUtil:getLocalPlayerEntity() then
        return nil;
    end;

    local v123 = p121:getHandItem();

    if v123 ~= nil then
        v123 = v123.tool;
    end;

    if not v123 then
        return nil;
    end;

    local sword = getItemMeta(v123.Name).sword;
    local v124 = 3.8 * BLOCK_SIZE;
    local attackRange = sword.attackRange;

    if attackRange == 0 or (attackRange ~= attackRange or not attackRange) then
        if DeviceUtil.isMobileControls() then
            v124 = CombatConstant.REGION_SWORD_CHARACTER_DISTANCE;
        end;
    else
        v124 = sword.attackRange;
    end;

    local multiHitCheckDurationSec = sword.multiHitCheckDurationSec;
    local v125 = multiHitCheckDurationSec == nil and 0 or multiHitCheckDurationSec;
    local v126 = p121:getTargetInRegion(v124, p122);

    if not p121:attackEntity(v126, nil, p122 ~= 0 and (p122 == p122 and p122) and {
        chargeTime = p122
    } or nil) then
        return nil;
    end;

    if v126 or v125 == 0 then
        return nil;
    end;

    local v127 = Workspace:GetServerTimeNow();
    local v128 = math.ceil(v125 / 0.1);
    local v129 = false;
    local v130 = 0;

    while true do
        if v129 then
            v130 = v130 + 1;
        else
            v129 = true;
        end;

        if v130 >= v128 then
            return;
        end;

        task.wait((math.min(0.1, v125)));
        v125 = v125 - 0.1;
        local v131 = p121:getTargetInRegion(v124, p122);
        local v132 = sword.chargedAttack and p122;
        local v133;

        if v132 == 0 or (v132 ~= v132 or not v132) then
            v133 = 0;
        else
            local chargedAttack = sword.chargedAttack;

            if chargedAttack ~= nil then
                chargedAttack = chargedAttack.maxChargeTimeSec;
            end;

            v133 = math.clamp(p122 / chargedAttack, 0, 1);
        end;

        if v131 then
            p121:sendServerRequest(v131, v133, {
                swingStartTime = v127
            });

            return;
        end;
    end;
end;

function u5.onEnable(u134, u135) -- Line: 750
    -- upvalues: getItemMeta (copy), GameAnimationUtil (copy), Players (copy), UserInputService (copy), ClientSyncEvents (copy), HttpService (copy), Flamework (copy), BaseWeaponBalance (copy), RunService (copy), MobileTouchType (copy), KnitClient (copy)
    local u136 = getItemMeta(u135.itemType);
    local sword = u136.sword;

    if sword ~= nil then
        sword = sword.idleAnimation;
    end;

    if sword ~= 0 and (sword == sword and sword) then
        u134:setupYield(function() -- Line: 758
            -- upvalues: GameAnimationUtil (ref), Players (ref), sword (copy)
            local u137 = GameAnimationUtil:playAnimation(Players.LocalPlayer, sword, {
                looped = true
            });

            return function() -- Line: 762
                -- upvalues: u137 (copy)
                local v138 = u137;

                if v138 ~= nil then
                    v138:Stop();
                end;

                local v139 = u137;

                if v139 ~= nil then
                    v139:Destroy();
                end;
            end;
        end);
    end;

    if UserInputService.TouchEnabled then
        u134.maid:GiveTask(ClientSyncEvents.MobileSwordButtonPressed:connect(function(p140) -- Line: 775
            -- upvalues: u136 (copy), u134 (copy)
            if p140.state == "up" then
                local sword2 = u136.sword;

                if sword2 ~= nil then
                    sword2 = sword2.chargedAttack;
                end;

                if sword2 == nil then
                    u134:mobileSwingPressed();
                end;
            end;
        end));
    end;

    local v141 = "swing-sword-" .. HttpService:GenerateGUID(false);
    local v150 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = v141,

        boundFunction = function(p142, p143, p144) -- Line: 793, Name: boundFunction
            -- upvalues: u134 (copy), Players (ref), u136 (copy), BaseWeaponBalance (ref), RunService (ref), ClientSyncEvents (ref)
            if u134.disableSwingState then
                return nil;
            end;

            u134.activeSwordActionId = u134.swordActionIdHandler:getNextId();

            if p143 == Enum.UserInputState.Begin then
                local v145 = Players.LocalPlayer:GetAttribute("IsCasting");

                if v145 ~= 0 and (v145 == v145 and (v145 ~= "" and v145)) then
                    return nil;
                end;

                local sword2 = u136.sword;

                if sword2 ~= nil then
                    sword2 = sword2.chargedAttack;
                end;

                if sword2 == nil then
                    u134:swingSwordAtMouse();

                    if p144.UserInputType == Enum.UserInputType.Gamepad1 and not u134.holdAutoSwingDisabled then
                        local sword3 = u136.sword;

                        if sword3 ~= nil then
                            sword3 = sword3.attackSpeed;
                        end;

                        if sword3 == nil then
                            sword3 = BaseWeaponBalance.SWORD_SWING_COOLDOWN;
                        end;

                        local u146 = sword3 * 0.5;
                        task.delay(u146, function() -- Line: 823
                            -- upvalues: u134 (ref), RunService (ref), u146 (copy)
                            if u134.activeSwordActionId ~= u134.swordActionIdHandler:getCurrId() then
                                return nil;
                            end;

                            u134.holdAutoSwingMaid:DoCleaning();
                            local u147 = 0;
                            u134:swingSwordAtMouse();
                            u134.holdAutoSwingMaid:GiveTask(RunService.Heartbeat:Connect(function(p148) -- Line: 831
                                -- upvalues: u147 (ref), u146 (ref), u134 (ref)
                                if u146 >= u147 then
                                    u147 = u147 + p148;

                                    return;
                                end;

                                if u134.holdAutoSwingDisabled then
                                    u134.holdAutoSwingMaid:DoCleaning();

                                    return nil;
                                end;

                                u134:swingSwordAtMouse();
                                u147 = 0;
                            end));
                        end);
                    end;
                end;

                ClientSyncEvents.SwordSwingDown:fire();
            elseif p143 == Enum.UserInputState.End then
                ClientSyncEvents.SwordSwingUp:fire();
                u134.activeSwordActionId = -1;
                u134.holdAutoSwingMaid:DoCleaning();
            end;

            return Enum.ContextActionResult.Pass;
        end,

        mobile = {
            touchType = MobileTouchType.TouchTap,

            mobileBoundFunction = function(p149) -- Line: 858, Name: mobileBoundFunction
                -- upvalues: KnitClient (ref), u135 (copy), u134 (copy)
                if KnitClient.Controllers.SwordChargeController:isWeaponCharging(u135.itemType) then
                    return nil;
                end;

                u134:mobileSwingPressed();
            end
        }
    });
    u134.maid:GiveTask(v150);

    if u134.bufferedMobileAttack then
        u134.bufferedMobileAttack = false;
        u134:setupYield(function() -- Line: 870
            -- upvalues: u134 (copy)
            u134:mobileSwingPressed();

            return function() -- Line: 872
            end;
        end);
    end;
end;

function u5.onDisable(p151) -- Line: 876
    p151.maid:DoCleaning();
end;

function u5.toggleSwordSwing(p152, p153) -- Line: 879
    p152.disableSwingState = p153;
end;

function u5.getSwordSwingDisabled(p154) -- Line: 882
    return p154.disableSwingState;
end;

function u5.isClickingTooFast(p155) -- Line: 885
    if tick() - p155.lastSwing < 0.1111111111111111 then
        return true;
    end;

    p155.lastSwing = tick();

    return false;
end;

function u5.isOnChargeAttackCooldown(p156, p157) -- Line: 892
    -- upvalues: getItemMeta (copy)
    local sword = getItemMeta(p157).sword;

    if sword ~= nil then
        sword = sword.chargedAttack;
    end;

    if not sword then
        return false;
    end;

    if sword.attackCooldown == nil then
        return false;
    end;

    return p156:getRemainingSwingCooldown(p157) > 0 or (p156:getRemainingChargeCooldown(p157) > 0 or p156:getRemainingCastingTime() > 0);
end;

function u5.getRemainingChargeCooldown(p158, p159) -- Line: 912
    -- upvalues: getItemMeta (copy), MapUtil (copy), Workspace (copy)
    local sword = getItemMeta(p159).sword;

    if sword ~= nil then
        sword = sword.chargedAttack;
    end;

    if not sword or sword.attackCooldown == nil then
        return 0;
    end;

    local v160 = MapUtil.getOrCreate(p158.lastChargedAttackTimeMap, p159, 0);

    if v160 == 0 then
        return 0;
    end;

    local v161 = v160 + sword.attackCooldown - Workspace:GetServerTimeNow();

    return math.max(v161, 0);
end;

function u5.getRemainingCastingTime(p162) -- Line: 929
    -- upvalues: Players (copy), Workspace (copy)
    local v163 = Players.LocalPlayer:GetAttribute("IsCasting");

    if v163 == 0 or (v163 ~= v163 or not v163) then
        return 0;
    end;

    if v163 == true then
        return 0.3;
    end;

    local v164 = v163 - Workspace:GetServerTimeNow();
    local v165;

    if v164 == 0 or (v164 ~= v164 or not v164) then
        v165 = v164;
    else
        v165 = v164 > 0;
    end;

    return (v165 == 0 or (v165 ~= v165 or not v165)) and 0 or v164;
end;

function u5.getRemainingSwingCooldown(p166, p167) -- Line: 947
    -- upvalues: getItemMeta (copy), Workspace (copy)
    local sword = getItemMeta(p167).sword;

    if not sword then
        return 0;
    end;

    if p166.lastAttack == 0 then
        return 0;
    end;

    local v168 = p166.lastAttack + sword.attackSpeed - Workspace:GetServerTimeNow();

    return math.max(v168, 0);
end;

function u5.getTargetInRegion(p169, p170, p171) -- Line: 960
    -- upvalues: PlaceUtil (copy), KnitClient (copy), MatchState (copy), Players (copy), EntityUtil (copy), GameWorldUtil (copy)
    if not PlaceUtil.isGameServer() or KnitClient.Controllers.MatchController:getMatchState() ~= MatchState.RUNNING then
        return nil;
    end;

    local v172 = 1.5;
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local Humanoid = Players.LocalPlayer.Character:FindFirstChild("Humanoid");

    if Humanoid then
        v172 = Humanoid.HipHeight;
    end;

    local v173 = EntityUtil:getLocalPlayerEntity();

    if not v173 then
        return nil;
    end;

    local v174 = Players.LocalPlayer.Character.PrimaryPart.Position + Players.LocalPlayer.Character.PrimaryPart.CFrame.LookVector.Unit * (p170 / 2);
    local v175 = math.max(3, v172);
    local v176 = v174 - Vector3.new(p170 / 2, v175, p170 / 2);
    local v177 = math.max(3, v172);
    local v178 = Vector3.new(p170 / 2, v177, p170 / 2);
    local v179 = Region3.new(v176, v174 + v178);

    for _, v in GameWorldUtil.getEntitiesWithinBox(v179.CFrame, v179.Size) do
        local v180 = v:getInstance();
        local PrimaryPart = v180.PrimaryPart;

        if PrimaryPart and (v180 ~= Players.LocalPlayer.Character and (v173:canAttack(v) and (p170 >= (PrimaryPart.Position - Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude and p169:canSee(v)))) then
            return v;
        end;
    end;
end;

function u5.sendServerRequest(p181, p182, p183, p184) -- Line: 1012
    -- upvalues: Players (copy), Workspace (copy), default (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not (Character and Workspace.CurrentCamera) then
        return false;
    end;

    local v185 = p181:getHandItem();

    if v185 ~= nil then
        v185 = v185.tool;
    end;

    if not v185 then
        return false;
    end;

    local Position = Workspace.CurrentCamera.CFrame.Position;
    local Position2 = p182:getInstance():GetPivot().Position;
    local Position3 = Players.LocalPlayer.Character:GetPivot().Position;
    local v186;

    if p184 == nil then
        v186 = p184;
    else
        v186 = p184.rayDirection;
    end;

    local v187 = v186 and {
        cameraPosition = {
            value = Position
        },
        cursorDirection = {
            value = p184.rayDirection
        }
    } or nil;
    local v188 = default.Client:Get("SwordHit");
    local v189 = {
        weapon = v185,
        entityInstance = p182:getInstance(),
        validate = {
            raycast = v187,
            targetPosition = {
                value = Position2
            },
            selfPosition = {
                value = Position3
            }
        },
        chargedAttack = {
            chargeRatio = p183
        }
    };
    local v190;

    if p184 == nil then
        v190 = p184;
    else
        v190 = p184.swingStartTime;
    end;

    local v191;

    if v190 == 0 or (v190 ~= v190 or not v190) then
        v191 = nil;
    else
        v191 = Workspace:GetServerTimeNow() - p184.swingStartTime;
    end;

    v189.timeSinceSwingStart = v191;
    v188:SendToServer(v189);
end;

function u5.enableHoldAutoSwing(p192) -- Line: 1072
    p192.holdAutoSwingDisabled = false;
end;

function u5.disableHoldAutoSwing(p193) -- Line: 1075
    p193.holdAutoSwingDisabled = true;
    p193.activeSwordActionId = -1;
    p193.holdAutoSwingMaid:DoCleaning();
end;

function u5.isHoldAutoSwingDisabled(p194) -- Line: 1080
    return p194.holdAutoSwingDisabled;
end;

return {
    SwordController = KnitClient.CreateController(u5.new())
};
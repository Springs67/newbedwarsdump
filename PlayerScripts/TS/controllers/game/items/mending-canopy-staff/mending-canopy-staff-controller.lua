-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local getAbilityMeta = v1.getAbilityMeta;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local MendingStaffChargeApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "nyoka", "ui", "mending-staff-charge-ui").MendingStaffChargeApp;
local NyokaProgressApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "nyoka", "ui", "nyoka-progress-bar").NyokaProgressApp;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local NyokaBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "nyoka-balance").NyokaBalance;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local NyokaUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "nyoka", "nyoka-util").NyokaUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u6 = Color3.fromRGB(112, 189, 92);
local u7 = Vector3.new(0, BLOCK_SIZE, 0);
local u8 = Vector3.new(0, BLOCK_SIZE, 0);
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 46, Name: __tostring
        return "MendingCanopyStaffController";
    end,

    __index = HandKnitController
});
u9.__index = u9;

function u9.new(...) -- Line: 52
    -- upvalues: u9 (ref)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11) -- Line: 56
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p11);
    p11.Name = "MendingCanopyStaffController";
    p11.chargeEnabledMaid = u2.new();
    p11.chargeDisabledMaid = u2.new();
    p11.glideMaid = u2.new();
    p11.overchargeMaid = u2.new();
    p11.equippedStaffsMap = {};
    p11.allyStaffMap = {};
    p11.chargedStaffs = {};
    p11.glidePhysicsEnabled = false;
end;

function u9.KnitStart(u12) -- Line: 68
    -- upvalues: HandKnitController (copy), default (copy), ClientSyncEvents (copy), Players (copy), AbilityId (copy), SoundManager (copy), GameSound (copy), RandomUtil (copy), StatusEffectType (copy)
    HandKnitController.KnitStart(u12);
    default.Client:OnEvent("MendingCanopyStaffEquippedEvent", function(p13, p14) -- Line: 70
        -- upvalues: u12 (copy)
        local v15 = u12.equippedStaffsMap[p13];

        if v15 ~= nil then
            local staffMaid = v15.staffMaid;

            if staffMaid ~= nil then
                staffMaid:DoCleaning();
            end;
        end;

        u12:staffEquipped(p13, p14);
    end);
    default.Client:OnEvent("MendingCanopyStaffUnequippedEvent", function(p16) -- Line: 82
        -- upvalues: u12 (copy)
        local v17 = u12.equippedStaffsMap[p16];

        if v17 ~= nil then
            local staffMaid = v17.staffMaid;

            if staffMaid ~= nil then
                staffMaid:DoCleaning();
            end;
        end;
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p18) -- Line: 94
        -- upvalues: Players (ref)
        local _ = p18.userCharacter == Players.LocalPlayer.Character;
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p19) -- Line: 100
        -- upvalues: AbilityId (ref), SoundManager (ref), GameSound (ref), u12 (copy)
        local userCharacter = p19.userCharacter;

        if userCharacter == nil then
            return nil;
        end;

        local _ = p19.ability == AbilityId.MENDING_CANOPY_STAFF_CHARGE_ENABLED;
        local _ = p19.ability == AbilityId.MENDING_CANOPY_STAFF_CHARGE_DISABLED;

        if p19.ability == AbilityId.MENDING_CANOPY_STAFF_OVERCHARGE then
            local NYOKA_MENDING_STAFF_OVERCHARGE = GameSound.NYOKA_MENDING_STAFF_OVERCHARGE;
            local v20 = {
                volumeMultiplier = 0.7
            };
            local PrimaryPart = userCharacter.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart.Position;
            end;

            v20.position = PrimaryPart;
            SoundManager:playSound(NYOKA_MENDING_STAFF_OVERCHARGE, v20);
            local v21 = 0;

            for _ in u12.chargedStaffs do
                v21 = v21 + 1;
            end;

            if v21 > 0 and u12.chargedStaffsConnection == nil then
                u12.chargedStaffsConnection = u12:watchChargedStaffs();
            end;
        end;
    end);
    default.Client:OnEvent("MendingCanopyStaffHealEvent", function(p22) -- Line: 137
        -- upvalues: u12 (copy), SoundManager (ref), RandomUtil (ref), GameSound (ref)
        local Character = p22.targetPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        local v23;

        if Character == nil then
            v23 = Character;
        else
            v23 = Character.Position;
        end;

        local v24 = u12.equippedStaffsMap[p22.fromPlayer];

        if v24 ~= nil then
            v24 = v24.staff;
        end;

        if v24 ~= nil then
            u12:createHealEffects(p22.fromPlayer, p22.targetPlayer);
        end;

        if v23 == nil then
            return nil;
        end;

        SoundManager:playSound(RandomUtil.fromList(GameSound.NYOKA_HEAL_APPLIED_0, GameSound.NYOKA_HEAL_APPLIED_1, GameSound.NYOKA_HEAL_APPLIED_2, GameSound.NYOKA_HEAL_APPLIED_3), {
            rollOffMaxDistance = 180,
            volumeMultiplier = 0.5,
            looped = false,
            parent = Character,
            position = v23
        });
    end);
    ClientSyncEvents.StatusEffectAdded:connect(function(p25) -- Line: 170
        -- upvalues: StatusEffectType (ref), Players (ref), SoundManager (ref), GameSound (ref), u12 (copy)
        if p25.statusEffect ~= StatusEffectType.MENDING_CANOPY_GLIDE then
            return nil;
        end;

        local entityInstance = p25.entityInstance;

        if entityInstance == nil then
            return nil;
        end;

        if Players.LocalPlayer.Character == entityInstance then
            local NYOKA_MENDING_STAFF_GLIDE_AVAILABLE = GameSound.NYOKA_MENDING_STAFF_GLIDE_AVAILABLE;
            local v26 = {};
            local PrimaryPart = p25.entityInstance.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart.Position;
            end;

            v26.position = PrimaryPart;
            v26.volumeMultiplier = 0.8;
            SoundManager:playSound(NYOKA_MENDING_STAFF_GLIDE_AVAILABLE, v26);
            u12:enableGlidePhysics(entityInstance, entityInstance.Humanoid.Animator);
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p27) -- Line: 196
        -- upvalues: StatusEffectType (ref), Players (ref), u12 (copy)
        if p27.statusEffect ~= StatusEffectType.MENDING_CANOPY_GLIDE then
            return nil;
        end;

        if Players.LocalPlayer.Character == p27.entityInstance then
            local glideMaid = u12.glideMaid;

            if glideMaid ~= nil then
                glideMaid:DoCleaning();
            end;
        end;
    end);
end;

function u9.isRelevantItem(p28, p29) -- Line: 209
    -- upvalues: NyokaUtil (copy)
    return NyokaUtil:isMendingCanopyStaff(p29.itemType);
end;

function u9.onEnable(p30, p31, p32) -- Line: 212
    -- upvalues: Players (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character:FindFirstChild("MendingCanopyStaffGlideForce");
        end;
    end;
end;

function u9.onDisable(p33) -- Line: 222
end;

function u9.onStartCharging(p34) -- Line: 224
end;

function u9.onStopCharging(p35) -- Line: 226
end;

function u9.onLaunch(p36) -- Line: 228
end;

function u9.onStartReload(p37) -- Line: 230
end;

function u9.staffEquipped(u38, u39, u40) -- Line: 232
    -- upvalues: u2 (copy), GamePlayerUtil (copy), Players (copy), RunService (copy), u7 (copy), SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), NyokaBalance (copy), EntityUtil (copy), u8 (copy), NyokaUtil (copy), getAbilityMeta (copy), Flamework (copy), u4 (copy), NyokaProgressApp (copy), getItemMeta (copy), MendingStaffChargeApp (copy)
    local v41 = u2.new();
    local v42 = u2.new();
    local Character = u39.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    local v43 = GamePlayerUtil.getGamePlayer(Players.LocalPlayer):getTeamId();
    local v44 = GamePlayerUtil.getGamePlayer(u39):getTeamId();

    if Character == nil then
        return nil;
    end;

    if v43 == v44 then
        local u45 = u38:createRadius(Character);
        local u47 = RunService.Heartbeat:Connect(function() -- Line: 248
            -- upvalues: Character (copy), u7 (ref), u45 (copy)
            local v46 = CFrame.new(Character.Position - u7);

            if u45 ~= nil then
                u45.CFrame = v46;
                u45.Orientation = Vector3.new(0, 0, 90);
            end;
        end);
        local u48 = u38:createHealIndicatorTween(u39, u45, 0, u40);
        u48:Play();
        local u49 = SoundManager:playSound(GameSound.NYOKA_MENDING_RADIUS_LOOP, {
            rollOffMaxDistance = 180,
            volumeMultiplier = 0.2,
            looped = true,
            parent = u45,
            position = Character.Position
        });
        u38.allyStaffMap[u39] = {
            staff = u40,
            allyMaid = v42,
            healIndicator = u45,
            healIndicatorTween = u48
        };

        if v42 ~= nil then
            v42:GiveTask(function() -- Line: 278
                -- upvalues: u45 (copy), u47 (copy), u48 (copy), u49 (copy)
                local v50 = u45;

                if v50 ~= nil then
                    v50:Destroy();
                end;

                local v51 = u47;

                if v51 ~= nil then
                    v51:Disconnect();
                end;

                local v52 = u48;

                if v52 ~= nil then
                    v52:Cancel();
                end;

                local v53 = u48;

                if v53 ~= nil then
                    v53:Destroy();
                end;

                local v54 = u49;

                if v54 ~= nil then
                    v54:Stop();
                end;

                local v55 = u49;

                if v55 ~= nil then
                    v55:Destroy();
                end;
            end);
        end;
    end;

    u38.equippedStaffsMap[u39] = {
        staff = u40,
        staffMaid = v41
    };
    local Character2 = u39.Character;
    local u56;

    if Character2 == nil then
        u56 = Character2;
    else
        u56 = Character2.Humanoid.Animator;
    end;

    local u57 = AnimationUtil:playAnimation(u56, GameAnimationUtil:getAssetId(AnimationType.MENDING_CANOPY_CHARGE), {
        looped = false
    });

    if u57 ~= nil then
        u57:Stop();
    end;

    GameAnimationUtil:getAssetId(AnimationType.MENDING_CANOPY_CHARGE);
    GameAnimationUtil:getAnimation(AnimationType.MENDING_CANOPY_CHARGE);
    local u58 = SoundManager:createSound(GameSound.NYOKA_MENDING_STAFF_CHARGING);
    u58.Looped = true;
    u58.Volume = 0.4;
    local u71 = u40:GetAttributeChangedSignal("StaffCharge"):Connect(function() -- Line: 335
        -- upvalues: u40 (copy), u58 (copy), Character2 (copy), u38 (copy), u39 (copy), NyokaBalance (ref), u56 (copy), u57 (copy)
        local v59 = u40:GetAttribute("StaffCharge");

        if u58.Parent ~= Character2 then
            u58.Parent = Character2.PrimaryPart;
        end;

        if v59 > 0 then
            if u38.chargedStaffs[u39] == nil then
                u38.chargedStaffs[u39] = u40;
            end;

            local v60 = 0.6 + 0.8 * (v59 / NyokaBalance.STAFF_MAX_CHARGE);

            if u58.IsPlaying then
                u58.PlaybackSpeed = v60;
            else
                u58:Play();
            end;

            local v61 = u56;

            if v61 then
                local v62 = u57;

                if v62 ~= nil then
                    v62 = v62.IsPlaying;
                end;

                v61 = not v62;

                if v61 then
                    local v63 = u57;

                    if v63 ~= nil then
                        v63 = v63.Speed;
                    end;

                    v61 = v63 ~= 0;
                end;
            end;

            if v61 then
                local v64 = u57;

                if v64 ~= nil then
                    v64:Play();
                end;

                local v65 = u57;

                if v65 ~= nil then
                    v65:GetMarkerReachedSignal("ChargingAnimationEnd"):Connect(function() -- Line: 380
                        -- upvalues: u57 (ref)
                        print("ChargingAnimationEnd");
                        local v66 = u57;

                        if v66 ~= nil then
                            v66:AdjustSpeed(0);
                        end;
                    end);
                end;
            end;
        else
            local v67 = u57;

            if v67 ~= nil then
                v67:Stop();
            end;

            if u57 ~= nil then
                u57:AdjustSpeed(1);
            end;

            local v68 = u58;

            if v68 ~= nil then
                v68 = v68.IsPlaying;
            end;

            if v68 then
                local v69 = u58;

                if v69 ~= nil then
                    v69:Stop();
                end;
            end;
        end;

        local v70 = 0;

        for _ in u38.chargedStaffs do
            v70 = v70 + 1;
        end;

        if v70 > 0 and u38.chargedStaffsConnection == nil then
            u38.chargedStaffsConnection = u38:watchChargedStaffs();
        end;
    end);
    local u72 = nil;
    local u73 = nil;
    local u83 = u39:GetAttributeChangedSignal("MendingStaffKnockbackEnabled"):Connect(function() -- Line: 430
        -- upvalues: u39 (copy), EntityUtil (ref), u72 (ref), u38 (copy), Character (copy), u73 (ref), RunService (ref), u8 (ref), u40 (copy), NyokaBalance (ref)
        local v74 = u39:GetAttribute("MendingStaffKnockbackEnabled");
        local v75 = EntityUtil:getEntity(u39);

        if v75 ~= nil then
            v75 = v75:getInstance();
        end;

        EntityUtil:getEntity(u39);

        if v74 then
            if v75 and u72 == nil then
                u72 = u38:createKnockbackEffects(Character.CFrame, v75);
            end;

            u73 = RunService.Heartbeat:Connect(function() -- Line: 443
                -- upvalues: u39 (ref), Character (ref), u8 (ref), u72 (ref), u40 (ref), NyokaBalance (ref)
                local v76 = u39:GetAttribute("MendingStaffKnockbackEnabled");

                if v76 ~= 0 and (v76 == v76 and (v76 ~= "" and v76)) then
                    local v77 = CFrame.new(Character.Position - u8);

                    if u72 ~= nil then
                        local u78 = nil;

                        local function _(p79) -- Line: 451
                            -- upvalues: u78 (ref)
                            if p79:IsA("ParticleEmitter") then
                                u78 = p79;

                                return nil;
                            end;
                        end;

                        for i, descendant in u72:GetDescendants() do
                            local _ = i - 1;

                            if descendant:IsA("ParticleEmitter") then
                                u78 = descendant;
                            end;
                        end;

                        u72:PivotTo(v77);

                        if u78 ~= nil then
                            local v80 = u40:GetAttribute("StaffCharge") / NyokaBalance.STAFF_MAX_CHARGE;
                            u78.Rate = 0.3 + 2.7 * v80;
                            u78.Size = NumberSequence.new(0, 3 + 7 * v80);
                        end;
                    end;
                end;
            end);

            return;
        end;

        local v81 = u72;

        if v81 ~= nil then
            v81:Destroy();
        end;

        u72 = nil;
        local v82 = u73;

        if v82 ~= nil then
            v82:Disconnect();
        end;
    end);

    if Players.LocalPlayer == u39 then
        u38:enableStaffChargeAbility();
        local v84 = NyokaUtil:getMendingStaffTierData(u40.Name);

        if v84 == nil then
            return nil;
        end;

        local v85;

        if v84 == nil then
            v85 = v84;
        else
            v85 = v84.manaId;
        end;

        local usableProgress = getAbilityMeta(v85).usableProgress;
        local v86;

        if usableProgress == nil then
            v86 = usableProgress;
        else
            v86 = usableProgress.stacks;
        end;

        if v86 == nil then
            return nil;
        end;

        local extraAbilities = v84.extraAbilities;

        if extraAbilities == nil then
            extraAbilities = false;
        end;

        if extraAbilities then
            u38:enableOverchargeAbility();
        end;

        local u88 = u40:GetAttributeChangedSignal("Charging"):Connect(function() -- Line: 519
            -- upvalues: Players (ref), u39 (copy), u40 (copy), u38 (copy), extraAbilities (copy)
            if Players.LocalPlayer == u39 then
                local v87 = u40:GetAttribute("Charging");

                if v87 == 0 or (v87 ~= v87 or (v87 == "" or not v87)) then
                    local chargeDisabledMaid = u38.chargeDisabledMaid;

                    if chargeDisabledMaid ~= nil then
                        chargeDisabledMaid:DoCleaning();
                    end;

                    u38:enableStaffChargeAbility();
                else
                    local chargeEnabledMaid = u38.chargeEnabledMaid;

                    if chargeEnabledMaid ~= nil then
                        chargeEnabledMaid:DoCleaning();
                    end;

                    u38:disableStaffChargeAbility();
                end;

                if extraAbilities then
                    u38:enableOverchargeAbility();
                end;
            end;
        end);
        local u89 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(NyokaProgressApp, {
            player = u39,
            maxProgress = usableProgress.stacks
        }));

        if v84 ~= nil then
            v84 = v84.itemType;
        end;

        local image = getItemMeta(v84).image;
        local u90 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(MendingStaffChargeApp, {
            staff = u40,
            icon = image
        }));

        if v41 ~= nil then
            v41:GiveTask(function() -- Line: 557
                -- upvalues: u89 (copy), u90 (copy), u88 (copy), u38 (copy)
                local v91 = u89;

                if v91 ~= nil then
                    v91:DoCleaning();
                end;

                local v92 = u89;

                if v92 ~= nil then
                    v92:Destroy();
                end;

                local v93 = u90;

                if v93 ~= nil then
                    v93:DoCleaning();
                end;

                local v94 = u90;

                if v94 ~= nil then
                    v94:Destroy();
                end;

                local v95 = u88;

                if v95 ~= nil then
                    v95:Disconnect();
                end;

                local chargeEnabledMaid = u38.chargeEnabledMaid;

                if chargeEnabledMaid ~= nil then
                    chargeEnabledMaid:DoCleaning();
                end;

                local chargeDisabledMaid = u38.chargeDisabledMaid;

                if chargeDisabledMaid ~= nil then
                    chargeDisabledMaid:DoCleaning();
                end;

                local overchargeMaid = u38.overchargeMaid;

                if overchargeMaid ~= nil then
                    overchargeMaid:DoCleaning();
                end;
            end);
        end;
    end;

    local NYOKA_MENDING_RADIUS_LOOP = GameSound.NYOKA_MENDING_RADIUS_LOOP;
    local v96 = {
        parent = u40.Handle
    };
    local Character3 = u39.Character;

    if Character3 ~= nil then
        Character3 = Character3.PrimaryPart;

        if Character3 ~= nil then
            Character3 = Character3.Position;
        end;
    end;

    v96.position = Character3;
    v96.rollOffMaxDistance = 180;
    v96.volumeMultiplier = 0.3;
    v96.looped = false;
    local u97 = SoundManager:playSound(NYOKA_MENDING_RADIUS_LOOP, v96);

    if v41 ~= nil then
        v41:GiveTask(function() -- Line: 613
            -- upvalues: u97 (copy), u38 (copy), u39 (copy), u71 (copy), u83 (copy), u73 (ref), u72 (ref)
            local v98 = u97;

            if v98 ~= nil then
                v98:Destroy();
            end;

            if u38.chargedStaffs[u39] then
                u38.chargedStaffs[u39] = nil;
            end;

            local v99 = u71;

            if v99 ~= nil then
                v99:Disconnect();
            end;

            local v100 = u83;

            if v100 ~= nil then
                v100:Disconnect();
            end;

            local v101 = u73;

            if v101 ~= nil then
                v101:Disconnect();
            end;

            local v102 = u72;

            if v102 ~= nil then
                v102:Destroy();
            end;

            u72 = nil;
            u38.equippedStaffsMap[u39] = nil;
            local v103 = u38.allyStaffMap[u39];

            if v103 ~= nil then
                v103.allyMaid:DoCleaning();
            end;

            u38.allyStaffMap[u39] = nil;
        end);
    end;
end;

function u9.watchChargedStaffs(u104) -- Line: 659
    -- upvalues: NyokaBalance (copy), RunService (copy)
    local STAFF_CHARGE_TICK_RATE = NyokaBalance.STAFF_CHARGE_TICK_RATE;
    local u105 = tick() + STAFF_CHARGE_TICK_RATE;
    local u106 = nil;
    u106 = RunService.Heartbeat:Connect(function() -- Line: 664
        -- upvalues: u105 (ref), STAFF_CHARGE_TICK_RATE (copy), u104 (copy), u106 (ref)
        if u105 <= tick() then
            u105 = tick() + STAFF_CHARGE_TICK_RATE;
            local chargedStaffs = u104.chargedStaffs;

            local function v111(p107, p108) -- Line: 668
                -- upvalues: u104 (ref)
                local v109 = p107:GetAttribute("StaffCharge");
                local v110 = u104.allyStaffMap[p108];

                if v110 == nil then
                    return nil;
                end;

                local healIndicatorTween = v110.healIndicatorTween;

                if healIndicatorTween then
                    healIndicatorTween:Cancel();
                end;

                v110.healIndicatorTween = u104:createHealIndicatorTween(p108, v110.healIndicator, v109, v110.staff);
                v110.healIndicatorTween:Play();

                if v109 == nil or v109 == 0 then
                    u104.chargedStaffs[p108] = nil;
                end;
            end;

            for i, v in chargedStaffs do
                v111(v, i, chargedStaffs);
            end;
        end;

        if next(u104.chargedStaffs) == nil then
            local v112 = u106;

            if v112 ~= nil then
                v112:Disconnect();
            end;

            u104.chargedStaffsConnection = nil;

            return nil;
        end;
    end);

    return u106;
end;

function u9.enableStaffChargeAbility(p113) -- Line: 706
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityState (copy)
    local chargeEnabledMaid = p113.chargeEnabledMaid;

    if chargeEnabledMaid ~= nil then
        chargeEnabledMaid:DoCleaning();
    end;

    local u114 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.MENDING_CANOPY_STAFF_CHARGE_ENABLED, {
        abilityType = "KitPrimary",
        abilityButton = {
            icon = "rbxassetid://16812685736",
            layoutOrder = -1,
            stateColors = {
                [AbilityState.READY] = Color3.fromRGB(255, 243, 1)
            }
        }
    }):expect();
    p113.chargeEnabledMaid:GiveTask(function() -- Line: 721
        -- upvalues: u114 (copy)
        u114.Destroy();
    end);
end;

function u9.disableStaffChargeAbility(p115) -- Line: 725
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityState (copy)
    local chargeDisabledMaid = p115.chargeDisabledMaid;

    if chargeDisabledMaid ~= nil then
        chargeDisabledMaid:DoCleaning();
    end;

    local u116 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.MENDING_CANOPY_STAFF_CHARGE_DISABLED, {
        abilityType = "KitPrimary",
        abilityButton = {
            icon = "rbxassetid://16812686987",
            layoutOrder = 0,
            stateColors = {
                [AbilityState.READY] = Color3.fromRGB(255, 243, 1)
            }
        }
    }):expect();
    p115.chargeDisabledMaid:GiveTask(function() -- Line: 740
        -- upvalues: u116 (copy)
        u116.Destroy();
    end);
end;

function u9.enableOverchargeAbility(p117) -- Line: 744
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityState (copy)
    local overchargeMaid = p117.overchargeMaid;

    if overchargeMaid ~= nil then
        overchargeMaid:DoCleaning();
    end;

    local u118 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.MENDING_CANOPY_STAFF_OVERCHARGE, {
        abilityType = "ItemSecondary",
        abilityButton = {
            icon = "rbxassetid://16909403219",
            layoutOrder = 100,
            stateColors = {
                [AbilityState.READY] = Color3.fromRGB(0, 0, 0)
            }
        }
    }):expect();
    p117.overchargeMaid:GiveTask(function() -- Line: 759
        -- upvalues: u118 (copy)
        u118.Destroy();
    end);
end;

function u9.enableGlidePhysics(u119, u120, p121) -- Line: 763
    -- upvalues: RunService (copy), Workspace (copy), NyokaBalance (copy), u3 (copy)
    local glideMaid = u119.glideMaid;

    if glideMaid ~= nil then
        glideMaid:DoCleaning();
    end;

    u119.glidePhysicsEnabled = true;
    local u128 = RunService.Stepped:Connect(function(p122) -- Line: 769
        -- upvalues: u119 (copy), u120 (copy), Workspace (ref), NyokaBalance (ref), u3 (ref)
        if not u119.glidePhysicsEnabled then
            return nil;
        end;

        local v123 = u120;

        if v123 ~= nil then
            v123 = v123.PrimaryPart;
        end;

        if not v123 then
            return nil;
        end;

        local v124 = math.pow((u120.PrimaryPart.AssemblyLinearVelocity * Vector3.new(0, 1, 0)).Magnitude, 2) / 2 * 4.5 * math.sign(u120.PrimaryPart.AssemblyLinearVelocity.Y) / 13;
        local v125 = math.max(0, (Workspace.Gravity * NyokaBalance.STAFF_GLIDE_GRAVITY_MULTIPLIER - v124) * u120.PrimaryPart.AssemblyMass);
        local v126 = Vector3.new(0, v125, 0);
        local v127 = v126.Y > 5000 and Vector3.new(0, 5000, 0) or v126;
        local PrimaryPart = u120.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart:FindFirstChild("MendingCanopyStaffGlideForce");
        end;

        if PrimaryPart then
            PrimaryPart.Force = v127;

            return;
        end;

        u3("BodyForce", {
            Name = "MendingCanopyStaffGlideForce",
            Force = v127,
            Parent = u120.PrimaryPart
        });
    end);
    local glideMaid2 = u119.glideMaid;

    if glideMaid2 ~= nil then
        glideMaid2:GiveTask(function() -- Line: 819
            -- upvalues: u119 (copy), u128 (copy), u120 (copy)
            u119.glidePhysicsEnabled = false;
            local v129 = u128;

            if v129 ~= nil then
                v129:Disconnect();
            end;

            if u120.Parent then
                local PrimaryPart = u120.PrimaryPart;

                if PrimaryPart ~= nil then
                    PrimaryPart = PrimaryPart:FindFirstChild("MendingCanopyStaffGlideForce");
                end;

                if PrimaryPart then
                    PrimaryPart:Destroy();
                end;
            end;
        end);
    end;
end;

function u9.createRadius(p130, p131) -- Line: 847
    -- upvalues: u3 (copy), Workspace (copy), NyokaBalance (copy), u7 (copy), u6 (copy)
    return u3("Part", {
        Name = "NyokaHealAOE",
        Orientation = Vector3.new(0, 0, 90),
        Transparency = 0,
        CastShadow = false,
        Reflectance = 0,
        Anchored = true,
        CanCollide = false,
        CanTouch = false,
        CanQuery = false,
        Parent = Workspace,
        Size = Vector3.new(NyokaBalance.MIN_HEAL_RADIUS, 0, 0),
        CFrame = CFrame.new(p131.Position) - u7,
        Shape = Enum.PartType.Cylinder,
        Color = u6,
        Material = Enum.Material.ForceField
    });
end;

function u9.createHealIndicatorTween(p132, p133, p134, p135, p136) -- Line: 867
    -- upvalues: NyokaUtil (copy), NyokaBalance (copy), TweenService (copy)
    local v137 = p132.allyStaffMap[p133];

    if v137 ~= nil then
        v137 = v137.healIndicatorTween;
    end;

    if v137 ~= nil then
        v137:Cancel();
    end;

    local v138 = NyokaUtil:getMendingStaffTierData(p136.Name);
    local v139;

    if v138 == nil then
        v139 = v138;
    else
        v139 = v138.minHealRadius;
    end;

    if v139 == nil then
        v139 = NyokaBalance.MIN_HEAL_RADIUS;
    end;

    if v138 ~= nil then
        v138 = v138.maxHealRadius;
    end;

    if v138 == nil then
        v138 = NyokaBalance.MAX_HEAL_RADIUS;
    end;

    local v140 = v139 + (v138 - v139) * (p135 / NyokaBalance.STAFF_MAX_CHARGE);

    return TweenService:Create(p134, TweenInfo.new(0.1, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
        Size = Vector3.new(0.7, v140 * 2, v140 * 2)
    });
end;

function u9.createKnockbackEffects(p141, p142, p143) -- Line: 904
    -- upvalues: ReplicatedStorage (copy), u8 (copy), EffectUtil (copy)
    local v144 = ReplicatedStorage.Assets.Effects.MendingStaffKnockback:Clone();
    v144:PivotTo(p142 - u8);
    v144.Parent = p143;
    v144.Anchored = true;
    EffectUtil:playEffects({ v144 }, p143, {});

    return v144;
end;

function u9.staffSpinnablesConnection(u145, u146) -- Line: 912
    -- upvalues: RunService (copy), NyokaBalance (copy)
    local Handle = u146:FindFirstChild("Handle");

    if Handle ~= nil then
        Handle = Handle:FindFirstChild("StaffPivot");
    end;

    local Handle2 = u146:FindFirstChild("Handle");

    if Handle2 ~= nil then
        Handle2 = Handle2:FindFirstChild("StaffPivotAttachment");
    end;

    if Handle == nil or Handle2 == nil then
        return nil;
    end;

    local Handle3 = u146:FindFirstChild("Handle");

    if Handle3 ~= nil then
        Handle3 = Handle3:FindFirstChild("StaffSpinnables");
    end;

    if Handle3 == nil then
        return nil;
    end;

    local CenterSphere = Handle3:FindFirstChild("CenterSphere");
    local Size = CenterSphere.Size;
    local v147;

    if Handle2 == nil then
        v147 = Handle2;
    else
        v147 = Handle2:FindFirstChild("FinLeftTopInitialAttachment");
    end;

    local v148;

    if Handle2 == nil then
        v148 = Handle2;
    else
        v148 = Handle2:FindFirstChild("FinRightTopInitialAttachment");
    end;

    local _ = Handle2.WorldCFrame;

    return RunService.Heartbeat:Connect(function() -- Line: 948
        -- upvalues: u146 (copy), Handle2 (copy), Handle (copy), NyokaBalance (ref), CenterSphere (copy), Size (copy), u145 (copy)
        local v149 = u146:GetAttribute("StaffCharge");

        if v149 == nil then
            return nil;
        end;

        if v149 == 0 and (Handle2 and Handle) then
            Handle.CFrame = Handle2.WorldCFrame;

            return nil;
        end;

        local v150 = 0 + 16 * (v149 / NyokaBalance.STAFF_MAX_CHARGE);
        local CFrame2 = CenterSphere.CFrame;
        local _ = CFrame2 + Vector3.new(CFrame2.X, CFrame2.Y + (0 + 3 * (v149 / NyokaBalance.STAFF_MAX_CHARGE)), CFrame2.Z);
        local v151 = Size.X + Size.X * 0.2 * u145:quadraticEaseInOut(v149 / NyokaBalance.STAFF_MAX_CHARGE);

        if Handle2 and Handle then
            Handle2.CFrame = Handle2.CFrame * CFrame.Angles(0, math.rad(v150), 0);
            Handle.CFrame = Handle2.WorldCFrame;
            CenterSphere.Size = Vector3.new(v151, v151, v151);
        end;
    end);
end;

function u9.quadraticEaseInOut(p152, p153) -- Line: 1026
    if p153 < 0.5 then
        return 2 * p153 * p153;
    end;

    return -1 + (4 - 2 * p153) * p153;
end;

function u9.createHealEffects(p154, p155, p156) -- Line: 1029
    -- upvalues: EntityUtil (copy), u3 (copy), TweenService (copy)
    local v157 = EntityUtil:getEntity(p155);

    if v157 ~= nil then
        v157 = v157:getHandItemInstanceFromCharacter();
    end;

    if v157 == nil then
        return nil;
    end;

    local Handle = v157:FindFirstChild("Handle");

    if Handle ~= nil then
        Handle = Handle:FindFirstChild("StaffPivotAttachment");
    end;

    local Character = p156.Character;

    if Character == nil then
        return nil;
    end;

    local UpperTorso = Character:FindFirstChild("UpperTorso");

    if UpperTorso ~= nil then
        UpperTorso = UpperTorso:FindFirstChild("BodyFrontAttachment");
    end;

    if UpperTorso == nil or Handle == nil then
        return nil;
    end;

    local u158 = u3("Beam", {
        Name = "MendingBeam",
        Width0 = 0.1,
        Width1 = 0.25,
        FaceCamera = true,
        TextureLength = 3,
        Segments = 1,
        Brightness = 2,
        LightEmission = 1,
        Attachment0 = Handle,
        Attachment1 = UpperTorso,
        Color = ColorSequence.new(Color3.fromRGB(255, 243, 1)),
        Parent = Handle,
        Transparency = NumberSequence.new(0.5, 0.25)
    });
    TweenService:Create(u158, TweenInfo.new(0.27999999999999997), {
        Width0 = 0.13,
        Width1 = 0.5,
        Brightness = 4
    }):Play();
    task.delay(0.29, function() -- Line: 1078
        -- upvalues: u158 (copy)
        local v159 = u158;

        if v159 ~= nil then
            v159:Destroy();
        end;
    end);
end;

KnitClient.CreateController(u9.new());

return nil;
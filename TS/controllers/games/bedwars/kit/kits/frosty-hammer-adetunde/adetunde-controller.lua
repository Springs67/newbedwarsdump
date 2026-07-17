-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local FrostyHammerBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "frosty-hammer-balance").FrostyHammerBalance;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local FrostyHammerUpgrade = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "frosty-hammer", "frosty-hammer-upgrades").FrostyHammerUpgrade;
local FrostyHammerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "frosty-hammer", "frosty-hammer-util").FrostyHammerUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local ShieldType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shield", "shield-type").ShieldType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "AdetundeController";
    end,

    __index = BaseKitController
});
u6.__index = u6;

function u6.new(...) -- Line: 44
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 48
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), GameSound (copy), BedwarsImageId (copy), AnimationType (copy)
    BaseKitController.constructor(p8, BedwarsKit.FROSTY_HAMMER, {
        sounds = {
            GameSound.FROST_HAMMER_SLAM,
            GameSound.ICICLE_IMPACT_1,
            GameSound.ICICLE_IMPACT_2,
            GameSound.ICICLE_BREAK_1,
            GameSound.ICICLE_BREAK_2,
            GameSound.FROST_SHIELD_SUMMON
        },
        imageIds = { BedwarsImageId.SKATING_ON_ICE, BedwarsImageId.SKATING_MAX_SPEED, BedwarsImageId.SKATING_JUMP },
        animations = { AnimationType.FROSTY_SHIELD_SUMMON, AnimationType.FROSTY_HAMMER_SLAM, AnimationType.FROSTY_HAMMER_UPGRADE }
    });
    p8.Name = "AdetundeController";
    p8.upgradeMap = {};
end;

function u6.KnitStart(p9) -- Line: 57
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p9);
end;

function u6.onKitLocalActivated(p10, p11) -- Line: 60
end;

function u6.onKitLocalDeactivated(p12) -- Line: 62
end;

function u6.onKitReplicationActivated(u13, p14) -- Line: 64
    -- upvalues: ClientSyncEvents (copy), SyncEventPriority (copy), ItemType (copy), EntityUtil (copy), InventoryUtil (copy), Players (copy), FrostyHammerUtil (copy), FrostyHammerUpgrade (copy), default (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), KnitClient2 (copy), SoundManager (copy), KnitClient (copy), GameSound (copy), WatchCharacter (copy)
    p14:GiveTask(ClientSyncEvents.SwordSwing:setPriority(SyncEventPriority.HIGHEST):connect(function(p15) -- Line: 65
        -- upvalues: ItemType (ref), EntityUtil (ref), InventoryUtil (ref), Players (ref), FrostyHammerUtil (ref), FrostyHammerUpgrade (ref)
        if p15.swordType == ItemType.FROSTY_HAMMER then
            if not EntityUtil:getLocalPlayerEntity() then
                return nil;
            end;

            if not InventoryUtil.getToolFromInventory(Players.LocalPlayer, ItemType.FROSTY_HAMMER) then
                return nil;
            end;

            local v16 = FrostyHammerUtil.getUpgradesFromHammer(Players.LocalPlayer);
            p15.attackSpeed = FrostyHammerUtil.getAttackSpeed(v16[FrostyHammerUpgrade.SPEED]);

            if Players.LocalPlayer:GetAttribute("HammerHitCount") == 0 then
                p15.attackSpeed = 1;
            end;
        end;
    end));
    p14:GiveTask(ClientSyncEvents.SwordSwing:setPriority(SyncEventPriority.LOW):connect(function(p17) -- Line: 86
        -- upvalues: ItemType (ref)
        if p17.swordType == ItemType.FROSTY_HAMMER then
            p17.bufferTime = nil;
        end;
    end));
    default.Client:Get("FrostyHammerStrike"):Connect(function(p18) -- Line: 91
        -- upvalues: AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), Players (ref), KnitClient2 (ref), SoundManager (ref), KnitClient (ref), GameSound (ref)
        AnimationUtil:playAnimation(p18.player, GameAnimationUtil:getAssetId(AnimationType.FROSTY_HAMMER_SLAM), {
            looped = false
        });

        if p18.player == Players.LocalPlayer then
            KnitClient2.Controllers.ViewmodelController:playAnimation(AnimationType.JUGGERNAUT_ATTACK_3_FP);
        end;

        local Character = p18.player.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        local v19 = KnitClient.Controllers.KitSkinController:getPlayerKitSkinMeta(p18.player);

        if v19 ~= nil then
            v19 = v19.adetunde;

            if v19 ~= nil then
                v19 = v19.slamSound;
            end;
        end;

        if v19 == nil then
            v19 = GameSound.FROST_HAMMER_SLAM;
        end;

        SoundManager:playSound(v19, {
            rollOffMaxDistance = 220,
            position = Character
        });
    end);
    default.Client:Get("FrostyHammerStrikeEffect"):Connect(function(p20) -- Line: 124
        -- upvalues: u13 (copy), SoundManager (ref), GameSound (ref)
        local count = p20.count;
        u13:playSlamEffect(p20.center, count == nil and 0 or count, p20.player);

        if p20.count == 1 then
            SoundManager:playSound(GameSound.ICICLE_IMPACT_1, {
                rollOffMaxDistance = 220,
                position = p20.center.Position
            });

            return;
        end;

        if p20.count == 2 then
            SoundManager:playSound(GameSound.ICICLE_IMPACT_2, {
                rollOffMaxDistance = 220,
                position = p20.center.Position
            });
        end;
    end);
    default.Client:Get("FrostShieldAdded"):Connect(function(p21) -- Line: 144
        -- upvalues: AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), KnitClient (ref), GameSound (ref), u13 (copy)
        local v22 = AnimationUtil:playAnimation(p21.player, GameAnimationUtil:getAssetId(AnimationType.FROSTY_SHIELD_SUMMON));

        if v22 ~= nil then
            v22:AdjustSpeed(2);
        end;

        local v23 = KnitClient.Controllers.KitSkinController:getPlayerKitSkinMeta(p21.player);

        if v23 ~= nil then
            v23 = v23.adetunde;

            if v23 ~= nil then
                v23 = v23.shieldSound;
            end;
        end;

        if v23 == nil then
            v23 = GameSound.FROST_SHIELD_SUMMON;
        end;

        local v24 = {};
        local Character = p21.player.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        v24.position = Character;
        v24.rollOffMaxDistance = 220;
        SoundManager:playSound(v23, v24);
        u13:equipFrostArmor(p21.player);
    end);
    WatchCharacter(function(p25, u26) -- Line: 176
        -- upvalues: u13 (copy)
        u26:GetAttributeChangedSignal("StormStack"):Connect(function() -- Line: 177
            -- upvalues: u26 (copy), u13 (ref)
            local v27 = u26:GetAttribute("StormStack");
            u13:handleStormEffect(u26, v27 == nil and 0 or v27);
        end);
        u26:GetAttributeChangedSignal("StormStartTime"):Connect(function() -- Line: 185
            -- upvalues: u26 (copy), u13 (ref)
            local v28 = u26:GetAttribute("StormStartTime");

            if v28 == 0 or (v28 ~= v28 or (v28 == "" or not v28)) then
                u13:removeStrom(u26);
            end;
        end);
    end);
end;

function u6.onKitReplicationDeactivated(p29) -- Line: 193
end;

function u6.onInnateAbilityEnabled(p30, p31, p32) -- Line: 195
end;

function u6.onAbilityUsed(p33, p34, p35) -- Line: 197
end;

function u6.equipFrostArmor(u36, u37) -- Line: 199
    -- upvalues: KnitClient (copy), ReplicatedStorage (copy), WeldUtil (copy), u3 (copy), EntityUtil (copy), ShieldType (copy)
    print("AdetundeController: equipFrostArmor ", u37.Name);
    local Character = u37.Character;

    if not Character then
        return nil;
    end;

    local v38 = KnitClient.Controllers.KitSkinController:getPlayerKitSkinMeta(u37);

    if v38 ~= nil then
        v38 = v38.adetunde;
    end;

    local v39;

    if v38 == nil then
        v39 = v38;
    else
        v39 = v38.frostArmorLeft:Clone();
    end;

    if v39 == nil then
        v39 = ReplicatedStorage.Assets.Effects.FrostArmorLeft:Clone();
    end;

    local v40;

    if v38 == nil then
        v40 = v38;
    else
        v40 = v38.frostArmorRight:Clone();
    end;

    if v40 == nil then
        v40 = ReplicatedStorage.Assets.Effects.FrostArmorRight:Clone();
    end;

    local v41;

    if v38 == nil then
        v41 = v38;
    else
        v41 = v38.frostVest:Clone();
    end;

    if v41 == nil then
        v41 = ReplicatedStorage.Assets.Effects.FrostVest:Clone();
    end;

    local v42;

    if v38 == nil then
        v42 = v38;
    else
        v42 = v38.frostHelmet:Clone();
    end;

    if v42 == nil then
        v42 = ReplicatedStorage.Assets.Effects.FrostHelmet:Clone();
    end;

    local u43 = {
        v39,
        v40,
        v41,
        v42
    };

    local function _(p44) -- Line: 244
        -- upvalues: Character (copy)
        p44.Parent = Character;
    end;

    for i, v in u43 do
        local _ = i - 1;
        v.Parent = Character;
    end;

    WeldUtil:weldCharacterAccessories(Character);
    local Handle = u43[3]:FindFirstChild("Handle");

    if v38 ~= nil then
        v38 = v38.frostShieldChargingEffect;

        if v38 ~= nil then
            v38 = v38:Clone();
        end;
    end;

    if v38 == nil then
        v38 = ReplicatedStorage.Assets.Effects.FrostShieldCharging:Clone();
    end;

    v38.Position = Handle.Position;
    v38.Parent = Handle;
    u3("WeldConstraint", {
        Part0 = v38,
        Part1 = Handle,
        Parent = v38
    });
    local v45 = ReplicatedStorage.Assets.Effects.FrostShieldEffect:Clone();
    local TrailLibrary = v45:FindFirstChild("TrailLibrary");

    if not TrailLibrary then
        return nil;
    end;

    require(TrailLibrary).InwardTrail:Init({
        EndPoint = Handle
    }, {
        Duration = 0.3,
        Offset = 17,
        Radius = 13,
        Count = 9,
        Interval = 0.03,
        Easing = "Linear"
    });
    local v46 = EntityUtil:getEntity(u37);
    local u47 = nil;

    if v46 ~= nil then
        v46 = v46:getInstance():GetAttributeChangedSignal("Shield_" .. ShieldType.FROSTY_SHIELD):Connect(function() -- Line: 294
            -- upvalues: u43 (copy), u47 (ref), u36 (copy), u37 (copy)
            local function _(p48) -- Line: 296
                -- upvalues: u47 (ref), u36 (ref), u37 (ref)
                p48:Destroy();
                local v49 = u47;

                if v49 ~= nil then
                    v49:Disconnect();
                end;

                u36:frostShieldBreakAnimation(u37);
            end;

            for i, v in u43 do
                local _ = i - 1;
                v:Destroy();
                local v50 = u47;

                if v50 ~= nil then
                    v50:Disconnect();
                end;

                u36:frostShieldBreakAnimation(u37);
            end;
        end);
    end;

    local v51 = false;
    local v52 = 0;

    while true do
        if v51 then
            v52 = v52 + 1;
        else
            v51 = true;
        end;

        if v52 >= 7 then
            v38:Destroy();
            v45:Destroy();

            return;
        end;

        local function _(p53) -- Line: 323
            local Handle2 = p53:FindFirstChild("Handle");
            Handle2.Transparency = Handle2.Transparency - 0.1;
        end;

        for i, v in u43 do
            local _ = i - 1;
            local Handle2 = v:FindFirstChild("Handle");
            Handle2.Transparency = Handle2.Transparency - 0.1;
        end;

        task.wait(0.1);
    end;
end;

function u6.frostShieldBreakAnimation(p54, p55) -- Line: 335
    -- upvalues: KnitClient (copy), ReplicatedStorage (copy), SoundManager (copy), GameSound (copy), u3 (copy)
    local u56 = KnitClient.Controllers.KitSkinController:getPlayerKitSkinMeta(p55);

    if u56 ~= nil then
        u56 = u56.adetunde;
    end;

    if u56 ~= nil then
        u56 = u56.frostShieldBreakEffect;

        if u56 ~= nil then
            u56 = u56:Clone();
        end;
    end;

    if u56 == nil then
        u56 = ReplicatedStorage.Assets.Effects.FrostShieldBreak:Clone();
    end;

    local Character = p55.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    u56.Position = Character.Position;
    local v57 = KnitClient.Controllers.KitSkinController:getPlayerKitSkinMeta(p55);

    if v57 ~= nil then
        v57 = v57.adetunde;

        if v57 ~= nil then
            v57 = v57.shieldBlastSound;
        end;
    end;

    if v57 == nil then
        v57 = GameSound.FROST_SHIELD_EXPLOSION;
    end;

    SoundManager:playSound(v57, {
        rollOffMaxDistance = 220,
        position = Character.Position
    });
    u3("WeldConstraint", {
        Part0 = u56,
        Part1 = Character,
        Parent = u56
    });
    u56.Parent = Character;

    local function _(p58) -- Line: 385
        if p58:IsA("ParticleEmitter") then
            p58:Emit(20);
        end;
    end;

    for i, descendant in u56:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant:Emit(20);
        end;
    end;

    task.delay(1, function() -- Line: 393
        -- upvalues: u56 (copy)
        u56:Destroy();
    end);
end;

function u6.playSlamEffect(p59, p60, p61, p62) -- Line: 397
    -- upvalues: KnitClient (copy), ReplicatedStorage (copy), Workspace (copy)
    local u63 = KnitClient.Controllers.KitSkinController:getPlayerKitSkinMeta(p62);

    if u63 ~= nil then
        u63 = u63.adetunde;
    end;

    if u63 ~= nil then
        u63 = u63.frostHammerSlamEffect:Clone();
    end;

    if u63 == nil then
        u63 = ReplicatedStorage.Assets.Effects.FrostHammerSlamEffect:Clone();
    end;

    u63.CFrame = p60 * CFrame.Angles(1.5707963267948966, 0, 0) - Vector3.new(0, 2, 0);
    u63.Anchored = true;
    u63.Parent = Workspace;
    local u64 = 30 - p61 * 10;

    local function _(p65) -- Line: 420
        -- upvalues: u64 (copy)
        if p65:IsA("ParticleEmitter") then
            p65:Emit(u64 * 2);
        end;
    end;

    for i, descendant in u63:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant:Emit(u64 * 2);
        end;
    end;

    task.delay(1, function() -- Line: 428
        -- upvalues: u63 (copy)
        u63:Destroy();
    end);
end;

function u6.handleStormEffect(p66, u67, p68) -- Line: 432
    -- upvalues: KnitClient (copy), u5 (copy), ReplicatedStorage (copy), u3 (copy), FrostyHammerBalance (copy), SoundManager (copy), GameSound (copy), RunService (copy)
    local u69 = KnitClient.Controllers.KitSkinController:getCharacterKitSkinMeta(u67);

    if u69 ~= nil then
        u69 = u69.adetunde;
    end;

    local function _(p70) -- Line: 439
        -- upvalues: u5 (ref)
        local v71 = u5.includes(p70.Name, "FrostHammerStorm") and p70:IsA("Model");

        return v71;
    end;

    local u72 = nil;

    for i, child in u67:GetChildren() do
        local _ = i - 1;
        local v73 = u5.includes(child.Name, "FrostHammerStorm") and child:IsA("Model");

        if v73 == true then
            u72 = child;
            break;
        end;
    end;

    if not u72 and p68 > 0 then
        if u69 == nil then
            u72 = u69;
        else
            u72 = u69.frostHammerStormEffect:Clone();
        end;

        if u72 == nil then
            u72 = ReplicatedStorage.Assets.Effects.FrostHammerStorm:Clone();
        end;

        u72:PivotTo(u67:GetPrimaryPartCFrame() - Vector3.new(0, 6, 0));
        u3("WeldConstraint", {
            Part0 = u72.PrimaryPart,
            Part1 = u67.PrimaryPart,
            Parent = u72.PrimaryPart
        });
        u72.Parent = u67;
    end;

    if p68 >= 1 then
        local v74;

        if u72 ~= nil then
            v74 = u72.PrimaryPart;

            if v74 ~= nil then
                v74 = v74:FindFirstChild("Aura");

                if v74 ~= nil then
                    v74 = v74:FindFirstChild("Level1");
                end;
            end;
        end;

        if v74 then
            v74:Emit(30);
        end;
    end;

    if p68 >= 2 then
        local v75;

        if u72 ~= nil then
            v75 = u72.PrimaryPart;

            if v75 ~= nil then
                v75 = v75:FindFirstChild("Aura");

                if v75 ~= nil then
                    v75 = v75:FindFirstChild("Level2");
                end;
            end;
        end;

        if v75 then
            v75:Emit(30);
        end;
    end;

    if FrostyHammerBalance.STORM_STACK_REQ <= p68 then
        if u72 ~= nil then
            local function _(p76) -- Line: 511
                if p76:IsA("ParticleEmitter") then
                    p76.Enabled = true;
                end;
            end;

            for i, descendant in u72:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("ParticleEmitter") then
                    descendant.Enabled = true;
                end;
            end;
        end;

        local v77 = KnitClient.Controllers.KitSkinController:getCharacterKitSkinMeta(u67);

        if v77 ~= nil then
            v77 = v77.adetunde;

            if v77 ~= nil then
                v77 = v77.stormStartSound;
            end;
        end;

        if v77 == nil then
            v77 = GameSound.FROST_STORM_START;
        end;

        local v78 = {};
        local v79 = u72;

        if v79 ~= nil then
            v79 = v79.PrimaryPart;

            if v79 ~= nil then
                v79 = v79.Position;
            end;
        end;

        v78.position = v79;
        v78.rollOffMaxDistance = 220;
        SoundManager:playSound(v77, v78);
        local v80 = {};
        local v81 = KnitClient.Controllers.KitSkinController:getCharacterKitSkinMeta(u67);

        if v81 ~= nil then
            v81 = v81.adetunde;

            if v81 ~= nil then
                v81 = v81.stormLoopSound;
            end;
        end;

        if v81 == nil then
            v81 = GameSound.FROST_STORM_LOOP;
        end;

        v80.SoundId = v81;
        v80.RollOffMinDistance = 20;
        v80.RollOffMaxDistance = 40;
        v80.Volume = 0.7;
        v80.Playing = true;
        v80.PlaybackSpeed = 1;
        local v82 = u72;

        if v82 ~= nil then
            v82 = v82.PrimaryPart;
        end;

        v80.Parent = v82;
        v80.Looped = true;
        u3("Sound", v80):Play();

        if u69 ~= nil then
            u69 = u69.auraEffect:Clone();
        end;

        if u69 == nil then
            u69 = ReplicatedStorage.Assets.Effects.FrostHammerAura:Clone();
        end;

        u69.Parent = u72;
        local u83 = 0;
        local u84 = nil;
        u84 = RunService.Heartbeat:Connect(function(p85) -- Line: 585
            -- upvalues: u83 (ref), u67 (copy), u69 (copy), u72 (ref), u84 (ref)
            u83 = u83 + p85;
            local v86 = u67:GetPrimaryPartCFrame();

            if u69 and v86 then
                u69.CFrame = CFrame.new(v86.Position) * CFrame.Angles(0, u83 * 0.8, 0);
            end;

            local v87 = u72;

            if v87 ~= nil then
                v87.Destroying:Connect(function() -- Line: 596
                    -- upvalues: u69 (ref), u84 (ref)
                    u69:Destroy();
                    u84:Disconnect();
                end);
            end;
        end);
    end;
end;

function u6.removeStrom(p88, p89) -- Line: 604
    -- upvalues: u5 (copy), SoundManager (copy), KnitClient (copy), GameSound (copy), Workspace (copy)
    local function _(p90) -- Line: 606
        -- upvalues: u5 (ref)
        local v91 = u5.includes(p90.Name, "FrostHammerStorm") and p90:IsA("Model");

        return v91;
    end;

    local u92 = nil;

    for i, child in p89:GetChildren() do
        local _ = i - 1;
        local v93 = u5.includes(child.Name, "FrostHammerStorm") and child:IsA("Model");

        if v93 == true then
            u92 = child;
            break;
        end;
    end;

    if u92 ~= nil then
        local function _(p94) -- Line: 622
            if p94:IsA("ParticleEmitter") then
                p94.Enabled = false;
            end;
        end;

        for i, descendant in u92:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ParticleEmitter") then
                descendant.Enabled = false;
            end;
        end;
    end;

    local v95 = KnitClient.Controllers.KitSkinController:getCharacterKitSkinMeta(p89);

    if v95 ~= nil then
        v95 = v95.adetunde;

        if v95 ~= nil then
            v95 = v95.stormEndSound;
        end;
    end;

    if v95 == nil then
        v95 = GameSound.FROST_STORM_END;
    end;

    local v96 = {};
    local v97;

    if u92 == nil then
        v97 = u92;
    else
        v97 = u92.PrimaryPart;

        if v97 ~= nil then
            v97 = v97.Position;
        end;
    end;

    v96.position = v97;
    v96.rollOffMaxDistance = 220;
    v96.volumeMultiplier = 3;
    SoundManager:playSound(v95, v96);

    if u92 then
        u92.Parent = Workspace;
        task.delay(0.5, function() -- Line: 658
            -- upvalues: u92 (copy)
            local v98 = u92;

            if v98 ~= nil then
                v98:Destroy();
            end;
        end);
    end;
end;

KnitClient.CreateController(u6.new());

return nil;
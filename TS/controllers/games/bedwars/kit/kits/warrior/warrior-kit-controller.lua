-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local WarriorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "warrior", "warrior-kit-util").WarriorUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local WarriorGritBar = RuntimeLib.import(script, script.Parent, "ui", "warrior-grit-bar").WarriorGritBar;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "WarriorKitController";
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
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p8, BedwarsKit.WARRIOR);
    p8.Name = "WarriorKitController";
    p8.bubbleEffectMaidMap = {};
end;

function u6.KnitStart(p9) -- Line: 53
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p9);
end;

function u6.onKitLocalActivated(u10, p11) -- Line: 56
    -- upvalues: KnitClient (copy), AnimationType (copy), GameSound (copy), Flamework (copy), u4 (copy), WarriorGritBar (copy), AbilityId (copy), AbilityMeta (copy), InventoryUtil (copy), Players (copy), getItemMeta (copy), AbilityState (copy), ClientStore (copy), CooldownId (copy)
    KnitClient.Controllers.PreloadController:runPreload({
        animations = { AnimationType.JUGGERNAUT_SPIN, AnimationType.JUGGERNAUT_SWING, AnimationType.JUGGERNAUT_LEAP_ATTACK },
        sounds = {
            GameSound.JUGGERNAUT_SPIN,
            GameSound.JUGGERNAUT_GROUND_SMASH,
            GameSound.JUGGERNAUT_LEAP,
            GameSound.STOMPER_HIT
        }
    });
    p11:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createFragment({
        WarriorGritBar = u4.createElement(WarriorGritBar)
    })));
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.WARRIOR_STRIKE, AbilityMeta[AbilityId.WARRIOR_STRIKE].triggerConfig);
    u10.abilityRef = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.WARRIOR_STRIKE);
    local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

    if hand ~= nil then
        hand = hand.itemType;
    end;

    if u10.abilityRef and not (hand and getItemMeta(hand).sword) then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u10.abilityRef, AbilityState.DISABLED);
    end;

    ClientStore.changed:connect(function(p12, p13) -- Line: 74
        -- upvalues: u10 (copy), AbilityState (ref), getItemMeta (ref), Flamework (ref), CooldownId (ref)
        local hand2 = p13.Inventory.observedInventory.inventory.hand;

        if hand2 ~= nil then
            hand2 = hand2.itemType;
        end;

        local hand3 = p12.Inventory.observedInventory.inventory.hand;

        if hand3 ~= nil then
            hand3 = hand3.itemType;
        end;

        if hand2 == hand3 then
            return nil;
        end;

        local abilityRef = u10.abilityRef;

        if abilityRef ~= nil then
            abilityRef = abilityRef.abilityState;
        end;

        if abilityRef == AbilityState.DISABLED then
            if hand3 and getItemMeta(hand3).sword then
                if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(CooldownId.WARROIR_STRIKE) > 0 then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u10.abilityRef, AbilityState.ON_COOLDOWN);

                    return;
                end;

                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u10.abilityRef, AbilityState.READY);
            end;
        elseif u10.abilityRef and not (hand3 and getItemMeta(hand3).sword) then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u10.abilityRef, AbilityState.DISABLED);
        end;
    end);
end;

function u6.onKitLocalDeactivated(p14) -- Line: 107
end;

function u6.onKitReplicationActivated(u15, p16) -- Line: 109
    -- upvalues: default (copy), AnimationType (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), Players (copy), KnitClient (copy), SoundManager (copy), ClientSyncEvents (copy), StatusEffectType (copy)
    default.Client:Get("WarriorStrike"):Connect(function(p17) -- Line: 110
        -- upvalues: AnimationType (ref), GameSound (ref), u15 (copy), AnimationUtil (ref), GameAnimationUtil (ref), Players (ref), KnitClient (ref), SoundManager (ref)
        local JUGGERNAUT_SPIN = AnimationType.JUGGERNAUT_SPIN;
        local JUGGERNAUT_SPIN_FP = AnimationType.JUGGERNAUT_SPIN_FP;
        local JUGGERNAUT_SPIN2 = GameSound.JUGGERNAUT_SPIN;
        local Character = p17.user.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        local strikeLevel = p17.strikeLevel;

        if strikeLevel == 1 then
            JUGGERNAUT_SPIN = AnimationType.JUGGERNAUT_SWING;
            JUGGERNAUT_SPIN_FP = AnimationType.NEW_SWORD_SWING_FP;
            JUGGERNAUT_SPIN2 = GameSound.JUGGERNAUT_GROUND_SMASH;
            u15:strikeEffect(p17.user);
        elseif strikeLevel == 2 then
            JUGGERNAUT_SPIN = AnimationType.JUGGERNAUT_LEAP_ATTACK;
            JUGGERNAUT_SPIN2 = GameSound.JUGGERNAUT_LEAP;
            JUGGERNAUT_SPIN_FP = AnimationType.JUGGERNAUT_LEAP_FP;
            u15:fullGritStrikeEffect(p17.user);
        elseif strikeLevel == 3 then
            JUGGERNAUT_SPIN = AnimationType.JUGGERNAUT_LEAP_ATTACK;
            JUGGERNAUT_SPIN_FP = AnimationType.JUGGERNAUT_LEAP_FP;
            JUGGERNAUT_SPIN2 = GameSound.JUGGERNAUT_LEAP;
            u15:fullGritStrikeEffect(p17.user);
        elseif strikeLevel == 0 then
            u15:spinEffect(p17.user);
        end;

        AnimationUtil:playAnimation(p17.user, GameAnimationUtil:getAssetId(JUGGERNAUT_SPIN), {
            looped = false
        });

        if p17.user == Players.LocalPlayer then
            AnimationUtil:playAnimation(p17.user, GameAnimationUtil:getAssetId(JUGGERNAUT_SPIN), {
                looped = false
            });
            KnitClient.Controllers.ViewmodelController:playAnimation(JUGGERNAUT_SPIN_FP);
        end;

        if Character then
            SoundManager:playSound(JUGGERNAUT_SPIN2, {
                position = Character
            });

            if p17.strikeLevel > 1 then
                task.delay(0.7, function() -- Line: 165
                    -- upvalues: SoundManager (ref), GameSound (ref), Character (copy)
                    SoundManager:playSound(GameSound.STOMPER_HIT, {
                        position = Character
                    });
                end);
            end;
        end;
    end);
    p16:GiveTask(ClientSyncEvents.StatusEffectAdded:connect(function(p18) -- Line: 173
        -- upvalues: StatusEffectType (ref), u15 (copy)
        if p18.statusEffect == StatusEffectType.WARRIOR_FINAL_STAND then
            u15:createBubble(p18.entityInstance);
        end;
    end));
    p16:GiveTask(ClientSyncEvents.StatusEffectRemoved:connect(function(p19) -- Line: 178
        -- upvalues: StatusEffectType (ref), Players (ref), u15 (copy)
        local v20 = p19.statusEffect == StatusEffectType.WARRIOR_FINAL_STAND and Players:GetPlayerFromCharacter(p19.entityInstance);

        if v20 then
            local v21 = u15.bubbleEffectMaidMap[v20];

            if v21 ~= nil then
                v21:DoCleaning();
            end;

            u15.bubbleEffectMaidMap[v20] = nil;
        end;
    end));
    default.Client:Get("WarriorRevive"):Connect(function(p22) -- Line: 191
        -- upvalues: u15 (copy)
        u15:playReviveEffect(p22.player);
    end);
end;

function u6.onKitReplicationDeactivated(p23) -- Line: 195
end;

function u6.onInnateAbilityEnabled(p24, p25, p26) -- Line: 197
end;

function u6.onAbilityUsed(p27, p28, p29) -- Line: 199
end;

function u6.spinEffect(p30, p31) -- Line: 201
    -- upvalues: u2 (copy), ReplicatedStorage (copy), Workspace (copy), RunService (copy)
    local u32 = u2.new();
    local u33 = ReplicatedStorage.Assets.Effects.JuggernautSpin:Clone();
    u33.Parent = Workspace;
    local Character = p31.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    u32:GiveTask(u33);
    u32:GiveTask(RunService.Heartbeat:Connect(function(p34) -- Line: 214
        -- upvalues: Character (copy), u33 (copy)
        local Position = Character.Position;

        if Position then
            u33.Position = Position;
        end;
    end));
    task.delay(0.5, function() -- Line: 220
        -- upvalues: u32 (copy)
        u32:DoCleaning();
    end);
end;

function u6.strikeEffect(u35, u36) -- Line: 224
    -- upvalues: u2 (copy), ReplicatedStorage (copy), Workspace (copy), RunService (copy)
    local u37 = u2.new();
    local u38 = ReplicatedStorage.Assets.Effects.JuggernautSpin:Clone();
    u38.Parent = Workspace;
    local Character = u36.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    task.delay(0.3, function() -- Line: 236
        -- upvalues: u35 (copy), u36 (copy)
        u35:playSlashEffect(u36);
    end);
    u37:GiveTask(u38);
    u37:GiveTask(RunService.Heartbeat:Connect(function(p39) -- Line: 240
        -- upvalues: Character (copy), u38 (copy)
        local CFrame2 = Character.CFrame;

        if CFrame2 then
            u38:PivotTo(CFrame2 * CFrame.Angles(3.141592653589793, 0, 5.497787143782138));
        end;
    end));
    task.delay(0.4, function() -- Line: 248
        -- upvalues: u37 (copy)
        u37:DoCleaning();
    end);
end;

function u6.fullGritStrikeEffect(u40, u41) -- Line: 252
    task.delay(0.25, function() -- Line: 253
        -- upvalues: u40 (copy), u41 (copy)
        u40:playSlashEffect(u41);
    end);
    task.delay(0.7, function() -- Line: 256
        -- upvalues: u40 (copy), u41 (copy)
        u40:playParticleEffect(u41);
    end);
end;

function u6.playSlashEffect(p42, p43) -- Line: 260
    -- upvalues: ReplicatedStorage (copy), Workspace (copy)
    local Character = p43.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.CFrame;
        end;
    end;

    if not Character then
        return nil;
    end;

    local u44 = ReplicatedStorage.Assets.Effects.WarriorStrike:Clone();
    u44:PivotTo(Character);
    u44.Parent = Workspace;
    u44:PivotTo(Character * CFrame.new(0, 0, -6));
    task.delay(0.15, function() -- Line: 279
        -- upvalues: u44 (copy)
        u44:Destroy();
    end);
end;

function u6.playParticleEffect(p45, p46) -- Line: 283
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), Players (copy)
    local Character = p46.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.CFrame;
        end;
    end;

    local v47;

    if Character == nil then
        v47 = Character;
    else
        v47 = Character.Position;
    end;

    if not (v47 and Character) then
        return nil;
    end;

    local v48 = v47 + Vector3.new(0, -2, 0) + Character.LookVector * 3;
    local u49 = ReplicatedStorage.Assets.Effects.JuggernautStabGround:Clone();
    local u50 = ReplicatedStorage.Assets.Effects.GroudCrack:Clone();
    u49.Position = v48;
    u49.Parent = Workspace;
    u50.Position = v48;
    u50.Parent = Workspace;
    local Character2 = Players.LocalPlayer.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;

        if Character2 ~= nil then
            Character2 = Character2.Position;
        end;
    end;

    if Character2 then
        Character2 = (Character2 - v48).Magnitude <= 20;
    end;

    if Character2 then
        p45:shakeScreen(v48);
    end;

    local function _(p51) -- Line: 328
        if p51:IsA("ParticleEmitter") then
            p51:Emit(30);
        end;
    end;

    for i, descendant in u49:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant:Emit(30);
        end;
    end;

    task.delay(1, function() -- Line: 336
        -- upvalues: u49 (copy), u50 (copy)
        u49:Destroy();
        u50:Destroy();
    end);
end;

function u6.shakeScreen(p52, p53) -- Line: 341
    -- upvalues: Players (copy), KnitClient (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:GetPrimaryPartCFrame();
    end;

    if not Character then
        return nil;
    end;

    KnitClient.Controllers.ScreenShakeController:shake(p53, Character.LookVector, {
        magnitude = 5,
        cycles = 5,
        duration = 0.4
    });
end;

function u6.createBubble(p54, p55) -- Line: 356
    -- upvalues: u2 (copy), Players (copy), EntityUtil (copy), u3 (copy), Workspace (copy), GameSound (copy), WarriorUtil (copy)
    local PrimaryPart = p55.PrimaryPart;
    local PrimaryPart2 = p55.PrimaryPart;

    if PrimaryPart2 ~= nil then
        PrimaryPart2 = PrimaryPart2.Position;
    end;

    local u56 = u2.new();
    local u57 = Players:GetPlayerFromCharacter(p55);

    if not (PrimaryPart2 and (PrimaryPart and (u57 and EntityUtil:getEntity(p55)))) then
        return nil;
    end;

    p54.bubbleEffectMaidMap[u57] = u56;
    local u58 = u3("Part", {
        Name = "FinalStandBubble",
        Size = Vector3.new(5, 5, 5),
        Anchored = false,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        Transparency = 0,
        Massless = true,
        CFrame = PrimaryPart.CFrame,
        Material = Enum.Material.ForceField,
        Shape = Enum.PartType.Ball,
        Parent = Workspace,
        Color = Color3.fromRGB(255, 0, 0)
    });
    u58:SetAttribute("FirstPersonVisible", false);
    u3("WeldConstraint", {
        Part1 = u58,
        Part0 = PrimaryPart,
        Parent = u58
    });
    u56:GiveTask(u58);
    local v59 = u3("Sound", {
        RollOffMinDistance = 20,
        RollOffMaxDistance = 40,
        Volume = 0.5,
        Playing = true,
        Looped = true,
        SoundId = GameSound.WARRIOR_FINAL_STAND_LOOP,
        Parent = u58
    });
    v59:Play();
    u56:GiveTask(v59);
    u57:GetAttributeChangedSignal(WarriorUtil.GRIT_ATTRIBUTE):Connect(function() -- Line: 403
        -- upvalues: u58 (copy), u57 (copy), WarriorUtil (ref)
        u58.Transparency = 1 - u57:GetAttribute(WarriorUtil.GRIT_ATTRIBUTE) / 50;
    end);
    PrimaryPart.Destroying:Connect(function() -- Line: 406
        -- upvalues: u56 (copy)
        u56:DoCleaning();
    end);
end;

function u6.playReviveEffect(p60, p61) -- Line: 410
    -- upvalues: u2 (copy), ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), GameSound (copy), RunService (copy)
    local Character = p61.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local u62 = u2.new();
    local u63 = ReplicatedStorage.Assets.Effects.WarriorEffect:Clone();
    u62:GiveTask(u63);
    u63.Parent = Workspace;
    u63.Position = Character.Position;
    SoundManager:playSound(GameSound.WARRIOR_FINAL_STAND_KILL, {
        position = Character.Position
    });

    local function _(p64) -- Line: 428
        if p64:IsA("ParticleEmitter") then
            p64:Emit(30);
        end;
    end;

    for i, descendant in u63:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant:Emit(30);
        end;
    end;

    u62:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 436
        -- upvalues: Character (copy), u63 (copy)
        local Position = Character.Position;

        if Position then
            u63.Position = Position;
        end;
    end));
    task.delay(1, function() -- Line: 442
        -- upvalues: u62 (copy)
        u62:DoCleaning();
    end);
end;

KnitClient.CreateController(u6.new());

return nil;
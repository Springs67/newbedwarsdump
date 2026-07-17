-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local AnimationUtil = v1.AnimationUtil;
local ConstantManager = v1.ConstantManager;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local InOutQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutQuad;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "void-knight-balance");
local getVoidKnightDefinitionForTier = v6.getVoidKnightDefinitionForTier;
local VoidKnightBalance = v6.VoidKnightBalance;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local VoidKnightNotification = RuntimeLib.import(script, script.Parent, "ui", "void-knight-notification").VoidKnightNotification;
local VoidKnightSidebar = RuntimeLib.import(script, script.Parent, "ui", "void-knight-progression-ui").VoidKnightSidebar;
local u7 = ConstantManager.registerConstants(script, {
    P1XRange = NumberRange.new(-30, 30),
    P1YRange = NumberRange.new(-15, 15),
    P1ZRange = NumberRange.new(0, 0)
});
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 48, Name: __tostring
        return "VoidKnightController";
    end,

    __index = BaseKitController
});
u8.__index = u8;

function u8.new(...) -- Line: 54
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 58
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), VoidKnightBalance (copy)
    BaseKitController.constructor(p10, BedwarsKit.VOID_KNIGHT);
    p10.Name = "VoidKnightController";
    p10.random = Random.new();
    p10.currentProgress = 0;
    p10.currentKills = 0;
    p10.currentTier = VoidKnightBalance.ProgressTiers.BASE;
end;

function u8.KnitStart(p11) -- Line: 66
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p11);
end;

function u8.onKitLocalActivated(u12, p13) -- Line: 69
    -- upvalues: Players (copy), VoidKnightBalance (copy), Flamework (copy), AbilityState (copy), getVoidKnightDefinitionForTier (copy), ItemType (copy), InventoryUtil (copy), KnitClient2 (copy), BedwarsKitSkinMeta (copy), GameSound (copy), SoundManager (copy), AbilityId (copy), AbilityMeta (copy), ClientStore (copy)
    u12:mountSidebarUI(p13);
    p13:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal(VoidKnightBalance.HaltedProgressAttribute):Connect(function() -- Line: 71
        -- upvalues: Players (ref), VoidKnightBalance (ref), u12 (copy), Flamework (ref), AbilityState (ref), getVoidKnightDefinitionForTier (ref), ItemType (ref), InventoryUtil (ref)
        local v14 = Players.LocalPlayer:GetAttribute(VoidKnightBalance.HaltedProgressAttribute);

        if not u12.enabledConsumeAbility then
            return nil;
        end;

        if v14 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u12.enabledConsumeAbility, AbilityState.DISABLED);

            return;
        end;

        local progressionRequirements = getVoidKnightDefinitionForTier((Players.LocalPlayer:GetAttribute(VoidKnightBalance.TierAttribute))).progressionRequirements;

        if progressionRequirements ~= nil then
            progressionRequirements = progressionRequirements.resourceType;
        end;

        local v15;

        if progressionRequirements == ItemType.IRON and InventoryUtil.getAmount(Players.LocalPlayer, ItemType.IRON) >= VoidKnightBalance.IronPerConsume then
            v15 = true;
        elseif progressionRequirements == ItemType.EMERALD then
            v15 = InventoryUtil.getAmount(Players.LocalPlayer, ItemType.EMERALD) >= VoidKnightBalance.EmeraldPerConsume;
        else
            v15 = false;
        end;

        if v15 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u12.enabledConsumeAbility, AbilityState.READY);

            return;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u12.enabledConsumeAbility, AbilityState.DISABLED);
    end));
    p13:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal(VoidKnightBalance.TierAttribute):Connect(function() -- Line: 93
        -- upvalues: Players (ref), VoidKnightBalance (ref), KnitClient2 (ref), BedwarsKitSkinMeta (ref), GameSound (ref), SoundManager (ref), u12 (copy), getVoidKnightDefinitionForTier (ref), ItemType (ref), Flamework (ref), AbilityId (ref), AbilityMeta (ref)
        local v16 = Players.LocalPlayer:GetAttribute(VoidKnightBalance.TierAttribute);

        if not Players.LocalPlayer.Character then
            return nil;
        end;

        local void_knight = BedwarsKitSkinMeta[KnitClient2.Controllers.KitSkinController:getKitSkin(Players.LocalPlayer.Character)].void_knight;
        local v17;

        if void_knight then
            v17 = void_knight.levelUpSounds;
        else
            v17 = {
                GameSound.VOID_KNIGHT_LEVEL_UP_1,
                GameSound.VOID_KNIGHT_LEVEL_UP_2,
                GameSound.VOID_KNIGHT_LEVEL_UP_3,
                GameSound.VOID_KNIGHT_LEVEL_UP_4
            };
        end;

        SoundManager:playSound(v17[v16 - 1 + 1], {
            position = nil,
            volumeMultiplier = 1.2
        });
        u12:sendTierNotifications(getVoidKnightDefinitionForTier(v16), v16);
        local progressionRequirements = getVoidKnightDefinitionForTier(v16).progressionRequirements;

        if progressionRequirements and progressionRequirements.resourceType == ItemType.EMERALD then
            local consumeIronRef = u12.consumeIronRef;

            if consumeIronRef ~= nil then
                consumeIronRef.Destroy();
            end;

            if Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbilities()[AbilityId.VOID_KNIGHT_CONSUME_EMERALD] ~= nil then
                return nil;
            end;

            local v18 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
            local VOID_KNIGHT_CONSUME_EMERALD = AbilityId.VOID_KNIGHT_CONSUME_EMERALD;
            local v19 = {};

            for i, v in AbilityMeta[AbilityId.VOID_KNIGHT_CONSUME_EMERALD].triggerConfig do
                v19[i] = v;
            end;

            v18:enableAbility(VOID_KNIGHT_CONSUME_EMERALD, v19):andThen(function(p20) -- Line: 126
                -- upvalues: u12 (ref)
                u12.consumeEmeraldRef = p20;
            end);
            u12.enabledConsumeAbility = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.VOID_KNIGHT_CONSUME_EMERALD);
        end;

        if getVoidKnightDefinitionForTier(u12.currentTier).unlocksAscendancy then
            local consumeIronRef = u12.consumeIronRef;

            if consumeIronRef ~= nil then
                consumeIronRef.Destroy();
            end;

            local consumeEmeraldRef = u12.consumeEmeraldRef;

            if consumeEmeraldRef ~= nil then
                consumeEmeraldRef.Destroy();
            end;

            local v21 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
            local VOID_KNIGHT_ASCEND = AbilityId.VOID_KNIGHT_ASCEND;
            local v22 = {};

            for i, v in AbilityMeta[AbilityId.VOID_KNIGHT_ASCEND].triggerConfig do
                v22[i] = v;
            end;

            v21:enableAbility(VOID_KNIGHT_ASCEND, v22);
        end;
    end));
    local u31 = ClientStore.changed:connect(function(p23, p24) -- Line: 152
        -- upvalues: Players (ref), VoidKnightBalance (ref), ItemType (ref), InventoryUtil (ref), Flamework (ref), AbilityId (ref), AbilityState (ref)
        if Players.LocalPlayer:GetAttribute(VoidKnightBalance.HaltedProgressAttribute) == true then
            return nil;
        end;

        local function _(p25) -- Line: 159
            -- upvalues: ItemType (ref)
            return p25.itemType == ItemType.IRON;
        end;

        local v26 = nil;

        for i, v in p24.Inventory.observedInventory.inventory.items do
            local _ = i - 1;

            if v.itemType == ItemType.IRON == true then
                v26 = v;
                break;
            end;
        end;

        local function _(p27) -- Line: 173
            -- upvalues: ItemType (ref)
            return p27.itemType == ItemType.IRON;
        end;

        local v28 = nil;

        for i, v in p23.Inventory.observedInventory.inventory.items do
            local _ = i - 1;

            if v.itemType == ItemType.IRON == true then
                v28 = v;
                break;
            end;
        end;

        if v26 == v28 then
            return nil;
        end;

        local v29 = InventoryUtil.getAmount(Players.LocalPlayer, ItemType.IRON);
        local v30 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.VOID_KNIGHT_CONSUME_IRON);

        if not v30 then
            return nil;
        end;

        if VoidKnightBalance.IronPerConsume <= v29 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v30, AbilityState.READY);

            return;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v30, AbilityState.DISABLED);
    end);
    p13:GiveTask(function() -- Line: 200
        -- upvalues: u31 (copy)
        u31:disconnect();
    end);
    local u40 = ClientStore.changed:connect(function(p32, p33) -- Line: 204
        -- upvalues: Players (ref), VoidKnightBalance (ref), ItemType (ref), InventoryUtil (ref), Flamework (ref), AbilityId (ref), AbilityState (ref)
        if Players.LocalPlayer:GetAttribute(VoidKnightBalance.HaltedProgressAttribute) == true then
            return nil;
        end;

        local function _(p34) -- Line: 211
            -- upvalues: ItemType (ref)
            return p34.itemType == ItemType.EMERALD;
        end;

        local v35 = nil;

        for i, v in p33.Inventory.observedInventory.inventory.items do
            local _ = i - 1;

            if v.itemType == ItemType.EMERALD == true then
                v35 = v;
                break;
            end;
        end;

        local function _(p36) -- Line: 225
            -- upvalues: ItemType (ref)
            return p36.itemType == ItemType.EMERALD;
        end;

        local v37 = nil;

        for i, v in p32.Inventory.observedInventory.inventory.items do
            local _ = i - 1;

            if v.itemType == ItemType.EMERALD == true then
                v37 = v;
                break;
            end;
        end;

        if v35 == v37 then
            return nil;
        end;

        local v38 = InventoryUtil.getAmount(Players.LocalPlayer, ItemType.EMERALD);
        local v39 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.VOID_KNIGHT_CONSUME_EMERALD);

        if not v39 then
            return nil;
        end;

        if VoidKnightBalance.EmeraldPerConsume <= v38 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v39, AbilityState.READY);

            return;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v39, AbilityState.DISABLED);
    end);
    p13:GiveTask(function() -- Line: 252
        -- upvalues: u40 (copy)
        return u40:disconnect();
    end);
end;

function u8.onAbilityUsed(p41, p42, p43) -- Line: 256
    -- upvalues: Players (copy), AbilityId (copy)
    if p43:isCancelled() then
        return nil;
    end;

    if p42 ~= Players.LocalPlayer.Character then
        p41:onAbilityUsedByNonLocalPlayer(p42, p43.ability);

        return nil;
    end;

    local ability = p43.ability;

    if ability == AbilityId.VOID_KNIGHT_CONSUME_IRON then
        p41:onConsumeIron(p42, p43);

        return;
    end;

    if ability == AbilityId.VOID_KNIGHT_CONSUME_EMERALD then
        p41:onConsumeEmerald(p42, p43);

        return;
    end;

    if ability ~= AbilityId.VOID_KNIGHT_ASCEND then
        return;
    end;

    p41:onAscend(p42, true);
end;

function u8.onKitLocalDeactivated(p44) -- Line: 280
end;

function u8.onKitReplicationActivated(p45, p46) -- Line: 282
end;

function u8.onKitReplicationDeactivated(p47) -- Line: 284
end;

function u8.onInnateAbilityEnabled(p48, p49, p50) -- Line: 286
    -- upvalues: Flamework (copy), AbilityId (copy)
    p48.consumeIronRef = p50;
    p48.enabledConsumeAbility = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.VOID_KNIGHT_CONSUME_IRON);
end;

function u8.onAbilityUsedByNonLocalPlayer(p51, p52, p53) -- Line: 290
    -- upvalues: AbilityId (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    if p53 == AbilityId.VOID_KNIGHT_CONSUME_IRON or p53 == AbilityId.VOID_KNIGHT_CONSUME_EMERALD then
        AnimationUtil:playAnimation(p52, GameAnimationUtil:getAssetId(AnimationType.USE_GRAVESTONE), {
            looped = false
        });

        return;
    end;

    if p53 ~= AbilityId.VOID_KNIGHT_ASCEND then
        return;
    end;

    p51:onAscend(p52, false);
end;

function u8.enableAscensionParticles(p54, p55, u56) -- Line: 308
    local AscensionEffect = p55:WaitForChild("UpperTorso"):WaitForChild("AscensionEffect");

    if AscensionEffect then
        local function _(p57) -- Line: 312
            if p57:IsA("ParticleEmitter") then
                return p57;
            end;
        end;

        local v58 = 0;
        local v59 = {};

        for i, descendant in AscensionEffect:GetDescendants() do
            local _ = i - 1;

            if not descendant:IsA("ParticleEmitter") then
                local descendant = nil;
            end;

            if descendant ~= nil then
                v58 = v58 + 1;
                v59[v58] = descendant;
            end;
        end;

        local function _(p60) -- Line: 329
            -- upvalues: u56 (copy)
            p60.Enabled = u56;
        end;

        for i, v in v59 do
            local _ = i - 1;
            v.Enabled = u56;
        end;
    end;
end;

function u8.onAscend(p61, p62, p63) -- Line: 337
    -- upvalues: KnitClient2 (copy), BedwarsKitSkinMeta (copy), SoundManager (copy), GameSound (copy)
    local void_knight = BedwarsKitSkinMeta[KnitClient2.Controllers.KitSkinController:getKitSkin(p62)].void_knight;
    local v64;

    if void_knight then
        v64 = void_knight.ascendSound;
    else
        v64 = GameSound.VOID_KNIGHT_ASCEND;
    end;

    local v65 = {
        volumeMultiplier = 1.3
    };
    local v66;

    if p63 then
        v66 = nil;
    else
        v66 = p62:GetPivot().Position;
    end;

    v65.position = v66;
    SoundManager:playSound(v64, v65);
end;

function u8.onConsumeIron(u67, p68, u69) -- Line: 346
    -- upvalues: InventoryUtil (copy), Players (copy), ItemType (copy), VoidKnightBalance (copy), ReplicatedStorage (copy), ItemUtil (copy)
    if InventoryUtil.getAmount(Players.LocalPlayer, ItemType.IRON) < VoidKnightBalance.IronPerConsume then
        u69:setCancelled(true);

        return nil;
    end;

    if Players.LocalPlayer:GetAttribute(VoidKnightBalance.HaltedProgressAttribute) == true then
        u69:setCancelled(true);

        return nil;
    end;

    u67:playConsumeEffectsOnCharacter(p68);
    local Position = u69.userCharacter:GetPivot().Position;
    task.spawn(function() -- Line: 358
        -- upvalues: VoidKnightBalance (ref), ReplicatedStorage (ref), ItemType (ref), ItemUtil (ref), u67 (copy), Position (copy), u69 (copy)
        local v70 = false;
        local v71 = 0;

        while true do
            if v70 then
                v71 = v71 + 1;
            else
                v70 = true;
            end;

            if v71 >= VoidKnightBalance.IronPerConsume then
                return;
            end;

            local v72 = ReplicatedStorage:WaitForChild("Items"):WaitForChild(ItemType.IRON);
            local u73 = ItemUtil.cloneItemIntoModel(v72);
            task.spawn(function() -- Line: 373
                -- upvalues: u67 (ref), u73 (copy), Position (ref), u69 (ref)
                u67:playItemConsumeEffect(u73, Position, function() -- Line: 374
                    -- upvalues: u69 (ref)
                    return u69.userCharacter:GetPivot();
                end, 1);
            end);
        end;
    end);
end;

function u8.playConsumeEffectsOnCharacter(p74, p75) -- Line: 382
    -- upvalues: KnitClient2 (copy), BedwarsKitSkinMeta (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    local void_knight = BedwarsKitSkinMeta[KnitClient2.Controllers.KitSkinController:getKitSkin(p75)].void_knight;
    AnimationUtil:playAnimation(p75, GameAnimationUtil:getAssetId(AnimationType.USE_GRAVESTONE), {
        looped = false
    });
    local v76;

    if void_knight then
        v76 = void_knight.consumeSound;
    else
        v76 = GameSound.VOID_KNIGHT_CONSUME;
    end;

    SoundManager:playSound(v76, {
        position = nil
    });
end;

function u8.onConsumeEmerald(u77, p78, u79) -- Line: 392
    -- upvalues: InventoryUtil (copy), Players (copy), ItemType (copy), VoidKnightBalance (copy), ReplicatedStorage (copy), ItemUtil (copy)
    if InventoryUtil.getAmount(Players.LocalPlayer, ItemType.EMERALD) < VoidKnightBalance.EmeraldPerConsume then
        u79:setCancelled(true);

        return nil;
    end;

    if Players.LocalPlayer:GetAttribute(VoidKnightBalance.HaltedProgressAttribute) == true then
        u79:setCancelled(true);

        return nil;
    end;

    u77:playConsumeEffectsOnCharacter(p78);
    local Position = u79.userCharacter:GetPivot().Position;
    task.spawn(function() -- Line: 404
        -- upvalues: VoidKnightBalance (ref), ReplicatedStorage (ref), ItemType (ref), ItemUtil (ref), u77 (copy), Position (copy), u79 (copy)
        local v80 = false;
        local v81 = 0;

        while true do
            if v80 then
                v81 = v81 + 1;
            else
                v80 = true;
            end;

            if v81 >= VoidKnightBalance.EmeraldPerConsume then
                return;
            end;

            local v82 = ReplicatedStorage:WaitForChild("Items"):WaitForChild(ItemType.EMERALD);
            local u83 = ItemUtil.cloneItemIntoModel(v82);
            task.spawn(function() -- Line: 419
                -- upvalues: u77 (ref), u83 (copy), Position (ref), u79 (ref)
                u77:playItemConsumeEffect(u83, Position, function() -- Line: 420
                    -- upvalues: u79 (ref)
                    return u79.userCharacter:GetPivot();
                end, 1);
            end);
        end;
    end);
end;

function u8.sendTierNotifications(p84, p85, p86) -- Line: 428
    -- upvalues: u3 (copy), VoidKnightBalance (copy), Flamework (copy), u4 (copy), VoidKnightNotification (copy)
    for _, v in u3.entries(p85) do
        local v87 = v[1];

        if v[2] ~= false then
            local v88 = Color3.fromRGB(181, 89, 237);
            local v89 = Color3.fromRGB(140, 23, 237);

            if p86 == VoidKnightBalance.ProgressTiers.CHOSEN then
                v88 = Color3.fromRGB(240, 148, 82);
                v89 = Color3.fromRGB(237, 143, 23);
            end;

            local v90 = nil;
            local v91;

            if v87 == "armorValues" then
                v91 = "- Increased Armor Strength";
            elseif v87 == "swordItem" then
                v91 = p86 ~= VoidKnightBalance.ProgressTiers.CHOSEN and "- Increased Sword Damage" or v90;
            elseif v87 == "unlocksDecay" then
                v91 = p86 == VoidKnightBalance.ProgressTiers.EMPOWERED and "- Unlocked Void Decay" or v90;
            elseif v87 == "unlocksShield" then
                v91 = p86 == VoidKnightBalance.ProgressTiers.CORRUPTED and "- Unlocked Void Shield" or v90;
            else
                v91 = v87 == "unlocksAscendancy" and p86 == VoidKnightBalance.ProgressTiers.CHOSEN and "- Unlocked Void Ascendance" or v90;
            end;

            if v91 ~= "" and v91 then
                local u92 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(VoidKnightNotification, {
                    fadeTime = 1.25,
                    duration = 3,
                    text = v91,
                    textColor3 = v88,
                    textStrokeColor3 = v89
                }));
                task.delay(6, function() -- Line: 485
                    -- upvalues: u92 (copy)
                    u92:DoCleaning();
                end);
                task.wait(0.5);
            end;
        end;
    end;
end;

u8.playItemConsumeEffect = RuntimeLib.async(function(p93, p94, u95, u96, p97, p98) -- Line: 492
    -- upvalues: Workspace (copy), u7 (copy), TweenService (copy), GameQueryUtil (copy), default (copy), InOutQuad (copy)
    local v99 = Workspace:GetServerTimeNow();

    if p98 == 0 or (p98 ~= p98 or not p98) then
        p98 = v99;
    end;

    local v100 = v99 - p98;
    local v101 = u96();

    if not v101 then
        return false;
    end;

    local Position = (v101 * CFrame.new(p93.random:NextNumber(u7.P1XRange.Min, u7.P1XRange.Max), p93.random:NextNumber(u7.P1YRange.Min, u7.P1YRange.Max), p93.random:NextNumber(u7.P1ZRange.Min, u7.P1ZRange.Max))):Lerp(v101, 0.5).Position;
    local u102 = p94:Clone();
    task.delay(0.2, function() -- Line: 505
        -- upvalues: u102 (ref), TweenService (ref)
        local function _(p103) -- Line: 507
            return p103:IsA("BasePart");
        end;

        local v104 = 0;
        local v105 = {};

        for i, descendant in u102:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") == true then
                v104 = v104 + 1;
                v105[v104] = descendant;
            end;
        end;

        local function v107(p106) -- Line: 521
            -- upvalues: TweenService (ref)
            TweenService:Create(p106, TweenInfo.new(0.5), {
                Color = Color3.fromRGB(0, 0, 0)
            }):Play();
        end;

        for i, v in v105 do
            v107(v, i - 1, v105);
        end;
    end);

    local function _(p108) -- Line: 531
        -- upvalues: GameQueryUtil (ref)
        return GameQueryUtil:setQueryIgnored(p108, true);
    end;

    for i, descendant in u102:GetDescendants() do
        local _ = i - 1;
        GameQueryUtil:setQueryIgnored(descendant, true);
    end;

    u102.Parent = Workspace;
    default(p97 - v100, InOutQuad, function(p109) -- Line: 538
        -- upvalues: u96 (copy), u95 (copy), Position (copy), u102 (ref)
        local v110 = u96();

        if v110 ~= nil then
            v110 = v110.Position;
        end;

        if not v110 then
            return nil;
        end;

        local v111 = u95:Lerp(Position, p109):Lerp(Position:Lerp(v110, p109), p109);
        u102:PivotTo(CFrame.new(v111) * CFrame.Angles(0, 6.283185307179586 * p109, 0));
    end, v100, 1):Wait();
    u102:Destroy();

    return true;
end);

function u8.mountSidebarUI(u112, p113) -- Line: 559
    -- upvalues: Players (copy), VoidKnightBalance (copy), u4 (copy), VoidKnightSidebar (copy)
    local v114 = Players.LocalPlayer:GetAttribute(VoidKnightBalance.ProgressAttribute);
    u112.currentProgress = v114 == nil and 0 or v114;
    local v115 = Players.LocalPlayer:GetAttribute(VoidKnightBalance.KillsAttribute);
    u112.currentKills = v115 == nil and 0 or v115;
    local v116 = Players.LocalPlayer:GetAttribute(VoidKnightBalance.TierAttribute);
    u112.currentTier = v116 == nil and 0 or v116;
    local u117 = u4.mount(u4.createElement(VoidKnightSidebar, {
        progress = u112.currentProgress,
        kills = u112.currentKills,
        tier = u112.currentTier
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    p113:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal(VoidKnightBalance.ProgressAttribute):Connect(function() -- Line: 580
        -- upvalues: u112 (copy), Players (ref), VoidKnightBalance (ref), u4 (ref), u117 (copy), VoidKnightSidebar (ref)
        u112.currentProgress = Players.LocalPlayer:GetAttribute(VoidKnightBalance.ProgressAttribute);
        u4.update(u117, u4.createElement(VoidKnightSidebar, {
            progress = u112.currentProgress,
            kills = u112.currentKills,
            tier = u112.currentTier
        }));
    end));
    p113:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal(VoidKnightBalance.KillsAttribute):Connect(function() -- Line: 589
        -- upvalues: u112 (copy), Players (ref), VoidKnightBalance (ref), u4 (ref), u117 (copy), VoidKnightSidebar (ref)
        u112.currentKills = Players.LocalPlayer:GetAttribute(VoidKnightBalance.KillsAttribute);
        u4.update(u117, u4.createElement(VoidKnightSidebar, {
            progress = u112.currentProgress,
            kills = u112.currentKills,
            tier = u112.currentTier
        }));
    end));
    p113:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal(VoidKnightBalance.TierAttribute):Connect(function() -- Line: 598
        -- upvalues: u112 (copy), Players (ref), VoidKnightBalance (ref), u4 (ref), u117 (copy), VoidKnightSidebar (ref)
        u112.currentTier = Players.LocalPlayer:GetAttribute(VoidKnightBalance.TierAttribute);
        u4.update(u117, u4.createElement(VoidKnightSidebar, {
            progress = u112.currentProgress,
            kills = u112.currentKills,
            tier = u112.currentTier
        }));
    end));
    p113:GiveTask(function() -- Line: 607
        -- upvalues: u4 (ref), u117 (copy)
        u4.unmount(u117);
    end);
end;

KnitClient.CreateController(u8.new());

return nil;
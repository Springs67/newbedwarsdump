-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local InOutExpo = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutExpo;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "electric-arc", "lib");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v6.CollectionService;
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local RunService = v6.RunService;
local Workspace = v6.Workspace;
local v7 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v7.InteractionCategory;
local InteractionPriority = v7.InteractionPriority;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 49, Name: __tostring
        return "SpiritAssassinController";
    end,

    __index = BaseKitController
});
u8.__index = u8;

function u8.new(...) -- Line: 55
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 59
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), AnimationType (copy), u4 (copy)
    BaseKitController.constructor(p10, BedwarsKit.SPIRIT_ASSASSIN, {
        animations = { AnimationType.DAGGER_CHARGE }
    });
    p10.Name = "SpiritAssassinController";
    p10.speedMaid = u4.new();
    p10.spiritMap = {};
end;

function u8.onKitLocalActivated(u11, p12) -- Line: 67
    -- upvalues: Players (copy), Flamework (copy), AbilityId (copy), KnitClient (copy), QueueType (copy), DeviceUtil (copy), InteractionPriority (copy), InteractionCategory (copy), EntityUtil (copy)
    Players.LocalPlayer:SetAttribute("UseKitAbility", true);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.SPIRIT_ASSASSIN_TELEPORT, nil);
    local v13 = KnitClient.Controllers.MatchController:getQueueType() == QueueType.SURVIVAL and "Penguins have soul?" or "Player\'s Soul";
    p12:GiveTask(KnitClient.Controllers.InteractionRegistryController:RegisterInteraction({
        interactionObjectText = "Teleport",
        interactionTag = "EvelynnSoul",
        instantActivation = true,
        maxActivationDistance = 120,
        interactionLabel = v13,
        clickablePrompt = DeviceUtil.isMobileControls(),
        priority = InteractionPriority.ABILITY,
        category = InteractionCategory.ABILITY,

        onInteracted = function(p14, p15, p16) -- Line: 84, Name: onInteracted
            -- upvalues: Players (ref), EntityUtil (ref), u11 (copy)
            if p14 == Players.LocalPlayer then
                local v17 = EntityUtil:getEntity(p14);

                if v17 ~= nil then
                    v17 = v17:isAlive();
                end;

                if not v17 then
                    return nil;
                end;

                local v18;

                if p15 == nil then
                    v18 = p15;
                else
                    v18 = p15:IsA("Model");
                end;

                if v18 and u11:useSpirit(p14, p15) then
                    p16:Destroy();
                end;
            end;
        end
    }));
end;

function u8.onKitLocalDeactivated(p19) -- Line: 108
end;

function u8.onKitReplicationActivated(u20, p21) -- Line: 110
    -- upvalues: default (copy), BedwarsKitSkin (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), Players (copy), AnimationType (copy)
    default.Client:OnEvent("SpawnSpiritOrb", function(p22) -- Line: 111
        -- upvalues: BedwarsKitSkin (ref), KnitClient (ref), BedwarsKitSkinMeta (ref), Players (ref), u20 (copy)
        local DEFAULT = BedwarsKitSkin.DEFAULT;
        local Character = p22.assassin.Character;

        if Character then
            DEFAULT = KnitClient.Controllers.KitController:getKitSkin(Character);
        end;

        local v23 = BedwarsKitSkinMeta[DEFAULT];

        if p22.assassin == Players.LocalPlayer and p22.soulOfPlayer then
            u20:cooldownIndicator(p22.soulOfPlayer, v23);
        end;

        u20:spawnSpirit(p22.position, p22.secret, p22.assassin, v23);
    end);
    default.Client:Get("SpiritAssassinSpeedUpdate"):Connect(function(p24) -- Line: 123
        -- upvalues: u20 (copy), Players (ref)
        if p24.multiplier == 1 then
            u20.speedMaid:DoCleaning();
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character:SetAttribute("SpiritSpeedBuffApplied", false);
            end;
        end;
    end);
    default.Client:Get("SpiritAssassinUseSpirit"):Connect(function(p25) -- Line: 132
        -- upvalues: u20 (copy), AnimationType (ref), Players (ref), KnitClient (ref)
        local v26 = math.abs(p25.player.UserId);
        u20:playChargeAnimation(AnimationType.DAGGER_CHARGE, p25.player);

        if p25.player == Players.LocalPlayer then
            KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_DAGGER_CHARGE);
        end;

        local v27 = u20.spiritMap[v26];
        u20.spiritMap[v26] = nil;

        if v27 ~= nil then
            v27:Destroy();
        end;
    end);
    default.Client:Get("SpiritAssassinLanded"):Connect(function(p28) -- Line: 145
        -- upvalues: u20 (copy), Players (ref), KnitClient (ref), AnimationType (ref)
        local Character = p28.player.Character;

        if Character ~= nil then
            Character = Character:GetPrimaryPartCFrame().Position;
        end;

        if Character then
            u20:createTrail(p28.originalPosition, Character);
        end;

        u20:playSlashAnimation(p28.player);

        if p28.player == Players.LocalPlayer then
            KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_DAGGER_SLASH);
        end;
    end);
end;

function u8.onKitReplicationDeactivated(p29) -- Line: 160
end;

function u8.onInnateAbilityEnabled(p30, p31, p32) -- Line: 162
end;

function u8.onAbilityUsed(p33, p34, p35) -- Line: 164
end;

function u8.playChargeAnimation(p36, p37, u38) -- Line: 166
    -- upvalues: EntityUtil (copy), BedwarsKitSkin (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), InventoryUtil (copy), ItemUtil (copy), ItemType (copy), Players (copy), KnitClient2 (copy), WeldUtil (copy)
    local u39 = EntityUtil:getEntity(u38);
    local v40;

    if u39 == nil then
        v40 = u39;
    else
        v40 = u39:getInstance();
    end;

    local DEFAULT = BedwarsKitSkin.DEFAULT;

    if v40 then
        DEFAULT = KnitClient.Controllers.KitController:getKitSkin(v40);
    end;

    local spiritAssassin = BedwarsKitSkinMeta[DEFAULT].spiritAssassin;
    local v41;

    if spiritAssassin == nil then
        v41 = spiritAssassin;
    else
        v41 = spiritAssassin.daggerChargeSound;
    end;

    if v41 == nil then
        v41 = GameSound.SPIRIT_DAGGER_CHARGE;
    end;

    local v42 = {};
    local Character = u38.Character;

    if Character ~= nil then
        Character = Character:GetPrimaryPartCFrame().Position;
    end;

    v42.position = Character;
    v42.rollOffMaxDistance = 45;
    v42.volumeMultiplier = 0.5;
    SoundManager:playSound(v41, v42);
    local v43 = AnimationUtil:playAnimation(u38, GameAnimationUtil:getAssetId(p37));

    if v43 ~= nil then
        v43:AdjustSpeed(0.8);
    end;

    local v44;

    if u39 == nil then
        v44 = u39;
    else
        v44 = u39:getInstance():GetAttribute("Dagger");
    end;

    if v44 ~= 0 and (v44 == v44 and (v44 ~= "" and v44)) then
        return nil;
    end;

    if u39 ~= nil then
        u39:getInstance():SetAttribute("Dagger", true);
    end;

    local hand = InventoryUtil.getInventory(u38).hand;

    if hand ~= nil then
        hand = hand.itemType;
    end;

    local v45;

    if spiritAssassin == nil then
        v45 = spiritAssassin;
    else
        v45 = spiritAssassin.dagger;
    end;

    local u46 = ItemUtil.createItemInstance(ItemType.SPIRIT_DAGGER, 1, v45);
    local v47;

    if spiritAssassin == nil then
        v47 = spiritAssassin;
    else
        v47 = spiritAssassin.daggerLeft;
    end;

    local u48 = ItemUtil.createItemInstance(ItemType.SPIRIT_DAGGER_LEFT, 1, v47);

    if spiritAssassin ~= nil then
        spiritAssassin = spiritAssassin.dagger;
    end;

    local v49 = ItemUtil.createItemInstance(ItemType.SPIRIT_DAGGER, 1, spiritAssassin);

    if u39 ~= nil then
        local v50 = u39:getHandItemInstanceFromCharacter();

        if v50 ~= nil then
            v50:Destroy();
        end;
    end;

    if u38 == Players.LocalPlayer then
        KnitClient2.Controllers.ViewmodelController:setHeldItem(v49);
    end;

    if u39 ~= nil then
        local v51 = u39:getHumanoid();

        if v51 ~= nil then
            v51:AddAccessory(u48);
        end;
    end;

    if u39 ~= nil then
        local v52 = u39:getHumanoid();

        if v52 ~= nil then
            v52:AddAccessory(u46);
        end;
    end;

    u46.Destroying:Connect(function() -- Line: 264
        -- upvalues: u48 (copy)
        u48:Destroy();
    end);
    u48.Destroying:Connect(function() -- Line: 267
        -- upvalues: u46 (copy)
        u46:Destroy();
    end);
    WeldUtil:weldCharacterAccessories(u38.Character);
    task.delay(1.5, function() -- Line: 272
        -- upvalues: u39 (copy), hand (copy), u46 (copy), u48 (copy), ItemUtil (ref), u38 (copy), Players (ref), KnitClient2 (ref), WeldUtil (ref)
        local v53 = u39;

        if v53 ~= nil then
            v53 = v53:getHandItemInstanceFromCharacter();

            if v53 ~= nil then
                v53 = v53.Name;
            end;
        end;

        if v53 == nil and hand then
            local v54 = u39;

            if v54 ~= nil then
                v54:getInstance():SetAttribute("Dagger", false);
            end;

            u46:Destroy();
            u48:Destroy();
            local v55 = ItemUtil.createItemInstance(hand);
            local v56 = ItemUtil.createItemInstance(hand);

            if u38 == Players.LocalPlayer then
                KnitClient2.Controllers.ViewmodelController:setHeldItem(v56);
            end;

            local v57 = u39;

            if v57 ~= nil then
                local v58 = v57:getHumanoid();

                if v58 ~= nil then
                    v58:AddAccessory(v55);
                end;
            end;

            WeldUtil:weldCharacterAccessories(u38.Character);
        end;
    end);
end;

function u8.playSlashAnimation(p59, p60) -- Line: 307
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), EntityUtil (copy), BedwarsKitSkin (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), scaleModel (copy), Workspace (copy), GameQueryUtil (copy), ModelUtil (copy), InOutExpo (copy)
    local v61 = AnimationUtil:playAnimation(p60, GameAnimationUtil:getAssetId(AnimationType.DAGGER_SLASH));

    if v61 ~= nil then
        v61:AdjustSpeed(0.8);
    end;

    local v62 = EntityUtil:getEntity(p60);

    if not v62 then
        return nil;
    end;

    local v63;

    if v62 == nil then
        v63 = v62;
    else
        v63 = v62:getInstance();
    end;

    local DEFAULT = BedwarsKitSkin.DEFAULT;

    if v63 then
        DEFAULT = KnitClient.Controllers.KitController:getKitSkin(v63);
    end;

    local spiritAssassin = BedwarsKitSkinMeta[DEFAULT].spiritAssassin;
    local v64;

    if spiritAssassin == nil then
        v64 = spiritAssassin;
    else
        v64 = spiritAssassin.daggerSlashSound;
    end;

    if v64 == nil then
        v64 = GameSound.SPIRIT_DAGGER_SLASH;
    end;

    local v65 = {};
    local Character = p60.Character;

    if Character ~= nil then
        Character = Character:GetPrimaryPartCFrame().Position;
    end;

    v65.position = Character;
    v65.rollOffMaxDistance = 45;
    v65.volumeMultiplier = 0.5;
    SoundManager:playSound(v64, v65);

    if spiritAssassin ~= nil then
        spiritAssassin = spiritAssassin.spinEffect;
    end;

    local u66 = ReplicatedStorage.Assets.Effects[spiritAssassin == nil and "DaggerSpin" or spiritAssassin]:Clone();

    if not u66:IsA("Model") then
        return nil;
    end;

    u66:PivotTo(v62:getInstance():GetPrimaryPartCFrame());
    scaleModel(u66, 0.04);
    u66.Parent = Workspace;

    for _, child in u66:GetChildren() do
        if child:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(child, true);
        end;
    end;

    ModelUtil.tweenModelSize(u66, 0, InOutExpo, 10);
    task.delay(0.3, function() -- Line: 368
        -- upvalues: u66 (copy)
        u66:Destroy();
    end);
end;

function u8.spawnSpirit(p67, p68, p69, p70, p71) -- Line: 372
    -- upvalues: Players (copy), ReplicatedStorage (copy), Workspace (copy), RuntimeLib (copy), CollectionService (copy)
    if p70 ~= Players.LocalPlayer then
        return nil;
    end;

    local Misc = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Misc");
    local spiritAssassin = p71.spiritAssassin;

    if spiritAssassin ~= nil then
        spiritAssassin = spiritAssassin.orbModelName;
    end;

    local u72 = Misc:WaitForChild(spiritAssassin == nil and "SpiritOrb" or spiritAssassin):Clone();
    u72:PivotTo(CFrame.new(p68));
    u72.Parent = Workspace;

    if p69 == "" then
        local v73 = math.abs(p70.UserId);
        p67.spiritMap[v73] = u72;
        RuntimeLib.Promise.delay(10):andThen(function() -- Line: 392
            -- upvalues: u72 (copy)
            if u72.Parent then
                u72:Destroy();
            end;
        end);

        return nil;
    end;

    u72:SetAttribute("SpiritSecret", p69);
    CollectionService:AddTag(u72, "EvelynnSoul");
    RuntimeLib.Promise.delay(10):andThen(function() -- Line: 403
        -- upvalues: u72 (copy)
        if u72.Parent then
            u72:Destroy();
        end;
    end);
end;

function u8.useSpirit(u74, u75, u76) -- Line: 410
    -- upvalues: EntityUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy), default (copy), Players (copy), KnitClient (copy), BalanceFile (copy)
    local v77 = EntityUtil:getEntity(u75);

    if v77 ~= nil then
        v77 = v77:getInstance();
    end;

    if v77 and StatusEffectUtil:isActive(v77, StatusEffectType.GROUNDED) then
        return false;
    end;

    if v77 and StatusEffectUtil:isActive(v77, StatusEffectType.FROSTED) then
        return false;
    end;

    local v78 = u76:GetAttribute("SpiritSecret");
    local v79 = default.Client:Get("UseSpirit"):CallServer({
        secret = v78
    });

    if v79 then
        local u80 = nil;
        task.delay(0.7, function() -- Line: 428
            -- upvalues: Players (ref), u74 (copy), KnitClient (ref), BalanceFile (ref), u76 (copy), u80 (ref), u75 (copy)
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character:GetAttribute("SpiritSpeedBuffApplied");
            end;

            if Character == 0 or (Character ~= Character or (Character == "" or not Character)) then
                u74.speedMaid:DoCleaning();
                u74.speedMaid:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    moveSpeedMultiplier = BalanceFile.SpiritAssassinKit.SPIRIT_ASSASSIN_SPEED_MODIFIER
                }));
                local Character2 = Players.LocalPlayer.Character;

                if Character2 ~= nil then
                    Character2:SetAttribute("SpiritSpeedBuffApplied", true);
                end;
            end;

            u76:Destroy();
            u80 = u75:GetAttribute("SpiritAssassinSpeedStart");
        end);
        task.delay(BalanceFile.SpiritAssassinKit.SPIRIT_ASSASSIN_SPEED_DURATION + 0.7, function() -- Line: 447
            -- upvalues: u75 (copy), u80 (ref), u74 (copy), Players (ref)
            if u75:GetAttribute("SpiritAssassinSpeedStart") == u80 then
                u74.speedMaid:DoCleaning();
                local Character = Players.LocalPlayer.Character;

                if Character ~= nil then
                    Character:SetAttribute("SpiritSpeedBuffApplied", false);
                end;
            end;
        end);
    end;

    return v79;
end;

function u8.cooldownIndicator(p81, u82, p83) -- Line: 459
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), GameQueryUtil (copy), RunService (copy)
    u82:SetAttribute("SpiritCooldown", true);
    local spiritAssassin = p83.spiritAssassin;

    if spiritAssassin ~= nil then
        spiritAssassin = spiritAssassin.spiritDaggerIndicator;
    end;

    local u84 = ReplicatedStorage.Assets.Effects[spiritAssassin == nil and "SpiritDagger" or spiritAssassin]:Clone();
    u84.Parent = Workspace;
    GameQueryUtil:setQueryIgnored(u84, true);
    task.delay(30, function() -- Line: 473
        -- upvalues: u84 (copy), u82 (copy)
        u84:Destroy();
        u82:SetAttribute("SpiritCooldown", false);
    end);
    local u85 = 0;
    local u86 = nil;
    u86 = RunService.Heartbeat:Connect(function(p87) -- Line: 479
        -- upvalues: u85 (ref), u84 (copy), u82 (copy), u86 (ref)
        u85 = u85 + p87;
        local PrimaryPart = u84.PrimaryPart;

        if PrimaryPart then
            PrimaryPart = u82;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart.Character;
            end;
        end;

        if not PrimaryPart then
            u84:Destroy();
            u86:Disconnect();

            return;
        end;

        debug.profilebegin("spin-spirit-indicator");
        local PrimaryPart2 = u82.Character.PrimaryPart;

        if PrimaryPart2 ~= nil then
            PrimaryPart2 = PrimaryPart2.CFrame.Position;
        end;

        if not PrimaryPart2 then
            return nil;
        end;

        u84:PivotTo(CFrame.new(PrimaryPart2 + Vector3.new(0, 7, 0)) * CFrame.Angles(3.141592653589793, u85 * 3.141592653589793 / 2, 0));
        debug.profileend();
    end);
    u82:GetAttributeChangedSignal("SpiritCooldown"):Connect(function() -- Line: 512
        -- upvalues: u82 (copy), u84 (copy)
        local v88 = u82:GetAttribute("SpiritCooldown");

        if v88 == 0 or (v88 ~= v88 or (v88 == "" or not v88)) then
            u84:Destroy();
        end;
    end);
end;

function u8.createTrail(p89, p90, p91) -- Line: 519
    -- upvalues: u5 (copy), Workspace (copy), u3 (copy), u4 (copy)
    local u92 = u5("Attachment", {
        Parent = u5("Part", {
            Transparency = 1,
            CanCollide = false,
            CanQuery = false,
            CanTouch = false,
            Anchored = true,
            Position = p90,
            Parent = Workspace
        })
    });
    local u93 = u5("Attachment", {
        Parent = u5("Part", {
            Transparency = 1,
            CanCollide = false,
            CanQuery = false,
            CanTouch = false,
            Anchored = true,
            Position = p91,
            Parent = Workspace
        })
    });
    local u94 = u3.link(u93, u92, Color3.fromRGB(180, 128, 255));
    local u95 = u4.new();
    u95:GiveTask(u94);
    task.delay(0.3, function() -- Line: 547
        -- upvalues: u94 (copy), u92 (copy), u93 (copy), u95 (copy)
        u94:Destroy();
        u92:Destroy();
        u93:Destroy();
        u95:DoCleaning();
    end);
end;

KnitClient.CreateController(u8.new());

return nil;
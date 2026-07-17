-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local v5 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v5.InteractionCategory;
local InteractionPriority = v5.InteractionPriority;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local HannahCombo = RuntimeLib.import(script, script.Parent, "ui", "hannah-combo").HannahCombo;
local u6 = {
    [BedwarsKitSkin.HANNAH_GHOST] = {
        swordSkin = "ghost",
        slashColor = Color3.fromRGB(5, 161, 107)
    },
    [BedwarsKitSkin.HANNAH_VICTORIOUS] = {
        swordSkin = "victorious",
        slashColor = Color3.fromRGB(255, 250, 33),
        executeSound = GameSound.HANNAH_EXECUTE_VICTORIOUS
    },
    [BedwarsKitSkin.HANNAH_BUNNY] = {
        swordSkin = "bunny",
        slashColor = Color3.fromRGB(255, 140, 40),
        executeSound = GameSound.HANNAH_EXECUTE_BUNNY
    },
    [BedwarsKitSkin.HANNAH_LUNAR] = {
        swordSkin = "lunar",
        slashColor = Color3.fromRGB(255, 41, 41),
        executeSound = GameSound.HANNAH_EXECUTE_LUNAR
    }
};
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 63, Name: __tostring
        return "HannahController";
    end,

    __index = BaseKitController
});
u7.__index = u7;

function u7.new(...) -- Line: 69
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 73
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), GameSound (copy), AnimationType (copy)
    BaseKitController.constructor(p9, BedwarsKit.HANNAH, {
        sounds = { GameSound.HANNAH_EXECUTE, GameSound.HANNAH_UNSHEATH_SWORD, GameSound.HANNAH_EXECUTE_VICTORIOUS },
        animations = { AnimationType.HANNAH_ATTACK, AnimationType.FP_HANNAH_ATTACK }
    });
    p9.Name = "HannahController";
end;

function u7.onKitLocalActivated(p10, p11) -- Line: 80
    -- upvalues: Players (copy), Flamework (copy), HannahCombo (copy)
    p11:GiveTask(p10:registerExecuteInteractions());
    Players.LocalPlayer:SetAttribute("UseKitAbility", true);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addApp({
        appId = "HannahCombo",
        app = HannahCombo
    }, {});
end;

function u7.onKitLocalDeactivated(p12) -- Line: 88
end;

function u7.onKitReplicationActivated(u13, p14) -- Line: 90
    -- upvalues: default (copy), Players (copy), EntityUtil (copy), u3 (copy), BedwarsImageId (copy), CollectionService (copy), KnitClient2 (copy), ClientStore (copy), BalanceFile (copy), KnitClient (copy), u6 (copy), GameSound (copy), SoundManager (copy)
    p14:GiveTask((default.Client:Get("HealthDropBelowThresholdHannah"):Connect(function(p15) -- Line: 91
        -- upvalues: Players (ref), EntityUtil (ref), u3 (ref), BedwarsImageId (ref), CollectionService (ref)
        if Players:GetPlayerFromCharacter(p15.entity) == Players.LocalPlayer then
            return nil;
        end;

        local v16 = EntityUtil:getLocalPlayerEntity();
        local v17 = EntityUtil:getEntity(p15.entity);

        if not Players:GetPlayerFromCharacter(p15.entity) then
            return nil;
        end;

        if v16 and (v17 and not v16:canAttack(v17)) then
            return nil;
        end;

        u3("BillboardGui", {
            Name = "Hannah Execution Icon",
            AlwaysOnTop = true,
            MaxDistance = 100,
            StudsOffset = Vector3.new(-1.5, 7, 0),
            Parent = p15.entity,
            Adornee = p15.entity.Head,
            Size = UDim2.fromScale(1, 1),
            Children = { u3("ImageLabel", {
                    BackgroundTransparency = 1,
                    Image = BedwarsImageId.PIRATE_SKULL_ICON,
                    Size = UDim2.fromScale(3, 3),
                    ScaleType = Enum.ScaleType.Fit
                }) }
        });
        CollectionService:AddTag(p15.entity, "HannahExecuteInteraction");
    end)));
    p14:GiveTask((default.Client:Get("HealthHealAboveThresholdHannah"):Connect(function(p18) -- Line: 122
        -- upvalues: KnitClient2 (ref)
        local v19 = p18.entity:FindFirstChild("Hannah Execution Icon");

        if v19 then
            v19:Destroy();
        end;

        KnitClient2.Controllers.InteractionRegistryController:removePrompt(p18.entity, "HannahExecuteInteraction");
    end)));
    p14:GiveTask((default.Client:Get("EntityDeathEvent"):Connect(function(p20) -- Line: 130
        -- upvalues: KnitClient2 (ref)
        local v21 = p20.entityInstance:FindFirstChild("Hannah Execution Icon");

        if v21 then
            v21:Destroy();
        end;

        KnitClient2.Controllers.InteractionRegistryController:removePrompt(p20.entityInstance, "HannahExecuteInteraction");
    end)));
    local u22 = tick();
    p14:GiveTask((default.Client:Get("HannahTeleport"):Connect(function(u23) -- Line: 139
        -- upvalues: Players (ref), u22 (ref), ClientStore (ref), BalanceFile (ref), KnitClient (ref), u6 (ref), GameSound (ref), SoundManager (ref), u13 (copy)
        local u24 = u23.player == Players.LocalPlayer;

        if u24 then
            local u25 = tick();
            u22 = u25;
            ClientStore:dispatch({
                type = "KitHannahSetCombo",
                combo = u23.comboSize
            });
            task.delay(BalanceFile.HANNAH_COMBO_EXPIRATION_SEC, function() -- Line: 148
                -- upvalues: u22 (ref), u25 (copy), ClientStore (ref)
                if u22 == u25 then
                    ClientStore:dispatch({
                        type = "KitHannahSetCombo",
                        combo = 0
                    });
                end;
            end);
        end;

        local v26 = KnitClient.Controllers.KitController:getKitSkin(u23.player.Character);
        local u27 = u6[v26];

        if u27 ~= nil then
            u27 = u27.executeSound;
        end;

        local v28 = u6[v26];

        if v28 ~= nil then
            v28 = v28.soundDelay;
        end;

        if u27 == "" or not u27 then
            u27 = GameSound.HANNAH_EXECUTE;
        end;

        local HANNAH_UNSHEATH_SWORD = GameSound.HANNAH_UNSHEATH_SWORD;
        local v29 = {};
        local v30;

        if u24 then
            v30 = nil;
        else
            v30 = u23.player.Character;

            if v30 ~= nil then
                v30 = v30:GetPrimaryPartCFrame().Position;
            end;
        end;

        v29.position = v30;
        v29.rollOffMaxDistance = 45;
        v29.volumeMultiplier = 0.7;
        SoundManager:playSound(HANNAH_UNSHEATH_SWORD, v29);
        task.delay(v28 == nil and 0.3 or v28, function() -- Line: 195
            -- upvalues: u23 (copy), Players (ref), u27 (ref), GameSound (ref), SoundManager (ref), u24 (copy)
            local Character = u23.player.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;

                if Character ~= nil then
                    Character = Character.CFrame;
                end;
            end;

            if Character or u23.player == Players.LocalPlayer then
                if u27 == "" or not u27 then
                    u27 = GameSound.HANNAH_EXECUTE;
                end;

                local v31 = {};

                if u24 then
                    Character = nil;
                elseif Character ~= nil then
                    Character = Character.Position;
                end;

                v31.position = Character;
                v31.rollOffMaxDistance = 80;
                v31.volumeMultiplier = 0.7;
                SoundManager:playSound(u27, v31);
            end;
        end);
        u13:pullOutSword(u23.player, u23.targetPosition);
    end)));
end;

function u7.onKitReplicationDeactivated(p32) -- Line: 233
end;

function u7.onInnateAbilityEnabled(p33, p34, p35) -- Line: 235
end;

function u7.onAbilityUsed(p36, p37, p38) -- Line: 237
end;

function u7.pullOutSword(u39, u40, u41) -- Line: 239
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy), Players (copy), ItemUtil (copy), ItemType (copy), KnitClient2 (copy), EntityUtil (copy), u3 (copy), WeldUtil (copy), ReplicatedStorage (copy)
    if not u40.Character then
        return nil;
    end;

    task.delay(0.5, function() -- Line: 243
        -- upvalues: u40 (copy), u39 (copy)
        local Character = u40.Character;

        if Character ~= nil then
            Character = Character:GetPrimaryPartCFrame();
        end;

        if Character then
            u39:playSlashEffect(Character, u40);
        end;
    end);
    local u42 = GameAnimationUtil:playAnimation(u40, AnimationType.HANNAH_ATTACK, {
        looped = false
    });

    if u40 == Players.LocalPlayer then
        local v43 = ItemUtil.createItemInstance(ItemType.PIRATE_SWORD_FP);
        KnitClient2.Controllers.ViewmodelController:setHeldItem(v43);
        KnitClient2.Controllers.ViewmodelController:playAnimation(AnimationType.FP_HANNAH_ATTACK);
    end;

    local Character = u40.Character;

    if Character ~= nil then
        Character = Character:FindFirstChild("pirate_sword_back");
    end;

    local v44 = EntityUtil:getEntity(u40);

    if v44 ~= nil then
        v44 = v44:getHandItemInstanceFromCharacter();

        if v44 ~= nil then
            v44 = v44:WaitForChild("Handle", 3);
        end;
    end;

    if v44 then
        v44.Transparency = 1;
    end;

    local u45;

    if Character then
        u45 = u40.Character;

        if u45 ~= nil then
            u45 = u45:WaitForChild("pirate_sword_back"):Clone();
        end;

        for _, child in Character:GetChildren() do
            if child:IsA("BasePart") then
                child.Transparency = 1;
            end;
        end;

        local Handle = u45:WaitForChild("Handle");
        local Handle2 = u45:FindFirstChild("Handle");

        if Handle2 ~= nil then
            Handle2 = Handle2:FindFirstChild("SwordAttachment");
        end;

        local v46 = Handle2.CFrame * CFrame.Angles(0, 3.141592653589793, 0);
        Handle:ClearAllChildren();
        u3("Attachment", {
            Name = "RightGripAttachment",
            Parent = Handle,
            CFrame = v46
        });
        u45.Parent = u40.Character;
        WeldUtil:weldCharacterAccessories(u40.Character);
    else
        u45 = ReplicatedStorage.Assets.Effects.PirateSword:Clone();
        u45.Parent = u40.Character;
        WeldUtil:weldCharacterAccessories(u40.Character);
    end;

    if u42 then
        u42:GetMarkerReachedSignal("start"):Connect(function() -- Line: 313
            -- upvalues: u39 (copy), u40 (copy), u41 (copy)
            u39:createTrail(u40, u41);
        end);
        u42:GetMarkerReachedSignal("end"):Connect(function() -- Line: 316
            -- upvalues: u45 (ref), u39 (copy), u40 (copy), u42 (copy)
            if u45 then
                u39:putSwordBack(u40, u45);
            end;

            local v47 = u42;

            if v47 ~= nil then
                v47:Stop();
            end;

            local v48 = u42;

            if v48 ~= nil then
                v48:Destroy();
            end;
        end);
        u42.Destroying:Connect(function() -- Line: 329
            -- upvalues: u45 (ref), u39 (copy), u40 (copy)
            if u45 then
                u39:putSwordBack(u40, u45);
            end;
        end);
    end;
end;

function u7.putSwordBack(p49, p50, p51) -- Line: 336
    -- upvalues: EntityUtil (copy), Players (copy), InventoryUtil (copy), ItemUtil (copy), KnitClient2 (copy)
    p51:Destroy();
    local v52 = EntityUtil:getEntity(p50);

    if v52 ~= nil then
        v52 = v52:getHandItemInstanceFromCharacter();

        if v52 ~= nil then
            v52 = v52:WaitForChild("Handle", 3);
        end;
    end;

    v52.Transparency = 0;
    local Character = p50.Character;

    if Character ~= nil then
        Character = Character:FindFirstChild("pirate_sword_back");
    end;

    if Character then
        for _, child in Character:GetChildren() do
            if child:IsA("BasePart") then
                child.Transparency = 0;
            end;
        end;
    end;

    if p50 == Players.LocalPlayer then
        local hand = InventoryUtil.getInventory(p50).hand;

        if hand ~= nil then
            hand = hand.itemType;
        end;

        if not hand then
            return nil;
        end;

        local v53 = ItemUtil.createItemInstance(hand);
        KnitClient2.Controllers.ViewmodelController:setHeldItem(v53);
    end;
end;

function u7.createTrail(p54, u55, p56) -- Line: 373
    -- upvalues: Players (copy), Workspace (copy), u3 (copy), GameAnimationUtil (copy), AnimationType (copy), TweenService (copy)
    if u55.Character then
        u55.Character.Archivable = true;
    end;

    local Character = u55.Character;

    if Character ~= nil then
        Character = Character:Clone();
    end;

    if not Character then
        return nil;
    end;

    local Animator = Character.Humanoid.Animator;
    local Character2 = u55.Character;

    if not Character.PrimaryPart then
        return nil;
    end;

    if u55 == Players.LocalPlayer then
        if Character.Humanoid == nil or not Character2 then
            return nil;
        end;

        Workspace.CurrentCamera.CameraSubject = Character.Humanoid;
    end;

    local Character3 = u55.Character;

    if Character3 ~= nil then
        Character3:SetAttribute("Transparency", 1);
    end;

    Character:PivotTo(CFrame.new(Character2:GetPrimaryPartCFrame().Position, p56));
    Character.Parent = Workspace;
    Animator:LoadAnimation(u3("Animation", {
        AnimationId = GameAnimationUtil:getAssetId(AnimationType.HANNAH_ATTACK)
    })):Play();
    local v57 = TweenInfo.new(0.6);
    local v58 = TweenService:Create(Character.PrimaryPart, v57, {
        CFrame = CFrame.new(p56)
    });
    v58:Play();
    v58.Completed:Connect(function() -- Line: 412
        -- upvalues: Character (copy), u55 (copy), Players (ref), Workspace (ref)
        Character:Destroy();

        if u55.Character then
            u55.Character:SetAttribute("Transparency", 0);
            u55.Character.Archivable = false;
        end;

        if u55 == Players.LocalPlayer then
            Workspace.CurrentCamera.CameraSubject = u55.Character.Humanoid;
        end;
    end);
end;

function u7.playSlashEffect(p59, p60, p61) -- Line: 423
    -- upvalues: KnitClient (copy), ReplicatedStorage (copy), BedwarsKitSkin (copy), Workspace (copy)
    if not (p60 and p61.Character) then
        return nil;
    end;

    local v62 = KnitClient.Controllers.KitController:getKitSkin(p61.Character);
    local u63 = ReplicatedStorage.Assets.Effects.HannahSwordSwing:Clone();
    local Main = u63:FindFirstChild("Main");

    if Main ~= nil then
        Main = Main:FindFirstChild("Color");
    end;

    if Main and v62 == BedwarsKitSkin.HANNAH_GHOST then
        Main.Color = Color3.fromRGB(5, 161, 107);
    end;

    u63:PivotTo(p60);
    u63.Parent = Workspace;
    u63:PivotTo(p60 * CFrame.new(0, 0, -2));
    task.delay(0.15, function() -- Line: 443
        -- upvalues: u63 (copy)
        u63:Destroy();
    end);
end;

function u7.registerExecuteInteractions(p64) -- Line: 447
    -- upvalues: KnitClient (copy), BalanceFile (copy), DeviceUtil (copy), InteractionPriority (copy), InteractionCategory (copy), Players (copy), EntityUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy), default (copy)
    return KnitClient.Controllers.InteractionRegistryController:RegisterInteraction({
        interactionLabel = "Blood For Blood!",
        interactionObjectText = "Execute",
        interactionTag = "HannahExecuteInteraction",
        instantActivation = true,
        removePromptOnInteract = true,
        maxActivationDistance = BalanceFile.HANNAH_EXECUTE_MAX_DISTANCE,
        clickablePrompt = DeviceUtil.isMobileControls(),
        priority = InteractionPriority.ABILITY,
        category = InteractionCategory.ABILITY,

        onInteracted = function(p65, p66, p67) -- Line: 458, Name: onInteracted
            -- upvalues: Players (ref), EntityUtil (ref), StatusEffectUtil (ref), StatusEffectType (ref), default (ref)
            if not p66:IsA("Model") then
                return nil;
            end;

            if not Players:GetPlayerFromCharacter(p66) then
                return nil;
            end;

            local v68 = EntityUtil:getEntity(p65);

            if v68 ~= nil then
                v68 = v68:getInstance();
            end;

            if v68 and StatusEffectUtil:isActive(v68, StatusEffectType.GROUNDED) then
                return nil;
            end;

            if v68 and StatusEffectUtil:isActive(v68, StatusEffectType.FROSTED) then
                return nil;
            end;

            local v69 = default.Client:Get("HannahPromptTrigger"):CallServer({
                user = Players.LocalPlayer,
                victimEntity = p66
            }) and p66:FindFirstChild("Hannah Execution Icon");

            if v69 then
                v69:Destroy();
            end;
        end
    });
end;

KnitClient.CreateController(u7.new());

return nil;
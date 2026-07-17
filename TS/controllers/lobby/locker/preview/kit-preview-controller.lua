-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CircularSpinner = v1.CircularSpinner;
local DeviceUtil = v1.DeviceUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ArmorTrimUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil;
local BedwarsArmorSet = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-armor-set").BedwarsArmorSet;
local ArmorItemSkinUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "armor-item-skin-util").ArmorItemSkinUtil;
local getItemSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta;
local getKitSkinMetadata = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").getKitSkinMetadata;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local LockerKitSkinPreviewGui = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-preview-util").LockerKitSkinPreviewGui;
local MountMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-meta").MountMeta;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local AccessoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "accessory-util").AccessoryUtil;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 37, Name: __tostring
        return "KitPreviewController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 43
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 47
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "KitPreviewController";
end;

function u5.KnitStart(p8) -- Line: 51
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p8);
end;

function u5.cloneDefaultR15Rig(p9) -- Line: 54
    -- upvalues: ReplicatedStorage (copy), default (copy)
    local Assets = ReplicatedStorage:FindFirstChild("Assets");
    local v10;

    if Assets == nil then
        v10 = Assets;
    else
        v10 = Assets:FindFirstChild("BaseR15Rig");
    end;

    if v10 then
        Assets = v10;
    elseif Assets ~= nil then
        Assets = Assets:FindFirstChild("Villagers");

        if Assets ~= nil then
            Assets = Assets:FindFirstChild("BaseR15Rig");
        end;
    end;

    if Assets then
        return Assets:Clone();
    end;

    default.Warn("KitPreviewController: BaseR15Rig not found under ReplicatedStorage.Assets.");

    return nil;
end;

function u5.setupLockerKitPreviewScene(p11, p12) -- Line: 77
    -- upvalues: KnitClient (copy)
    KnitClient.Controllers.LockerPreviewController:setPreviewAngle(CFrame.Angles(0, 3.141592653589793, 0));

    if KnitClient.Controllers.LockerPreviewController.isFullscreen then
        KnitClient.Controllers.CameraController:setMaxZoom(8);
        KnitClient.Controllers.CameraController:setMinZoom(8);
        KnitClient.Controllers.CameraController:setZoom(8);
    end;

    KnitClient.Controllers.LockerPreviewController:toggleLighting(true);
    p12:GiveTask(function() -- Line: 85
        -- upvalues: KnitClient (ref)
        return KnitClient.Controllers.LockerPreviewController:toggleLighting(false);
    end);
end;

function u5.unanchorRigParts(p13, p14) -- Line: 89
    local function _(p15) -- Line: 91
        if p15:IsA("BasePart") then
            p15.Anchored = false;
        end;
    end;

    for i, descendant in p14:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.Anchored = false;
        end;
    end;
end;

function u5.spawnPreviewRig(p16, p17) -- Line: 100
    local v18 = p16:cloneDefaultR15Rig();
    local v19 = v18 or p17:Clone();

    if v18 then
        p16:unanchorRigParts(v19);
    end;

    return v19;
end;

function u5.applyArmorTrimToRig(p20, u21, p22) -- Line: 108
    -- upvalues: ReplicatedStorage (copy), BedwarsArmorSet (copy), AccessoryUtil (copy), ArmorTrimUtil (copy), WeldUtil (copy), KnitClient (copy)
    local Assets = ReplicatedStorage:FindFirstChild("Assets");

    if Assets ~= nil then
        Assets = Assets:FindFirstChild("Armor");
    end;

    local v23 = BedwarsArmorSet[p22.armorSet or "LEATHER"] or BedwarsArmorSet.LEATHER;

    if Assets then
        for _, v in v23 do
            local v24 = Assets:FindFirstChild(v);

            if v24 then
                for _, child in v24:GetChildren() do
                    if child:IsA("Accessory") then
                        AccessoryUtil:addAccessory(u21, child:Clone());
                    end;
                end;
            end;
        end;
    end;

    local function _(p25) -- Line: 129
        -- upvalues: AccessoryUtil (ref), u21 (copy)
        AccessoryUtil:addAccessory(u21, p25);
    end;

    for i, v in ArmorTrimUtil.createArmorTrims(p22.type, p22.color, p22.effectRank) do
        local _ = i - 1;
        AccessoryUtil:addAccessory(u21, v);
    end;

    WeldUtil:weldCharacterAccessories(u21);
    KnitClient.Controllers.ArmorTrimController:attachArmorTrimEffects(u21, p22.type, p22.color, p22.effectRank, p22.effectType);
end;

function u5.playIdleOnRig(p26, p27) -- Line: 138
    -- upvalues: GameAnimationUtil (copy)
    local v28 = GameAnimationUtil:getAnimationFromCharacter(p27, "idle");

    if v28 then
        local Humanoid = p27:FindFirstChild("Humanoid");

        if Humanoid ~= nil then
            Humanoid = Humanoid:FindFirstChild("Animator");
        end;

        if Humanoid ~= nil then
            Humanoid = Humanoid:LoadAnimation(v28);
        end;

        if Humanoid ~= nil then
            Humanoid:Play();
        end;
    end;
end;

function u5.getPreviewLobbyDisplayAnimation(p29, p30) -- Line: 157
    -- upvalues: BedwarsKit (copy), getBedwarsKitMeta (copy), getItemMeta (copy)
    if p30 == nil or p30 == BedwarsKit.NONE then
        return nil;
    end;

    local v31 = getBedwarsKitMeta(p30);
    local previewLobbyDisplayConfig = v31.previewLobbyDisplayConfig;

    if previewLobbyDisplayConfig ~= nil then
        previewLobbyDisplayConfig = previewLobbyDisplayConfig.poseAnimation;
    end;

    if previewLobbyDisplayConfig ~= nil then
        return v31.previewLobbyDisplayConfig.poseAnimation;
    end;

    local kitItems = v31.kitItems;

    if not kitItems then
        return nil;
    end;

    for _, v in kitItems do
        if v.previewOnLobbyDisplayModel then
            local v32 = getItemMeta(v.itemType);
            local thirdPerson = v32.thirdPerson;

            if thirdPerson ~= nil then
                thirdPerson = thirdPerson.holdAnimation;
            end;

            if thirdPerson == nil then
                thirdPerson = v32.projectileSource;

                if thirdPerson ~= nil then
                    thirdPerson = thirdPerson.thirdPerson;

                    if thirdPerson ~= nil then
                        thirdPerson = thirdPerson.idleAnimation;
                    end;
                end;

                if thirdPerson == nil then
                    thirdPerson = v32.sword;

                    if thirdPerson ~= nil then
                        thirdPerson = thirdPerson.idleAnimation;
                    end;
                end;
            end;

            if thirdPerson ~= nil then
                return thirdPerson;
            end;
        end;
    end;

    return nil;
end;

function u5.getPreviewLobbyDisplayMount(p33, p34) -- Line: 207
    -- upvalues: BedwarsKit (copy), getBedwarsKitMeta (copy)
    if p34 == nil or p34 == BedwarsKit.NONE then
        return nil;
    end;

    local previewLobbyDisplayConfig = getBedwarsKitMeta(p34).previewLobbyDisplayConfig;

    if previewLobbyDisplayConfig ~= nil then
        previewLobbyDisplayConfig = previewLobbyDisplayConfig.mount;
    end;

    return previewLobbyDisplayConfig;
end;

function u5.getPreviewLobbyDisplayCharacterScaleMultiplier(p35, p36) -- Line: 217
    -- upvalues: BedwarsKit (copy), getBedwarsKitMeta (copy)
    if p36 == nil or p36 == BedwarsKit.NONE then
        return nil;
    end;

    local previewLobbyDisplayConfig = getBedwarsKitMeta(p36).previewLobbyDisplayConfig;

    if previewLobbyDisplayConfig ~= nil then
        previewLobbyDisplayConfig = previewLobbyDisplayConfig.characterScaleMultiplier;
    end;

    return previewLobbyDisplayConfig;
end;

function u5.mountPreviewRig(p37, p38, u39, p40) -- Line: 227
    -- upvalues: MountMeta (copy), KnitClient (copy), RunService (copy), GameAnimationUtil (copy), AnimationType (copy)
    local v41 = p37:getPreviewLobbyDisplayMount(p40);

    if v41 == nil then
        return false;
    end;

    local u42 = MountMeta[v41];
    local v43 = p37:getPreviewLobbyDisplayCharacterScaleMultiplier(p40);

    if v43 ~= nil then
        u39:ScaleTo(u39:GetScale() * v43);
    end;

    local u44 = KnitClient.Controllers.MountController:weldMountToCharacter(v41, u39);

    if not u44 then
        return false;
    end;

    p38:GiveTask(RunService.Stepped:Connect(function() -- Line: 241
        -- upvalues: KnitClient (ref), u44 (copy), u42 (copy), u39 (copy)
        KnitClient.Controllers.MountSittingController:performStep(u44, u42, u39);
    end));
    local u45 = GameAnimationUtil:playAnimation(u39, AnimationType.SIT_ON_DODO_BIRD, {
        looped = true
    });

    if u45 then
        u45.Priority = Enum.AnimationPriority.Movement;
        p38:GiveTask(function() -- Line: 249
            -- upvalues: u45 (copy)
            u45:Stop();
            u45:Destroy();
        end);
    end;

    local u46 = KnitClient.Controllers.MountAnimationController:playAnimationInMount(u44, u42.animations.idle, 1, true);

    if u46 then
        u46.Priority = Enum.AnimationPriority.Idle;
        p38:GiveTask(function() -- Line: 257
            -- upvalues: u46 (copy)
            u46:Stop();
            u46:Destroy();
        end);
    end;

    return true;
end;

function u5.playPreviewAnimationOnRig(p47, p48, p49) -- Line: 264
    -- upvalues: GameAnimationUtil (copy)
    local v50 = p47:getPreviewLobbyDisplayAnimation(p49);

    if v50 == nil then
        p47:playIdleOnRig(p48);

        return nil;
    end;

    local v51 = GameAnimationUtil:playAnimation(p48, v50, {
        looped = true
    });

    if not v51 then
        p47:playIdleOnRig(p48);

        return nil;
    end;

    v51.Priority = Enum.AnimationPriority.Action;
end;

function u5.getKitSkinItemSkin(p52, p53, p54) -- Line: 279
    -- upvalues: getKitSkinMetadata (copy), getItemSkinMeta (copy)
    if p53 == nil then
        return nil;
    end;

    local itemSkins = getKitSkinMetadata(p53).itemSkins;

    if not itemSkins then
        return nil;
    end;

    for _, v in itemSkins do
        if getItemSkinMeta(v).itemType == p54 then
            return v;
        end;
    end;

    return nil;
end;

function u5.mountKitSkinPreviewLoadingSpinner(p55, p56) -- Line: 294
    -- upvalues: DeviceUtil (copy), u3 (copy), CircularSpinner (copy)
    local v57 = DeviceUtil.isSmallScreen() and 36 or 54;
    local u58 = u3.mount(u3.createElement("ScreenGui", {
        Name = "KitSkinPreviewLoading",
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        DisplayOrder = 1000,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, { u3.createElement(CircularSpinner, {
            Size = UDim2.fromOffset(v57, v57),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5)
        }) }), p56);

    return function() -- Line: 307
        -- upvalues: u3 (ref), u58 (copy)
        u3.unmount(u58);
    end;
end;

function u5.applyPreviewArmorSetToRig(p59, p60, p61, p62) -- Line: 311
    -- upvalues: BedwarsKit (copy), getBedwarsKitMeta (copy), ReplicatedStorage (copy), BedwarsArmorSet (copy), getItemMeta (copy), ArmorItemSkinUtil (copy), AccessoryUtil (copy), WeldUtil (copy)
    if p61 == nil or p61 == BedwarsKit.NONE then
        return nil;
    end;

    local previewLobbyDisplayConfig = getBedwarsKitMeta(p61).previewLobbyDisplayConfig;

    if previewLobbyDisplayConfig ~= nil then
        previewLobbyDisplayConfig = previewLobbyDisplayConfig.armorSet;
    end;

    if previewLobbyDisplayConfig == nil then
        return nil;
    end;

    local Assets = ReplicatedStorage:FindFirstChild("Assets");

    if Assets ~= nil then
        Assets = Assets:FindFirstChild("Armor");
    end;

    local v63 = BedwarsArmorSet[previewLobbyDisplayConfig];

    if not Assets or v63 == nil then
        return nil;
    end;

    for _, v in v63 do
        local v64 = p59:getKitSkinItemSkin(p62, v);
        local armor = getItemMeta(v).armor;

        if armor ~= nil then
            armor = armor.slot;
        end;

        if armor ~= nil then
            local v = ArmorItemSkinUtil.getArmorFolderName(v, v64, armor);
        end;

        local v65 = Assets:FindFirstChild(v);

        if v65 then
            for _, child in v65:GetChildren() do
                if child:IsA("Accessory") then
                    AccessoryUtil:addAccessory(p60, child:Clone());
                end;
            end;
        end;
    end;

    WeldUtil:weldCharacterAccessories(p60);
end;

function u5.attachPreviewKitItems(p66, p67, p68, p69) -- Line: 352
    -- upvalues: BedwarsKit (copy), getBedwarsKitMeta (copy), getItemMeta (copy), ItemUtil (copy), WeldUtil (copy)
    if p68 == nil or p68 == BedwarsKit.NONE then
        return nil;
    end;

    local kitItems = getBedwarsKitMeta(p68).kitItems;

    if not kitItems then
        return nil;
    end;

    for _, v in kitItems do
        if v.previewOnLobbyDisplayModel and not getItemMeta(v.itemType).block then
            local v70 = p66:getKitSkinItemSkin(p69, v.itemType);
            WeldUtil:weldAccessory(p67, (ItemUtil.createItemInstance(v.itemType, 1, v70)));
        end;
    end;
end;

function u5.previewArmorTrim(p71, p72) -- Line: 372
    -- upvalues: u2 (copy), default (copy), Workspace (copy), KnitClient (copy)
    local v73 = u2.new();
    p71:setupLockerKitPreviewScene(v73);
    local v74 = p71:cloneDefaultR15Rig();

    if not v74 then
        default.Warn("KitPreviewController.previewArmorTrim: no BaseR15Rig; cannot show armor trim preview.");

        return v73;
    end;

    p71:unanchorRigParts(v74);
    v74.Parent = Workspace;
    v74:PivotTo(CFrame.new(KnitClient.Controllers.LockerPreviewController:getPreviewDummyPosition()));
    v73:GiveTask(v74);
    p71:applyArmorTrimToRig(v74, p72);
    p71:playIdleOnRig(v74);

    return v73;
end;

function u5.previewKit(p75, p76, p77) -- Line: 388
    -- upvalues: u2 (copy), getKitSkinMetadata (copy), BedwarsKit (copy), PlaceUtil (copy), Players (copy), default2 (copy), LockerKitSkinPreviewGui (copy), Workspace (copy), KnitClient (copy)
    local v78 = u2.new();
    p75:setupLockerKitPreviewScene(v78);
    local v79 = p76.kind == "kitSkin";
    local v80;

    if v79 then
        v80 = p76.kitSkin;
    else
        v80 = nil;
    end;

    local v81;

    if p76.kind == "kitSkin" then
        v81 = p76.kit or getKitSkinMetadata(p76.kitSkin).kit;
    else
        v81 = nil;
    end;

    if v79 then
        if v80 == nil or (v81 == nil or v81 == BedwarsKit.NONE) then
            v79 = false;
        else
            v79 = PlaceUtil.isLobbyServer();
        end;
    end;

    if v79 then
        local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui", 10);
        local u82;

        if PlayerGui then
            u82 = p75:mountKitSkinPreviewLoadingSpinner(PlayerGui);
        else
            u82 = nil;
        end;

        local function _() -- Line: 398
            -- upvalues: u82 (ref)
            local v83 = u82;

            if v83 ~= nil then
                v83();
            end;

            u82 = nil;
        end;

        if default2.Client:Get("LockerKitSkinPreviewRequest"):CallServer({
            kit = v81,
            kitSkin = v80
        }) then
            local v84 = nil;

            if PlayerGui then
                local v85 = false;
                local v86 = 0;

                while true do
                    if true then
                        if v85 then
                            v86 = v86 + 1;
                        else
                            v85 = true;
                        end;
                    end;

                    if v86 >= 50 then
                        break;
                    end;

                    v84 = PlayerGui:FindFirstChild(LockerKitSkinPreviewGui.FolderName);

                    if v84 ~= nil then
                        v84 = v84:FindFirstChild(LockerKitSkinPreviewGui.ModelName);
                    end;

                    if v84 then
                        break;
                    end;

                    task.wait(0.1);
                end;
            end;

            local v87 = u82;

            if v87 ~= nil then
                v87();
            end;

            u82 = nil;

            if v84 then
                local v88 = v84:Clone();
                v88.Name = "KitSkinLockerPreview";
                local Animate = v88:FindFirstChild("Animate");
                local v89;

                if Animate == nil then
                    v89 = Animate;
                else
                    v89 = Animate:IsA("LocalScript");
                end;

                if v89 then
                    Animate.Enabled = false;
                end;

                local HumanoidRootPart = v88:FindFirstChild("HumanoidRootPart");

                if HumanoidRootPart then
                    HumanoidRootPart.Anchored = true;
                end;

                v88.Parent = Workspace;
                v88:PivotTo(CFrame.new(KnitClient.Controllers.LockerPreviewController:getPreviewDummyPosition()));
                v78:GiveTask(v88);
                v78:GiveTask(function() -- Line: 457
                    -- upvalues: default2 (ref)
                    default2.Client:Get("LockerKitSkinPreviewClear"):SendToServer();
                end);
                p75:applyPreviewArmorSetToRig(v88, v81, v80);
                p75:attachPreviewKitItems(v88, v81, v80);

                if not p75:mountPreviewRig(v78, v88, v81) then
                    p75:playPreviewAnimationOnRig(v88, v81);
                end;

                return v78;
            end;

            default2.Client:Get("LockerKitSkinPreviewClear"):SendToServer();
        end;

        local v90 = u82;

        if v90 ~= nil then
            v90();
        end;

        u82 = nil;
    end;

    local v91 = p75:spawnPreviewRig(p77);
    v91.Parent = Workspace;
    v91:PivotTo(CFrame.new(KnitClient.Controllers.LockerPreviewController:getPreviewDummyPosition()));
    v78:GiveTask(v91);

    if p76.kind == "kit" then
        v81 = p76.kit;
    end;

    p75:applyPreviewArmorSetToRig(v91, v81, v80);
    p75:attachPreviewKitItems(v91, v81, v80);

    if not p75:mountPreviewRig(v78, v91, v81) then
        p75:playPreviewAnimationOnRig(v91, v81);
    end;

    return v78;
end;

KnitClient.CreateController(u5.new());

return nil;
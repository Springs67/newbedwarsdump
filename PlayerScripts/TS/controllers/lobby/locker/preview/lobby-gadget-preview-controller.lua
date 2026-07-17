-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local AnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BalloonUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balloon", "balloon-util").BalloonUtil;
local ArmorSlot = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local LobbyGadgetMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta;
local LobbyGadgetType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
local MountMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-meta").MountMeta;
local PetMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "pet", "pet-meta").PetMeta;
local VehicleMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-meta").VehicleMeta;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "LobbyGadgetPreviewController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 32
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 36
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "LobbyGadgetPreviewController";
end;

function u4.KnitStart(p7) -- Line: 40
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p7);
end;

function u4.previewLobbyGadget(p8, p9, u10, p11) -- Line: 43
    -- upvalues: u1 (copy), LobbyGadgetMeta (copy), KnitClient (copy), ArmorSlot (copy), GameAnimationUtil (copy), LobbyGadgetType (copy), AnimationType (copy)
    local u12 = u1.new();
    local v13 = LobbyGadgetMeta[p9];
    local LockerPreviewController = KnitClient.Controllers.LockerPreviewController;
    local preview = v13.preview;

    if preview ~= nil then
        preview = preview.customAngle;
    end;

    if preview == nil then
        preview = CFrame.Angles(0, 4.101523742186674, 0);
    end;

    LockerPreviewController:setPreviewAngle(preview);

    if p11 ~= nil then
        p11:unequipArmorSlot(ArmorSlot.HELMET);
    end;

    if p11 ~= nil then
        p11:unequipArmorSlot(ArmorSlot.CHESTPLATE);
    end;

    if p11 ~= nil then
        p11:unequipArmorSlot(ArmorSlot.BOOTS);
    end;

    if p11 ~= nil then
        p11:unequipItemInHand();
    end;

    if p11 ~= nil then
        p11:unequipBackpackSlot();
    end;

    local HumanoidRootPart = u10:FindFirstChild("HumanoidRootPart");

    if u10 ~= nil then
        u10:PivotTo(CFrame.new(KnitClient.Controllers.LockerPreviewController:getPreviewDummyPosition()));
    end;

    u12:GiveTask(function() -- Line: 83
        -- upvalues: u10 (copy), KnitClient (ref)
        local v14 = u10;

        if v14 ~= nil then
            v14 = v14:PivotTo(KnitClient.Controllers.LockerPreviewController:getBackstageWorldPosition());
        end;

        return v14;
    end);
    local v15 = GameAnimationUtil:getAnimationFromCharacter(u10, "idle");

    if v15 then
        u10.Humanoid.Animator:LoadAnimation(v15):Play();
    end;

    if v13.items and not v13.vehicle then
        u12:GiveTask(p8:previewLobbyGadgetItem(u10, p11, v13));
    end;

    if v13.pet then
        u12:GiveTask(p8:previewLobbyGadgetPet(v13.pet, u10));
    end;

    if v13.mount then
        u12:GiveTask(p8:previewLobbyGadgetMount(v13.mount, u10));
    end;

    if v13.vehicle then
        u12:GiveTask(p8:previewLobbyGadgetVehicle(v13.vehicle, u10, HumanoidRootPart));
    end;

    if p9 ~= LobbyGadgetType.ANGEL_WINGS then
        if p9 == LobbyGadgetType.CLOAK then
            u12:GiveTask(KnitClient.Controllers.CloakLobbyGadgetController:equipCharacter(u10));

            return u12;
        end;

        if p9 == LobbyGadgetType.POGO_STICK then
            local u16 = GameAnimationUtil:playAnimation(u10, AnimationType.POGO_STICK_MOUNT, {
                looped = true
            });

            if u16 then
                u16.Priority = Enum.AnimationPriority.Action4;
            end;

            if u16 ~= nil then
                u16:GetMarkerReachedSignal("Pause"):Once(function() -- Line: 134
                    -- upvalues: u16 (copy)
                    return u16:AdjustSpeed(0);
                end);
            end;

            u12:GiveTask(function() -- Line: 138
                -- upvalues: u16 (copy)
                local v17 = u16;

                if v17 ~= nil then
                    v17:Stop();
                end;

                local v18 = u16;

                if v18 ~= nil then
                    v18:Destroy();
                end;
            end);
            local Humanoid = u10.Humanoid;

            if Humanoid then
                u12:GiveTask(function() -- Line: 151
                    -- upvalues: Humanoid (copy)
                    local v19 = Humanoid;
                    v19.HipHeight = v19.HipHeight - 1.3;
                end);
                Humanoid.HipHeight = Humanoid.HipHeight + 1.3;

                return u12;
            end;
        elseif p9 == LobbyGadgetType.VIP_HOVER_BOARD then
            u12:GiveTask(KnitClient.Controllers.VipHoverboardController:mountHoverboard(u10));
        end;

        return u12;
    end;

    HumanoidRootPart.Anchored = false;
    local v20 = KnitClient.Controllers.AngelWingsBackpackController:getAngelWingType();
    KnitClient.Controllers.AngelWingsBackpackController:equipCharacter(u10, v20, true):andThen(function(p21) -- Line: 116
        -- upvalues: u12 (copy), HumanoidRootPart (copy)
        u12:GiveTask(p21);
        u12:GiveTask(function() -- Line: 118
            -- upvalues: HumanoidRootPart (ref)
            HumanoidRootPart.Anchored = true;

            return HumanoidRootPart.Anchored;
        end);
    end);

    return u12;
end;

function u4.setIdleAnimation(p22, p23, p24, p25) -- Line: 161
    -- upvalues: GameAnimationUtil (copy)
    local u26 = GameAnimationUtil:playAnimation(p24, p23, {
        looped = true
    });
    p25:GiveTask(function() -- Line: 165
        -- upvalues: u26 (copy)
        local v27 = u26;

        if v27 ~= nil then
            v27 = v27:Stop();
        end;

        return v27;
    end);
end;

function u4.previewLobbyGadgetItem(u28, u29, u30, u31) -- Line: 173
    -- upvalues: u1 (copy), getItemMeta (copy), ItemUtil (copy), BalloonUtil (copy), KnitClient (copy)
    local u32 = u1.new();

    local function v40(p33) -- Line: 175
        -- upvalues: getItemMeta (ref), ItemUtil (ref), u30 (copy), u31 (copy), u28 (copy), u29 (copy), u32 (copy), BalloonUtil (ref), KnitClient (ref)
        local v34 = getItemMeta(p33);
        local v35 = ItemUtil.createItemInstance(p33);

        if v34.armor then
            local v36 = u30;

            if v36 ~= nil then
                v36:equipArmorItem(v35, v34.armor.slot);
            end;
        else
            local preview = u31.preview;

            if preview ~= nil then
                preview = preview.hideItemInHand;
            end;

            if not preview then
                local v37 = u30;

                if v37 ~= nil then
                    v37:equipItem(v35);
                end;
            end;
        end;

        local preview = u31.preview;

        if preview ~= nil then
            preview = preview.disableIdleAnimation;
        end;

        if not preview then
            local preview2 = u31.preview;

            if preview2 ~= nil then
                preview2 = preview2.idleAnimation;
            end;

            if preview2 == 0 or (preview2 ~= preview2 or not preview2) then
                local sword = v34.sword;

                if sword ~= nil then
                    sword = sword.idleAnimation;
                end;

                if sword ~= 0 and (sword == sword and sword) then
                    u28:setIdleAnimation(v34.sword.idleAnimation, u29, u32);
                end;

                local thirdPerson = v34.thirdPerson;

                if thirdPerson ~= nil then
                    thirdPerson = thirdPerson.holdAnimation;
                end;

                if thirdPerson ~= 0 and (thirdPerson == thirdPerson and thirdPerson) then
                    u28:setIdleAnimation(v34.thirdPerson.holdAnimation, u29, u32);
                end;

                local projectileSource = v34.projectileSource;

                if projectileSource ~= nil then
                    projectileSource = projectileSource.thirdPerson;

                    if projectileSource ~= nil then
                        projectileSource = projectileSource.aimAnimation;
                    end;
                end;

                if projectileSource ~= 0 and (projectileSource == projectileSource and projectileSource) then
                    local projectileSource2 = v34.projectileSource;

                    if projectileSource2 ~= nil then
                        projectileSource2 = projectileSource2.thirdPerson;

                        if projectileSource2 ~= nil then
                            projectileSource2 = projectileSource2.aimAnimation;
                        end;
                    end;

                    u28:setIdleAnimation(projectileSource2, u29, u32);
                end;
            else
                u28:setIdleAnimation(u31.preview.idleAnimation, u29, u32);
            end;
        end;

        if v34.balloon then
            local v38 = false;
            local v39 = 0;

            while true do
                if true then
                    if v38 then
                        v39 = v39 + 1;
                    else
                        v38 = true;
                    end;
                end;

                if v39 >= BalloonUtil.MAX_INFLATED_BALLOONS then
                    break;
                end;

                u32:GiveTask((KnitClient.Controllers.BalloonController:inflateBalloonFromCharacter(u29)));
            end;
        end;
    end;

    local preview = u31.preview;

    if preview ~= nil then
        preview = preview.featuredItem;
    end;

    if preview then
        v40(u31.preview.featuredItem);

        return u32;
    end;

    if u31.items then
        for _, v in u31.items do
            v40(v.itemType);
        end;
    end;

    return u32;
end;

function u4.previewLobbyGadgetPet(p41, p42, p43) -- Line: 273
    -- upvalues: u1 (copy), PetMeta (copy), Workspace (copy), KnitClient (copy), AnimationUtil (copy), GameAnimationUtil (copy)
    local v44 = u1.new();
    p43:PivotTo(p43:GetPivot() + Vector3.new(1.5, 0, -1.5));
    local v45 = PetMeta[p42];
    local v46 = v45.model:Clone();
    v46.Parent = Workspace;
    v46:PivotTo(CFrame.new(KnitClient.Controllers.LockerPreviewController:getPreviewDummyPosition()));
    local scaleMultiplier = v45.scaleMultiplier;

    if scaleMultiplier ~= 0 and (scaleMultiplier == scaleMultiplier and scaleMultiplier) then
        v46:ScaleTo(v45.scaleMultiplier * v46:GetScale());
    end;

    if v46.PrimaryPart then
        v46.PrimaryPart.Anchored = true;
    end;

    v44:GiveTask(v46);
    local v47 = -p43.Humanoid.HipHeight - v46:GetExtentsSize().Y / 2;
    local heightOffset = v45.heightOffset;
    local spawnHeightOffset = v45.spawnHeightOffset;
    local v48 = CFrame.new(-3, v47 + (heightOffset == nil and 0 or heightOffset) + (spawnHeightOffset == nil and 0 or spawnHeightOffset), 3);
    v46:PivotTo(p43:GetPivot() * v48);
    local v49 = v46:FindFirstChildWhichIsA("Animator", true);

    if v49 then
        AnimationUtil:playAnimation(v49, GameAnimationUtil:getAssetId(v45.animations.idle), {
            looped = true
        });
        v44:GiveTask(KnitClient.Controllers.PetController:setupPetPassiveAnims(v45, v49));
    end;

    return v44;
end;

function u4.previewLobbyGadgetMount(p50, p51, u52) -- Line: 313
    -- upvalues: u1 (copy), MountMeta (copy), KnitClient (copy), GameAnimationUtil (copy), AnimationType (copy), RunService (copy)
    local v53 = u1.new();
    local u54 = MountMeta[p51];
    local u55 = KnitClient.Controllers.MountController:weldMountToCharacter(p51, u52);
    local u56 = u52.Humanoid.Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.SIT_ON_DODO_BIRD));
    u56.Priority = Enum.AnimationPriority.Movement;
    u56:Play();
    v53:GiveTask(function() -- Line: 320
        -- upvalues: u52 (copy), u55 (copy), u54 (copy), u56 (copy)
        local v57 = u52;

        if v57 then
            v57 = u55;

            if v57 ~= nil then
                v57 = v57.PrimaryPart;
            end;
        end;

        if v57 then
            local mountHipYOffset = u54.mountHipYOffset;

            if mountHipYOffset == nil then
                mountHipYOffset = u55.PrimaryPart.Size.Y / 2 - 0.1;
            end;

            local Humanoid = u52.Humanoid;
            Humanoid.HipHeight = Humanoid.HipHeight - mountHipYOffset;
        end;

        local v58 = u55;

        if v58 ~= nil then
            v58:Destroy();
        end;

        u56:Stop();
    end);

    if u55 then
        v53:GiveTask((RunService.Stepped:Connect(function() -- Line: 343
            -- upvalues: u52 (copy), KnitClient (ref), u55 (copy), u54 (copy)
            if u52 then
                KnitClient.Controllers.MountSittingController:performStep(u55, u54, u52);
            end;
        end)));
        KnitClient.Controllers.MountAnimationController:playAnimationInMount(u55, u54.animations.idle, 1, true);
    end;

    return v53;
end;

function u4.previewLobbyGadgetVehicle(p59, p60, p61, u62) -- Line: 353
    -- upvalues: u1 (copy), VehicleMeta (copy), KnitClient (copy), Workspace (copy), GameAnimationUtil (copy), AnimationType (copy), u2 (copy)
    local v63 = u1.new();
    local v64 = VehicleMeta[p60];
    local v65 = KnitClient.Controllers.VehicleController:getVehicleModel(p60);
    u62.Anchored = false;
    v63:GiveTask(function() -- Line: 358
        -- upvalues: u62 (copy)
        u62.Anchored = true;

        return u62.Anchored;
    end);

    if v65 then
        v65.Parent = Workspace;
        v65:PivotTo(p61:GetPivot());

        if v65.PrimaryPart then
            v65.PrimaryPart.Anchored = true;
        end;

        v63:GiveTask(v65);
        local Driver = v65:FindFirstChild("Driver");
        p61:PivotTo(Driver:GetPivot());
        local sitAnimation = v64.sitAnimation;

        if sitAnimation == nil then
            sitAnimation = AnimationType.SIT_ON_DODO_BIRD;
        end;

        local u66 = p61.Humanoid.Animator:LoadAnimation(GameAnimationUtil:getAnimation(sitAnimation));
        u66.Priority = Enum.AnimationPriority.Movement;
        u66:Play();
        v63:GiveTask(function() -- Line: 380
            -- upvalues: u66 (copy)
            return u66:Stop();
        end);
        u2("Weld", {
            C0 = CFrame.new((Vector3.new(0, Driver.Size.Y / 2, 0))) * CFrame.Angles(1.5707963267948966, 0, 0),
            C1 = CFrame.new(Vector3.new(0, -1.5, 0)) * CFrame.Angles(1.5707963267948966, 0, 0),
            Part0 = Driver,
            Part1 = u62,
            Parent = Driver
        });
    end;

    return v63;
end;

KnitClient.CreateController(u4.new());

return nil;
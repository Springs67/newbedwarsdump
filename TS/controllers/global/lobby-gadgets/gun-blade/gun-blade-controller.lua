-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GunBladeUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "gun-blade-balance").GunBladeUtil;
local KnockbackUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "knockback-util").KnockbackUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SharedSyncEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 39, Name: __tostring
        return "GunBladeController";
    end,

    __index = HandKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 45
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 49
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p7);
    p7.Name = "GunBladeController";
    p7.modelMap = {};
    p7.maidMap = {};
    p7.animationMaid = u2.new();
    p7.shootRaycastParams = nil;
end;

function u5.KnitStart(u8) -- Line: 57
    -- upvalues: HandKnitController (copy), SharedSyncEvents (copy), Players (copy), GunBladeUtil (copy), ClientSyncEvents (copy), AbilityId (copy), default (copy), GameSound (copy), SoundManager (copy), ReplicatedStorage (copy), Workspace (copy), WatchCharacter (copy), KnitClient (copy)
    HandKnitController.KnitStart(u8);
    SharedSyncEvents.HandItemRendered:connect(function(p9) -- Line: 60
        -- upvalues: Players (ref), GunBladeUtil (ref), u8 (copy)
        local v10 = Players:GetPlayerFromCharacter(p9.entity);

        if not v10 or v10 == Players.LocalPlayer then
            return nil;
        end;

        if GunBladeUtil:isGunBlade(p9.itemType) then
            u8:equip(v10, p9.itemType);

            return;
        end;

        u8:unequip(v10);
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p11) -- Line: 73
        -- upvalues: AbilityId (ref), Players (ref), u8 (copy)
        if p11.ability == AbilityId.HAND_GUN and p11.userCharacter == Players.LocalPlayer.Character then
            u8:fire();
        end;
    end);
    default.Client:Get("HandGunFireEffect"):Connect(function(p12) -- Line: 78
        -- upvalues: u8 (copy), Players (ref), GameSound (ref), SoundManager (ref), ReplicatedStorage (ref), Workspace (ref)
        local v13 = u8:getSkinMeta(p12.user);

        if p12.user ~= Players.LocalPlayer then
            local v14;

            if v13 == nil then
                v14 = v13;
            else
                v14 = v13.gunblade;

                if v14 ~= nil then
                    v14 = v14.gunFireSound;
                end;
            end;

            if v14 == "" or not v14 then
                v14 = GameSound.GUN_BLADE_SHOT;
            end;

            SoundManager:playSound(v14, {
                position = p12.position
            });
        end;

        if v13 ~= nil then
            v13 = v13.gunblade;

            if v13 ~= nil then
                v13 = v13.gunFireEffect;
            end;
        end;

        local u15 = (v13 or ReplicatedStorage.Assets.Effects.GunFireEffect):Clone();
        u15:PivotTo(CFrame.new(p12.position, p12.position + p12.direction.Unit * 10));
        u15.Parent = Workspace;

        local function _(p16) -- Line: 114
            if p16:IsA("ParticleEmitter") then
                p16:Emit(20);
            end;
        end;

        for i, descendant in u15:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ParticleEmitter") then
                descendant:Emit(20);
            end;
        end;

        task.delay(0.5, function() -- Line: 122
            -- upvalues: u15 (copy)
            u15:Destroy();
        end);
    end);
    WatchCharacter(function(u17, u18) -- Line: 126
        -- upvalues: Players (ref), u8 (copy), KnitClient (ref)
        local v19 = math.abs(Players.LocalPlayer.UserId);
        u18:GetAttributeChangedSignal(tostring(v19) .. "HandGunMarked"):Connect(function() -- Line: 127
            -- upvalues: u18 (copy), Players (ref), u8 (ref), u17 (copy)
            local v20 = math.abs(Players.LocalPlayer.UserId);
            local v21 = u18:GetAttribute(tostring(v20) .. "HandGunMarked");

            if v21 == 0 or (v21 ~= v21 or (v21 == "" or not v21)) then
                u8:clearMark(u17);

                return;
            end;

            u8:createMark(u17);
        end);
        u18:GetAttributeChangedSignal("HandGunSpeed"):Connect(function() -- Line: 135
            -- upvalues: u18 (copy), Players (ref), u17 (copy), u8 (ref), KnitClient (ref)
            if u18:GetAttribute("HandGunSpeed") == nil then
                if Players.LocalPlayer == u17 and u8.speedMaid then
                    u8.speedMaid:Destroy();
                    u8.speedMaid = nil;
                end;
            elseif Players.LocalPlayer == u17 then
                local speedMaid = u8.speedMaid;

                if speedMaid ~= nil then
                    speedMaid:Destroy();
                end;

                u8.speedMaid = nil;
                u8.speedMaid = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    blockSprint = false,
                    moveSpeedMultiplier = 1.2
                });
            end;
        end);
    end);
end;

function u5.isRelevantItem(p22, p23) -- Line: 157
    -- upvalues: GunBladeUtil (copy)
    return GunBladeUtil:isGunBlade(p23.itemType);
end;

function u5.onEnable(p24, p25, p26) -- Line: 160
    -- upvalues: Players (copy), Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    p24:equip(Players.LocalPlayer, p25.itemType);
    p24:setUpAnimation();
    p24:setupDestroyableYield(function() -- Line: 164
        -- upvalues: Flamework (ref), AbilityId (ref), AbilityMeta (ref)
        return Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.HAND_GUN, AbilityMeta[AbilityId.HAND_GUN].triggerConfig):expect();
    end);
end;

function u5.onDisable(p27) -- Line: 168
    -- upvalues: Players (copy)
    p27:unequip(Players.LocalPlayer);
    p27:cleanUpAnimation();
end;

function u5.equip(p28, p29, p30) -- Line: 173
    -- upvalues: ReplicatedStorage (copy), ItemType (copy), WeldUtil (copy), u2 (copy)
    p28:unequip(p29);
    local WoodHandGun = ReplicatedStorage.Assets.Effects.WoodHandGun;
    local v31 = p28:getSkinMeta(p29);
    local v32;

    if v31 == nil then
        v32 = v31;
    else
        v32 = v31.gunblade;

        if v32 ~= nil then
            v32 = v32.handGunModel;
        end;
    end;

    if v32 then
        if p30 == ItemType.IRON_GUN_BLADE then
            WoodHandGun = v31.gunblade.handGunModel.iron;
        elseif p30 == ItemType.STONE_GUN_BLADE then
            WoodHandGun = v31.gunblade.handGunModel.stone;
        elseif p30 == ItemType.DIAMOND_GUN_BLADE then
            WoodHandGun = v31.gunblade.handGunModel.diamond;
        elseif p30 == ItemType.EMERALD_GUN_BLADE then
            WoodHandGun = v31.gunblade.handGunModel.emerald;
        else
            WoodHandGun = v31.gunblade.handGunModel.wood;
        end;
    elseif p30 == ItemType.IRON_GUN_BLADE then
        WoodHandGun = ReplicatedStorage.Assets.Effects.IronHandGun;
    elseif p30 == ItemType.STONE_GUN_BLADE then
        WoodHandGun = ReplicatedStorage.Assets.Effects.StoneHandGun;
    elseif p30 == ItemType.DIAMOND_GUN_BLADE then
        WoodHandGun = ReplicatedStorage.Assets.Effects.DiamondHandGun;
    elseif p30 == ItemType.EMERALD_GUN_BLADE then
        WoodHandGun = ReplicatedStorage.Assets.Effects.EmeraldHandGun;
    end;

    local v33 = WoodHandGun:Clone();

    if v33 and p29.Character then
        local function _(p34) -- Line: 211
            p34:SetAttribute("VisibleInViewmodel", true);
        end;

        for i, descendant in v33:GetDescendants() do
            local _ = i - 1;
            descendant:SetAttribute("VisibleInViewmodel", true);
        end;

        v33.Parent = p29.Character;
        WeldUtil:weldAccessory(p29.Character, v33);
        local v35 = u2.new();
        v35:GiveTask(v33);
        p28.modelMap[p29] = v35;
    end;
end;

function u5.unequip(p36, p37) -- Line: 229
    local v38 = p36.modelMap[p37];

    if v38 ~= nil then
        v38:DoCleaning();
    end;
end;

function u5.fire(p39) -- Line: 237
    -- upvalues: Workspace (copy), Players (copy), KnitClient (copy), AnimationType (copy), default (copy), AnimationUtil (copy), GameAnimationUtil (copy), GameSound (copy), SoundManager (copy), EntityUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy), KnockbackUtil (copy)
    local CurrentCamera = Workspace.CurrentCamera;
    local v40;

    if CurrentCamera == nil then
        v40 = CurrentCamera;
    else
        v40 = CurrentCamera.CFrame.LookVector.Unit;
    end;

    if not v40 then
        return nil;
    end;

    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.GAUNTLETS_JAB_1ST);
    local AssemblyMass = Character.AssemblyMass;

    if not default.Client:Get("HandGunFireRequest"):CallServer({
        lookVector = v40
    }) then
        return nil;
    end;

    AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.GUN_BLADE_FIRE), {
        fadeSamePriorityTracks = false,
        looped = false
    });
    local v41 = p39:getSkinMeta(Players.LocalPlayer);

    if v41 ~= nil then
        v41 = v41.gunblade;

        if v41 ~= nil then
            v41 = v41.gunFireSound;
        end;
    end;

    if v41 == "" or not v41 then
        v41 = GameSound.GUN_BLADE_SHOT;
    end;

    SoundManager:playSound(v41);
    Character.CFrame = CFrame.new(Character.Position, Character.Position + CurrentCamera.CFrame.LookVector * Vector3.new(1, 0, 1));
    local v42 = EntityUtil:getLocalPlayerEntity();
    local v43 = false;

    if v42 and not StatusEffectUtil:getActive(v42:getInstance(), StatusEffectType.GROUNDED) then
        if not p39.shootRaycastParams then
            p39.shootRaycastParams = RaycastParams.new();
            p39.shootRaycastParams.FilterDescendantsInstances = { Workspace:FindFirstChild("Map"), Workspace:FindFirstChild("Lobby"), Workspace.Terrain };
            p39.shootRaycastParams.FilterType = Enum.RaycastFilterType.Include;
        end;

        local v44 = v42:getInstance();
        local Position = v42:getInstance():GetPivot().Position;
        local Y = (v44:GetExtentsSize() / 2).Y;
        local v45 = not Workspace:Raycast(Position - Vector3.new(0, Y, 0), Vector3.new(0, -3, 0), p39.shootRaycastParams) and true or v43;
        KnockbackUtil.applyKnockbackPlatformStand(Character);
        Character:ApplyImpulse(v40 * (AssemblyMass * (v45 and 80 or 20) * -1));
    end;
end;

function u5.createMark(p46, p47) -- Line: 311
    -- upvalues: u3 (copy), BedwarsImageId (copy), ColorUtil (copy), EntityUtil (copy), Players (copy), CollectionService (copy), u2 (copy)
    p46:clearMark(p47);
    local Character = p47.Character;

    if not Character then
        return nil;
    end;

    local v48 = u3("BillboardGui", {
        ResetOnSpawn = false,
        AlwaysOnTop = true,
        Parent = Character.PrimaryPart,
        Size = UDim2.fromScale(3, 3),
        Children = { u3("ImageLabel", {
                ImageTransparency = 0.25,
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.new(1.5, 0, 1.5, 0),
                Image = BedwarsImageId.GUN_BLADE_MARK,
                ImageColor3 = ColorUtil.WHITE
            }) }
    });
    local v49 = EntityUtil:getPlayerFromEntityInstance(Character);

    if v49 and v49 == Players.LocalPlayer then
        CollectionService:AddTag(v48, "FirstPersonHidden");
    end;

    local v50 = u2.new();
    v50:GiveTask(v48);
    p46.maidMap[p47] = v50;
end;

function u5.clearMark(p51, p52) -- Line: 342
    local v53 = p51.maidMap[p52];

    if v53 ~= nil then
        v53:DoCleaning();
    end;
end;

function u5.getSkin(p54, p55) -- Line: 350
    -- upvalues: KnitClient (copy)
    local v56;

    if p55.Character then
        v56 = KnitClient.Controllers.KitSkinController:getKitSkin(p55.Character);
    else
        v56 = nil;
    end;

    return v56;
end;

function u5.getSkinMeta(p57, p58) -- Line: 357
    -- upvalues: BedwarsKitSkinMeta (copy)
    local v59 = p57:getSkin(p58);

    if v59 then
        return BedwarsKitSkinMeta[v59];
    end;

    return nil;
end;

function u5.setUpAnimation(p60) -- Line: 364
    -- upvalues: Players (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    local LocalPlayer = Players.LocalPlayer;
    local Character = LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    local Humanoid = Character.Humanoid;
    local u61 = false;
    local u62 = nil;
    p60.animationMaid:GiveTask(function() -- Line: 373
        -- upvalues: u62 (ref)
        local v63 = u62;

        if v63 ~= nil then
            v63:Stop();
        end;

        local v64 = u62;

        if v64 ~= nil then
            v64:Destroy();
        end;
    end);
    p60.animationMaid:GiveTask(Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function() -- Line: 383
        -- upvalues: Humanoid (copy), u61 (ref), u62 (ref), AnimationUtil (ref), LocalPlayer (copy), GameAnimationUtil (ref), AnimationType (ref)
        if Humanoid.MoveDirection.Magnitude > 0 and (Humanoid:GetState() == Enum.HumanoidStateType.Running and not u61) then
            local v65 = u62;

            if v65 ~= nil then
                v65:Stop();
            end;

            local v66 = u62;

            if v66 ~= nil then
                v66:Destroy();
            end;

            u62 = AnimationUtil:playAnimation(LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.GUN_BLADE_RUN), {
                fadeSamePriorityTracks = false
            });
            u61 = true;
        end;

        if Humanoid.MoveDirection.Magnitude == 0 and Humanoid:GetState() == Enum.HumanoidStateType.Running then
            u61 = false;
            local v67 = u62;

            if v67 ~= nil then
                v67:Stop();
            end;

            local v68 = u62;

            if v68 ~= nil then
                v68:Destroy();
            end;

            u61 = false;
            u62 = AnimationUtil:playAnimation(LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.GUN_BLADE_IDLE), {
                fadeSamePriorityTracks = false
            });
        end;
    end));
end;

function u5.cleanUpAnimation(p69) -- Line: 415
    p69.animationMaid:DoCleaning();
end;

KnitClient.CreateController(u5.new());

return nil;
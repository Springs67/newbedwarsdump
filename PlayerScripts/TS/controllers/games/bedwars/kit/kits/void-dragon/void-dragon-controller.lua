-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local ContextActionService = v4.ContextActionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local UserInputService = v4.UserInputService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local BuildRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").BuildRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local VoidDragonBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "void-dragon-balance").VoidDragonBalance;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local getBedwarsKitMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta;
local VoidDragonActions = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "void-dragon", "void-dragon-const").VoidDragonActions;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local VoidDragonUi = RuntimeLib.import(script, script.Parent, "ui", "void-dragon-ui").VoidDragonUi;
local u5 = { GameSound.XUROT_FLAP_WING_1, GameSound.XUROT_FLAP_WING_2 };
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 42, Name: __tostring
        return "VoidDragonController";
    end,

    __index = BaseKitController
});
u6.__index = u6;

function u6.new(...) -- Line: 48
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 52
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), AnimationType (copy), GameSound (copy), u2 (copy), DeviceUtil (copy)
    BaseKitController.constructor(p8, BedwarsKit.VOID_DRAGON, {
        animations = {
            AnimationType.VOID_DRAGON_WINGS_FLAP,
            AnimationType.VOID_DRAGON_GLIDE,
            AnimationType.VOID_DRAGON_WING_TRANSFORM,
            AnimationType.VOID_DRAGON_BREATH,
            AnimationType.VOID_DRAGON_IDLE,
            AnimationType.VOID_DRAGON_RUNNING,
            AnimationType.VOID_DRAGON_FLYING,
            AnimationType.VOID_DRAGON_TRANSFORM
        },
        sounds = {
            GameSound.XUROT_BREATH,
            GameSound.XUROT_FLAP_WING_1,
            GameSound.XUROT_FLAP_WING_2,
            GameSound.XUROT_TRANSFORM
        }
    });
    p8.Name = "VoidDragonController";
    p8.jumpMaid = u2.new();
    p8.inDragonForm = false;
    p8.abilityMaid = u2.new();
    p8.SpeedMaid = u2.new();
    p8.YTargetOffset = DeviceUtil.isMobileControls() and 0.25 or 0.05;
    p8.jumpReadyTime = -1;
    p8.startHoldingTime = 0;
    p8.targetingMaid = u2.new();
    p8.isHolding = false;
    p8.breathReadyTime = -1;
end;

function u6.onKitLocalActivated(u9, u10) -- Line: 69
    -- upvalues: default (copy), Players (copy), Flamework (copy), BuildRoduxApp (copy), VoidDragonUi (copy), ContextActionService (copy), RuntimeLib (copy), UserInputService (copy), RunService (copy), ClientStore (copy), ClientSyncEvents (copy)
    local function v11() -- Line: 70
        -- upvalues: default (ref), u9 (copy), Players (ref)
        if default.Client:Get("VoidDragonActive"):CallServer() then
            u9:voidDragonActive(Players.LocalPlayer);
        end;
    end;

    local v12 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(BuildRoduxApp(VoidDragonUi, {
        VoidDragonActive = v11
    }));
    ContextActionService:BindAction("Dragon Transform", function(p13, p14, p15) -- Line: 79
        -- upvalues: default (ref), u9 (copy), Players (ref)
        if default.Client:Get("VoidDragonActive"):CallServer() then
            u9:voidDragonActive(Players.LocalPlayer);
        end;
    end, false, Enum.KeyCode.V);
    u10:GiveTask(v12);
    local u16 = -1;
    u10:GiveTask((task.spawn(function() -- Line: 87
        -- upvalues: RuntimeLib (ref), u9 (copy)
        while true do
            local v17 = task.wait(0.5);

            if v17 == 0 or (v17 ~= v17 or not v17) then
                break;
            end;

            RuntimeLib.Promise.defer(function() -- Line: 93
                -- upvalues: u9 (ref)
                u9:antiGravityDecay();
            end);
        end;
    end)));
    u10:GiveTask(UserInputService.InputBegan:Connect(function(p18, p19) -- Line: 99
        -- upvalues: u9 (copy), RunService (ref)
        if u9:validInput(p18) and u9.inDragonForm then
            u9.startHoldingTime = time();
            u9.isHolding = true;
            local u20 = nil;
            u20 = RunService.Heartbeat:Connect(function(p21) -- Line: 104
                -- upvalues: u9 (ref), u20 (ref)
                if not u9.isHolding then
                    u9.targetingMaid:DoCleaning();
                    u20:Disconnect();
                end;

                if time() - u9.startHoldingTime >= 0.15 then
                    u9:enablePredictor();
                    u20:Disconnect();
                end;
            end);
        end;
    end));
    u10:GiveTask(UserInputService.InputEnded:Connect(function(p22, p23) -- Line: 116
        -- upvalues: u9 (copy), default (ref), Players (ref)
        if u9:validInput(p22) and (u9.inDragonForm and u9.isHolding) then
            u9.isHolding = false;
            u9.targetingMaid:DoCleaning();
            local v24;

            if time() - u9.startHoldingTime > 0.15 then
                v24 = u9:fireAtMouse();
            else
                v24 = nil;
            end;

            default.Client:Get("DragonBreath"):SendToServer({
                player = Players.LocalPlayer,
                targetPoint = v24
            });
        end;
    end));
    u10:GiveTask(UserInputService.TouchTapInWorld:Connect(function(p25, p26) -- Line: 132
        -- upvalues: u9 (copy), default (ref), Players (ref)
        if not p26 and u9.inDragonForm then
            local v27 = u9:fireAtMouse();
            default.Client:Get("DragonBreath"):SendToServer({
                player = Players.LocalPlayer,
                targetPoint = v27
            });
        end;
    end));
    default.Client:OnEvent("VoidDragonEnergyIncrease", function(p28) -- Line: 141
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "KitVoidDragonIncrementProgress",
            progress = p28.incrementProgress / 100
        });
    end):andThen(function(p29) -- Line: 146
        -- upvalues: u10 (copy)
        u10:GiveTask(p29);
    end);
    u10:GiveTask((default.Client:Get("VoidDragonDeactive"):Connect(function() -- Line: 149
        -- upvalues: u9 (copy)
        u9:deactivateDragonForm();
    end)));
    u10:GiveTask(UserInputService.JumpRequest:Connect(function() -- Line: 153
        -- upvalues: u16 (ref), Players (ref), u9 (copy)
        if u16 < time() then
            u16 = time() + 0.15;
            local Character = Players.LocalPlayer.Character;

            if (Character.Humanoid:GetState() == Enum.HumanoidStateType.Jumping or Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall) and u9.inDragonForm then
                u16 = time() + 1;
                u9:flapWings();
            end;
        end;
    end));
    u10:GiveTask(ClientSyncEvents.NewHandItem:connect(function(p30) -- Line: 163
        -- upvalues: u9 (copy)
        if u9.inDragonForm then
            p30:setCancelled(true);
        end;
    end));
    u10:GiveTask((default.Client:Get("VoidDragonLanded"):Connect(function() -- Line: 168
        -- upvalues: u9 (copy)
        u9.jumpReadyTime = time() + 0.1;
        u9:clearAllForce();
    end)));
end;

function u6.onKitLocalDeactivated(p31) -- Line: 174
end;

function u6.onKitReplicationActivated(u32, p33) -- Line: 176
    -- upvalues: default (copy)
    p33:GiveTask((default.Client:Get("VoidDragonAction"):Connect(function(p34) -- Line: 177
        -- upvalues: u32 (copy)
        u32:animationHandler(p34.player, p34.action, p34.breathTargetPoint);
    end)));
end;

function u6.onKitReplicationDeactivated(p35) -- Line: 182
end;

function u6.onInnateAbilityEnabled(p36, p37, p38) -- Line: 184
end;

function u6.onAbilityUsed(p39, p40, p41) -- Line: 186
    -- upvalues: Players (copy), AbilityId (copy), default (copy)
    if p40 == Players.LocalPlayer.Character and p41.ability == AbilityId.END_DRAGON then
        default.Client:Get("VoidDragonExit"):CallServer();
    end;
end;

function u6.clearAllForce(p42) -- Line: 191
    -- upvalues: Players (copy)
    local Character = Players.LocalPlayer.Character;

    if Character then
        local PrimaryPart = Character.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart:FindFirstChild("FlapWingForce");
        end;

        if PrimaryPart ~= nil then
            PrimaryPart:Destroy();
        end;

        p42.SpeedMaid:DoCleaning();
    end;
end;

function u6.voidDragonActive(u43, p44) -- Line: 207
    -- upvalues: ContextActionService (copy), Flamework (copy), AbilityId (copy), getBedwarsKitMeta (copy), BedwarsKit (copy), ClientStore (copy), InventoryUtil (copy), Players (copy)
    ContextActionService:UnbindAction("Dragon Transform");
    u43.inDragonForm = true;
    local u45 = nil;
    task.delay(3, function() -- Line: 211
        -- upvalues: u43 (copy), Flamework (ref), AbilityId (ref), getBedwarsKitMeta (ref), BedwarsKit (ref), u45 (ref)
        if u43.inDragonForm then
            local v46 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
            local END_DRAGON = AbilityId.END_DRAGON;
            local v47 = {};
            local v48 = {};
            local renderImage = getBedwarsKitMeta(BedwarsKit.VOID_DRAGON).renderImage;
            v48.icon = renderImage == nil and "" or renderImage;
            v47.abilityButton = v48;
            v47.abilityType = "KitPrimary";
            u45 = v46:enableAbility(END_DRAGON, v47):expect();
        end;
    end);
    u43.abilityMaid:GiveTask(function() -- Line: 229
        -- upvalues: u45 (ref)
        local v49 = u45;

        if v49 ~= nil then
            v49.Destroy();
        end;
    end);
    ClientStore:dispatch({
        type = "UnequipItemInHand",
        equip = false
    });
    local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

    if hand ~= nil then
        hand = hand.itemType;
    end;

    if hand then
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            local v50 = Character:WaitForChild(hand, 3);

            if v50 ~= nil then
                v50:Destroy();
            end;
        end;
    end;
end;

function u6.removeHandItem(p51, p52) -- Line: 254
    -- upvalues: InventoryUtil (copy)
    local hand = InventoryUtil.getInventory(p52).hand;

    if hand ~= nil then
        hand = hand.itemType;
    end;

    if hand then
        local Character = p52.Character;

        if Character ~= nil then
            local v53 = Character:WaitForChild(hand, 3);

            if v53 ~= nil then
                v53:Destroy();
            end;
        end;
    end;
end;

function u6.deactivateDragonForm(u54) -- Line: 270
    -- upvalues: ClientStore (copy), ContextActionService (copy), default (copy), Players (copy)
    u54.inDragonForm = false;
    u54:clearAllForce();
    u54.jumpMaid:DoCleaning();
    u54.targetingMaid:DoCleaning();
    u54.SpeedMaid:DoCleaning();
    u54.abilityMaid:DoCleaning();
    ClientStore:dispatch({
        type = "UnequipItemInHand",
        equip = true
    });
    ContextActionService:BindAction("Dragon Transform", function(p55, p56, p57) -- Line: 281
        -- upvalues: default (ref), u54 (copy), Players (ref)
        if default.Client:Get("VoidDragonActive"):CallServer() then
            u54:voidDragonActive(Players.LocalPlayer);
        end;
    end, false, Enum.KeyCode.V);
end;

function u6.flapWings(u58) -- Line: 288
    -- upvalues: default (copy), Players (copy), u3 (copy), Workspace (copy), KnitClient (copy)
    if u58.jumpReadyTime >= time() or not u58.inDragonForm then
        return nil;
    end;

    if default.Client:Get("DragonFlap"):CallServer({
        player = Players.LocalPlayer
    }) == false then
        return nil;
    end;

    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    local Character2 = Players.LocalPlayer.Character;

    if Character2 ~= nil then
        Character2 = Character2:FindFirstChild("Humanoid");
    end;

    local AssemblyMass = Character.AssemblyMass;
    local v59;

    if Character == nil then
        v59 = Character;
    else
        v59 = Character:FindFirstChild("FlapWingForce");
    end;

    if v59 then
        v59.Force = Vector3.new(0, Workspace.Gravity * AssemblyMass * 0.85, 0);
    else
        v59 = u3("BodyForce", {
            Name = "FlapWingForce",
            Force = Vector3.new(0, Workspace.Gravity * AssemblyMass * 0.75, 0),
            Parent = Character
        });
    end;

    local v60 = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
        blockSprint = true,
        constantSpeedMultiplier = 1.7
    });
    u58.SpeedMaid:GiveTask(v60);
    KnitClient.Controllers.MobileShiftLockController:enable(false);
    local u61 = time();
    v59:SetAttribute("forceAddedTime", u61);
    local v62 = Character.AssemblyLinearVelocity.Y * AssemblyMass;

    if Character2 ~= nil then
        Character2 = Character2:GetState();
    end;

    local v63 = Character2 == Enum.HumanoidStateType.Landed and 0 or v62;

    if Character ~= nil then
        Character:ApplyImpulse((Vector3.new(0, AssemblyMass * 40 - v63, 0)));
    end;

    task.delay(3, function() -- Line: 345
        -- upvalues: Character (copy), u61 (copy), u58 (copy), default (ref)
        local v64 = Character;

        if v64 ~= nil then
            v64 = v64:FindFirstChild("FlapWingForce");
        end;

        local v65;

        if v64 == nil then
            v65 = v64;
        else
            v65 = v64:GetAttribute("forceAddedTime");
        end;

        if v65 == u61 then
            u58.SpeedMaid:DoCleaning();
            default.Client:Get("VoidDragonEndFlying"):SendToServer();

            if v64 ~= nil then
                v64:Destroy();
            end;
        end;
    end);
end;

function u6.dragonBreathEffect(p66, p67, p68) -- Line: 365
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), RunService (copy)
    local Character = p67.Character;

    if not (Character and Character.PrimaryPart) then
        return nil;
    end;

    local Head = Character:FindFirstChild("Head");

    if not Head then
        return nil;
    end;

    local u69 = ReplicatedStorage.Assets.Effects.DragonBreath:Clone();
    p68 = p68;
    local v70;

    if p68 == nil then
        v70 = p68;
    else
        v70 = p68 - Head.Position;
    end;

    local u71;

    if p68 then
        u71 = p68 + v70.Unit * 10;
    else
        u71 = Head.Position + Character.PrimaryPart.CFrame.LookVector.Unit * 10;
    end;

    u69:PivotTo(CFrame.lookAt(Head.Position, u71));
    u69.Parent = Workspace;
    local u72 = RunService.Heartbeat:Connect(function() -- Line: 392
        -- upvalues: u69 (copy), Head (copy), u71 (ref)
        u69:PivotTo(CFrame.lookAt(Head.Position, u71));
    end);
    task.delay(0.3, function() -- Line: 395
        -- upvalues: u69 (copy), u72 (copy)
        u69:Destroy();
        u72:Disconnect();
    end);
end;

function u6.antiGravityDecay(p73) -- Line: 400
    -- upvalues: Players (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character:FindFirstChild("FlapWingForce");
        end;
    end;

    if Character then
        Character.Force = Character.Force * Vector3.new(0, 0.93, 0);
    end;
end;

function u6.animationHandler(p74, p75, p76, p77) -- Line: 415
    -- upvalues: VoidDragonActions (copy)
    if p76 == VoidDragonActions.DRAGON_BREATH then
        p74:breathAnimation(p75, p77);

        return;
    end;

    if p76 == VoidDragonActions.DRAGON_FLAP_WINGS then
        p74:flapAnimation(p75);

        return;
    end;

    if p76 == VoidDragonActions.TRANSFORM then
        p74:transformAnimation(p75);

        return;
    end;

    if p76 ~= VoidDragonActions.Dragon_DEACTIVE then
        return;
    end;

    p74:dragonDeactiveAnimation(p75);
end;

function u6.flapAnimation(p78, p79) -- Line: 435
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), RandomUtil (copy), u5 (copy)
    local Character = p79.Character;

    if Character ~= nil then
        Character = Character:FindFirstChild("wings");
    end;

    local AnimationController = Character:WaitForChild("AnimationController", 3);

    if AnimationController ~= nil then
        AnimationController = AnimationController:WaitForChild("Animator", 3);
    end;

    GameAnimationUtil:playAnimation(AnimationController, AnimationType.VOID_DRAGON_WINGS_FLAP);
    local Character2 = p79.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;

        if Character2 ~= nil then
            Character2 = Character2.Position;
        end;
    end;

    SoundManager:playSound(RandomUtil.fromList(unpack(u5)), {
        rollOffMaxDistance = 45,
        volumeMultiplier = 0.5,
        position = Character2
    });
end;

function u6.transformAnimation(p80, p81) -- Line: 461
    -- upvalues: SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), WeldUtil (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    p80:removeHandItem(p81);
    local Character = p81.Character;

    if Character ~= nil then
        Character = Character:FindFirstChild("wings");
    end;

    local Character2 = p81.Character;
    local v82;

    if Character2 == nil then
        v82 = Character2;
    else
        v82 = Character2.PrimaryPart;

        if v82 ~= nil then
            v82 = v82.Position;
        end;
    end;

    if not (v82 and Character2) then
        return nil;
    end;

    if Character then
        local v83 = Character:FindFirstChild("Plane.001");
        local v84 = Character:FindFirstChild("Plane.013");
        v83.Transparency = 0;
        v84.Transparency = 0;
    end;

    SoundManager:playSound(GameSound.XUROT_TRANSFORM, {
        rollOffMaxDistance = 45,
        volumeMultiplier = 0.5,
        position = v82
    });
    local u85 = ReplicatedStorage.Assets.Effects.VoidDragonTransform:Clone();
    u85.Position = v82;
    u85.Parent = p81.Character;
    local u86 = WeldUtil:weldParts(Character2.PrimaryPart, u85);
    task.delay(1, function() -- Line: 495
        -- upvalues: u86 (copy), u85 (copy)
        u86:Destroy();
        u85:Destroy();
    end);

    local function _(p87) -- Line: 500
        if p87:IsA("ParticleEmitter") then
            p87:Emit(30);
        end;
    end;

    for i, descendant in u85:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("ParticleEmitter") then
            descendant:Emit(30);
        end;
    end;

    AnimationUtil:playAnimation(p81, GameAnimationUtil:getAssetId(AnimationType.VOID_DRAGON_TRANSFORM));
    AnimationUtil:playAnimation(Character, GameAnimationUtil:getAssetId(AnimationType.VOID_DRAGON_WING_TRANSFORM), {
        looped = false
    });
    p80:changeWingSize(p81.Character, true);
end;

function u6.dragonDeactiveAnimation(p88, p89) -- Line: 514
    p88:changeWingSize(p89.Character, false);
end;

function u6.breathAnimation(u90, u91, u92) -- Line: 517
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    AnimationUtil:playAnimation(u91, GameAnimationUtil:getAssetId(AnimationType.VOID_DRAGON_BREATH_FIRE));
    task.delay(0.1, function() -- Line: 519
        -- upvalues: u90 (copy), u91 (copy), u92 (copy)
        u90:dragonBreathEffect(u91, u92);
    end);
    local Character = u91.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    SoundManager:playSound(GameSound.XUROT_BREATH, {
        rollOffMaxDistance = 45,
        volumeMultiplier = 0.5,
        position = Character
    });
end;

function u6.enablePredictor(u93) -- Line: 539
    -- upvalues: Workspace (copy), u3 (copy), GameQueryUtil (copy), CollectionService (copy), RunService (copy), Players (copy)
    local v94 = {
        Transparency = 1,
        CanCollide = false,
        Anchored = true,
        Parent = Workspace
    };
    local u95 = u3("Part", v94);
    local u96 = u3("Part", v94);
    GameQueryUtil:setQueryIgnored(u95, true);
    GameQueryUtil:setQueryIgnored(u96, true);
    u93.targetingMaid:GiveTask(u95);
    u93.targetingMaid:GiveTask(u96);
    local u97 = u3("Beam", {
        FaceCamera = true,
        Segments = 300,
        Width0 = 0.08,
        Attachment0 = u3("Attachment", {
            Parent = u95
        }),
        Attachment1 = u3("Attachment", {
            Parent = u96
        }),
        Color = ColorSequence.new(Color3.fromRGB(255, 255, 255)),
        Transparency = NumberSequence.new(0.2),
        Width1 = 0.08 + 2.22 * ((u95.Position - u96.Position).Magnitude / 100),
        Parent = Workspace
    });
    CollectionService:AddTag(u97, "dragon-breath-preview-beam");
    u93.targetingMaid:GiveTask(u97);
    u93.targetingMaid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 575
        -- upvalues: Players (ref), u96 (copy), u95 (copy), u97 (copy), Workspace (ref), u93 (copy)
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        if not Character then
            u96:Destroy();
            u95:Destroy();
            u97:Destroy();

            return nil;
        end;

        u95.Position = Character;
        local CFrame2 = Workspace.CurrentCamera.CFrame;
        local v98 = Players.LocalPlayer:GetMouse();
        local v99 = Vector2.new(v98.X, v98.Y);
        local Unit = (Workspace.CurrentCamera:ScreenPointToRay(v99.X, v99.Y).Unit.Direction + Vector3.new(0, u93.YTargetOffset, 0)).Unit;
        u96.Position = Character + (CFrame2.Position + Unit * ((CFrame2.Position - Character).Magnitude * 10) - Character).Unit * 10;
        u97.Width1 = 0.08 + 0.08 * ((u95.Position - u96.Position).Magnitude / 100);

        if not u93.isHolding then
            u96:Destroy();
            u95:Destroy();
            u97:Destroy();

            return nil;
        end;
    end));
end;

function u6.validInput(p100, p101) -- Line: 621
    -- upvalues: KnitClient (copy)
    local v102 = KnitClient.Controllers.KeybindLoadController:getKeybinds();
    local v103;

    if v102 == nil then
        v103 = v102;
    else
        v103 = v102.keyboard;

        if v103 ~= nil then
            v103 = v103.controlActions.Attack;
        end;
    end;

    local v104 = v103 or Enum.UserInputType.MouseButton1;

    if v102 ~= nil then
        v102 = v102.gamepad;

        if v102 ~= nil then
            v102 = v102.controlActions.Attack;
        end;
    end;

    return false or (p101.UserInputType == v104 and true or p101.KeyCode == v104) or p101.UserInputType == Enum.UserInputType.Touch or (v102 or Enum.KeyCode.ButtonR2) == p101.KeyCode;
end;

function u6.fireAtMouse(p105, p106) -- Line: 665
    -- upvalues: VoidDragonBalance (copy), Players (copy), Workspace (copy)
    if p105.breathReadyTime > time() then
        return nil;
    end;

    p105.breathReadyTime = time() + VoidDragonBalance.BREATH_COOLDOWN;
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local v107 = Players.LocalPlayer:GetMouse();
    local v108 = p106 or Vector2.new(v107.X, v107.Y);
    local CFrame2 = Workspace.CurrentCamera.CFrame;
    local Unit = (Workspace.CurrentCamera:ScreenPointToRay(v108.X, v108.Y).Unit.Direction + Vector3.new(0, p105.YTargetOffset, 0)).Unit;
    local v109 = CFrame2.Position + Unit * ((CFrame2.Position - Character).Magnitude * 10);
    local Character2 = Players.LocalPlayer.Character;

    if Character2 ~= nil then
        Character2:PivotTo(CFrame.lookAt(Character, v109));
    end;

    return v109;
end;

function u6.changeWingSize(p110, p111, p112) -- Line: 705
    local wings = p111:WaitForChild("wings");
    local small_wings = p111:WaitForChild("small_wings");
    local v113 = p112 and 0 or 1;

    if not (small_wings:WaitForChild("SmallWingsRootPart", 3) and wings:WaitForChild("RootPart", 3)) then
        return nil;
    end;

    wings:WaitForChild("Plane.001", 3).Transparency = v113;
    wings:WaitForChild("Plane.013", 3).Transparency = v113;
    small_wings:WaitForChild("SmallPlane.001", 3).Transparency = 1 - v113;
    small_wings:WaitForChild("SmallPlane.013", 3).Transparency = 1 - v113;
end;

KnitClient.CreateController(u6.new());

return nil;
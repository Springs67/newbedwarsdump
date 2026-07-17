-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local ConstantManager = v1.ConstantManager;
local MobileTouchType = v1.MobileTouchType;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v4.Lighting;
local Players = v4.Players;
local RunService = v4.RunService;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = ConstantManager.registerConstants(script, {
    FlightSpeed = 55
});
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 36, Name: __tostring
        return "RavenController";
    end,

    __index = HandKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 42
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, ...) -- Line: 46
    -- upvalues: HandKnitController (copy), u2 (copy), u3 (copy)
    HandKnitController.constructor(p8, ...);
    p8.Name = "RavenController";
    p8.maid = u2.new();
    p8.detonateMaid = u2.new();
    p8.spawnMaid = u2.new();
    p8.watchingExplosion = false;
    p8.activeRaven = u3("BoolValue", {
        Value = false
    });
end;

function u6.KnitStart(u9) -- Line: 57
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), Players (copy), AbilityId (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), default (copy)
    HandKnitController.KnitStart(u9);
    ClientSyncEvents.AbilityUsed:connect(function(p10) -- Line: 59
        -- upvalues: Players (ref), AbilityId (ref), u9 (copy), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), default (ref)
        if p10.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        if p10.ability == AbilityId.RAVEN_SPAWN then
            if u9.activeRaven.Value and not u9.watchingExplosion then
                return nil;
            end;

            AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.RAVEN_THROW));
            u9.activeRaven.Value = true;
            default.Client:Get("SpawnRaven"):CallServerAsync():andThen(function(p11) -- Line: 70
                -- upvalues: u9 (ref)
                if not p11 then
                    u9.activeRaven.Value = false;

                    return nil;
                end;

                if not p11.PrimaryPart then
                    p11:GetPropertyChangedSignal("PrimaryPart"):Wait();
                end;

                u9:handleRaven(p11);
            end):catch(function() -- Line: 80
                -- upvalues: u9 (ref)
                u9.activeRaven.Value = true;
            end);
        end;
    end);
end;

function u6.handleRaven(u12, u13) -- Line: 86
    -- upvalues: u2 (copy), Players (copy), EntityUtil (copy), KnitClient (copy), default (copy), Workspace (copy), u3 (copy), RunService (copy), RuntimeLib (copy), SoundManager (copy), GameSound (copy), Lighting (copy), TweenService (copy), u5 (copy)
    local u14 = u2.new();
    u14:GiveTask(function() -- Line: 88
        -- upvalues: u12 (copy)
        u12.activeRaven.Value = false;
    end);
    local LocalPlayer = Players.LocalPlayer;
    local v15 = not u13.Parent;

    if not v15 then
        local v16 = EntityUtil:getEntity(LocalPlayer);

        if v16 ~= nil then
            v16 = v16:isAlive();
        end;

        v15 = not v16;
    end;

    if v15 then
        u14:DoCleaning();

        return nil;
    end;

    u14:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
        moveSpeedMultiplier = 0,
        blockSprint = true
    }));
    u14:GiveTask(default.Client:Get("EntityDeathEvent"):Connect(function(p17) -- Line: 108
        -- upvalues: EntityUtil (ref), LocalPlayer (copy), u12 (copy), u14 (copy)
        local entityInstance = p17.entityInstance;
        local v18 = EntityUtil:getEntity(LocalPlayer);

        if v18 ~= nil then
            v18 = v18:getInstance();
        end;

        if entityInstance == v18 then
            u12:detonateRaven();
            u14:DoCleaning();
        end;
    end));
    u13.AncestryChanged:Connect(function() -- Line: 119
        -- upvalues: u14 (copy)
        u14:DoCleaning();
    end);
    local CurrentCamera = Workspace.CurrentCamera;

    if not CurrentCamera then
        u14:DoCleaning();

        return nil;
    end;

    local CFrame2 = CurrentCamera.CFrame;

    local function u24() -- Line: 128
        -- upvalues: u13 (copy)
        local v19 = u13:GetDescendants();

        local function _(p20, p21) -- Line: 130
            if p21:IsA("BasePart") then
                return p20 + p21:GetMass();
            end;

            return p20;
        end;

        local v22 = 0;

        for i = 1, #v19 do
            local v23 = v19[i];
            local _ = i - 1;

            if v23:IsA("BasePart") then
                v22 = v22 + v23:GetMass();
            end;
        end;

        return v22;
    end;

    local v25 = {
        Name = "AntiGravity"
    };
    local v26 = u24() * Workspace.Gravity;
    v25.Force = Vector3.new(0, v26, 0);
    v25.Parent = u13.PrimaryPart;
    local u27 = u3("BodyForce", v25);
    CurrentCamera.CameraSubject = u13:WaitForChild("Handle");
    LocalPlayer.CameraMaxZoomDistance = 6.5;
    LocalPlayer.CameraMinZoomDistance = 6.5;
    u14:GiveTask(function() -- Line: 153
        -- upvalues: u2 (ref), u12 (copy), RunService (ref), CFrame2 (ref), CurrentCamera (copy), RuntimeLib (ref), LocalPlayer (copy), Players (ref)
        local u28 = u2.new();
        u12.watchingExplosion = true;
        u28:GiveTask(RunService.RenderStepped:Connect(function() -- Line: 156
            -- upvalues: CFrame2 (ref), CurrentCamera (ref)
            CurrentCamera.CFrame = CFrame2 * CFrame.new(Vector3.new(0, 0, 8));
        end));
        RuntimeLib.Promise.delay(0.5):andThen(function() -- Line: 162
            -- upvalues: u28 (copy), u12 (ref), LocalPlayer (ref), Players (ref), CurrentCamera (ref)
            u28:DoCleaning();
            u12.watchingExplosion = false;
            LocalPlayer.CameraMaxZoomDistance = 14;
            LocalPlayer.CameraMinZoomDistance = 0;
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character:FindFirstChildWhichIsA("Humanoid");
            end;

            CurrentCamera.CameraSubject = Character;
        end);
    end);
    local u29 = SoundManager:playSound(GameSound.RAVEN_SPACE_AMBIENT);
    local v30 = u29:getInstance();

    if v30 ~= nil then
        v30 = v30.Volume;
    end;

    local u31 = v30 == nil and 0.5 or v30;
    u29:setProperty("Volume", 0);
    u14:GiveTask(function() -- Line: 186
        -- upvalues: SoundManager (ref), u29 (copy)
        SoundManager:tweenSoundVolume(u29, 0, 0.5);
        task.delay(0.5, function() -- Line: 188
            -- upvalues: u29 (ref)
            u29:Destroy();
        end);
    end);
    local v32 = u3("Folder", {
        Name = "Disabled",
        Parent = Lighting
    });
    local u33 = Lighting:FindFirstChildWhichIsA("Atmosphere");
    local u34 = Lighting:FindFirstChildWhichIsA("SunRaysEffect");

    if u34 then
        u34.Parent = v32;
        u14:GiveTask(function() -- Line: 201
            -- upvalues: u34 (copy), Lighting (ref)
            u34.Parent = Lighting;
        end);
    end;

    local u35;

    if u33 then
        u35 = false;
    else
        u33 = u3("Atmosphere", {
            Parent = Lighting
        });
        u14:GiveTask(u33);
        u35 = true;
    end;

    local u36 = u33:Clone();
    local u37 = u3("ColorCorrectionEffect", {
        Parent = Lighting
    });
    local u38 = u3("DepthOfFieldEffect", {
        Name = "RavenDepthOfField",
        FocusDistance = 19.76,
        InFocusRadius = 28.2,
        FarIntensity = 0,
        NearIntensity = 0,
        Parent = Lighting
    });
    u14:GiveTask(u37);
    u14:GiveTask(u38);
    u14:GiveTask(function() -- Line: 227
        -- upvalues: u35 (ref), u36 (copy), Lighting (ref), u33 (ref)
        if u35 then
            u36:Destroy();
        else
            u36.Parent = Lighting;
        end;

        u33:Destroy();
    end);
    local v39 = u3("NumberValue", {
        Value = 0
    });
    u14:GiveTask(v39);
    v39.Changed:Connect(function(p40) -- Line: 239
        -- upvalues: u37 (copy), u38 (copy), u33 (ref), u36 (copy), u29 (copy), u31 (copy)
        u37.Brightness = -0.05 * p40;
        u37.Contrast = 0.05 * p40;
        u37.TintColor = Color3.fromRGB(248 * p40 + 255 * (1 - p40), 250 * p40 + 255 * (1 - p40), 250 * p40 + 255 * (1 - p40));
        u38.FarIntensity = p40;
        u33.Density = 0.65 * p40 + u36.Density * (1 - p40);
        u33.Color = Color3.fromRGB(45 * p40 + u36.Color.R * 255 * (1 - p40), 56 * p40 + u36.Color.R * 255 * (1 - p40), 46 * p40 + u36.Color.R * 255 * (1 - p40));
        u33.Decay = Color3.fromRGB(30 * p40 + u36.Color.R * 255 * (1 - p40), 32 * p40 + u36.Color.R * 255 * (1 - p40), 35 * p40 + u36.Color.R * 255 * (1 - p40));
        u33.Haze = 10 * p40 + u36.Haze * (1 - p40);
        u29:setProperty("Volume", p40 * u31);
    end);
    TweenService:Create(v39, TweenInfo.new(1.25, Enum.EasingStyle.Linear), {
        Value = 1
    }):Play();

    if u13.Parent then
        RuntimeLib.Promise.any({ RuntimeLib.Promise.try(function() -- Line: 254
                -- upvalues: u13 (copy)
                return u13:WaitForChild("Flying");
            end), RuntimeLib.Promise.try(function() -- Line: 256
                -- upvalues: u13 (copy)
                return u13.AncestryChanged:Wait();
            end) }):await();

        if not u13.Parent then
            return nil;
        end;
    end;

    u14:GiveTask(u12.detonateMaid);
    u12:mountDetonate();
    RuntimeLib.Promise.delay(0):andThen(function() -- Line: 266
        -- upvalues: CurrentCamera (copy), u13 (copy)
        CurrentCamera.CameraSubject = u13.PrimaryPart;
    end);
    local u41 = u3("Vector3Value", {
        Value = u13:GetPivot().LookVector.Unit
    });
    u14:GiveTask(u41);
    u14:GiveTask(RunService.RenderStepped:Connect(function() -- Line: 275
        -- upvalues: CurrentCamera (copy), CFrame2 (ref), u41 (copy), u5 (ref), u13 (copy), u27 (copy), u24 (copy), Workspace (ref), TweenService (ref)
        if CurrentCamera.CameraSubject then
            CFrame2 = CurrentCamera.CFrame;
        end;

        local v42 = u41.Value * u5.FlightSpeed;
        u13.PrimaryPart.AssemblyLinearVelocity = v42;
        local v43 = u24() * Workspace.Gravity;
        u27.Force = Vector3.new(0, v43, 0);
        u13:PivotTo(CFrame.new(u13.PrimaryPart.Position, u13.PrimaryPart.Position + v42));
        TweenService:Create(u41, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
            Value = (u13:GetPivot() - CurrentCamera.CFrame.Position).Position.Unit
        }):Play();
    end));
end;

function u6.spawnRaven(p44) -- Line: 295
    -- upvalues: Flamework (copy), AbilityId (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.RAVEN_SPAWN);
end;

function u6.isRelevantItem(p45, p46) -- Line: 298
    -- upvalues: ItemType (copy)
    return p46.itemType == ItemType.RAVEN;
end;

function u6.onEnable(u47, p48) -- Line: 301
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy), Flamework (copy), MobileTouchType (copy), AbilityId (copy), AbilityMeta (copy)
    if u47.activeEnabledThread then
        task.cancel(u47.activeEnabledThread);
        u47.activeEnabledThread = nil;
    end;

    u47.activeEnabledThread = task.spawn(function() -- Line: 306
        -- upvalues: u47 (copy), GameAnimationUtil (ref), Players (ref), AnimationType (ref), Flamework (ref), MobileTouchType (ref), AbilityId (ref), AbilityMeta (ref)
        if u47.activeRaven.Value then
            u47.activeRaven.Changed:Wait();
        end;

        u47:setupYield(function() -- Line: 310
            -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref)
            local u49 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.RAVEN_HOLD, {
                looped = true
            });

            return function() -- Line: 314
                -- upvalues: u49 (copy)
                local v50 = u49;

                if v50 ~= nil then
                    v50:Stop();
                end;
            end;
        end);
        u47.spawnMaid:DoCleaning();
        u47.maid:GiveTask(u47.spawnMaid);
        local v54 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
            action = "Attack",
            actionId = "raven-spawn",

            boundFunction = function(p51, p52, p53) -- Line: 327, Name: boundFunction
                -- upvalues: u47 (ref)
                if p52 == Enum.UserInputState.Begin then
                    u47:spawnRaven();
                end;
            end,

            mobile = {
                touchType = MobileTouchType.TouchTap,

                mobileBoundFunction = function() -- Line: 334, Name: mobileBoundFunction
                    -- upvalues: u47 (ref)
                    u47:spawnRaven();
                end
            }
        });
        u47.spawnMaid:GiveTask(v54);
        u47.spawnMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.RAVEN_SPAWN, AbilityMeta[AbilityId.RAVEN_SPAWN].triggerConfig):expect());
    end);
end;

function u6.onDisable(u55) -- Line: 343
    -- upvalues: InventoryUtil (copy), Players (copy), ItemType (copy)
    if u55.activeDisabledThread then
        task.cancel(u55.activeDisabledThread);
        u55.activeDisabledThread = nil;
    end;

    u55.activeDisabledThread = task.spawn(function() -- Line: 348
        -- upvalues: u55 (copy), InventoryUtil (ref), Players (ref), ItemType (ref)
        if u55.activeRaven.Value then
            u55.activeRaven.Changed:Wait();
        end;

        local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

        if hand ~= nil then
            hand = hand.itemType;
        end;

        if hand == ItemType.RAVEN then
            return nil;
        end;

        u55.maid:DoCleaning();
    end);
end;

function u6.mountDetonate(u56) -- Line: 362
    -- upvalues: Flamework (copy), MobileTouchType (copy), AbilityId (copy), AbilityMeta (copy)
    u56.spawnMaid:DoCleaning();
    u56.detonateMaid:DoCleaning();
    u56.maid:GiveTask(u56.detonateMaid);
    local v60 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "raven-detonate",

        boundFunction = function(p57, p58, p59) -- Line: 370, Name: boundFunction
            -- upvalues: u56 (copy)
            if p58 == Enum.UserInputState.Begin then
                u56:detonateRaven();
            end;
        end,

        mobile = {
            touchType = MobileTouchType.TouchTap,

            mobileBoundFunction = function() -- Line: 377, Name: mobileBoundFunction
                -- upvalues: u56 (copy)
                u56:detonateRaven();
            end
        }
    });
    u56.detonateMaid:GiveTask(v60);
    u56.detonateMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.RAVEN_DETONATE, AbilityMeta[AbilityId.RAVEN_DETONATE].triggerConfig):expect());
end;

function u6.detonateRaven(p61) -- Line: 385
    -- upvalues: Flamework (copy), AbilityId (copy), InventoryUtil (copy), Players (copy), ItemType (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.RAVEN_DETONATE);
    local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;
    local v62;

    if hand == nil then
        v62 = hand;
    else
        v62 = hand.itemType;
    end;

    if v62 == ItemType.RAVEN then
        p61:onEnable(hand);
    end;
end;

KnitClient.CreateController(u6.new());

return nil;
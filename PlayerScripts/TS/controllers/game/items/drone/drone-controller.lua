-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local EngineerFilmEffect = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "watcher", "ui", "engineer-film-effect").EngineerFilmEffect;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u6 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "player-control-module");
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local DroneHealth = RuntimeLib.import(script, script.Parent, "ui", "drone-health-ui").DroneHealth;
local DroneItemUi = RuntimeLib.import(script, script.Parent, "ui", "drone-item-ui").DroneItemUi;
local DroneTntUi = RuntimeLib.import(script, script.Parent, "ui", "drone-tnt-ui").DroneTntUi;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 41, Name: __tostring
        return "DroneController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 47
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 51
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p9);
    p9.Name = "DroneController";
    p9.speedMotor = u2.SingleMotor.new(0);
    p9.velocityMotor = u2.GroupMotor.new({
        x = 0,
        y = 0,
        z = 0
    });
    p9.preloaded = false;
end;

function u7.KnitStart(u10) -- Line: 62
    -- upvalues: KnitController (copy), u3 (copy), ClientSyncEvents (copy), SoundManager (copy), GameSound (copy), u4 (copy), EngineerFilmEffect (copy), Players (copy), Flamework (copy), DroneTntUi (copy), GameAnimationUtil (copy), AnimationType (copy), AbilityId (copy), AbilityMeta (copy), BalanceFile (copy), ReplicatedStorage (copy), EntityUtil (copy), KnitClient (copy), Workspace (copy), TweenService (copy), CollectionService (copy), KnitClient2 (copy), InventoryUtil (copy), ItemType (copy), default (copy), RunService (copy), u6 (copy), u2 (copy)
    KnitController.KnitStart(u10);
    local u11 = u3.new();
    ClientSyncEvents.GuidedProjectileRemoved:connect(function(p12) -- Line: 65
        -- upvalues: u11 (copy)
        if p12.guidedProjectileType == "drone" then
            u11:DoCleaning();
        end;
    end);
    ClientSyncEvents.GuidedProjectileEnabling:connect(function(u13) -- Line: 70
        -- upvalues: SoundManager (ref), GameSound (ref), u10 (copy), u11 (copy), u4 (ref), EngineerFilmEffect (ref), Players (ref), Flamework (ref), DroneTntUi (ref), GameAnimationUtil (ref), AnimationType (ref), AbilityId (ref), AbilityMeta (ref)
        if u13.guidedProjectileType ~= "drone" then
            return nil;
        end;

        SoundManager:playSound(GameSound.DRONE_DEPLOY);
        u10:updateReleaseUi(u13.model:GetAttribute("HeldItem"), u13.model:GetAttribute("HeldItemAmount"), u13.model);
        u10:updateHealthUi(u13.model);
        u11:GiveTask(function() -- Line: 77
            -- upvalues: u10 (ref), u13 (copy)
            u10:updateReleaseUi(nil, nil, u13.model);
            u10:updateHealthUi(nil);
        end);
        u10.filmTree = u4.mount(u4.createElement("ScreenGui", {
            ResetOnSpawn = false,
            IgnoreGuiInset = true
        }, { u4.createElement(EngineerFilmEffect, {
                transparency = 0.95,
                color = Color3.fromRGB(84, 138, 99)
            }) }), Players.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
        u11:GiveTask(function() -- Line: 90
            -- upvalues: u10 (ref), u4 (ref)
            if u10.filmTree then
                u4.unmount(u10.filmTree);
                u10.filmTree = nil;
            end;
        end);
        local v14 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(DroneTntUi, {
            Drone = u13.model
        }));

        if v14 then
            u11:GiveTask(v14);
        end;

        u11:GiveTask(u13.model:GetAttributeChangedSignal("HeldItemAmount"):Connect(function() -- Line: 102
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.BEEHIVE_PRODUCE);
        end));
        local u15 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.USE_TABLET, {
            looped = true
        });
        u11:GiveTask(function() -- Line: 108
            -- upvalues: u15 (copy)
            local v16 = u15;

            if v16 ~= nil then
                v16:Stop();
            end;
        end);
        local v17 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
        local DRONE_SPEED_BOOST = AbilityId.DRONE_SPEED_BOOST;
        local v18 = {};

        for i, v in AbilityMeta[AbilityId.DRONE_SPEED_BOOST].triggerConfig do
            v18[i] = v;
        end;

        function v18.getExtraData() -- Line: 121
            -- upvalues: u13 (copy)
            return {
                drone = u13.model
            };
        end;

        local u19 = v17:enableAbility(DRONE_SPEED_BOOST, v18):expect();
        u11:GiveTask(function() -- Line: 127
            -- upvalues: u19 (copy)
            u19.Destroy();
        end);
    end);
    ClientSyncEvents.GuidedProjectileDisabling:connect(function(p20) -- Line: 131
        -- upvalues: SoundManager (ref), GameSound (ref)
        if p20.guidedProjectileType ~= "drone" then
            return nil;
        end;

        SoundManager:playSound(GameSound.DRONE_DEPLOY);

        for _, descendant in p20.model:GetDescendants() do
            if descendant:IsA("Sound") then
                descendant.Volume = 0;
            end;
        end;
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p21) -- Line: 142
        -- upvalues: AbilityId (ref), u3 (ref), BalanceFile (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), EntityUtil (ref), Players (ref), KnitClient (ref), Workspace (ref), TweenService (ref)
        if p21.ability ~= AbilityId.DRONE_SPEED_BOOST then
            return nil;
        end;

        local drone = p21.extra.drone;
        local u22 = u3.new();
        task.delay(BalanceFile.CyberDrone.SPEED_BOOST_DURATION, function() -- Line: 149
            -- upvalues: u22 (copy)
            u22:DoCleaning();
        end);
        SoundManager:playSound(GameSound.SEAHORSE_SPEEDUP, {
            parent = drone.PrimaryPart
        });
        local v23 = ReplicatedStorage.Assets.Effects.WindTunnelParticles:Clone();
        v23.EmissionDirection = Enum.NormalId.Back;
        v23.Parent = drone.PrimaryPart;
        v23.Size = NumberSequence.new(0.5);
        v23.Lifetime = NumberRange.new(1);
        u22:GiveTask(v23);
        local u24 = nil;
        u24 = drone:GetAttributeChangedSignal("SpeedBoost"):Once(function() -- Line: 164
            -- upvalues: u22 (copy), u24 (ref), drone (copy)
            u22:GiveTask(u24);

            if not drone:GetAttribute("SpeedBoost") then
                u22:DoCleaning();
            end;
        end);
        local u25 = nil;
        u25 = drone.Destroying:Once(function() -- Line: 172
            -- upvalues: u22 (copy), u25 (ref)
            u22:GiveTask(u25);
            u22:DoCleaning();
        end);
        local v26 = EntityUtil:getEntity(p21.userCharacter);

        if v26 ~= nil then
            v26 = v26:getPlayer();
        end;

        if v26 == Players.LocalPlayer then
            u22:GiveTask((KnitClient.Controllers.ScreenParticlesController:emitParticlesOnScreen({
                keepEnabled = true,
                particleEmitter = { ReplicatedStorage.Assets.Effects.WindTunnelParticles }
            })));

            if Workspace.CurrentCamera then
                local CurrentCamera = Workspace.CurrentCamera;

                if CurrentCamera ~= nil then
                    CurrentCamera = CurrentCamera.FieldOfView;
                end;

                local CurrentCamera2 = Workspace.CurrentCamera;
                local v27 = TweenInfo.new(0.1, Enum.EasingStyle.Linear);
                local v28 = {};
                local CurrentCamera3 = Workspace.CurrentCamera;

                if CurrentCamera3 ~= nil then
                    CurrentCamera3 = CurrentCamera3.FieldOfView;
                end;

                v28.FieldOfView = CurrentCamera3 + 20;
                TweenService:Create(CurrentCamera2, v27, v28):Play();
                u22:GiveTask(function() -- Line: 206
                    -- upvalues: Workspace (ref), TweenService (ref), CurrentCamera (copy)
                    if Workspace.CurrentCamera then
                        TweenService:Create(Workspace.CurrentCamera, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
                            FieldOfView = CurrentCamera
                        }):Play();
                    end;
                end);
            end;
        end;
    end);
    CollectionService:GetInstanceAddedSignal("Drone"):Connect(function(u29) -- Line: 216
        -- upvalues: u10 (copy), Players (ref), KnitClient2 (ref), InventoryUtil (ref), ItemType (ref), BalanceFile (ref), Flamework (ref), default (ref)
        u10:preloadDroneAssets();

        if u29:GetAttribute("PlayerUserId") ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        u29:GetAttributeChangedSignal("HeldItem"):Connect(function() -- Line: 223
            -- upvalues: u10 (ref), u29 (copy)
            u10:updateReleaseUi(u29:GetAttribute("HeldItem"), u29:GetAttribute("HeldItemAmount"), u29);
        end);
        u29:GetAttributeChangedSignal("HeldItemAmount"):Connect(function() -- Line: 226
            -- upvalues: u10 (ref), u29 (copy)
            u10:updateReleaseUi(u29:GetAttribute("HeldItem"), u29:GetAttribute("HeldItemAmount"), u29);
        end);
        u29:GetAttributeChangedSignal("Health"):Connect(function() -- Line: 229
            -- upvalues: u10 (ref), u29 (copy)
            u10:updateHealthUi(u29);
        end);
        u29:GetAttributeChangedSignal("MaxHealth"):Connect(function() -- Line: 232
            -- upvalues: u10 (ref), u29 (copy)
            u10:updateHealthUi(u29);
        end);
        KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            Name = "StoreTNTPrompt",
            RequiresLineOfSight = true,
            MaxActivationDistance = 6,
            HoldDuration = 0,
            ActionText = "Store TNT",
            ObjectText = "Drone",
            Parent = u29
        }).Triggered:Connect(function(p30) -- Line: 244
            -- upvalues: Players (ref), InventoryUtil (ref), ItemType (ref), u10 (ref), u29 (copy), BalanceFile (ref), Flamework (ref), default (ref)
            if p30 ~= Players.LocalPlayer then
                return nil;
            end;

            if not InventoryUtil.getToolFromInventory(Players.LocalPlayer, ItemType.TNT) then
                return nil;
            end;

            if u10:getDroneNumStoredTnt(u29) >= BalanceFile.CyberDrone.TNT_CAPACITY then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "This drone has reached the max capacity of " .. tostring(BalanceFile.CyberDrone.TNT_CAPACITY) .. " TNT"
                });
            end;

            default.Client:Get("DroneAddTNT"):SendToServer();
        end);
    end);
    RunService.Heartbeat:Connect(function() -- Line: 261
        -- upvalues: KnitClient2 (ref), u6 (ref), BalanceFile (ref), u10 (copy), u2 (ref), Workspace (ref)
        local v31 = KnitClient2.Controllers.GuidedProjectileController:getCurrentGuidedProjectile();

        if v31 and (v31.type == "drone" and v31.enabled == true) then
            if v31.disabling then
                return nil;
            end;

            local v32 = u6:GetMoveVector();
            local v33 = v31.model:GetAttribute("SpeedBoost");
            local v34;

            if v33 == 0 or (v33 ~= v33 or (v33 == "" or not v33)) then
                v34 = BalanceFile.CyberDrone.BASE_SPEED;
            else
                v34 = BalanceFile.CyberDrone.BOOSTED_SPEED;
            end;

            if v32.Magnitude > 0.5 then
                u10.speedMotor:setGoal(u2.Spring.new(20 * v34, {
                    frequency = 1,
                    dampingRatio = 0.5
                }));
                local v35 = Workspace.CurrentCamera.CFrame:Inverse():VectorToObjectSpace(v32.Unit) * u10.speedMotor:getValue();
                u10.velocityMotor:setGoal({
                    x = u2.Spring.new(v35.X, {
                        frequency = 4,
                        dampingRatio = 0.7
                    }),
                    y = u2.Spring.new(v35.Y, {
                        frequency = 4,
                        dampingRatio = 0.7
                    }),
                    z = u2.Spring.new(v35.Z, {
                        frequency = 4,
                        dampingRatio = 0.7
                    })
                });
            else
                u10.speedMotor:setGoal(u2.Spring.new(0, {
                    frequency = 1,
                    dampingRatio = 0.5
                }));
                u10.velocityMotor:setGoal({
                    x = u2.Spring.new(0, {
                        frequency = 1,
                        dampingRatio = 0.75
                    }),
                    y = u2.Spring.new(0, {
                        frequency = 1,
                        dampingRatio = 0.75
                    }),
                    z = u2.Spring.new(0, {
                        frequency = 1,
                        dampingRatio = 0.75
                    })
                });
            end;

            for _, v in v31.sounds do
                v.Volume = u10.speedMotor:getValue() / 60 / 2 + 0.5;
            end;

            local v36 = u10.velocityMotor:getValue();
            v31.model.PrimaryPart.AssemblyLinearVelocity = Vector3.new(v36.x, v36.y, v36.z);
            v31.model.PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0);
        end;
    end);
end;

function u7.updateReleaseUi(p37, p38, p39, p40) -- Line: 321
    -- upvalues: ItemUtil (copy), WeldUtil (copy), Flamework (copy), u4 (copy), DroneItemUi (copy)
    if p38 == nil then
        if p37.heldItemUIMaid then
            p37.heldItemUIMaid:DoCleaning();
            p37.heldItemUIMaid = nil;
        end;

        for _, child in p40:GetChildren() do
            if child:IsA("Accessory") and child:GetAttribute("DroneAccessory") == true then
                child:Destroy();
            end;
        end;

        return;
    end;

    local v41 = p40:FindFirstChildOfClass("Humanoid");

    if v41 then
        local v42 = ItemUtil.createItemInstance(p38, 1);
        v42:SetAttribute("DroneAccessory", true);
        v41:AddAccessory(v42);
        WeldUtil:weldCharacterAccessories(p40);
    end;

    if p37.heldItemUIMaid then
        p37.heldItemUIMaid:DoCleaning();
    end;

    p37.heldItemUIMaid = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(DroneItemUi, {
        drone = p40,
        amount = p39 == nil and 1 or p39
    }));
end;

function u7.updateHealthUi(p43, p44) -- Line: 352
    -- upvalues: Flamework (copy), u4 (copy), DroneHealth (copy)
    if not p44 then
        if p43.healthUIMaid then
            p43.healthUIMaid:DoCleaning();
            p43.healthUIMaid = nil;
        end;

        return;
    end;

    local v45 = p44:GetAttribute("Health");
    local v46 = p44:GetAttribute("MaxHealth");

    if p43.healthUIMaid then
        p43.healthUIMaid:DoCleaning();
    end;

    p43.healthUIMaid = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(DroneHealth, {
        health = v45,
        maxHealth = v46
    }));
end;

function u7.getDroneNumStoredTnt(p47, p48) -- Line: 368
    local v49 = p48:GetAttribute("AmountStoredTNT");

    return v49 == nil and 0 or v49;
end;

function u7.preloadDroneAssets(p50) -- Line: 375
    -- upvalues: KnitClient (copy), GameSound (copy)
    if p50.preloaded then
        return nil;
    end;

    p50.preloaded = true;
    KnitClient.Controllers.PreloadController:runPreload({
        sounds = { GameSound.SEAHORSE_SPEEDUP, GameSound.DRONE_DEPLOY, GameSound.BEEHIVE_PRODUCE }
    });
end;

KnitClient.CreateController(u7.new());

return nil;
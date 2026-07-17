-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v7.Players;
local ReplicatedStorage = v7.ReplicatedStorage;
local RunService = v7.RunService;
local Workspace = v7.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local v8 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "movement", "event", "move-mount-event");
local InputActionType = v8.InputActionType;
local MoveMountDirection = v8.MoveMountDirection;
local MoveMountUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "movement", "move-mount-ui").MoveMountUI;
local MountFlightControls = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "mount", "mount-flight-controls").MountFlightControls;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local WinEffect = RuntimeLib.import(script, script.Parent.Parent, "win-effect").WinEffect;
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 41, Name: __tostring
        return "TrainWinEffectController";
    end,

    __index = WinEffect
});
u9.__index = u9;

function u9.new(...) -- Line: 47
    -- upvalues: u9 (ref)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11) -- Line: 51
    -- upvalues: WinEffect (copy), WinEffectType (copy), u4 (copy)
    WinEffect.constructor(p11, WinEffectType.TRAIN);
    p11.Name = "TrainWinEffectController";
    p11.upHeld = false;
    p11.downHeld = false;
    p11.maid = u4.new();
end;

function u9.KnitStart(u12) -- Line: 58
    -- upvalues: WinEffect (copy), ClientSyncEvents (copy), AbilityId (copy), u5 (copy), GameSound (copy), MoveMountDirection (copy), InputActionType (copy), default (copy), Players (copy), u3 (copy), EntityUtil (copy), ReplicatedStorage (copy), AnimationType (copy), Workspace (copy), RunService (copy)
    WinEffect.KnitStart(u12);
    ClientSyncEvents.AbilityUsed:connect(function(p13) -- Line: 60
        -- upvalues: AbilityId (ref), u5 (ref), GameSound (ref)
        if p13:isCancelled() then
            return nil;
        end;

        if p13.ability ~= AbilityId.TRAIN_WHISTLE then
            return nil;
        end;

        local u14 = u5("Sound", {
            Name = "WhistleSound",
            Volume = 1,
            RollOffMaxDistance = 150,
            RollOffMinDistance = 25,
            SoundId = GameSound.TRAIN_WHISTLE,
            Parent = p13.userCharacter.PrimaryPart
        });
        u14:Play();
        u14.Ended:Connect(function() -- Line: 76
            -- upvalues: u14 (copy)
            return u14:Destroy();
        end);
    end);
    u12.maid:GiveTask(ClientSyncEvents.MoveMountButtonChange:connect(function(p15) -- Line: 80
        -- upvalues: MoveMountDirection (ref), u12 (copy), InputActionType (ref)
        local direction = p15.direction;

        if direction == MoveMountDirection.UP then
            u12.upHeld = p15.inputActionType == InputActionType.PRESS;

            return;
        end;

        if direction == MoveMountDirection.DOWN then
            u12.downHeld = p15.inputActionType == InputActionType.PRESS;
        end;
    end));
    default.Client:OnEvent("TrainWinEffectSetupComplete", function(p16) -- Line: 93
        -- upvalues: Players (ref), ClientSyncEvents (ref), AbilityId (ref), u3 (ref), EntityUtil (ref), ReplicatedStorage (ref), u12 (copy), AnimationType (ref), u5 (ref), GameSound (ref), Workspace (ref), RunService (ref)
        local winningPlayer = p16.winningPlayer;

        if winningPlayer == Players.LocalPlayer then
            ClientSyncEvents.CanUseLocalAbility:connect(function(p17) -- Line: 96
                -- upvalues: AbilityId (ref)
                if p17:isCancelled() then
                    return nil;
                end;

                if p17.ability ~= AbilityId.TRAIN_WHISTLE then
                    p17:setCancelled(true);

                    return nil;
                end;
            end);
        end;

        local u18 = u3.SingleMotor.new(0);
        local Character = winningPlayer.Character;
        local v19;

        if Character == nil then
            v19 = Character;
        else
            v19 = Character.PrimaryPart;
        end;

        if not v19 then
            return nil;
        end;

        local Humanoid = Character:FindFirstChild("Humanoid");

        if not Humanoid then
            return nil;
        end;

        local v20 = EntityUtil:getEntity(winningPlayer);

        if not v20 then
            return nil;
        end;

        local u21 = ReplicatedStorage.Assets.Misc.TrainEngine:Clone();

        if not u21.PrimaryPart then
            return nil;
        end;

        u12:setUpTrainCabin(u21, Character.HumanoidRootPart.CFrame, {
            type = AnimationType.TRAIN_ENGINE_LOOP,
            animator = u21.AnimationController.Animator
        });
        local u22 = ReplicatedStorage.Assets.Misc.TrainCoalCabin:Clone();

        if not u22.PrimaryPart then
            return nil;
        end;

        u12:setUpTrainCabin(u22, Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 20), {
            type = AnimationType.TRAIN_COAL_CABIN_LOOP,
            animator = u22.AnimationController.Animator
        });
        local u23 = ReplicatedStorage.Assets.Misc.TrainPassengerCabin:Clone();

        if not u23.PrimaryPart then
            return nil;
        end;

        u12:setUpTrainCabin(u23, Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 40), {
            type = AnimationType.TRAIN_PASSANGER_CABIN_LOOP,
            animator = u23.AnimationController.Animator
        });
        local u24 = ReplicatedStorage.Assets.Misc.TrainPassengerCabin:Clone();

        if not u24.PrimaryPart then
            return nil;
        end;

        u12:setUpTrainCabin(u24, Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 60), {
            type = AnimationType.TRAIN_PASSANGER_CABIN_LOOP,
            animator = u24.AnimationController.Animator
        });
        u5("Sound", {
            Name = "ChuggaSound",
            Looped = true,
            Volume = 0.2,
            RollOffMaxDistance = 150,
            RollOffMinDistance = 25,
            SoundId = GameSound.TRAIN_MOVEMENT_LOOP,
            Parent = Character.PrimaryPart
        }):Play();

        if Players.LocalPlayer == winningPlayer then
            u12:mountTrainUi(winningPlayer);
            u12:bindTrainControls();
            u12:orientCamera(u21.PrimaryPart);
            u12:setUpWhistleAbility();
        end;

        local u25 = Character:Clone();

        if u25 then
            u25.Parent = Workspace;
            u25.Name = "Conductor";
        end;

        v20:getInstance():SetAttribute("Transparency", 1);
        v20:hideNametag();
        local PrimaryPart = Character.PrimaryPart;
        u5("BodyForce", {
            Name = "AntiGrav",
            Force = Vector3.new(0, Workspace.Gravity * PrimaryPart.AssemblyMass, 0),
            Parent = PrimaryPart
        });
        local v26 = u5("Attachment", {
            Parent = Character.PrimaryPart
        });
        u5("AngularVelocity", {
            MaxTorque = 5000,
            RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
            Attachment0 = v26,
            Parent = Character.PrimaryPart
        });
        local u27 = Workspace:GetServerTimeNow();
        local CFrame2 = Character.PrimaryPart.CFrame;
        local CFrame3 = u21.PrimaryPart.CFrame;
        local CFrame4 = u22.PrimaryPart.CFrame;
        local CFrame5 = u23.PrimaryPart.CFrame;
        local CFrame6 = u24.PrimaryPart.CFrame;
        RunService.Heartbeat:Connect(function(p28) -- Line: 251
            -- upvalues: Character (copy), Workspace (ref), u27 (ref), u21 (copy), CFrame3 (ref), CFrame4 (ref), u22 (copy), CFrame5 (ref), u23 (copy), CFrame6 (ref), u24 (copy), CFrame2 (ref), u25 (copy), Players (ref), winningPlayer (copy), u12 (ref), u18 (copy), u3 (ref), Humanoid (copy)
            local v29 = Character;

            if v29 ~= nil then
                v29 = v29.PrimaryPart;
            end;

            if not v29 then
                return nil;
            end;

            local v30 = Workspace:GetServerTimeNow();
            local v31 = (v30 - u27) / 0.6;
            u21:PivotTo(Character.PrimaryPart.CFrame);

            if CFrame3 and CFrame4 then
                u22:PivotTo(CFrame4:Lerp(CFrame3 + Vector3.new(0, -0.5, 0), v31));
            end;

            if CFrame4 and CFrame5 then
                u23:PivotTo(CFrame5:Lerp(CFrame4 + Vector3.new(0, -1, 0), v31));
            end;

            if CFrame5 and CFrame6 then
                u24:PivotTo(CFrame6:Lerp(CFrame5, v31));
            end;

            if u27 + 0.6 <= v30 then
                u27 = v30;
                CFrame2 = Character.PrimaryPart.CFrame;

                if not u21.PrimaryPart then
                    return nil;
                end;

                if not u22.PrimaryPart then
                    return nil;
                end;

                if not u23.PrimaryPart then
                    return nil;
                end;

                if not u24.PrimaryPart then
                    return nil;
                end;

                CFrame3 = u21.PrimaryPart.CFrame;
                CFrame4 = u22.PrimaryPart.CFrame;
                CFrame5 = u23.PrimaryPart.CFrame;
                CFrame6 = u24.PrimaryPart.CFrame;
            end;

            local v32 = u25;

            if v32 ~= nil then
                v32 = v32.PrimaryPart;
            end;

            if v32 then
                local CharacterPosition = u21:FindFirstChild("CharacterPosition");
                local v33 = u25:GetExtentsSize().Y / 2;
                local CFrame7 = CharacterPosition.CFrame;
                local v34 = Vector3.new(0, v33 - 0.3, 0);
                u25.PrimaryPart.CFrame = CFrame7 + v34;
            end;

            if Players.LocalPlayer == winningPlayer then
                local CFrame7 = Character.PrimaryPart.CFrame;
                local v35 = CFrame.new(0, 0, -35 * p28);
                Character.PrimaryPart.CFrame = CFrame7 * v35;

                if u12.upHeld and not u12.downHeld then
                    u18:setGoal(u3.Spring.new(10));
                elseif u12.downHeld and not u12.upHeld then
                    u18:setGoal(u3.Spring.new(-10));
                else
                    u18:setGoal(u3.Spring.new(0, {
                        frequency = 1
                    }));
                end;

                local PrimaryPart2 = Character.PrimaryPart;
                local v36 = u18:getValue();
                PrimaryPart2.AssemblyLinearVelocity = Vector3.new(0, v36, 0);
                Humanoid:Move(Vector3.new(0, 0, 0));
            end;
        end);
    end);
end;

function u9.onWin(p37, p38) -- Line: 336
end;

function u9.seatPassenger(p39, p40, p41, p42) -- Line: 338
    -- upvalues: Workspace (copy), WeldUtil (copy)
    p40.Parent = Workspace;

    if p41 then
        p40:PivotTo(p41.CFrame + p42);

        local function _(p43) -- Line: 346
            return p43:IsA("BasePart");
        end;

        local v44 = 0;
        local v45 = {};

        for i, descendant in p40:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") == true then
                v44 = v44 + 1;
                v45[v44] = descendant;
            end;
        end;

        for _, v in v45 do
            v.CanCollide = false;
            v.CanTouch = false;
            WeldUtil:weldParts(p41, v);
        end;
    end;
end;

function u9.setUpWhistleAbility(p46) -- Line: 367
    -- upvalues: Flamework (copy), AbilityId (copy), BedwarsImageId (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.TRAIN_WHISTLE, {
        abilityType = "MiscPrimary",
        abilityButton = {
            icon = BedwarsImageId.TRAIN_WHISTLE
        }
    });
end;

function u9.setUpTrainCabin(p47, p48, p49, p50) -- Line: 375
    -- upvalues: Workspace (copy), u5 (copy), AnimationUtil (copy), GameAnimationUtil (copy)
    if not p48.PrimaryPart then
        return nil;
    end;

    p48.Parent = Workspace;
    p48.PrimaryPart.CFrame = p49;

    local function _(p51) -- Line: 382
        if p51:IsA("BasePart") then
            p51.CanCollide = false;
            p51.CanTouch = false;
        end;
    end;

    for i, descendant in p48:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CanCollide = false;
            descendant.CanTouch = false;
        end;
    end;

    u5("VectorForce", {
        Name = "CabinAntiGrav",
        Force = Vector3.new(0, 10 * p48.PrimaryPart.AssemblyMass, 0),
        Parent = p48
    });

    if p50 then
        AnimationUtil:playAnimation(p50.animator, GameAnimationUtil:getAssetId(p50.type), {
            looped = true
        });
    end;
end;

function u9.mountTrainUi(p52, p53) -- Line: 403
    -- upvalues: DeviceUtil (copy), KnitClient2 (copy), u6 (copy), MoveMountUI (copy)
    if DeviceUtil.isMobileControls() then
        KnitClient2.Controllers.MobileUiController:toggleMountMovementControls(true);
        p52.maid:GiveTask(function() -- Line: 406
            -- upvalues: KnitClient2 (ref)
            KnitClient2.Controllers.MobileUiController:toggleMountMovementControls(false);
        end);

        return;
    end;

    local u54 = u6.mount(u6.createElement("ScreenGui", {
        ResetOnSpawn = false
    }, { u6.createElement(MoveMountUI) }), p53:WaitForChild("PlayerGui"));
    p52.maid:GiveTask(function() -- Line: 415
        -- upvalues: u6 (ref), u54 (copy)
        u6.unmount(u54);
    end);
end;

function u9.orientCamera(p55, p56) -- Line: 420
    -- upvalues: Workspace (copy), Players (copy)
    if Workspace.CurrentCamera then
        Workspace.CurrentCamera.CameraSubject = p56;
        Players.LocalPlayer.CameraMaxZoomDistance = 100;
        Players.LocalPlayer.CameraMinZoomDistance = 60;
    end;
end;

function u9.bindTrainControls(u57) -- Line: 427
    -- upvalues: MountFlightControls (copy)
    local v58 = MountFlightControls.bindUpDownControls();
    u57.maid:GiveTask(v58.bindActionMaid);
    u57.maid:GiveTask(v58.shouldFlyUpRef.Changed:Connect(function(p59) -- Line: 430
        -- upvalues: u57 (copy)
        u57.upHeld = p59;

        return u57.upHeld;
    end));
    u57.maid:GiveTask(v58.shouldFlyDownRef.Changed:Connect(function(p60) -- Line: 434
        -- upvalues: u57 (copy)
        u57.downHeld = p60;

        return u57.downHeld;
    end));
end;

KnitClient.CreateController(u9.new());

return nil;
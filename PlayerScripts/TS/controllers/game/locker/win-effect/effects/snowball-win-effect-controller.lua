-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v7.CollectionService;
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
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local CFrameUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local SnowballWinEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "snowball-win-effect-util").SnowballWinEffectUtil;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WinEffect = RuntimeLib.import(script, script.Parent.Parent, "win-effect").WinEffect;
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 43, Name: __tostring
        return "SnowballWinEffectController";
    end,

    __index = WinEffect
});
u9.__index = u9;

function u9.new(...) -- Line: 49
    -- upvalues: u9 (ref)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11) -- Line: 53
    -- upvalues: WinEffect (copy), WinEffectType (copy), u4 (copy)
    WinEffect.constructor(p11, WinEffectType.SNOW_BALL_RIDER);
    p11.Name = "SnowballWinEffectController";
    p11.upHeld = false;
    p11.downHeld = false;
    p11.maid = u4.new();
end;

function u9.KnitStart(u12) -- Line: 60
    -- upvalues: WinEffect (copy), ClientSyncEvents (copy), MoveMountDirection (copy), InputActionType (copy), default (copy), u3 (copy), EntityUtil (copy), KnitClient (copy), Players (copy), u5 (copy), Workspace (copy), SoundManager (copy), GameSound (copy), SnowballWinEffectUtil (copy), RunService (copy), CFrameUtil (copy), AbilityId (copy)
    WinEffect.KnitStart(u12);
    u12.maid:GiveTask(ClientSyncEvents.MoveMountButtonChange:connect(function(p13) -- Line: 62
        -- upvalues: MoveMountDirection (ref), u12 (copy), InputActionType (ref)
        local direction = p13.direction;

        if direction == MoveMountDirection.UP then
            u12.upHeld = p13.inputActionType == InputActionType.PRESS;

            return;
        end;

        if direction == MoveMountDirection.DOWN then
            u12.downHeld = p13.inputActionType == InputActionType.PRESS;
        end;
    end));
    default.Client:OnEvent("SnowballRiderWinEffectSetupComplete", function(p14) -- Line: 75
        -- upvalues: u3 (ref), EntityUtil (ref), u12 (copy), KnitClient (ref), Players (ref), u5 (ref), Workspace (ref), SoundManager (ref), GameSound (ref), SnowballWinEffectUtil (ref), RunService (ref), CFrameUtil (ref), ClientSyncEvents (ref), AbilityId (ref)
        local winningPlayer = p14.winningPlayer;
        local u15 = u3.SingleMotor.new(0);
        local Character = winningPlayer.Character;
        local v16;

        if Character == nil then
            v16 = Character;
        else
            v16 = Character.PrimaryPart;
        end;

        if not v16 then
            return nil;
        end;

        local Humanoid = Character:FindFirstChild("Humanoid");

        if not Humanoid then
            return nil;
        end;

        local u17 = EntityUtil:getEntity(winningPlayer);

        if not u17 then
            return nil;
        end;

        if not Character.PrimaryPart then
            return nil;
        end;

        local u18 = u12:createSnowball(winningPlayer);

        if not u18 then
            return nil;
        end;

        u12:rideSnowball(Character, u18);
        u17:getInstance():SetAttribute("Transparency", 1);
        u17:hideNametag();
        u12.maid:GiveTask(function() -- Line: 108
            -- upvalues: u17 (copy)
            u17:getInstance():SetAttribute("Transparency", 0);
            u17:showNametag();
        end);
        KnitClient.Controllers.FootstepsController:muteFootsteps(winningPlayer);

        if Players.LocalPlayer == winningPlayer then
            u12:mountVehicleUI(winningPlayer);
            u12:bindControls();
            u12:orientCamera(Character.PrimaryPart);
            KnitClient.Controllers.SnowWeatherParticleController:enable(2);
            u12:enableAbility();
        end;

        u12:playEffect(winningPlayer);
        local PrimaryPart = Character.PrimaryPart;
        u5("BodyForce", {
            Name = "AntiGrav",
            Force = Vector3.new(0, Workspace.Gravity * PrimaryPart.AssemblyMass, 0),
            Parent = PrimaryPart
        });
        local v19 = u5("Attachment", {
            Parent = Character.PrimaryPart
        });
        u5("AngularVelocity", {
            MaxTorque = 5000,
            RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
            Attachment0 = v19,
            Parent = Character.PrimaryPart
        });
        u12.maid:GiveTask(SoundManager:playSound(GameSound.SNOWBOARD_AVALANCHE_LOOP, {
            looped = true,
            playbackSpeedMultiplier = 0.4,
            volumeMultiplier = 2,
            parent = u18
        }));
        local u20 = u18:GetScale();
        local u21 = nil;
        u21 = winningPlayer.AttributeChanged:Connect(function(p22) -- Line: 152
            -- upvalues: SnowballWinEffectUtil (ref), winningPlayer (copy), u20 (copy), u18 (copy), u21 (ref)
            if p22 ~= SnowballWinEffectUtil.BLOCK_COUNT_ATTRIBUTE then
                return nil;
            end;

            local v23 = winningPlayer:GetAttribute(SnowballWinEffectUtil.BLOCK_COUNT_ATTRIBUTE);
            local v24 = math.clamp(v23 / SnowballWinEffectUtil.BLOCKS_TO_REACH_MAX_SCALE, 0, 1);
            u18:ScaleTo((SnowballWinEffectUtil.getScale(u20, v23)));

            if v24 >= 1 then
                u21:Disconnect();
            end;
        end);
        RunService.Heartbeat:Connect(function(p25) -- Line: 164
            -- upvalues: Character (copy), Players (ref), winningPlayer (copy), SnowballWinEffectUtil (ref), u12 (ref), u15 (copy), u3 (ref), Humanoid (copy), CFrameUtil (ref), u18 (copy)
            local v26 = Character;

            if v26 ~= nil then
                v26 = v26.PrimaryPart;
            end;

            if not v26 then
                return nil;
            end;

            if Players.LocalPlayer == winningPlayer then
                local CFrame2 = Character.PrimaryPart.CFrame;
                local v27 = CFrame.new(0, 0, -SnowballWinEffectUtil.SPEED * p25);
                Character.PrimaryPart.CFrame = CFrame2 * v27;

                if u12.upHeld and not u12.downHeld then
                    u15:setGoal(u3.Spring.new(10));
                elseif u12.downHeld and not u12.upHeld then
                    u15:setGoal(u3.Spring.new(-10));
                else
                    u15:setGoal(u3.Spring.new(0, {
                        frequency = 1
                    }));
                end;

                local PrimaryPart2 = Character.PrimaryPart;
                local v28 = u15:getValue();
                PrimaryPart2.AssemblyLinearVelocity = Vector3.new(0, v28, 0);
                Humanoid:Move(Vector3.new(0, 0, 0));
            end;

            CFrameUtil.setPosition(u18, Character.PrimaryPart.Position);
            CFrameUtil.rotateLocalDegrees(u18, (Vector3.new(60 * p25, 40 * p25, 10 * p25)));
        end);
        ClientSyncEvents.AbilityUsed:connect(function(p29) -- Line: 194
            -- upvalues: AbilityId (ref), SoundManager (ref), GameSound (ref)
            if p29.ability ~= AbilityId.SNOWBAL_RIDER_WIN_EFFECT then
                return nil;
            end;

            SoundManager:playSound(GameSound.SNOWBALL_LAUNCHER_POWER_SHOT, {
                volumeMultiplier = 1.2,
                rollOffMinDistance = 150,
                rollOffMaxDistance = 450,
                position = p29.userCharacter:GetPivot().Position
            });
        end);
        ClientSyncEvents.ProjectileHit:connect(function(p30) -- Line: 205
            -- upvalues: SnowballWinEffectUtil (ref), KnitClient (ref), Workspace (ref)
            if p30.projectileType ~= SnowballWinEffectUtil.ABILITY_PROJECTILE_TYPE then
                return nil;
            end;

            KnitClient.Controllers.ScreenShakeController:shake(p30.hitData.hitCFrame.Position, Workspace.CurrentCamera.CFrame.Position - p30.hitData.hitCFrame.Position, {
                magnitude = 1.8,
                duration = 0.4
            });
        end);
    end);
end;

function u9.onWin(p31, p32) -- Line: 220
end;

function u9.mountVehicleUI(p33, p34) -- Line: 222
    -- upvalues: DeviceUtil (copy), KnitClient2 (copy), u6 (copy), MoveMountUI (copy)
    if DeviceUtil.isMobileControls() then
        KnitClient2.Controllers.MobileUiController:toggleMountMovementControls(true);
        p33.maid:GiveTask(function() -- Line: 225
            -- upvalues: KnitClient2 (ref)
            KnitClient2.Controllers.MobileUiController:toggleMountMovementControls(false);
        end);

        return;
    end;

    local u35 = u6.mount(u6.createElement("ScreenGui", {
        ResetOnSpawn = false
    }, { u6.createElement(MoveMountUI) }), p34:WaitForChild("PlayerGui"));
    p33.maid:GiveTask(function() -- Line: 234
        -- upvalues: u6 (ref), u35 (copy)
        u6.unmount(u35);
    end);
end;

function u9.orientCamera(p36, p37) -- Line: 239
    -- upvalues: Workspace (copy), Players (copy)
    if Workspace.CurrentCamera then
        Workspace.CurrentCamera.CameraSubject = p37;
        Players.LocalPlayer.CameraMaxZoomDistance = 100;
        Players.LocalPlayer.CameraMinZoomDistance = 60;
    end;
end;

function u9.bindControls(u38) -- Line: 246
    -- upvalues: MountFlightControls (copy)
    local v39 = MountFlightControls.bindUpDownControls();
    u38.maid:GiveTask(v39.bindActionMaid);
    u38.maid:GiveTask(v39.shouldFlyUpRef.Changed:Connect(function(p40) -- Line: 249
        -- upvalues: u38 (copy)
        u38.upHeld = p40;

        return u38.upHeld;
    end));
    u38.maid:GiveTask(v39.shouldFlyDownRef.Changed:Connect(function(p41) -- Line: 253
        -- upvalues: u38 (copy)
        u38.downHeld = p41;

        return u38.downHeld;
    end));
end;

function u9.createSnowball(p42, p43) -- Line: 258
    -- upvalues: ReplicatedStorage (copy), ItemUtil (copy), Workspace (copy), CollectionService (copy), scaleModel (copy), BLOCK_SIZE (copy)
    local v44 = ItemUtil.cloneItemIntoModel(ReplicatedStorage.Assets.Effects.snowball_rider);
    local v45 = v44:FindFirstChildWhichIsA("BasePart");
    local Character = p43.Character;
    local v46;

    if Character == nil then
        v46 = Character;
    else
        v46 = Character:FindFirstChildWhichIsA("Humanoid");
    end;

    local v47;

    if Character == nil then
        v47 = Character;
    else
        v47 = Character.PrimaryPart;
    end;

    if not (v45 and (Character and (v46 and v47))) then
        v44:Destroy();

        return nil;
    end;

    v44.Parent = Workspace;
    v44.Name = "DisguisedPlayerBlock_" .. tostring(p43.UserId);

    local function _(p48) -- Line: 280
        if p48:IsA("BasePart") then
            p48.CanCollide = false;
            p48.CanQuery = false;
            p48.CanQuery = false;
            p48.Anchored = true;
        end;
    end;

    for i, descendant in v44:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CanCollide = false;
            descendant.CanQuery = false;
            descendant.CanQuery = false;
            descendant.Anchored = true;
        end;
    end;

    CollectionService:AddTag(v44, "DontBlockSwordRaycast");
    scaleModel(v44, BLOCK_SIZE / 2.8 * 2);
    v44:PivotTo(v47.CFrame - Vector3.new(0, v47.Size.Y / 2 + v46.HipHeight - BLOCK_SIZE / 2, 0));

    return v44;
end;

function u9.rideSnowball(p49, p50, p51) -- Line: 300
    -- upvalues: u5 (copy), GameAnimationUtil (copy), AnimationType (copy)
    p50.Archivable = true;
    local v52 = p50:Clone();
    v52.Parent = p51;
    v52.Name = "Conductor";

    local function _(p53) -- Line: 307
        if p53:IsA("Part") then
            p53.CanCollide = false;
            p53.CanQuery = false;
            p53.CanTouch = false;
        end;
    end;

    for i, descendant in v52:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("Part") then
            descendant.CanCollide = false;
            descendant.CanQuery = false;
            descendant.CanTouch = false;
        end;
    end;

    p49.maid:GiveTask(v52);
    v52:PivotTo(p51.Handle.Seat:GetPivot() + Vector3.new(0, 2.5, 0));
    local v54 = u5("WeldConstraint", {
        Parent = p51.Handle.Seat,
        Part0 = p51.Handle.Seat,
        Part1 = v52.PrimaryPart
    });
    p49.maid:GiveTask(v54);
    local u55 = v52:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation((u5("Animation", {
        AnimationId = GameAnimationUtil:getAssetId(AnimationType.R15_SIT)
    })));
    u55:Play();
    p49.maid:GiveTask(function() -- Line: 337
        -- upvalues: u55 (copy)
        u55:Stop();
        u55:Destroy();
    end);
end;

function u9.playEffect(p56, p57) -- Line: 342
    -- upvalues: GameSound (copy), SoundManager (copy)
    local Character = p57.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    SoundManager:playSound(GameSound.MIMIC_HIDE, {
        volumeMultiplier = 0.25,
        position = Character
    });
end;

function u9.enableAbility(p58) -- Line: 360
    -- upvalues: Flamework (copy), AbilityId (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.SNOWBAL_RIDER_WIN_EFFECT, {
        abilityType = "MiscPrimary",
        clickToTrigger = true,
        abilityButton = {
            icon = "rbxassetid://7911163294"
        }
    }):expect();
end;

KnitClient.CreateController(u9.new());

return nil;
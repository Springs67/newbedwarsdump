-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local MathExtras = v1.MathExtras;
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
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local getClosestBlockToWorldPosition = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-util").getClosestBlockToWorldPosition;
local CFrameUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local MiloWinEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "milo-win-effect-util").MiloWinEffectUtil;
local WinEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WinEffect = RuntimeLib.import(script, script.Parent.Parent, "win-effect").WinEffect;
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 44, Name: __tostring
        return "MiloWinEffectController";
    end,

    __index = WinEffect
});
u9.__index = u9;

function u9.new(...) -- Line: 50
    -- upvalues: u9 (ref)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11) -- Line: 54
    -- upvalues: WinEffect (copy), WinEffectType (copy), u4 (copy)
    WinEffect.constructor(p11, WinEffectType.DUST_DEVIL);
    p11.Name = "MiloWinEffectController";
    p11.upHeld = false;
    p11.downHeld = false;
    p11.maid = u4.new();
end;

function u9.KnitStart(u12) -- Line: 61
    -- upvalues: WinEffect (copy), ClientSyncEvents (copy), MoveMountDirection (copy), InputActionType (copy), default (copy), KnitClient2 (copy), GameSound (copy), AnimationType (copy), u3 (copy), EntityUtil (copy), getClosestBlockToWorldPosition (copy), ItemType (copy), Players (copy), u5 (copy), Workspace (copy), SoundManager (copy), MiloWinEffectUtil (copy), MathExtras (copy), RunService (copy), CFrameUtil (copy)
    WinEffect.KnitStart(u12);
    u12.maid:GiveTask(ClientSyncEvents.MoveMountButtonChange:connect(function(p13) -- Line: 63
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
    default.Client:OnEvent("MiloWinEffectSetupComplete", function(p14) -- Line: 76
        -- upvalues: KnitClient2 (ref), GameSound (ref), AnimationType (ref), u3 (ref), EntityUtil (ref), getClosestBlockToWorldPosition (ref), ItemType (ref), u12 (copy), Players (ref), u5 (ref), Workspace (ref), SoundManager (ref), MiloWinEffectUtil (ref), MathExtras (ref), RunService (ref), CFrameUtil (ref)
        KnitClient2.Controllers.PreloadController:runPreload({
            sounds = { GameSound.DUST_DEVIL_LOOP, GameSound.DUST_DEVIL_PICKUP_LOOP },
            animations = { AnimationType.DUST_DEVIL_PLAYER, AnimationType.DUST_DEVIL_SPIN }
        });
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

        local v17 = EntityUtil:getEntity(winningPlayer);

        if not v17 then
            return nil;
        end;

        if not Character.PrimaryPart then
            return nil;
        end;

        local v18 = getClosestBlockToWorldPosition(Character.PrimaryPart.Position);
        local v19;

        if v18 == nil then
            v19 = ItemType.GRASS;
        else
            v19 = v18.Name;
        end;

        local u20 = u12:createBlock(winningPlayer, v19);

        if not u20 then
            return nil;
        end;

        if Players.LocalPlayer == winningPlayer then
            u12:mountUi(winningPlayer);
            u12:bindControls();
            u12:orientCamera(Character.PrimaryPart);
        end;

        v17:getInstance():SetAttribute("Transparency", 1);
        v17:hideNametag();
        u12:playEffect(winningPlayer);
        local PrimaryPart = Character.PrimaryPart;
        u5("BodyForce", {
            Name = "AntiGrav",
            Force = Vector3.new(0, Workspace.Gravity * PrimaryPart.AssemblyMass, 0),
            Parent = PrimaryPart
        });
        local v21 = u5("Attachment", {
            Parent = Character.PrimaryPart
        });
        u5("AngularVelocity", {
            MaxTorque = 5000,
            RelativeTo = Enum.ActuatorRelativeTo.Attachment0,
            Attachment0 = v21,
            Parent = Character.PrimaryPart
        });
        u12.maid:GiveTask(SoundManager:playSound(GameSound.UFO_ENGINE_LOOP, {
            looped = true,
            playbackSpeedMultiplier = 0.4,
            volumeMultiplier = 1.5,
            parent = u20
        }));
        local u22 = u20:GetScale();
        local u23 = nil;
        u23 = winningPlayer.AttributeChanged:Connect(function(p24) -- Line: 156
            -- upvalues: winningPlayer (copy), MiloWinEffectUtil (ref), MathExtras (ref), u22 (copy), u20 (copy), u23 (ref)
            if p24 ~= "MiloWinEffect_BlockCount" then
                return nil;
            end;

            local v25 = winningPlayer:GetAttribute("MiloWinEffect_BlockCount") / MiloWinEffectUtil.BLOCKS_TO_REACH_MAX_SCALE;
            local v26 = math.clamp(v25, 0, 1);
            u20:ScaleTo((MathExtras:lerp(u22, MiloWinEffectUtil.MAX_SCALE, v26)));

            if v26 >= 1 then
                u23:Disconnect();
            end;
        end);
        RunService.Heartbeat:Connect(function(p27) -- Line: 169
            -- upvalues: Character (copy), Players (ref), winningPlayer (copy), MiloWinEffectUtil (ref), u12 (ref), u15 (copy), u3 (ref), Humanoid (copy), CFrameUtil (ref), u20 (copy)
            local v28 = Character;

            if v28 ~= nil then
                v28 = v28.PrimaryPart;
            end;

            if not v28 then
                return nil;
            end;

            if Players.LocalPlayer == winningPlayer then
                local CFrame2 = Character.PrimaryPart.CFrame;
                local v29 = CFrame.new(0, 0, -MiloWinEffectUtil.SPEED * p27);
                Character.PrimaryPart.CFrame = CFrame2 * v29;

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
                local v30 = u15:getValue();
                PrimaryPart2.AssemblyLinearVelocity = Vector3.new(0, v30, 0);
                Humanoid:Move(Vector3.new(0, 0, 0));
            end;

            CFrameUtil.setPosition(u20, Character.PrimaryPart.Position);
            CFrameUtil.rotateLocalDegrees(u20, (Vector3.new(60 * p27, 40 * p27, 10 * p27)));
        end);
    end);
end;

function u9.onWin(p31, p32) -- Line: 206
end;

function u9.mountUi(p33, p34) -- Line: 208
    -- upvalues: DeviceUtil (copy), KnitClient2 (copy), u6 (copy), MoveMountUI (copy)
    if DeviceUtil.isMobileControls() then
        KnitClient2.Controllers.MobileUiController:toggleMountMovementControls(true);
        p33.maid:GiveTask(function() -- Line: 211
            -- upvalues: KnitClient2 (ref)
            KnitClient2.Controllers.MobileUiController:toggleMountMovementControls(false);
        end);

        return;
    end;

    local u35 = u6.mount(u6.createElement("ScreenGui", {
        ResetOnSpawn = false
    }, { u6.createElement(MoveMountUI) }), p34:WaitForChild("PlayerGui"));
    p33.maid:GiveTask(function() -- Line: 220
        -- upvalues: u6 (ref), u35 (copy)
        u6.unmount(u35);
    end);
end;

function u9.orientCamera(p36, p37) -- Line: 225
    -- upvalues: Workspace (copy), Players (copy)
    if Workspace.CurrentCamera then
        Workspace.CurrentCamera.CameraSubject = p37;
        Players.LocalPlayer.CameraMaxZoomDistance = 100;
        Players.LocalPlayer.CameraMinZoomDistance = 60;
    end;
end;

function u9.bindControls(u38) -- Line: 232
    -- upvalues: MountFlightControls (copy)
    local v39 = MountFlightControls.bindUpDownControls();
    u38.maid:GiveTask(v39.bindActionMaid);
    u38.maid:GiveTask(v39.shouldFlyUpRef.Changed:Connect(function(p40) -- Line: 235
        -- upvalues: u38 (copy)
        u38.upHeld = p40;

        return u38.upHeld;
    end));
    u38.maid:GiveTask(v39.shouldFlyDownRef.Changed:Connect(function(p41) -- Line: 239
        -- upvalues: u38 (copy)
        u38.downHeld = p41;

        return u38.downHeld;
    end));
end;

function u9.createBlock(p42, p43, p44) -- Line: 244
    -- upvalues: ReplicatedStorage (copy), ItemUtil (copy), Workspace (copy), CollectionService (copy), scaleModel (copy), BLOCK_SIZE (copy)
    local v45 = ReplicatedStorage:WaitForChild("Items"):WaitForChild(p44);
    local v46 = ItemUtil.cloneItemIntoModel(v45);
    local v47 = v46:FindFirstChildWhichIsA("BasePart");
    local Character = p43.Character;
    local v48;

    if Character == nil then
        v48 = Character;
    else
        v48 = Character:FindFirstChildWhichIsA("Humanoid");
    end;

    local v49;

    if Character == nil then
        v49 = Character;
    else
        v49 = Character.PrimaryPart;
    end;

    if not (v47 and (Character and (v48 and v49))) then
        v46:Destroy();

        return nil;
    end;

    v46.Parent = Workspace;
    v46.Name = "DisguisedPlayerBlock_" .. tostring(p43.UserId);

    local function _(p50) -- Line: 266
        if p50:IsA("BasePart") then
            p50.CanCollide = false;
            p50.CanQuery = false;
            p50.CanQuery = false;
            p50.Anchored = true;
        end;
    end;

    for i, descendant in v46:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CanCollide = false;
            descendant.CanQuery = false;
            descendant.CanQuery = false;
            descendant.Anchored = true;
        end;
    end;

    CollectionService:AddTag(v46, "DontBlockSwordRaycast");
    scaleModel(v46, BLOCK_SIZE / 2.8 * 2);
    v46:PivotTo(v49.CFrame - Vector3.new(0, v49.Size.Y / 2 + v48.HipHeight - BLOCK_SIZE / 2, 0));

    return v46;
end;

function u9.playEffect(p51, p52) -- Line: 291
    -- upvalues: EntityUtil (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy)
    local Character = p52.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local v53 = EntityUtil:getEntity(p52);
    local MIMIC_HIDE = GameSound.MIMIC_HIDE;

    if v53 then
        local v54 = ReplicatedStorage.Assets.Effects.MimicBlockEffect:Clone();
        v54.Parent = Workspace;
        v54.Position = Character;
        EffectUtil:playEffects({ v54 }, nil, {
            destroyAfterSec = 1
        });
    end;

    SoundManager:playSound(MIMIC_HIDE, {
        volumeMultiplier = 0.25,
        position = Character
    });
end;

KnitClient.CreateController(u9.new());

return nil;
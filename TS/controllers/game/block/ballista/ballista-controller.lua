-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConstantManager = v1.ConstantManager;
local GamepadAction = v1.GamepadAction;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v6.CollectionService;
local Players = v6.Players;
local RunService = v6.RunService;
local TweenService = v6.TweenService;
local UserInputService = v6.UserInputService;
local Workspace = v6.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BallistaCrosshairWrapper = RuntimeLib.import(script, script.Parent, "ballista-crosshair").BallistaCrosshairWrapper;
local BallistaUI = RuntimeLib.import(script, script.Parent, "ballista-ui").BallistaUI;
local u7 = ConstantManager.registerConstants(script, {
    Sensitivity = 0.004,
    ControllerDeltaMultiplier = 5,
    AngleLowerLimitY = 0.8,
    AngleUpperLimitY = 0.8,
    DampingRatio = 0.75,
    Frequency = 4,
    AimSendRate = 0.2
});
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 47, Name: __tostring
        return "BallistaController";
    end,

    __index = KnitController
});
u8.__index = u8;

function u8.new(...) -- Line: 53
    -- upvalues: u8 (copy)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 57
    -- upvalues: KnitController (copy), u4 (copy), u3 (copy), default (copy)
    KnitController.constructor(p10);
    p10.Name = "BallistaController";
    p10.aimingMaid = u4.new();
    p10.ballistaPromptMap = {};
    p10.ballistaDriverMap = {};
    p10.angleX = 0;
    p10.angleY = 0;
    p10.ballistaMaidMap = {};
    p10.angleMotor = u3.GroupMotor.new({
        x = 0,
        y = 0
    });
    p10.mouseDown = false;
    p10.fireBallista = default.Client:Get("FireBallista");
    p10.nextAllowedShot = -1;
    p10.lastBallistaHeadUpdate = 0;
end;

function u8.KnitStart(u11) -- Line: 75
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), KnitClient2 (copy), Players (copy), ClientStore (copy), default (copy), u4 (copy), CollectionService (copy), RunService (copy), UserInputService (copy), u7 (copy), u3 (copy), Workspace (copy), getItemMeta (copy), ItemType (copy), SoundManager (copy), RandomUtil (copy), Flamework (copy), CooldownId (copy), TweenService (copy), GameSound (copy), RuntimeLib (copy)
    KnitController.KnitStart(u11);
    WatchCollectionTag("Ballista", function(u12) -- Line: 77
        -- upvalues: KnitClient2 (ref), u11 (copy), Players (ref), ClientStore (ref), default (ref), u4 (ref)
        local u13 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            Name = "AimPrompt",
            HoldDuration = 0.2,
            RequiresLineOfSight = false,
            MaxActivationDistance = 8,
            ActionText = "Aim Ballista",
            ClickablePrompt = false,
            Parent = u12
        });
        u11.ballistaPromptMap[u12] = u13;
        u13.Triggered:Connect(function(p14) -- Line: 90
            -- upvalues: u11 (ref), u12 (copy), u13 (copy), Players (ref), ClientStore (ref), default (ref)
            if u11.ballistaDriverMap[p14] then
                return false;
            end;

            u11.ballistaDriverMap[p14] = u12;
            u13.Enabled = false;

            if p14 == Players.LocalPlayer then
                ClientStore:dispatch({
                    type = "UnequipItemInHand",
                    equip = false
                });
                default.Client:Get("AimBallista"):SendToServer({
                    ballista = u12
                });
                u11:watchPlayerDistance(p14, u12);
                u11:startAiming(u12);
            end;
        end);
        local v15 = u11.ballistaMaidMap[u12] or u4.new();
        u11.ballistaMaidMap[u12] = v15;
        v15:GiveTask(u13);
        u11:updateAngleOfTurret(u12);
        v15:GiveTask(u12:GetAttributeChangedSignal("AngleX"):Connect(function() -- Line: 126
            -- upvalues: u11 (ref), u12 (copy)
            u11:updateAngleOfTurret(u12);
        end));
        v15:GiveTask(u12:GetAttributeChangedSignal("AngleY"):Connect(function() -- Line: 129
            -- upvalues: u11 (ref), u12 (copy)
            u11:updateAngleOfTurret(u12);
        end));
    end);
    CollectionService:GetInstanceRemovedSignal("Ballista"):Connect(function(p16) -- Line: 133
        -- upvalues: u11 (copy), Players (ref)
        local v17 = u11.ballistaMaidMap[p16];

        if v17 ~= nil then
            v17:DoCleaning();
        end;

        if p16 == u11.ballista then
            u11.ballista = nil;
            u11:exitBallista(Players.LocalPlayer, p16);
            u11.aimingMaid:DoCleaning();
        end;

        local v18 = u11.ballistaPromptMap[p16];

        if v18 ~= nil then
            v18:Destroy();
        end;
    end);
    local u19 = nil;
    RunService.RenderStepped:Connect(function() -- Line: 156
        -- upvalues: u11 (copy), u19 (ref), UserInputService (ref), u7 (ref), u3 (ref), Workspace (ref)
        if u11.ballista == nil then
            if u19 then
                UserInputService.MouseBehavior = u19;
                u19 = nil;
            end;

            return nil;
        end;

        if not UserInputService.TouchEnabled then
            if UserInputService.MouseBehavior ~= Enum.MouseBehavior.LockCenter then
                u19 = UserInputService.MouseBehavior;
            end;

            UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter;
        end;

        local v20;

        if u11.thumbstickPosition then
            v20 = Vector2.new(u11.thumbstickPosition.X, -u11.thumbstickPosition.Y) * u7.ControllerDeltaMultiplier;
        else
            v20 = UserInputService:GetMouseDelta();
        end;

        u11.angleX = u11.angleX - v20.X * u7.Sensitivity;
        u11.angleY = math.clamp(u11.angleY - v20.Y * u7.Sensitivity, -u7.AngleLowerLimitY, u7.AngleUpperLimitY);
        u11.angleMotor:setGoal({
            x = u3.Spring.new(u11.angleX, {
                dampingRatio = u7.DampingRatio,
                frequency = u7.Frequency
            }),
            y = u3.Spring.new(u11.angleY, {
                dampingRatio = u7.DampingRatio,
                frequency = u7.Frequency
            })
        });
        Workspace.CurrentCamera.CFrame = u11.ballista.Head.CameraOrigin.WorldCFrame;
    end);
    RunService.Heartbeat:Connect(function() -- Line: 194
        -- upvalues: Workspace (ref), u11 (copy), Players (ref)
        if Workspace:GetServerTimeNow() - u11.lastBallistaHeadUpdate > 0.2 then
            u11.lastBallistaHeadUpdate = Workspace:GetServerTimeNow();

            local function _(p21, p22) -- Line: 199
                -- upvalues: Players (ref), u11 (ref)
                if p22 ~= Players.LocalPlayer then
                    u11:updateAngleOfTurret(p21);
                end;
            end;

            for i, v in u11.ballistaDriverMap do
                if i ~= Players.LocalPlayer then
                    u11:updateAngleOfTurret(v);
                end;
            end;
        end;

        if u11.ballista == nil then
            return nil;
        end;

        if u11.mouseDown == true then
            u11:fire();
        end;
    end);
    u11.angleMotor:onStep(function(p23) -- Line: 216
        -- upvalues: u11 (copy)
        if not u11.ballista then
            return nil;
        end;

        local v24 = CFrame.new(u11.ballista.Rotate.Position);
        local v25 = CFrame.Angles(0, p23.x, 0);
        local v26 = CFrame.Angles(p23.y, 0, 0);
        u11.ballista.Rotate.CFrame = v24 * v25 * v26;
    end);
    default.Client:Get("BallistaFired"):Connect(function(u27) -- Line: 225
        -- upvalues: getItemMeta (ref), ItemType (ref), SoundManager (ref), RandomUtil (ref), Players (ref), Flamework (ref), CooldownId (ref), u11 (copy), TweenService (ref), GameSound (ref)
        local block = getItemMeta(ItemType.BALLISTA).block;

        if block ~= nil then
            block = block.projectileSource;
        end;

        if not block then
            return nil;
        end;

        if block.launchSound then
            SoundManager:playSound(RandomUtil.fromList(unpack(block.launchSound)), {
                position = u27.ballista.Position
            });
        end;

        if u27.player == Players.LocalPlayer then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.BALLISTA, block.fireDelaySec - 0.05, {
                cooldownBar = {
                    color = Color3.new(0.92, 0.22, 0.18)
                }
            });
        end;

        local ballista = u27.ballista;
        u11:hideArrow(ballista);
        local Size = ballista.Rope.Size;
        local Position = ballista.Rope.Position;
        TweenService:Create(ballista.Rope, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
            Size = ballista.Rope.Size * Vector3.new(1, 1, 0),
            Position = ballista.Rope.Position + Vector3.new(0, 0, -(Size.Z / 2))
        }):Play();
        local u29 = task.delay(1, function() -- Line: 265
            -- upvalues: SoundManager (ref), GameSound (ref), ballista (copy), TweenService (ref), Size (copy), Position (copy), u27 (copy), u11 (ref)
            SoundManager:playSound(GameSound.BALLISTA_RELOAD, {
                position = ballista.Position
            });
            TweenService:Create(ballista.Rope, TweenInfo.new(0.5), {
                Size = Size,
                Position = Position
            }):Play();
            local u28 = task.delay(0.5, function() -- Line: 274
                -- upvalues: ballista (ref), u27 (ref), u11 (ref)
                if not ballista then
                    return nil;
                end;

                if not u27.player then
                    return nil;
                end;

                if u11:hasAmmo(u27.player) then
                    u11:showArrow(ballista);
                end;
            end);
            ballista.Destroying:Once(function() -- Line: 286
                -- upvalues: u28 (copy)
                task.cancel(u28);
            end);
        end);
        ballista.Destroying:Once(function() -- Line: 290
            -- upvalues: u29 (copy)
            task.cancel(u29);
        end);
    end);
    default.Client:Get("EntityDeathEvent"):Connect(function(p30) -- Line: 294
        -- upvalues: Players (ref), u11 (copy)
        local v31 = Players:GetPlayerFromCharacter(p30.entityInstance);

        if not v31 then
            return nil;
        end;

        local v32 = u11.ballistaDriverMap[v31];
        local v33;

        if v32 then
            v33 = u11.ballistaPromptMap[v32];
        else
            v33 = nil;
        end;

        u11.ballistaDriverMap[v31] = nil;

        if v33 then
            v33.Enabled = true;
        end;

        if v31 == Players.LocalPlayer then
            u11.aimingMaid:DoCleaning();
        end;
    end);
    default.Client:Get("BallistaEntered"):Connect(function(p34) -- Line: 309
        -- upvalues: u11 (copy)
        local v35 = u11.ballistaPromptMap[p34.ballista];

        if v35 then
            v35.Enabled = false;
        end;

        u11.ballistaDriverMap[p34.player] = p34.ballista;

        if u11:hasAmmo(p34.player) then
            u11:showArrow(p34.ballista);
        end;
    end);
    default.Client:Get("BallistaExited"):Connect(function(u36) -- Line: 324
        -- upvalues: u11 (copy), Players (ref), RuntimeLib (ref)
        local v37 = u11.ballistaPromptMap[u36.ballista];

        if v37 then
            v37.Enabled = true;
        end;

        u11.ballistaDriverMap[u36.player] = nil;

        if u36.player == Players.LocalPlayer then
            u11.aimingMaid:DoCleaning();
        end;

        RuntimeLib.try(function() -- Line: 337
            -- upvalues: u11 (ref), u36 (copy)
            u11:hideArrow(u36.ballista);
        end, function(p38) -- Line: 339
        end);
    end);
end;

function u8.exitBallista(p39, p40, p41) -- Line: 342
    -- upvalues: default (copy)
    default.Client:Get("RequestExitBallista"):CallServer({
        ballista = p41
    });
end;

function u8.mountBallistaUI(p42, p43) -- Line: 347
    -- upvalues: u5 (copy), BallistaCrosshairWrapper (copy), Players (copy), Flamework (copy), BallistaUI (copy), GamepadAction (copy)
    local u44 = u5.mount(u5.createElement(BallistaCrosshairWrapper), Players.LocalPlayer:WaitForChild("PlayerGui"));
    p42.aimingMaid:GiveTask(function() -- Line: 349
        -- upvalues: u5 (ref), u44 (copy)
        u5.unmount(u44);
    end);
    local v45 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u5.createElement(BallistaUI, {
        Ballista = p43,
        inputTypes = { Enum.KeyCode.X, GamepadAction.Interact }
    }));
    p42.aimingMaid:GiveTask(v45);
end;

function u8.watchPlayerDistance(u46, u47, u48) -- Line: 358
    -- upvalues: RunService (copy)
    u46.aimingMaid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 359
        -- upvalues: u47 (copy), u48 (copy), u46 (copy)
        local Character = u47.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        local Position = u48:GetPivot().Position;
        local v49;

        if Character == nil then
            v49 = Character;
        else
            v49 = Character.Parent;
        end;

        if not v49 then
            u46:exitBallista(u47, u48);

            return nil;
        end;

        if not Position or (Character.Position - Position).Magnitude > 10 then
            u46:exitBallista(u47, u48);
        end;
    end));
end;

function u8.startAiming(u50, p51) -- Line: 379
    -- upvalues: UserInputService (copy)
    u50.aimingMaid:DoCleaning();
    u50:mountBallistaUI(p51);
    local MouseIconEnabled = UserInputService.MouseIconEnabled;
    UserInputService.MouseIconEnabled = false;
    u50.ballista = p51;
    u50.aimingMaid:GiveTask(function() -- Line: 385
        -- upvalues: u50 (copy), UserInputService (ref), MouseIconEnabled (copy)
        u50.ballista = nil;
        UserInputService.MouseIconEnabled = MouseIconEnabled;
    end);
    local v52 = p51:GetAttribute("AngleX");
    local v53 = p51:GetAttribute("AngleY");
    u50.angleX = v52 == nil and 0 or math.rad(v52);
    u50.angleY = v53 == nil and 0 or math.rad(v53);
    u50.aimingMaid:GiveTask(UserInputService.InputBegan:Connect(function(p54, p55) -- Line: 393
        -- upvalues: u50 (copy)
        if not p55 and (u50:isAcceptableInput(p54) and p54.UserInputState == Enum.UserInputState.Begin) then
            u50.mouseDown = true;
        end;
    end));
    u50.aimingMaid:GiveTask(UserInputService.InputEnded:Connect(function(p56, p57) -- Line: 398
        -- upvalues: u50 (copy)
        if not p57 and (u50:isAcceptableInput(p56) and p56.UserInputState == Enum.UserInputState.End) then
            u50.mouseDown = false;
        end;
    end));
end;

function u8.isAcceptableInput(p58, p59) -- Line: 404
    -- upvalues: KnitClient2 (copy)
    local v60 = KnitClient2.Controllers.KeybindLoadController:getKeybinds();
    local v61;

    if v60 == nil then
        v61 = v60;
    else
        v61 = v60.keyboard;

        if v61 ~= nil then
            v61 = v61.controlActions.Attack;
        end;
    end;

    local v62 = v61 or Enum.UserInputType.MouseButton1;

    if v60 ~= nil then
        v60 = v60.gamepad;

        if v60 ~= nil then
            v60 = v60.controlActions.Attack;
        end;
    end;

    return false or (p59.UserInputType == v62 and true or p59.KeyCode == v62) or (v60 or Enum.KeyCode.ButtonR2) == p59.KeyCode;
end;

function u8.fire(p63) -- Line: 443
    -- upvalues: getItemMeta (copy), ItemType (copy)
    if not p63.ballista then
        return nil;
    end;

    local block = getItemMeta(ItemType.BALLISTA).block;

    if block ~= nil then
        block = block.projectileSource;
    end;

    if not block then
        return nil;
    end;

    if time() < p63.nextAllowedShot then
        return nil;
    end;

    p63.nextAllowedShot = time() + block.fireDelaySec;
    p63.fireBallista:SendToServer({
        ballistaBlock = p63.ballista,
        lookVector = p63.ballista.Head.BulletOrigin.WorldCFrame.LookVector,
        angleX = math.deg(p63.angleX % 6.283185307179586),
        angleY = math.deg(p63.angleY)
    });
end;

function u8.updateAngleOfTurret(p64, p65) -- Line: 468
    -- upvalues: TweenService (copy)
    local v66 = p65:GetAttribute("AngleX");
    local v67 = p65:GetAttribute("AngleY");

    if v66 == nil or v67 == nil then
        return nil;
    end;

    local Rotate = p65.Rotate;
    local v68 = TweenInfo.new(0.2, Enum.EasingStyle.Linear);
    local v69 = {};
    local v70 = CFrame.new(p65.Rotate.Position);
    local v71 = CFrame.Angles(0, math.rad(v66), 0);
    local v72 = CFrame.Angles(math.rad(v67), 0, 0);
    v69.CFrame = v70 * v71 * v72;
    local v73 = TweenService:Create(Rotate, v68, v69);
    v73:Play();
    local u74 = nil;
    u74 = v73.Completed:Connect(function() -- Line: 486
        -- upvalues: u74 (ref)
        u74:Disconnect();
    end);
end;

function u8.hasAmmo(p75, p76) -- Line: 490
    -- upvalues: InventoryUtil (copy), ItemType (copy)
    local function _(p77) -- Line: 492
        -- upvalues: ItemType (ref)
        return p77.itemType == ItemType.BALLISTA_AMMO;
    end;

    for i, v in InventoryUtil.getInventory(p76).items do
        local _ = i - 1;

        if v.itemType == ItemType.BALLISTA_AMMO then
            return true;
        end;
    end;

    return false;
end;

function u8.showArrow(p78, p79) -- Line: 506
    p79.ExplosiveArrow.Transparency = 0;
    p79.ExplosiveArrow.Attachment.BigFire.Enabled = true;
    p79.ExplosiveArrow.Attachment.SmallFire.Enabled = true;
    p79.ExplosiveArrow.Attachment.Specs.Enabled = true;
end;

function u8.hideArrow(p80, p81) -- Line: 512
    p81.ExplosiveArrow.Transparency = 1;
    p81.ExplosiveArrow.Attachment.BigFire.Enabled = false;
    p81.ExplosiveArrow.Attachment.SmallFire.Enabled = false;
    p81.ExplosiveArrow.Attachment.Specs.Enabled = false;
end;

KnitClient.CreateController(u8.new());

return nil;
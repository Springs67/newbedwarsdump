-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ActionButton = v1.ActionButton;
local ColorUtil = v1.ColorUtil;
local ConstantManager = v1.ConstantManager;
local DeviceUtil = v1.DeviceUtil;
local GamepadAction = v1.GamepadAction;
local MobileButton = v1.MobileButton;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v6.CollectionService;
local Players = v6.Players;
local RunService = v6.RunService;
local TweenService = v6.TweenService;
local Workspace = v6.Workspace;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local KnockbackUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "knockback-util").KnockbackUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u7 = { AnimationType.HANG_GLIDER_ARM, AnimationType.HANG_GLIDER_BODY };
local u8 = ConstantManager.registerConstants(script, {
    DragConstant = 6
});
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 46, Name: __tostring
        return "HangGliderController";
    end,

    __index = HandKnitController
});
u9.__index = u9;

function u9.new(...) -- Line: 52
    -- upvalues: u9 (copy)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11, ...) -- Line: 56
    -- upvalues: HandKnitController (copy), u3 (copy)
    HandKnitController.constructor(p11, ...);
    p11.Name = "HangGliderController";
    p11.maid = u3.new();
    p11.activeGliderMaid = u3.new();
    p11.acceptedGlidingStates = {
        [Enum.HumanoidStateType.FallingDown] = true,
        [Enum.HumanoidStateType.Flying] = true,
        [Enum.HumanoidStateType.Jumping] = true,
        [Enum.HumanoidStateType.Freefall] = true
    };
    p11.hangGliderActive = false;
    p11.hangGliderActivateTime = 0;
    p11.activeForces = {};
end;

function u9.KnitStart(u12) -- Line: 71
    -- upvalues: HandKnitController (copy), KnitClient (copy), ItemType (copy), u7 (copy), default (copy), SoundManager (copy), GameSound (copy), CollectionService (copy), TweenService (copy), Players (copy)
    HandKnitController.KnitStart(u12);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.HANG_GLIDER, {
        animations = u7
    });
    default.Client:OnEvent("HangGliderStateChanged", function(p13) -- Line: 76
        -- upvalues: SoundManager (ref), GameSound (ref), CollectionService (ref), TweenService (ref)
        local player = p13.player;
        local Character = player.Character;

        if p13.active and Character then
            local v14 = SoundManager:playModifiableSound(GameSound.GLIDER_GLIDE, {
                rollOffMaxDistance = 150,
                volumeMultiplier = 0,
                parent = Character.PrimaryPart,
                position = Character:GetPrimaryPartCFrame().Position
            });

            if v14 then
                v14.Looped = true;
                CollectionService:AddTag(v14, player.Name .. ":glider_loop_sound");
                TweenService:Create(v14, TweenInfo.new(0.6), {
                    Volume = 2
                }):Play();
            end;
        else
            for _, v in CollectionService:GetTagged(player.Name .. ":glider_loop_sound") do
                v:Stop();
                v:Destroy();
            end;
        end;
    end);
    local Character = Players.LocalPlayer.Character;

    if Character then
        u12:registerCharacter(Character);
    end;

    Players.LocalPlayer.CharacterAdded:Connect(function(p15) -- Line: 105
        -- upvalues: u12 (copy)
        u12:registerCharacter(p15);
    end);
    default.Client:OnEvent("HangGliderStateChanged", function(p16) -- Line: 108
        -- upvalues: Players (ref), u12 (copy)
        if p16.active == false and p16.player.UserId == Players.LocalPlayer.UserId then
            u12:closeHangGlider();
        end;
    end);
end;

function u9.registerCharacter(u17, p18) -- Line: 114
    -- upvalues: Workspace (copy)
    p18:WaitForChild("Humanoid").StateChanged:Connect(function(p19, p20) -- Line: 117
        -- upvalues: u17 (copy), Workspace (ref)
        local v21 = u17.acceptedGlidingStates[p20] == nil and (u17.hangGliderActive and Workspace:GetServerTimeNow() - u17.hangGliderActivateTime > 0.18);

        if v21 then
            u17:sendCloseHangGliderEvent();
        end;
    end);
end;

function u9.openHangGlider(u22) -- Line: 129
    -- upvalues: Players (copy), default (copy), Workspace (copy), KnockbackUtil (copy), KnitClient2 (copy), u7 (copy), GameAnimationUtil (copy), u4 (copy), RunService (copy), u8 (copy), DeviceUtil (copy), u5 (copy), BedwarsImageId (copy), BedwarsUI (copy), MobileButton (copy), Flamework (copy), ActionButton (copy), GamepadAction (copy)
    local Character = Players.LocalPlayer.Character;
    local v23;

    if Character == nil then
        v23 = Character;
    else
        v23 = Character.PrimaryPart;
    end;

    if not v23 then
        return nil;
    end;

    default.Client:Get("HangGliderUse"):SendToServer({});
    local LookVector = Workspace.CurrentCamera.CFrame.LookVector;
    local v24 = Vector3.new(LookVector.X, 0, LookVector.Z);
    KnockbackUtil.applyKnockbackDirection(Character.PrimaryPart, Character.PrimaryPart.AssemblyMass, (v24.Magnitude == 0 and Vector3.new(1, 0, 0) or v24).Unit * 200 + Vector3.new(0, 200, 0), {
        vertical = 8,
        horizontal = 2
    });
    u22.hangGliderActivateTime = Workspace:GetServerTimeNow();
    u22.hangGliderActive = true;
    task.delay(0.2, function() -- Line: 156
        -- upvalues: u22 (copy)
        if not u22:canOpenHangGlider() and u22.hangGliderActive then
            u22:sendCloseHangGliderEvent();
        end;
    end);
    local v25 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
        blockSprint = true,
        constantSpeedMultiplier = 2.5
    });
    u22.activeGliderMaid:GiveTask(v25);
    KnitClient2.Controllers.MobileShiftLockController:enable(false);

    for _, v in u7 do
        local u26 = GameAnimationUtil:playAnimation(Players.LocalPlayer, v, {
            looped = true
        });
        u22.activeGliderMaid:GiveTask(function() -- Line: 174
            -- upvalues: u26 (copy)
            local v27 = u26;

            if v27 ~= nil then
                v27:Stop();
            end;
        end);
    end;

    local Humanoid = Character:WaitForChild("Humanoid");
    local v28 = {
        Name = "LiftForce",
        Force = Vector3.new(0, 0, 0),
        ApplyAtCenterOfMass = true,
        Parent = Humanoid.RootPart,
        RelativeTo = Enum.ActuatorRelativeTo.World
    };
    local RootPart = Humanoid.RootPart;

    if RootPart ~= nil then
        RootPart = RootPart:WaitForChild("RootRigAttachment");
    end;

    v28.Attachment0 = RootPart;
    local u29 = u4("VectorForce", v28);
    local v30 = {
        Name = "AlignmentForce",
        Parent = Humanoid.RootPart
    };
    local RootPart2 = Humanoid.RootPart;

    if RootPart2 ~= nil then
        RootPart2 = RootPart2:WaitForChild("RootRigAttachment");
    end;

    v30.Attachment0 = RootPart2;
    v30.RigidityEnabled = true;
    v30.Mode = Enum.OrientationAlignmentMode.OneAttachment;
    local u31 = u4("AlignOrientation", v30);
    table.insert(u22.activeForces, u29);
    table.insert(u22.activeForces, u31);
    local u32 = 0;

    local function _(p33, p34, p35) -- Line: 220
        return (p33 - p34[1]) * (p35[2] - p35[1]) / (p34[2] - p34[1]) + p35[1];
    end;

    Character.PrimaryPart.AssemblyLinearVelocity = Character.PrimaryPart.AssemblyLinearVelocity * Vector3.new(1, 0.5, 1);
    RunService:BindToRenderStep("HangGliderThrust", Enum.RenderPriority.Last.Value, function() -- Line: 227
        -- upvalues: Humanoid (copy)
        Humanoid:Move(Vector3.new(0, 0, -1), true);
    end);
    local u52 = RunService.Stepped:Connect(function(p36) -- Line: 230
        -- upvalues: Character (copy), Workspace (ref), u31 (copy), u32 (ref), u8 (ref), u29 (copy)
        local PrimaryPart = Character.PrimaryPart;
        local CurrentCamera = Workspace.CurrentCamera;
        local Humanoid2 = Character:WaitForChild("Humanoid");
        local AssemblyLinearVelocity = PrimaryPart.AssemblyLinearVelocity;
        local RootPart3 = Humanoid2.RootPart;

        if RootPart3 ~= nil then
            RootPart3 = RootPart3.AssemblyMass;
        end;

        local v37 = math.sign(CurrentCamera.CFrame.LookVector.Y) * CurrentCamera.CFrame:ToOrientation();
        local v38 = math.clamp(v37, 0.01, 1.5707963267948966);
        local v39 = 1 - math.min(v38, 0.2617993877991494) / 1.5707963267948966;
        local v40 = math.clamp(v39, 0.01, 1);

        if v38 < 0.2617993877991494 then
            PrimaryPart.CFrame = CFrame.new(PrimaryPart.Position, PrimaryPart.Position + CurrentCamera.CFrame.LookVector);
        else
            local LookVector2 = CurrentCamera.CFrame.LookVector;
            local v41 = Vector3.new(LookVector2.X, 0, LookVector2.Z);

            if v41.Magnitude ~= 0 then
                PrimaryPart.CFrame = CFrame.new(PrimaryPart.Position, PrimaryPart.Position + v41) * CFrame.Angles(math.sign(CurrentCamera.CFrame.LookVector.Y) * 0.2617993877991494, 0, 0);
            end;
        end;

        u31.CFrame = CurrentCamera.CFrame;

        if u32 > 0.5 then
            local v42 = v40 / 0.2617993877991494 * 0.5;

            if math.sign(CurrentCamera.CFrame.LookVector.Y) == 1 and Humanoid2.WalkSpeed > 0 then
                Humanoid2.WalkSpeed = Humanoid2.WalkSpeed - v42;
            elseif Humanoid2.WalkSpeed < 37 then
                Humanoid2.WalkSpeed = Humanoid2.WalkSpeed + v42;
            end;

            u32 = u32 - 0.5;
        end;

        u32 = u32 + p36;
        local v43 = { -1, 1 };
        local v44 = { 0.7, 1.25 };
        local v45 = ((1 - v40) * math.sign(CurrentCamera.CFrame.LookVector.Y) - v43[1]) * (v44[2] - v44[1]) / (v43[2] - v43[1]) + v44[1];
        local v46 = { 0, 35 };
        local v47 = { -0.3, 0 };
        local v48 = ((AssemblyLinearVelocity * Vector3.new(1, 0, 1)).Magnitude - v46[1]) * (v47[2] - v47[1]) / (v46[2] - v46[1]) + v47[1];
        local DragConstant = u8.DragConstant;
        local v49 = math.clamp(AssemblyLinearVelocity.Y, -100, 100);
        local v50 = DragConstant * (math.pow(v49, 2) / 2) * math.sign(Character.PrimaryPart.AssemblyLinearVelocity.Y) / 13;
        local v51 = (Workspace.Gravity * math.max(0.7, v45 + v48) - v50) * ((RootPart3 == 0 or (RootPart3 ~= RootPart3 or not RootPart3)) and 0 or RootPart3);
        u29.Force = Vector3.new(0, v51, 0);
    end);
    u22.activeGliderMaid:GiveTask(function() -- Line: 306
        -- upvalues: u52 (copy)
        u52:Disconnect();
    end);

    if DeviceUtil.isMobileControls() then
        local v53 = {};
        local v54 = {
            Image = BedwarsImageId.DOWN_MOBILE,
            Position = BedwarsUI:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0),

            OnClick = function() -- Line: 324
                -- upvalues: u22 (copy)
                u22:sendCloseHangGliderEvent();
            end
        };
        v53[#v53 + 1] = u5.createElement(MobileButton, v54);
        local u55 = u5.mount(u5.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, v53), Players.LocalPlayer:WaitForChild("PlayerGui"));
        u22.activeGliderMaid:GiveTask(function() -- Line: 329
            -- upvalues: u5 (ref), u55 (copy)
            u5.unmount(u55);
        end);
    else
        local v56 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u5.createElement(ActionButton, {
            actionName = "HangGliderDismount",
            text = "Dismount Glider",
            interactionKey = Enum.KeyCode.X,
            gamepadInteractionKey = GamepadAction.CloseMenu,

            onActivated = function() -- Line: 338, Name: onActivated
                -- upvalues: u22 (copy)
                if u22.hangGliderActive then
                    u22:sendCloseHangGliderEvent();
                end;
            end
        }));
        u22.activeGliderMaid:GiveTask(v56);
    end;
end;

function u9.closeHangGlider(p57) -- Line: 348
    -- upvalues: RunService (copy), Players (copy), DeviceUtil (copy), KnitClient2 (copy), ClientStore (copy)
    p57.hangGliderActive = false;

    for _, v in p57.activeForces do
        v:Destroy();
    end;

    table.clear(p57.activeForces);
    RunService:UnbindFromRenderStep("HangGliderThrust");
    local Humanoid = Players.LocalPlayer.Character:WaitForChild("Humanoid");

    if Humanoid then
        Humanoid.WalkSpeed = 14;
    end;

    if DeviceUtil.isMobileControls() then
        if not ClientStore:getState().Settings.mobileShiftLock then
            KnitClient2.Controllers.MobileShiftLockController:disable();
        end;
    else
        KnitClient2.Controllers.MobileShiftLockController:disable();
    end;

    p57.activeGliderMaid:DoCleaning();
end;

function u9.sendCloseHangGliderEvent(p58) -- Line: 366
    -- upvalues: default (copy)
    default.Client:Get("HangGliderClose"):SendToServer({});
end;

function u9.canOpenHangGlider(p59) -- Line: 370
    -- upvalues: EntityUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy), Players (copy)
    local v60 = EntityUtil:getLocalPlayerEntity();

    if not v60 then
        return false;
    end;

    if StatusEffectUtil:hasAnyActive(v60:getInstance(), { StatusEffectType.GROUNDED, StatusEffectType.FROSTED }) then
        return false;
    end;

    local Humanoid = Players.LocalPlayer.Character:FindFirstChild("Humanoid");

    return p59.acceptedGlidingStates[Humanoid:GetState()] ~= nil;
end;

function u9.isRelevantItem(p61, p62) -- Line: 389
    -- upvalues: ItemType (copy)
    return p62.itemType == ItemType.HANG_GLIDER;
end;

function u9.onEnable(u63, p64) -- Line: 392
    -- upvalues: ClientStore (copy), ColorUtil (copy), Flamework (copy), DeviceUtil (copy), u5 (copy), MobileButton (copy), BedwarsImageId (copy), BedwarsUI (copy), Players (copy)
    local tool = p64.tool;
    local myTeam = ClientStore:getState().Game.myTeam;

    if myTeam ~= nil then
        myTeam = myTeam.color;
    end;

    if myTeam == nil then
        myTeam = Color3.fromRGB(255, 255, 255);
    end;

    tool.Handle.LightStripe.Color = myTeam;
    tool.Handle.DarkStripe.Color = ColorUtil.darken(myTeam, 0.5);
    local v68 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "open-glider",

        boundFunction = function(p65, p66, p67) -- Line: 411, Name: boundFunction
            -- upvalues: u63 (copy)
            if p66 == Enum.UserInputState.Begin then
                if u63.hangGliderActive then
                    return nil;
                end;

                if not u63:canOpenHangGlider() then
                    return nil;
                end;

                u63:openHangGlider();
            end;
        end
    });
    u63.maid:GiveTask(v68);

    if DeviceUtil.isMobileControls() then
        u63:setupYield(function() -- Line: 425
            -- upvalues: u5 (ref), MobileButton (ref), BedwarsImageId (ref), BedwarsUI (ref), u63 (copy), Players (ref)
            local u69 = u5.mount(u5.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u5.createElement(MobileButton, {
                    Image = BedwarsImageId.UP_MOBILE,
                    Position = BedwarsUI:getActionMobileButtonPosition(),

                    OnClick = function() -- Line: 432, Name: OnClick
                        -- upvalues: u63 (ref)
                        if u63.hangGliderActive then
                            u63:sendCloseHangGliderEvent();

                            return nil;
                        end;

                        if not u63:canOpenHangGlider() then
                            return nil;
                        end;

                        u63:openHangGlider();
                    end
                }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));

            return function() -- Line: 444
                -- upvalues: u5 (ref), u69 (copy)
                u5.unmount(u69);
            end;
        end);
    end;
end;

function u9.onDisable(p70) -- Line: 450
    p70.maid:DoCleaning();
end;

KnitClient.CreateController(u9.new());

return nil;
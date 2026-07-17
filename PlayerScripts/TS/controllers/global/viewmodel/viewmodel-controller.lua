-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConstantManager = v1.ConstantManager;
local DeviceUtil = v1.DeviceUtil;
local GameCoreSharedSyncEvents = v1.GameCoreSharedSyncEvents;
local GameQueryUtil = v1.GameQueryUtil;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local Signal = v2.Signal;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local ContextActionService = v5.ContextActionService;
local HttpService = v5.HttpService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util");
local GameAnimationUtil = v6.GameAnimationUtil;
local getAnimationFromAssetId = v6.getAnimationFromAssetId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local LoggerProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local ViewmodelMode = RuntimeLib.import(script, script.Parent, "viewmodel-mode").ViewmodelMode;
local u7 = ConstantManager.registerConstants(script, {
    DEPTH_OFFSET = 0,
    VERTICAL_OFFSET = 0,
    HORIZONTAL_OFFSET = 0
});
local u8 = {
    Enum.HumanoidStateType.Jumping,
    Enum.HumanoidStateType.FallingDown,
    Enum.HumanoidStateType.Freefall,
    Enum.HumanoidStateType.Flying
};
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 44, Name: __tostring
        return "ViewmodelController";
    end,

    __index = KnitController
});
u9.__index = u9;

function u9.new(...) -- Line: 50
    -- upvalues: u9 (copy)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11) -- Line: 54
    -- upvalues: KnitController (copy), Signal (copy), u3 (copy), ViewmodelMode (copy), LoggerProvider (copy)
    KnitController.constructor(p11);
    p11.Name = "ViewmodelController";
    p11.heldItemChangedSignal = Signal.new();
    p11.heldItemMaid = u3.new();
    p11.crosshair = false;
    p11.crosshairMaid = u3.new();
    p11.unlockCamera = false;
    p11.viewmodelMode = ViewmodelMode.DEFAULT;
    p11.viewmodelMaid = u3.new();
    p11.disableKeys = {};
    p11.handItemVisibility = true;
    p11.firstPersonActive = false;
    p11.shiftlockActive = false;
    p11.logger = LoggerProvider.getLogger("ViewmodelController");
end;

function u9.KnitStart(u12) -- Line: 70
    -- upvalues: KnitClient (copy), ClientSyncEvents (copy), RunService (copy), ContextActionService (copy)
    u12:setupViewmodel();

    local function _() -- Line: 72
        -- upvalues: u12 (copy)
        if u12.shiftlockActive then
            u12.crosshairMaid:DoCleaning();
            u12:setMouseIcon("rbxasset://textures/MouseLockedCursor.png");

            return nil;
        end;

        if u12.firstPersonActive then
            u12:showCrosshair();

            return;
        end;

        u12:hideCrosshair();
    end;

    if u12.shiftlockActive then
        u12.crosshairMaid:DoCleaning();
        u12:setMouseIcon("rbxasset://textures/MouseLockedCursor.png");
    elseif u12.firstPersonActive then
        u12:showCrosshair();
    else
        u12:hideCrosshair();
    end;

    KnitClient.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p13) -- Line: 85
        -- upvalues: u12 (copy)
        u12.firstPersonActive = p13 == 0;

        if u12.shiftlockActive then
            u12.crosshairMaid:DoCleaning();
            u12:setMouseIcon("rbxasset://textures/MouseLockedCursor.png");

            return;
        end;

        if u12.firstPersonActive then
            u12:showCrosshair();

            return;
        end;

        u12:hideCrosshair();
    end);
    ClientSyncEvents.ShiftLockToggle:connect(function(p14) -- Line: 89
        -- upvalues: u12 (copy)
        u12.shiftlockActive = p14.enabled;

        if u12.shiftlockActive then
            u12.crosshairMaid:DoCleaning();
            u12:setMouseIcon("rbxasset://textures/MouseLockedCursor.png");

            return;
        end;

        if u12.firstPersonActive then
            u12:showCrosshair();

            return;
        end;

        u12:hideCrosshair();
    end);

    if RunService:IsStudio() then
        ContextActionService:BindAction("camera-unlock", function(p15, p16, p17) -- Line: 95
            -- upvalues: u12 (copy)
            if not u12.viewmodel then
                return nil;
            end;

            if p16 == Enum.UserInputState.Begin then
                u12.unlockCamera = not u12.unlockCamera;

                if u12.unlockCamera then
                    for _, descendant in u12.viewmodel:GetDescendants() do
                        if descendant:IsA("BasePart") then
                            descendant:SetAttribute("unlockcamera_transparency", descendant.Transparency);
                            descendant.Transparency = 0;
                        end;
                    end;

                    return;
                end;

                for _, descendant in u12.viewmodel:GetDescendants() do
                    if descendant:IsA("BasePart") and descendant:GetAttribute("unlockcamera_transparency") ~= nil then
                        descendant.Transparency = descendant:GetAttribute("unlockcamera_transparency");
                    end;
                end;
            end;
        end, false, Enum.KeyCode.LeftBracket);
    end;
end;

function u9.setupViewmodel(u18, p19) -- Line: 119
    -- upvalues: ViewmodelMode (copy), Players (copy), ReplicatedStorage (copy), CollectionService (copy), Workspace (copy), GameQueryUtil (copy), RunService (copy), u7 (copy)
    u18.viewmodelMaid:DoCleaning();

    if u18.viewmodelMode == ViewmodelMode.SHOW_ARMS then
        u18.viewmodelMaid:GiveTask(Players.LocalPlayer.CharacterAdded:Connect(function(p20) -- Line: 122
            -- upvalues: u18 (copy)
            u18:setupViewmodel();
        end));
    end;

    local v21 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Viewmodel"):Clone();

    if not p19 then
        if u18.viewmodelMode == ViewmodelMode.SHOW_ARMS then
            local Character = Players.LocalPlayer.Character;

            if not Character then
                return false;
            end;

            Character.Archivable = true;
            Character:WaitForChild("Humanoid"):WaitForChild("Animator");
            p19 = Character:Clone();
            CollectionService:RemoveTag(p19, "entity");
        else
            p19 = v21;
        end;
    end;

    u18.viewmodel = p19;
    u18.viewmodelMaid:GiveTask(u18.viewmodel);

    for _, descendant in u18.viewmodel:GetDescendants() do
        local v22 = descendant:GetAttribute("VisibleInViewmodel");

        if descendant:IsA("BasePart") then
            descendant.CollisionGroup = "Players";
            descendant.CastShadow = false;
            descendant:SetAttribute("ViewmodelPart", true);
            local v23 = true;

            if u18.viewmodelMode == ViewmodelMode.SHOW_ARMS then
                for _, v in { "Left", "Right" } do
                    if table.find({ v .. "UpperArm", v .. "LowerArm", v .. "Hand" }, descendant.Name) ~= nil then
                        v23 = false;
                        break;
                    end;
                end;
            end;

            if v23 and v22 ~= true then
                descendant.Transparency = 1;
            end;
        end;
    end;

    task.spawn(function() -- Line: 169
        -- upvalues: Workspace (ref), u18 (copy), GameQueryUtil (ref)
        Workspace:WaitForChild("ClientFlameReady");
        local viewmodel = u18.viewmodel;

        if viewmodel ~= nil then
            viewmodel = viewmodel:GetDescendants();
        end;

        for _, v in viewmodel == nil and {} or viewmodel do
            if v:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(v, true);
            end;
        end;
    end);
    u18.animator = u18.viewmodel:WaitForChild("Humanoid"):WaitForChild("Animator");
    u18.viewmodelMaid:GiveTask(u18.animator);

    if u18.viewmodelMode == ViewmodelMode.SHOW_ARMS then
        u18.viewmodelMaid:GiveTask(u18:setupFirstPersonHandAnimations());
    end;

    local Head = v21:FindFirstChild("Head");
    local u24 = v21.PrimaryPart.CFrame - Head.CFrame.Position;
    u18.viewmodelMaid:GiveTask(RunService.RenderStepped:Connect(function(p25) -- Line: 196
        -- upvalues: u18 (copy), Workspace (ref), u24 (copy), u7 (ref), ViewmodelMode (ref)
        if u18.unlockCamera then
            return nil;
        end;

        if not u18.viewmodel then
            u18.logger:Debug("View Model Not Found!");

            return nil;
        end;

        if u18.viewmodel.Parent ~= Workspace.CurrentCamera then
            u18.logger:Debug("View Model\'s Parent is Incorrect!");
        end;

        local CurrentCamera = Workspace.CurrentCamera;

        if not u18.firstPersonActive or u18:isDisabled() then
            u18.viewmodel:PivotTo(CFrame.new(Vector3.new(-9999, 0, -9999)));

            return;
        end;

        local v26 = CurrentCamera.CFrame * u24 * CFrame.new((Vector3.new(u7.HORIZONTAL_OFFSET, u7.VERTICAL_OFFSET, u7.DEPTH_OFFSET)));
        local v27 = 0;
        local v28 = u18.viewmodelMode == ViewmodelMode.SHOW_ARMS and -0.8 or 0;
        local itemMeta = u18.itemMeta;

        if itemMeta ~= nil then
            itemMeta = itemMeta.block;
        end;

        if itemMeta then
            v28 = -0.5;
        else
            local itemMeta2 = u18.itemMeta;

            if itemMeta2 ~= nil then
                itemMeta2 = itemMeta2.firstPerson;

                if itemMeta2 ~= nil then
                    itemMeta2 = itemMeta2.verticalOffset;
                end;
            end;

            if itemMeta2 ~= nil then
                v28 = u18.itemMeta.firstPerson.verticalOffset;
            end;
        end;

        local itemMeta2 = u18.itemMeta;

        if itemMeta2 ~= nil then
            itemMeta2 = itemMeta2.firstPerson;

            if itemMeta2 ~= nil then
                itemMeta2 = itemMeta2.horizontalOffset;
            end;
        end;

        if itemMeta2 ~= nil then
            v27 = u18.itemMeta.firstPerson.horizontalOffset;
        end;

        if v28 ~= 0 or v27 ~= 0 then
            v26 = v26 * CFrame.new((Vector3.new(v27, v28, 0)));
        end;

        u18.viewmodel:PivotTo(v26);
    end));
    u18.viewmodel.Parent = Workspace.CurrentCamera;

    if u18.viewmodel.PrimaryPart then
        u18.viewmodel.PrimaryPart.Anchored = true;
    end;

    return true;
end;

function u9.setViewModelMode(u29, u30) -- Line: 262
    -- upvalues: ViewmodelMode (copy), KnitClient (copy), AnimationType (copy)
    if u30 == u29.viewmodelMode then
        return nil;
    end;

    u29.viewmodelMode = u30;
    task.spawn(function() -- Line: 267
        -- upvalues: u30 (copy), ViewmodelMode (ref), KnitClient (ref), AnimationType (ref), u29 (copy)
        if u30 == ViewmodelMode.SHOW_ARMS then
            KnitClient.Controllers.PreloadController:runPreload({
                animations = { AnimationType.FP_HANDS_RUNNING_HEAD, AnimationType.FP_HANDS_RUNNING_LEFT_ARM, AnimationType.FP_HANDS_RUNNING_RIGHT_ARM }
            });
        end;

        u29:setupViewmodel();
    end);
end;

function u9.setupFirstPersonHandAnimations(u31) -- Line: 276
    -- upvalues: u3 (copy), Players (copy), KnitClient (copy), AnimationType (copy), getItemMeta (copy)
    local u32 = u3.new();
    local u33 = false;
    local u34 = u3.new();
    u32:GiveTask(u34);
    local u35 = true;
    u32:GiveTask(function() -- Line: 286
        -- upvalues: u35 (ref)
        u35 = false;
    end);
    task.spawn(function() -- Line: 289
        -- upvalues: Players (ref), u35 (ref), u32 (copy), u33 (ref), u34 (copy), KnitClient (ref), AnimationType (ref), u31 (copy), getItemMeta (ref)
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:WaitForChild("Humanoid", 15);
        end;

        if not (Character and u35) then
            return nil;
        end;

        u32:GiveTask(Character.Died:Connect(function() -- Line: 298
            -- upvalues: u32 (ref)
            u32:DoCleaning();
        end));
        u32:GiveTask(Character:GetPropertyChangedSignal("MoveDirection"):Connect(function() -- Line: 301
            -- upvalues: Character (copy), u33 (ref), u34 (ref), KnitClient (ref), AnimationType (ref), u31 (ref), getItemMeta (ref)
            if Character.MoveDirection.Magnitude == 0 ~= u33 then
                return nil;
            end;

            u33 = Character.MoveDirection.Magnitude > 0;

            if not u33 then
                u34:DoCleaning();

                return nil;
            end;

            local u36 = KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_HANDS_RUNNING_LEFT_ARM, {
                looped = true,
                fadeTime = 0.2,
                keepEnabledOnUnequipItem = true,
                priority = Enum.AnimationPriority.Movement
            });
            local u37 = KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_HANDS_RUNNING_RIGHT_ARM, {
                looped = true,
                fadeTime = 0.2,
                keepEnabledOnUnequipItem = true,
                priority = Enum.AnimationPriority.Movement
            });

            if not (u36 and u37) then
                return nil;
            end;

            local u38 = { u36, u37 };
            u34:GiveTask(function() -- Line: 326
                -- upvalues: u38 (copy)
                local function _(p39) -- Line: 327
                    if p39 ~= nil then
                        p39 = p39:Stop(0.4);
                    end;

                    return p39;
                end;

                for i, v in u38 do
                    local _ = i - 1;

                    if v ~= nil then
                        v:Stop(0.4);
                    end;
                end;

                return nil;
            end);
            local u43 = u31.heldItemChangedSignal:Connect(function(p40) -- Line: 339
                -- upvalues: u31 (ref), u37 (ref), getItemMeta (ref), KnitClient (ref), AnimationType (ref), u38 (copy), u36 (copy)
                if u31.heldItem then
                    local v41 = u37;

                    if v41 ~= nil then
                        v41:Stop(0.4);
                    end;
                else
                    local v42;

                    if p40 then
                        v42 = getItemMeta(p40.Name);
                    else
                        v42 = nil;
                    end;

                    if v42 ~= nil then
                        v42 = v42.disableFirstPersonHoldAnimation;
                    end;

                    if v42 == true then
                        return nil;
                    end;

                    u37 = KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_HANDS_RUNNING_RIGHT_ARM, {
                        looped = true,
                        fadeTime = 0.2,
                        keepEnabledOnUnequipItem = true,
                        priority = Enum.AnimationPriority.Movement
                    });

                    if u37 then
                        table.insert(u38, u37);
                        u37.TimePosition = u36.TimePosition;
                        u37:AdjustSpeed(u36.Speed);
                    end;
                end;
            end);

            if u31.heldItem then
                u37:Stop(0.4);
            end;

            u34:GiveTask(function() -- Line: 371
                -- upvalues: u43 (copy)
                return u43:Disconnect();
            end);

            local function handleWalkSpeed(u44) -- Line: 374
                -- upvalues: u38 (copy)
                local function _(p45) -- Line: 375
                    -- upvalues: u44 (copy)
                    if p45 ~= nil then
                        p45 = p45:AdjustSpeed(u44 / 24);
                    end;

                    return p45;
                end;

                for i, v in u38 do
                    local _ = i - 1;

                    if v ~= nil then
                        v:AdjustSpeed(u44 / 24);
                    end;
                end;
            end;

            handleWalkSpeed(Character.WalkSpeed);
            u34:GiveTask(Character:GetPropertyChangedSignal("WalkSpeed"):Connect(function() -- Line: 387
                -- upvalues: handleWalkSpeed (copy), Character (ref)
                handleWalkSpeed(Character.WalkSpeed);
            end));
        end));
    end);

    return u32;
end;

function u9.showCrosshair(u46) -- Line: 394
    -- upvalues: DeviceUtil (copy), u4 (copy), Players (copy)
    u46.crosshair = true;

    if not DeviceUtil.isMobileControls() then
        u46:setMouseIcon("rbxassetid://8099700275");
        u46.crosshairMaid:GiveTask(function() -- Line: 416
            -- upvalues: u46 (copy)
            u46:clearMouseIcon();
        end);

        return;
    end;

    local v47 = u4.createElement("ScreenGui", {
        IgnoreGuiInset = true
    }, { u4.createElement("ImageLabel", {
            SizeConstraint = "RelativeYY",
            BackgroundTransparency = 1,
            Image = "rbxassetid://8099581307",
            Size = UDim2.fromScale(0.04, 0.04),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            ResampleMode = Enum.ResamplerMode.Pixelated
        }) });
    local u48 = u4.mount(v47, Players.LocalPlayer:WaitForChild("PlayerGui"));
    u46.crosshairMaid:GiveTask(function() -- Line: 411
        -- upvalues: u4 (ref), u48 (copy)
        u4.unmount(u48);
    end);
end;

function u9.hideCrosshair(p49) -- Line: 421
    p49.crosshair = false;
    p49.crosshairMaid:DoCleaning();
    p49:clearMouseIcon();
end;

function u9.isDisabled(p50) -- Line: 426
    local v51 = 0;

    for _ in p50.disableKeys do
        v51 = v51 + 1;
    end;

    return v51 > 0;
end;

function u9.addDisabler(p52) -- Line: 435
    -- upvalues: HttpService (copy)
    local v53 = HttpService:GenerateGUID(false);
    p52.disableKeys[v53] = true;

    return v53;
end;

function u9.removeDisabler(p54, p55) -- Line: 440
    p54.disableKeys[p55] = nil;
end;

function u9.setHeldItem(p56, p57) -- Line: 445
    -- upvalues: getItemMeta (copy), scaleModel (copy), EffectUtil (copy), GameQueryUtil (copy), WeldUtil (copy), u3 (copy), ClientSyncEvents (copy), AnimationType (copy), Players (copy), u8 (copy)
    p56.logger:Debug("View Model Set Held Item: " .. tostring(p57));

    if p56.heldItem then
        p56.heldItemMaid:DoCleaning();
        p56.heldItem:Destroy();
        p56.heldItem = nil;
        p56.itemMeta = nil;
        p56.heldItemChangedSignal:Fire(nil);
    end;

    if not p56.viewmodel then
        return nil;
    end;

    if p57 then
        local v58 = getItemMeta(p57.Name);
        local Model = Instance.new("Model");
        p57.Parent = Model;
        local Handle = p57:FindFirstChild("Handle");

        if not Handle then
            return nil;
        end;

        Model.PrimaryPart = Handle;
        local firstPerson = v58.firstPerson;

        if firstPerson ~= nil then
            firstPerson = firstPerson.scale;
        end;

        local v59 = firstPerson == nil and 1 or firstPerson;
        scaleModel(Model, v59);
        EffectUtil:scaleEffect({ Model }, v59);

        local function _(p60) -- Line: 484
            -- upvalues: GameQueryUtil (ref)
            if p60:IsA("BasePart") then
                p60.CanCollide = false;
                GameQueryUtil:setQueryIgnored(p60, true);
            end;
        end;

        for i, descendant in p57:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.CanCollide = false;
                GameQueryUtil:setQueryIgnored(descendant, true);
            end;
        end;

        p56.heldItem = p57;
        p56.itemMeta = v58;
        p56.heldItemChangedSignal:Fire(p57);
        p56.viewmodel:FindFirstChild("Humanoid"):AddAccessory(p57);
        WeldUtil:weldCharacterAccessories(p56.viewmodel);
        local v61 = u3.new();
        p56.heldItemMaid:GiveTask(v61);
        ClientSyncEvents.ViewModelItemAdded:fire(p57, v61);
        local firstPerson2 = v58.firstPerson;

        if firstPerson2 ~= nil then
            firstPerson2 = firstPerson2.holdAnimation;
        end;

        if firstPerson2 == 0 or (firstPerson2 ~= firstPerson2 or not firstPerson2) then
            firstPerson2 = AnimationType.FP_HOLD;
        end;

        local u62 = p56:playAnimation(firstPerson2, {
            looped = true,
            priority = Enum.AnimationPriority.Idle
        });
        p56.heldItemMaid:GiveTask(function() -- Line: 516
            -- upvalues: u62 (copy)
            local v63 = u62;

            if v63 ~= nil then
                v63:Stop();
            end;

            local v64 = u62;

            if v64 ~= nil then
                v64:Destroy();
            end;
        end);
        local u65;

        if v58.disableFirstPersonWalkAnimation then
            u65 = nil;
        else
            u65 = p56:playAnimation(AnimationType.FP_WALK, {
                looped = true,
                priority = Enum.AnimationPriority.Movement
            });
        end;

        local u66 = true;
        p56.heldItemMaid:GiveTask(function() -- Line: 536
            -- upvalues: u66 (ref), u65 (ref)
            u66 = false;
            local v67 = u65;

            if v67 ~= nil then
                v67:Stop();
            end;

            local v68 = u65;

            if v68 ~= nil then
                v68:Destroy();
            end;
        end);
        task.spawn(function() -- Line: 547
            -- upvalues: Players (ref), u66 (ref), u8 (ref), u65 (ref)
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;
            end;

            local Character2 = Players.LocalPlayer.Character;

            if Character2 ~= nil then
                Character2 = Character2:FindFirstChild("Humanoid");
            end;

            local v69 = 0;

            while true do
                local v70 = task.wait(0.1);

                if v70 ~= 0 and (v70 == v70 and v70) then
                    v70 = u66;
                end;

                if v70 == 0 or (v70 ~= v70 or not v70) then
                    return;
                end;

                if not Character then
                    return nil;
                end;

                local v71 = math.clamp(Character.Velocity.Magnitude / 14, 0, 2) * 1.2;

                if Character2 then
                    local v72 = Character2:GetState();
                    v71 = table.find(u8, v72) ~= nil and 0 or v71;
                end;

                if v71 <= 0.01 then
                    local v73 = u65;

                    if v73 ~= nil then
                        v73 = v73.IsPlaying;
                    end;

                    if v73 then
                        v69 = u65.TimePosition;
                        local v74 = u65;

                        if v74 ~= nil then
                            v74:Stop(0.3);
                        end;
                    end;
                else
                    local v75 = u65;

                    if v75 ~= nil then
                        v75 = v75.IsPlaying;
                    end;

                    if not v75 then
                        local v76 = u65;

                        if v76 ~= nil then
                            v76:AdjustSpeed(v69);
                        end;

                        local v77 = u65;

                        if v77 ~= nil then
                            v77:Play(0.3);
                        end;
                    end;
                end;

                if v71 ~= nil then
                    local v78 = u65;

                    if v78 ~= nil then
                        v78:AdjustSpeed(v71);
                    end;
                end;
            end;
        end);
    end;
end;

function u9.startWalkingAnimation(p79) -- Line: 620
    -- upvalues: AnimationType (copy)
    local u80 = p79:playAnimation(AnimationType.FP_WALK, {
        looped = true,
        priority = Enum.AnimationPriority.Movement
    });
    p79.heldItemMaid:GiveTask(function() -- Line: 625
        -- upvalues: u80 (copy)
        local v81 = u80;

        if v81 ~= nil then
            v81:Stop();
        end;

        local v82 = u80;

        if v82 ~= nil then
            v82:Destroy();
        end;
    end);
end;

function u9.playAnimation(p83, p84, u85) -- Line: 636
    -- upvalues: GameCoreSharedSyncEvents (copy), Players (copy), GameAnimationUtil (copy), getAnimationFromAssetId (copy)
    if not p83.animator then
        return nil;
    end;

    local v86 = GameCoreSharedSyncEvents.BeforeAnimationPlayEvent:fire(Players.LocalPlayer, GameAnimationUtil:getAssetId(p84));

    if v86:isCancelled() then
        return nil;
    end;

    local v87 = GameAnimationUtil:getAssetId(p84);
    local animationAssetIdOverride = v86.animationAssetIdOverride;

    if animationAssetIdOverride ~= "" and animationAssetIdOverride then
        v87 = v86.animationAssetIdOverride;
    end;

    local v88 = getAnimationFromAssetId(v87);
    local u89 = p83.animator:LoadAnimation(v88);
    local v90;

    if u85 == nil then
        v90 = u85;
    else
        v90 = u85.looped;
    end;

    if v90 == nil then
        v90 = false;
    end;

    u89.Looped = v90;
    local v91;

    if u85 == nil then
        v91 = u85;
    else
        v91 = u85.priority;
    end;

    if v91 == nil then
        v91 = Enum.AnimationPriority.Action;
    end;

    u89.Priority = v91;
    u89:Play();
    local v92;

    if u85 == nil then
        v92 = u85;
    else
        v92 = u85.keepEnabledOnUnequipItem;
    end;

    if not v92 then
        p83.heldItemMaid:GiveTask(function() -- Line: 675
            -- upvalues: u89 (copy), u85 (copy)
            local v93 = u85;

            if v93 ~= nil then
                v93 = v93.fadeTime;
            end;

            if v93 == nil then
                v93 = nil;
            end;

            u89:Stop(v93);
        end);
    end;

    return u89;
end;

function u9.addAccessory(p94, p95) -- Line: 690
    -- upvalues: WeldUtil (copy)
    if not p94.viewmodel then
        warn("No viewmodel found.");

        return nil;
    end;

    local Humanoid = p94.viewmodel:FindFirstChild("Humanoid");

    if not Humanoid then
        warn("No humanoid found for viewmodel.");

        return nil;
    end;

    Humanoid:AddAccessory(p95);
    WeldUtil:weldCharacterAccessories(p94.viewmodel);

    if p94.handItemVisibility == false then
        p94:setHandItemVisibility(p94.handItemVisibility);
    end;
end;

function u9.isVisible(p96) -- Line: 706
    return p96.firstPersonActive;
end;

function u9.getViewModel(p97) -- Line: 709
    return p97.viewmodel;
end;

function u9.setHandItemVisibilityMode(p98, p99) -- Line: 712
    p98.handItemVisibility = p99;
    p98:setHandItemVisibility(p99);
end;

function u9.setHandItemVisibility(p100, p101) -- Line: 716
    -- upvalues: CollectionService (copy)
    if not p100.heldItem then
        return nil;
    end;

    if p101 then
        CollectionService:RemoveTag(p100.heldItem, "FirstPersonHidden");

        local function _(p102) -- Line: 723
            -- upvalues: CollectionService (ref)
            CollectionService:RemoveTag(p102, "FirstPersonHidden");
        end;

        for i, descendant in p100.heldItem:GetDescendants() do
            local _ = i - 1;
            CollectionService:RemoveTag(descendant, "FirstPersonHidden");
        end;

        return;
    end;

    CollectionService:AddTag(p100.heldItem, "FirstPersonHidden");

    local function _(p103) -- Line: 732
        -- upvalues: CollectionService (ref)
        CollectionService:AddTag(p103, "FirstPersonHidden");
    end;

    for i, descendant in p100.heldItem:GetDescendants() do
        local _ = i - 1;
        CollectionService:AddTag(descendant, "FirstPersonHidden");
    end;
end;

function u9.setMouseIcon(p104, p105) -- Line: 740
    -- upvalues: Players (copy)
    Players.LocalPlayer:GetMouse().Icon = p105;
end;

function u9.clearMouseIcon(p106) -- Line: 743
    p106:setMouseIcon("");
end;

function u9.getFirstPersonHandItem(p107) -- Line: 746
    return p107.heldItem;
end;

return {
    ViewmodelController = KnitClient.CreateController(u9.new())
};
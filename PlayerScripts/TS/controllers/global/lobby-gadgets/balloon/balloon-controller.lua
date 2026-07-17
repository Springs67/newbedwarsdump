-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ActionButton = v1.ActionButton;
local ConstantManager = v1.ConstantManager;
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local GameTheme = v1.GameTheme;
local GamepadAction = v1.GamepadAction;
local MobileButton = v1.MobileButton;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v6.CollectionService;
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local RunService = v6.RunService;
local TweenService = v6.TweenService;
local Workspace = v6.Workspace;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local BalloonSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "balloon", "balloon-skin").BalloonSkin;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u7 = ConstantManager.registerConstants(script, {
    DragConstant = 4.5
});
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 48, Name: __tostring
        return "BalloonController";
    end,

    __index = HandKnitController
});
u8.__index = u8;

function u8.new(...) -- Line: 54
    -- upvalues: u8 (copy)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10, ...) -- Line: 58
    -- upvalues: HandKnitController (copy), u3 (copy), u4 (copy), Workspace (copy)
    HandKnitController.constructor(p10, ...);
    p10.Name = "BalloonController";
    p10.maid = u3.new();
    p10.clientBalloonHookFolder = u4("Folder", {
        Name = "ClientBalloonHooks",
        Parent = Workspace
    });
    p10.balloonPhysicsEnabled = false;
    p10.balloonPhysicsMaid = u3.new();
    p10.lastTntDrop = 0;
    p10.clientBalloonAttachment = {};
    p10.playerBalloonHeartbeatMap = {};
end;

function u8.KnitStart(u11) -- Line: 72
    -- upvalues: HandKnitController (copy), Workspace (copy), RunService (copy), MapUtil (copy), Flamework (copy), Players (copy), InventoryUtil (copy), ItemType (copy), default (copy), GameSound (copy), BalloonSkin (copy), RandomUtil (copy), SoundManager (copy), TweenService (copy), RuntimeLib (copy), WatchCharacter (copy), CollectionService (copy)
    HandKnitController.KnitStart(u11);
    u11.balloonRootsFolder = Workspace:WaitForChild("BalloonRoots");
    RunService.Heartbeat:Connect(function(p12) -- Line: 75
        -- upvalues: MapUtil (ref), u11 (copy)
        for _, v in MapUtil.keys(u11.clientBalloonAttachment) do
            local v13 = u11.clientBalloonAttachment[v];

            if v13 then
                if v.Parent then
                    v13.CFrame = v.Balloon.CFrame;
                else
                    v13:Destroy();
                    u11.clientBalloonAttachment[v] = nil;
                end;
            end;
        end;
    end);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "drop-tnt",
        priority = 4000,

        boundFunction = function(p14, p15, p16) -- Line: 93, Name: boundFunction
            -- upvalues: Players (ref), InventoryUtil (ref), ItemType (ref), u11 (copy)
            if p15 ~= Enum.UserInputState.Begin then
                return Enum.ContextActionResult.Pass;
            end;

            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character:GetAttribute("InflatedBalloons");
            end;

            if (Character == nil and 0 or Character) == 0 then
                return Enum.ContextActionResult.Pass;
            end;

            local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

            if hand ~= nil then
                hand = hand.itemType;
            end;

            if hand ~= ItemType.TNT then
                return Enum.ContextActionResult.Pass;
            end;

            u11:dropTNT();

            return Enum.ContextActionResult.Sink;
        end
    });
    default.Client:WaitFor("BalloonPopped"):andThen(function(p17) -- Line: 121
        -- upvalues: Players (ref), GameSound (ref), BalloonSkin (ref), RandomUtil (ref), SoundManager (ref), TweenService (ref), RuntimeLib (ref), u11 (copy)
        p17:Connect(function(u18) -- Line: 122
            -- upvalues: Players (ref), GameSound (ref), BalloonSkin (ref), RandomUtil (ref), SoundManager (ref), TweenService (ref), RuntimeLib (ref), u11 (ref)
            u18.Balloon.PopEffect:Emit(20);
            local v19;

            if u18:GetAttribute("BalloonOwner") == Players.LocalPlayer.UserId then
                v19 = nil;
            else
                v19 = u18.Balloon.Position;
            end;

            local BALLOON_POP = GameSound.BALLOON_POP;

            if BalloonSkin.BALLOON_POP_SOUNDS and #BalloonSkin.BALLOON_POP_SOUNDS > 0 then
                BALLOON_POP = RandomUtil.fromList(unpack(BalloonSkin.BALLOON_POP_SOUNDS));
            end;

            SoundManager:playSound(BALLOON_POP, {
                position = v19
            });
            TweenService:Create(u18.Balloon, TweenInfo.new(0.3), {
                Size = Vector3.new(0, 0, 0)
            }):Play();
            RuntimeLib.Promise.delay(0.1):andThen(function() -- Line: 139
                -- upvalues: TweenService (ref), u18 (copy)
                TweenService:Create(u18.Balloon, TweenInfo.new(0.2), {
                    Transparency = 1
                }):Play();
            end);
            TweenService:Create(u18.RopeConstraint, TweenInfo.new(0.3), {
                Thickness = 0
            }):Play();
            local v20 = Players:GetPlayerByUserId(u18:GetAttribute("BalloonOwner"));
            local v21;

            if v20 == nil then
                v21 = v20;
            else
                v21 = v20.Character;

                if v21 ~= nil then
                    v21 = v21:GetAttribute("InflatedBalloons");
                end;
            end;

            local v22 = v21 == 1 and u18:GetAttribute("DeflatedBalloon");

            if v22 ~= 0 and (v22 == v22 and (v22 ~= "" and v22)) then
                local v23 = u11.playerBalloonHeartbeatMap[v20];

                if v23 ~= nil then
                    v23:Disconnect();
                end;

                u11.playerBalloonHeartbeatMap[v20] = nil;
            end;
        end);
    end);
    WatchCharacter(function(u24, u25, u26) -- Line: 173
        -- upvalues: CollectionService (ref), u11 (copy), Players (ref), SoundManager (ref), GameSound (ref)
        u26:GiveTask(CollectionService:GetInstanceAddedSignal("InflatedBalloon:" .. u24.Name):Connect(function(p27) -- Line: 174
            -- upvalues: u11 (ref), u24 (copy), u26 (copy), u25 (copy), Players (ref), SoundManager (ref), GameSound (ref)
            if not u11.playerBalloonHeartbeatMap[u24] then
                u26:GiveTask(u11:enableBalloonAttachment(u24, u25));
            end;

            u11:hookBalloon(u24, u11:getBalloonAttachment(u24), p27);
            local v28;

            if p27:GetAttribute("BalloonOwner") == Players.LocalPlayer.UserId then
                v28 = nil;
            else
                v28 = p27.Balloon.Position;
            end;

            SoundManager:playSound(GameSound.BALLOON_INFLATE, {
                position = v28
            });
        end));

        if u24 == Players.LocalPlayer then
            u25:GetAttributeChangedSignal("InflatedBalloons"):Connect(function() -- Line: 191
                -- upvalues: u25 (copy), u11 (ref)
                local v29 = u25:GetAttribute("InflatedBalloons");

                if v29 > 0 and not u11.balloonPhysicsEnabled then
                    u11:enableBalloonPhysics(u25);

                    return;
                end;

                if v29 == 0 and u11.balloonPhysicsEnabled then
                    u11.balloonPhysicsMaid:DoCleaning();
                end;
            end);
            u26:GiveTask(function() -- Line: 199
                -- upvalues: u11 (ref)
                u11.balloonPhysicsMaid:DoCleaning();
            end);
        end;
    end);
end;

function u8.enableBalloonAttachment(u30, u31, u32) -- Line: 211
    -- upvalues: u3 (copy), GameQueryUtil (copy), RunService (copy)
    local v33 = u3.new();
    local u34 = u30.balloonRootsFolder:WaitForChild("BalloonRoot:" .. u31.Name);
    u30:getBalloonAttachment(u31);
    GameQueryUtil:setQueryIgnored(u34, true);
    local v35 = u30.playerBalloonHeartbeatMap[u31];

    if v35 then
        v35:Disconnect();
    end;

    local v36;

    if u32 == nil then
        v36 = u32;
    else
        v36 = u32:FindFirstChild("UpperTorso");

        if v36 ~= nil then
            v36 = v36:FindFirstChild("BodyBackAttachment");
        end;
    end;

    local u37 = v36;
    local v40 = RunService.Heartbeat:Connect(function(p38) -- Line: 230
        -- upvalues: u37 (ref), u32 (copy), u34 (copy)
        if not u37 then
            local v39 = u32;

            if v39 ~= nil then
                v39 = v39:FindFirstChild("UpperTorso");

                if v39 ~= nil then
                    v39 = v39:FindFirstChild("BodyBackAttachment");
                end;
            end;

            u37 = v39;
        end;

        if u37 then
            u34.CFrame = u37.WorldCFrame;
        end;
    end);
    u30.playerBalloonHeartbeatMap[u31] = v40;

    if v33 ~= nil then
        v33:GiveTask(function() -- Line: 251
            -- upvalues: u30 (copy), u31 (copy)
            local v41 = u30.playerBalloonHeartbeatMap[u31];

            if v41 then
                v41:Disconnect();
                u30.playerBalloonHeartbeatMap[u31] = nil;
            end;
        end);
    end;

    return v33;
end;

function u8.getBalloonAttachment(p42, p43) -- Line: 265
    return p42.balloonRootsFolder:WaitForChild("BalloonRoot:" .. p43.Name):WaitForChild("Attachment");
end;

function u8.hookBalloon(p44, p45, p46, p47) -- Line: 269
    -- upvalues: Players (copy), u4 (copy), GameQueryUtil (copy)
    local RopeConstraint = p47:WaitForChild("RopeConstraint");
    RopeConstraint.Attachment0 = p46;

    if p45 == Players.LocalPlayer then
        RopeConstraint.Attachment1 = p47.Balloon.Attachment;

        return;
    end;

    local v48 = u4("Part", {
        CanCollide = false,
        Anchored = true,
        Transparency = 1,
        Parent = p44.clientBalloonHookFolder
    });
    local v49 = u4("Attachment", {
        Parent = v48
    });
    GameQueryUtil:setQueryIgnored(v48, true);
    p44.clientBalloonAttachment[p47] = v48;
    RopeConstraint.Attachment1 = v49;
end;

function u8.dropTNT(p50) -- Line: 291
    -- upvalues: default (copy)
    if tick() < p50.lastTntDrop + 0.25 then
        return false;
    end;

    p50.lastTntDrop = tick();
    default.Client:Get("DropTnt"):SendToServer();

    return true;
end;

function u8.enableBalloonPhysics(u51, u52) -- Line: 299
    -- upvalues: u3 (copy), KnitClient (copy), RunService (copy), u7 (copy), Workspace (copy), u4 (copy), Players (copy), DeviceUtil (copy), u5 (copy), BedwarsImageId (copy), BedwarsUI (copy), MobileButton (copy), Flamework (copy), ActionButton (copy), GamepadAction (copy), GameTheme (copy)
    u51.balloonPhysicsMaid:DoCleaning();
    local Humanoid = u52:FindFirstChild("Humanoid");
    u51.balloonPhysicsEnabled = true;
    u51.balloonPhysicsMaid:GiveTask(function() -- Line: 303
        -- upvalues: u51 (copy)
        u51.balloonPhysicsEnabled = false;
    end);
    u51.balloonPhysicsMaid:GiveTask(function() -- Line: 306
        -- upvalues: u52 (copy)
        if u52.Parent then
            local PrimaryPart = u52.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart:FindFirstChild("BalloonForce");
            end;

            if PrimaryPart then
                PrimaryPart:Destroy();
            end;
        end;
    end);
    local u53 = u3.new();

    local function _() -- Line: 320
        -- upvalues: KnitClient (ref), u53 (copy)
        u53:GiveTask((KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
            constantSpeedMultiplier = 0.65
        })));
    end;

    u51.balloonPhysicsMaid:GiveTask(Humanoid.StateChanged:Connect(function(p54, p55) -- Line: 326
        -- upvalues: KnitClient (ref), u53 (copy)
        if p55 == Enum.HumanoidStateType.Freefall then
            u53:GiveTask((KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                constantSpeedMultiplier = 0.65
            })));

            return;
        end;

        u53:DoCleaning();
    end));

    if Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
        u53:GiveTask((KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
            constantSpeedMultiplier = 0.65
        })));
    end;

    u51.balloonPhysicsMaid:GiveTask(function() -- Line: 336
        -- upvalues: u53 (copy)
        u53:DoCleaning();
    end);
    local u62 = RunService.Stepped:Connect(function(p56) -- Line: 339
        -- upvalues: u52 (copy), u7 (ref), Workspace (ref), u4 (ref)
        local v57 = u52;

        if v57 ~= nil then
            v57 = v57.PrimaryPart;
        end;

        if not v57 then
            return nil;
        end;

        local v58 = u52:GetAttribute("InflatedBalloons");
        local v59 = math.pow((u52.PrimaryPart.AssemblyLinearVelocity * Vector3.new(0, 1, 0)).Magnitude, 2) / 2 * u7.DragConstant * math.sign(u52.PrimaryPart.AssemblyLinearVelocity.Y) / 13;
        local v60 = math.max(0, (Workspace.Gravity * (v58 >= 4 and 1.2 or (v58 >= 3 and 1.1 or (v58 >= 2 and 0.975 or 0.85))) - v59) * u52.PrimaryPart.AssemblyMass);
        local v61 = Vector3.new(0, v60, 0);
        local BalloonForce = u52.PrimaryPart:FindFirstChild("BalloonForce");

        if BalloonForce then
            BalloonForce.Force = v61;

            return;
        end;

        u4("BodyForce", {
            Name = "BalloonForce",
            Force = v61,
            Parent = u52.PrimaryPart
        });
    end);
    u51.balloonPhysicsMaid:GiveTask(function() -- Line: 375
        -- upvalues: u62 (copy)
        u62:Disconnect();
    end);
    local v63 = Players.LocalPlayer:GetAttribute("BalloonPopDisabled");

    if v63 == 0 or (v63 ~= v63 or (v63 == "" or not v63)) then
        if DeviceUtil.isMobileControls() then
            local v64 = {};
            local v65 = #v64;
            local v66 = {
                Image = BedwarsImageId.DOWN_MOBILE,
                Position = BedwarsUI:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0),

                OnClick = function() -- Line: 394
                    -- upvalues: u51 (copy)
                    u51:deflateBalloon();
                end
            };
            v64[v65 + 1] = u5.createElement(MobileButton, v66);
            local v67 = {
                Image = BedwarsImageId.EXPLODE_MOBILE,
                Position = BedwarsUI:getActionMobileButtonPosition() - UDim2.fromScale(0.04, DeviceUtil.isSmallScreen() and 0.14 or 0.11),

                OnClick = function() -- Line: 404
                    -- upvalues: u51 (copy)
                    u51:dropTNT();
                end
            };
            v64[v65 + 2] = u5.createElement(MobileButton, v67);
            local u68 = u5.mount(u5.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, v64), Players.LocalPlayer:WaitForChild("PlayerGui"));
            u51.balloonPhysicsMaid:GiveTask(function() -- Line: 409
                -- upvalues: u5 (ref), u68 (copy)
                u5.unmount(u68);
            end);

            return;
        end;

        local v69 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u5.createElement(ActionButton, {
            actionName = "deflate-balloon",
            text = "Pop Balloon",
            interactionKey = Enum.KeyCode.X,
            gamepadInteractionKey = GamepadAction.CloseMenu,

            onActivated = function() -- Line: 417, Name: onActivated
                -- upvalues: u51 (copy)
                u51:deflateBalloon();
            end,

            LayoutOrder = GameTheme.abilityActionBarPriority
        }));
        u51.balloonPhysicsMaid:GiveTask(v69);
    end;
end;

function u8.inflateBalloon(p70) -- Line: 427
    -- upvalues: Flamework (copy), CooldownId (copy), KnitClient (copy), AnimationType (copy), default (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(CooldownId.BALLOON) then
        return nil;
    end;

    KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_USE_ITEM);
    default.Client:Get("InflateBalloon"):SendToServer();
end;

function u8.deflateBalloon(p71) -- Line: 434
    -- upvalues: KnitClient (copy), AnimationType (copy), default (copy)
    KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_USE_ITEM);
    default.Client:Get("DeflateBalloon"):SendToServer();
end;

function u8.isRelevantItem(p72, p73) -- Line: 438
    -- upvalues: getItemMeta (copy)
    local balloon = getItemMeta(p73.itemType).balloon;

    if balloon == nil then
        balloon = false;
    end;

    return balloon;
end;

function u8.onEnable(u74, p75) -- Line: 446
    -- upvalues: Flamework (copy), DeviceUtil (copy), u5 (copy), MobileButton (copy), BedwarsImageId (copy), BedwarsUI (copy), Players (copy)
    local v79 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "inflate-balloon",

        boundFunction = function(p76, p77, p78) -- Line: 452, Name: boundFunction
            -- upvalues: u74 (copy)
            if p77 == Enum.UserInputState.Begin then
                u74:inflateBalloon();
            end;
        end
    });
    u74.maid:GiveTask(v79);

    if DeviceUtil.isMobileControls() then
        u74:setupYield(function() -- Line: 460
            -- upvalues: u5 (ref), MobileButton (ref), BedwarsImageId (ref), BedwarsUI (ref), u74 (copy), Players (ref)
            local u80 = u5.mount(u5.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u5.createElement(MobileButton, {
                    Image = BedwarsImageId.UP_MOBILE,
                    Position = BedwarsUI:getActionMobileButtonPosition(),

                    OnClick = function() -- Line: 467, Name: OnClick
                        -- upvalues: u74 (ref)
                        u74:inflateBalloon();
                    end
                }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));

            return function() -- Line: 472
                -- upvalues: u5 (ref), u80 (copy)
                u5.unmount(u80);
            end;
        end);
    end;
end;

function u8.onDisable(p81) -- Line: 478
    p81.maid:DoCleaning();
end;

function u8.inflateBalloonFromCharacter(p82, p83) -- Line: 481
    -- upvalues: u3 (copy), u4 (copy), PlaceUtil (copy), BalloonSkin (copy), RandomUtil (copy), ReplicatedStorage (copy), Workspace (copy), u2 (copy)
    local v84 = u3.new();

    if not p83 then
        return v84;
    end;

    local v85 = u4("Part", {
        Name = "BalloonRoot",
        Size = Vector3.new(0.2, 0.2, 0.2),
        Transparency = 1,
        Anchored = true,
        CanCollide = false,
        Position = p83:GetPivot().Position,
        Parent = p83,
        Children = { u4("Attachment", {
                Name = "Attachment"
            }) }
    });
    v84:GiveTask(v85);
    local v86 = "InflatedBalloon";
    local v87;

    if PlaceUtil.isLobbyServer() then
        v87 = BalloonSkin.BALLOON_SKIN_MODELS_LOBBY;
    else
        v87 = BalloonSkin.BALLOON_SKIN_MODELS;
    end;

    if v87 and #v87 > 0 then
        v86 = RandomUtil.fromList(unpack(v87));
    end;

    local v88 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild(v86):Clone();
    v88.Balloon:SetAttribute("IgnoreProjectileCollision", true);
    v88.Balloon.CFrame = p83:GetPivot();
    v88.Parent = Workspace;
    local RopeConstraint = v88:WaitForChild("RopeConstraint");
    RopeConstraint.Attachment0 = v85:FindFirstChild("Attachment");
    RopeConstraint.Attachment1 = v88.Balloon.Attachment;
    u4("BodyForce", {
        Name = "BodyForce",
        Force = Vector3.new(0, Workspace.Gravity * v88.Balloon.Mass * 1.3, 0),
        Parent = v88.Balloon
    });

    if v86 == "InflatedBalloon" then
        u4("BodyGyro", {
            D = 0,
            CFrame = v88.Balloon.CFrame,
            Parent = v88.Balloon
        });
    else
        u4("BodyGyro", {
            D = 1000,
            P = 10,
            CFrame = v88.Balloon.CFrame,
            Parent = v88.Balloon
        });
    end;

    local v89 = Color3.fromRGB(216, 50, 53);
    local v90 = u2.keys(BalloonSkin.BALLOON_SKIN_MODELS_COLORS);

    if table.find(v90, v86) ~= nil then
        v89 = BalloonSkin.BALLOON_SKIN_MODELS_COLORS[v86];
    end;

    v88.Balloon.Color = v89;
    v88.Balloon.PopEffect.Color = ColorSequence.new(v89);
    v84:GiveTask(v88);

    return v84;
end;

KnitClient.CreateController(u8.new());

return {
    Constants = u7
};
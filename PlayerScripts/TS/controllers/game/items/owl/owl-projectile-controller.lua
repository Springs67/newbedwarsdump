-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local MobileButton = v1.MobileButton;
local MobileTouchType = v1.MobileTouchType;
local PressMode = v1.PressMode;
local RandomUtil = v1.RandomUtil;
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
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ProjectileController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-controller").ProjectileController;
local ProjectileHandler = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local OwlBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "owl-balance-file").OwlBalance;
local ProjectileUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "projectile-util").ProjectileUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local OwlStatus = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "owl", "owl-status").OwlStatus;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Setting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting;
local OwlUtil = RuntimeLib.import(script, script.Parent, "owl-util").OwlUtil;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 43, Name: __tostring
        return "OwlProjectileController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 49
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 53
    -- upvalues: KnitController (copy), u3 (copy), DeviceUtil (copy)
    KnitController.constructor(p9);
    p9.Name = "OwlProjectileController";
    p9.activate = false;
    p9.maid = u3.new();
    p9.startHoldingTime = 0;
    p9.targetingMaid = u3.new();
    p9.isHolding = false;
    p9.YTargetOffset = DeviceUtil.isMobileControls() and 0.25 or 0.05;
    p9.bulletType = "owl_projectile";
    p9.projectileReadyTime = -1;
    p9.uiMaid = u3.new();
end;

function u7.KnitStart(u10) -- Line: 66
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), OwlUtil (copy), Players (copy), default (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), OwlStatus (copy), TweenService (copy), RandomUtil (copy), SoundManager (copy)
    KnitController.KnitStart(u10);
    ClientSyncEvents.OwlNewTarget:connect(function(p11) -- Line: 68
        -- upvalues: u10 (copy), OwlUtil (ref), Players (ref)
        if not p11.target then
            u10.target = nil;
            u10.activate = false;
            u10.isHolding = false;
            u10:onDeactive();

            return;
        end;

        u10.target = p11.target;
        u10.activate = true;
        local v12 = OwlUtil:getOwlClientModelByUser(Players.LocalPlayer);

        if v12 ~= nil then
            v12 = v12.PrimaryPart;
        end;

        u10.owl = v12;
        u10:onActive();
    end);
    default.Client:Get("FireOwlProjectile"):Connect(function(p13, p14, p15, p16) -- Line: 85
        -- upvalues: OwlUtil (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), OwlStatus (ref), TweenService (ref), RandomUtil (ref), SoundManager (ref), Players (ref), u10 (copy), ClientSyncEvents (ref)
        local u17 = OwlUtil:getOwlClientModelByUser(p13);
        local v18;

        if u17 == nil then
            v18 = u17;
        else
            v18 = u17.PrimaryPart;

            if v18 ~= nil then
                v18 = v18:FindFirstChild("bulletOrigin");
            end;
        end;

        local WorldPosition = v18.WorldPosition;
        local v19;

        if u17 == nil then
            v19 = u17;
        else
            v19 = u17.PrimaryPart;
        end;

        if not (v19 and WorldPosition) then
            return nil;
        end;

        local v20 = AnimationUtil:playAnimation(u17, GameAnimationUtil:getAssetId(AnimationType.OWL_SHOOT));
        u17:SetAttribute("Status", OwlStatus.SHOOTING);

        if v20 ~= nil then
            v20.Stopped:Connect(function() -- Line: 110
                -- upvalues: AnimationUtil (ref), u17 (copy), GameAnimationUtil (ref), AnimationType (ref), OwlStatus (ref)
                AnimationUtil:playAnimation(u17, GameAnimationUtil:getAssetId(AnimationType.OWL_FLY));
                u17:SetAttribute("Status", OwlStatus.DEFAULT);
            end);
        end;

        local v21 = TweenInfo.new(0.3);
        local v22 = { CFrame.new(u17.PrimaryPart.Position, u17.PrimaryPart.Position + p15.Unit):ToOrientation() };
        local PrimaryPart = u17.PrimaryPart;
        local v23 = {};
        local v24 = math.deg(v22[1]);
        local v25 = math.deg(v22[2]);
        local v26 = math.deg(v22[3]);
        v23.Orientation = Vector3.new(v24, v25, v26);
        TweenService:Create(PrimaryPart, v21, v23):Play();
        SoundManager:playSound(RandomUtil.fromList(unpack(OwlUtil:getOwlShootSound(p13))), {
            rollOffMaxDistance = 220,
            position = u17.PrimaryPart.Position
        });

        if p13 == Players.LocalPlayer then
            return nil;
        end;

        local v27 = u10:getKitSkinData(p13.Character);
        local v28;

        if v27 == nil then
            v28 = v27;
        else
            v28 = v27.projectileModel;
        end;

        if v28 then
            v28 = p16;
        end;

        if v28 then
            p16.projectileModel = v27.projectileModel;
        end;

        ClientSyncEvents.FireClientProjectile:fire(nil, nil, "owl_projectile", WorldPosition, p14, p15, {}, p16);
    end);
end;

function u7.onActive(u29) -- Line: 146
    -- upvalues: u3 (copy), Flamework (copy), RunService (copy), Workspace (copy), MobileTouchType (copy)
    local u30 = nil;
    local v31 = u3.new();
    u29.maid:GiveTask(v31);
    local v38 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "owl-projectile-click",

        boundFunction = function(p32, p33, u34) -- Line: 154, Name: boundFunction
            -- upvalues: u30 (ref), u29 (copy), RunService (ref), Workspace (ref)
            if p33 ~= Enum.UserInputState.Begin then
                if p33 == Enum.UserInputState.End then
                    if u30 and u34 ~= u30 then
                        return nil;
                    end;

                    u30 = nil;
                    pcall(function() -- Line: 192
                        -- upvalues: RunService (ref)
                        return RunService:UnbindFromRenderStep("owl-projectile-mobile-confirm");
                    end);

                    if u29.isHolding then
                        u29:stopHolding();
                        u29.targetingMaid:DoCleaning();
                        local _ = time() - u29.startHoldingTime;
                    end;
                end;

                return;
            end;

            if u34.UserInputType == Enum.UserInputType.Touch then
                u30 = u34;
            end;

            local function v37() -- Line: 159
                -- upvalues: u29 (ref), u34 (copy), RunService (ref), u30 (ref)
                if not u29.activate then
                    return nil;
                end;

                if u34.UserInputState == Enum.UserInputState.End or u34.UserInputState == Enum.UserInputState.Cancel then
                    return nil;
                end;

                if u29.isHolding then
                    return nil;
                end;

                if u34.UserInputType == Enum.UserInputType.Touch then
                    local u35 = 0;
                    RunService:BindToRenderStep("owl-projectile-mobile-confirm", 250, function(p36) -- Line: 172
                        -- upvalues: u35 (ref), RunService (ref), u29 (ref), u30 (ref)
                        u35 = u35 + p36;

                        if u35 >= 0.3 then
                            RunService:UnbindFromRenderStep("owl-projectile-mobile-confirm");
                            u29:startHolding(u30);
                        end;
                    end);

                    return nil;
                end;

                u29:startHolding();
            end;

            if u29.projectileReadyTime > Workspace:GetServerTimeNow() then
                return nil;
            end;

            v37();
        end,

        mobile = {
            touchType = MobileTouchType.TouchBeginEnd
        },
        priority = Enum.ContextActionPriority.High.Value
    });
    u29.maid:GiveTask(v38);
    u29:displayMobileButton();
end;

function u7.onDeactive(p39) -- Line: 210
    p39.maid:DoCleaning();
    p39.targetingMaid:DoCleaning();
    p39.uiMaid:DoCleaning();
end;

function u7.stopHolding(p40, p41) -- Line: 215
    -- upvalues: default (copy), Workspace (copy), ProjectileHandler (copy), ProjectileController (copy), ProjectileUtil (copy), ClientSyncEvents (copy), OwlBalance (copy), Players (copy)
    if not p40.owl then
        return nil;
    end;

    default.Client:Get("OwlAiming"):SendToServer({
        starting = false,
        owl = p40.owl
    });

    if not p40.isHolding then
        return nil;
    end;

    p40.isHolding = false;
    local v42;

    if p41 then
        v42 = Workspace.CurrentCamera;

        if v42 ~= nil then
            v42 = v42.ViewportSize / 2 - Vector2.new(0, game:GetService("GuiService"):GetGuiInset().Y / 2);
        end;
    else
        v42 = nil;
    end;

    local WorldPosition = p40.owl:FindFirstChild("bulletOrigin").WorldPosition;
    local v43 = ProjectileController:calculateImportantLaunchValues(ProjectileHandler.new(1, 1, p40.bulletType, nil, nil, nil, nil, v42), true, nil, WorldPosition);

    if not v43 then
        return nil;
    end;

    local v44 = ProjectileUtil.generateRefId();
    local v45 = default.Client:Get("OwlFireProjectile");
    local v46 = {
        fromPosition = WorldPosition
    };
    local v47;

    if v43 == nil then
        v47 = v43;
    else
        v47 = v43.initialVelocity;
    end;

    v46.direction = v47;
    v46.offset = nil;
    v46.ProjectileRefId = v44;
    local v48;

    if v43 == nil then
        v48 = v43;
    else
        v48 = v43.initialVelocity;
    end;

    v46.initialVelocity = v48;
    v45:SendToServer(v46);

    if p40.projectileReadyTime > Workspace:GetServerTimeNow() then
        return nil;
    end;

    local cooldown = ClientSyncEvents.ProjectileCooldownModifierCheck:fire(OwlBalance.OWL_SHOOTING_COOLDOWN).cooldown;
    p40.projectileReadyTime = Workspace:GetServerTimeNow() + cooldown;
    local v49 = p40:getKitSkinData(Players.LocalPlayer.Character);
    local v50 = nil;
    local v51;

    if v49 == nil then
        v51 = v49;
    else
        v51 = v49.projectileModel;
    end;

    if v51 then
        v50 = v49.projectileModel;
    end;

    if v43 ~= nil then
        v43 = v43.initialVelocity;
    end;

    ClientSyncEvents.FireClientProjectile:fire(nil, nil, "owl_projectile", WorldPosition, v44, v43, {}, {
        projectileModel = v50,
        relativeOverride = {
            relX = 0.01,
            relY = 0.01,
            relZ = 0.01
        }
    });
end;

function u7.startHolding(u52, u53, u54) -- Line: 296
    -- upvalues: Workspace (copy), OwlUtil (copy), Players (copy), OwlStatus (copy), RunService (copy), default (copy)
    if not u52.owl then
        return nil;
    end;

    if u52.projectileReadyTime > Workspace:GetServerTimeNow() then
        return nil;
    end;

    local v55 = OwlUtil:getOwlClientModelByUser(Players.LocalPlayer);

    if not v55 or v55:GetAttribute("Status") == OwlStatus.LIFTING then
        return nil;
    end;

    local target = u52.target;

    if target ~= nil then
        target = target.Character;

        if target ~= nil then
            target = target.PrimaryPart;

            if target ~= nil then
                target = target.Position;
            end;
        end;
    end;

    local Position = u52.owl.Position;

    if not target or (not Position or (Position - target).Magnitude > 15) then
        return nil;
    end;

    u52.startHoldingTime = Workspace:GetServerTimeNow();
    u52.isHolding = true;
    local u56 = nil;
    u56 = RunService.Heartbeat:Connect(function(p57) -- Line: 325
        -- upvalues: u52 (copy), u56 (ref), Workspace (ref), u53 (copy), u54 (copy)
        if not u52.isHolding then
            u52.targetingMaid:DoCleaning();
            u56:Disconnect();
        end;

        if Workspace:GetServerTimeNow() - u52.startHoldingTime >= 0.15 then
            u52:enablePredictor(u53, u54);
            u56:Disconnect();
        end;
    end);
    default.Client:Get("OwlAiming"):SendToServer({
        starting = true,
        owl = u52.owl
    });
end;

function u7.enablePredictor(u58, u59, u60) -- Line: 340
    -- upvalues: Workspace (copy), u4 (copy), GameQueryUtil (copy), CollectionService (copy), RunService (copy), ProjectileHandler (copy), ProjectileController (copy), Players (copy)
    if not u58.owl then
        return nil;
    end;

    local v61 = {
        Transparency = 1,
        CanCollide = false,
        Anchored = true,
        Parent = Workspace
    };
    local u62 = u4("Part", v61);
    local u63 = u4("Part", v61);
    GameQueryUtil:setQueryIgnored(u62, true);
    GameQueryUtil:setQueryIgnored(u63, true);
    u58.targetingMaid:GiveTask(u62);
    u58.targetingMaid:GiveTask(u63);
    local u64 = u4("Beam", {
        FaceCamera = true,
        Segments = 300,
        Width0 = 0.08,
        Attachment0 = u4("Attachment", {
            Parent = u62
        }),
        Attachment1 = u4("Attachment", {
            Parent = u63
        }),
        Color = ColorSequence.new(Color3.fromRGB(255, 255, 255)),
        Transparency = NumberSequence.new(0.2),
        Width1 = 0.08 + 2.22 * ((u62.Position - u63.Position).Magnitude / 100),
        Parent = Workspace
    });
    CollectionService:AddTag(u64, "dragon-breath-preview-beam");
    u58.targetingMaid:GiveTask(u64);
    u58.targetingMaid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 379
        -- upvalues: u58 (copy), u62 (copy), u59 (copy), u60 (copy), Workspace (ref), ProjectileHandler (ref), ProjectileController (ref), u63 (copy), u64 (copy), Players (ref)
        local WorldPosition = u58.owl:FindFirstChild("bulletOrigin").WorldPosition;
        u62.Position = WorldPosition;
        local v65;

        if u59 then
            v65 = {
                inputObject = u59
            };
            local v66 = u59;

            if v66 ~= nil then
                v66 = v66.Position.X;
            end;

            local v67 = u59;

            if v67 ~= nil then
                v67 = v67.Position.Y;
            end;

            v65.initialPosition = Vector2.new(v66, v67);
        else
            v65 = nil;
        end;

        local v68;

        if u60 then
            v68 = Workspace.CurrentCamera;

            if v68 ~= nil then
                v68 = v68.ViewportSize / 2 - Vector2.new(0, game:GetService("GuiService"):GetGuiInset().Y / 2);
            end;
        else
            v68 = nil;
        end;

        local v69 = ProjectileController:calculateImportantLaunchValues(ProjectileHandler.new(1, 1, u58.bulletType, v65, nil, nil, nil, v68), true, nil, WorldPosition);

        if not v69 then
            return nil;
        end;

        local initialVelocity = v69.initialVelocity;
        local deltaT = v69.deltaT;
        local gravitationalAcceleration = v69.gravitationalAcceleration;

        local function _(p70) -- Line: 420
            -- upvalues: initialVelocity (copy), WorldPosition (copy)
            return initialVelocity.X * p70 + WorldPosition.X;
        end;

        local function _(p71) -- Line: 423
            -- upvalues: gravitationalAcceleration (copy), initialVelocity (copy), WorldPosition (copy)
            return -0.5 * gravitationalAcceleration * p71 ^ 2 + initialVelocity.Y * p71 + WorldPosition.Y;
        end;

        local function _(p72) -- Line: 426
            -- upvalues: initialVelocity (copy), WorldPosition (copy)
            return initialVelocity.Z * p72 + WorldPosition.Z;
        end;

        local v73 = deltaT / 2;
        local v74 = Vector3.new(initialVelocity.X * (deltaT / 2) + WorldPosition.X, -0.5 * gravitationalAcceleration * v73 ^ 2 + initialVelocity.Y * v73 + WorldPosition.Y, initialVelocity.Z * (deltaT / 2) + WorldPosition.Z);
        local v75 = Vector3.new(initialVelocity.X * deltaT + WorldPosition.X, -0.5 * gravitationalAcceleration * deltaT ^ 2 + initialVelocity.Y * deltaT + WorldPosition.Y, initialVelocity.Z * deltaT + WorldPosition.Z);
        local v76 = (v74 - WorldPosition * 0.25 - v75 * 0.25) * 2;
        local v77 = v76 * 0.6666666666666666 + WorldPosition * 0.3333333333333333;
        local v78 = v76 * 0.6666666666666666 + v75 * 0.3333333333333333;
        u62.CFrame = CFrame.new(WorldPosition, v77) * CFrame.Angles(0, 1.5707963267948966, 0);
        u63.CFrame = CFrame.new(v75, v78) * CFrame.Angles(0, -1.5707963267948966, 0);
        u64.CurveSize0 = (v77 - u62.Position).Magnitude;
        u64.CurveSize1 = (v78 - u63.Position).Magnitude;
        local _ = Workspace.CurrentCamera.CFrame;
        local v79 = Players.LocalPlayer:GetMouse();
        local v80 = Vector2.new(v79.X, v79.Y);
        local _ = (Workspace.CurrentCamera:ScreenPointToRay(v80.X, v80.Y).Unit.Direction + Vector3.new(0, u58.YTargetOffset, 0)).Unit;
        u64.Width1 = 0.08 + 0.08 * ((u62.Position - u63.Position).Magnitude / 100);

        if not u58.isHolding then
            u63:Destroy();
            u62:Destroy();
            u64:Destroy();

            return nil;
        end;
    end));
end;

function u7.getKitSkinData(p81, p82) -- Line: 469
    -- upvalues: KnitClient (copy), BedwarsKitSkinMeta (copy)
    if not p82 then
        return nil;
    end;

    local v83 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p82)];

    if v83.owl then
        return v83.owl;
    end;
end;

function u7.displayMobileButton(u84) -- Line: 479
    -- upvalues: KnitClient2 (copy), Setting (copy), DeviceUtil (copy), u3 (copy), u5 (copy), MobileButton (copy), BedwarsImageId (copy), Flamework (copy), PressMode (copy), Players (copy)
    if KnitClient2.Controllers.SettingsController:getSetting(Setting.MOBILE_PROJECTILE_BUTTON) and DeviceUtil.isMobileControls() then
        KnitClient2.Controllers.MobileLayoutLoadController:onMobileLayoutLoaded():await();
        local u85 = u3.new();
        local u93 = u5.mount(u5.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u5.createElement(MobileButton, {
                Image = BedwarsImageId.BOW_MOBILE,
                Position = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonPosition("FireProjectile"),
                Size = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonSize("FireProjectile"),
                PressMode = PressMode.FREE_MOVING_HOLD,

                OnPressDown = function() -- Line: 492, Name: OnPressDown
                    -- upvalues: u84 (copy), u85 (copy)
                    if u84.projectileHandler then
                        return nil;
                    end;

                    (function() -- Line: 496
                        -- upvalues: u84 (ref), u85 (ref)
                        if u84.projectileHandler then
                            return nil;
                        end;

                        if not u84:canLaunch() then
                            return nil;
                        end;

                        u84:startHolding(nil, true);
                        local owl = u84.owl;

                        if owl ~= nil then
                            owl = owl.Parent;
                        end;

                        if owl ~= nil then
                            owl:SetAttribute("TransparencyOverride", true);
                        end;

                        local u86 = {};
                        local v87;

                        if owl == nil then
                            v87 = owl;
                        else
                            local function _(p88) -- Line: 517
                                -- upvalues: u86 (copy)
                                if p88:IsA("MeshPart") or p88:IsA("Decal") then
                                    u86[p88] = p88.Transparency;
                                    p88.Transparency = math.max(0.97, p88.Transparency);
                                end;
                            end;

                            for i, descendant in owl:GetDescendants() do
                                local _ = i - 1;

                                if descendant:IsA("MeshPart") or descendant:IsA("Decal") then
                                    u86[descendant] = descendant.Transparency;
                                    descendant.Transparency = math.max(0.97, descendant.Transparency);
                                end;
                            end;

                            v87 = nil;
                        end;

                        u85:DoCleaning();
                        u85:GiveTask(function() -- Line: 534
                            -- upvalues: u86 (copy), owl (copy)
                            local function _(p89, p90) -- Line: 535
                                p90.Transparency = p89;
                            end;

                            for i, v in u86 do
                                i.Transparency = v;
                            end;

                            local v91 = owl;

                            if v91 ~= nil then
                                v91:SetAttribute("TransparencyOverride", nil);
                            end;
                        end);
                    end)();
                end,

                OnPressUp = function(p92) -- Line: 549, Name: OnPressUp
                    -- upvalues: u85 (copy), u84 (copy)
                    u85:DoCleaning();
                    u84:stopHolding(true);
                end
            }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));
        u84.uiMaid:GiveTask(function() -- Line: 555
            -- upvalues: u5 (ref), u93 (copy)
            u5.unmount(u93);
        end);
    end;
end;

function u7.canLaunch(p94) -- Line: 560
    return true;
end;

KnitClient.CreateController(u7.new());

return nil;
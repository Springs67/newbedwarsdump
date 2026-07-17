-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConstantManager = v1.ConstantManager;
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "bezier", "out").default;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ProjectileUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "projectile-util").ProjectileUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local getItemSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta;
local ProjectileMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local IdUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "id-util").IdUtil;
local ProjectileHandler = RuntimeLib.import(script, script.Parent, "projectile-handler").ProjectileHandler;
local u5 = ConstantManager.registerConstants(script, {
    RelX = 0.8,
    RelY = -0.6,
    RelZ = 0,
    CameraMultiplier = 10,
    BeamGrowthMultiplier = 0.08,
    YTargetOffset = DeviceUtil.isMobileControls() and 0.25 or 0.05
});
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 41, Name: __tostring
        return "ProjectileController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 47
    -- upvalues: u6 (copy)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, ...) -- Line: 51
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p8, ...);
    p8.Name = "ProjectileController";
    p8.isTargeting = false;
    p8.targetingId = 0;
    p8.targetingMaid = u2.new();
end;

function u6.KnitStart(p9) -- Line: 58
    p9:projectileSetup();
end;

function u6.projectileSetup(u10) -- Line: 61
    -- upvalues: u3 (copy), Workspace (copy), default2 (copy), EntityUtil (copy), ClientSyncEvents (copy)
    u10.projectileTargetingFolder = u3("Folder", {
        Name = "ProjectileTargeting",
        Parent = Workspace
    });
    default2.Client:OnEvent("ProjectileLaunchClient", function(p11) -- Line: 66
        -- upvalues: EntityUtil (ref), u10 (copy)
        local shooter = p11.shooter;
        local v12;

        if shooter then
            v12 = EntityUtil:getEntity(shooter);
        else
            v12 = nil;
        end;

        local ammoType = p11.ammoType;
        local projectileType = p11.projectileType;
        local positionFrom = p11.positionFrom;
        local projectileRefId = p11.projectileRefId;
        local initialVelocity = p11.initialVelocity;
        local v13;

        if p11 == nil then
            v13 = p11;
        else
            v13 = p11.launchData;
        end;

        local v14 = v13 == nil and {} or v13;
        local v15 = {};
        local config = p11.config;

        if config ~= nil then
            config = config.projectileModel;
        end;

        v15.projectileModel = config;
        local config2 = p11.config;

        if config2 ~= nil then
            config2 = config2.projectileModelScale;
        end;

        v15.projectileModelScale = config2;
        local config3 = p11.config;

        if config3 ~= nil then
            config3 = config3.relativeOverride;
        end;

        v15.relativeOverride = config3;
        local config4 = p11.config;

        if config4 ~= nil then
            config4 = config4.launchSound;
        end;

        v15.launchSound = config4;
        local config5 = p11.config;

        if config5 ~= nil then
            config5 = config5.projectileOverrideName;
        end;

        v15.projectileNameOverride = config5;
        u10:createLocalProjectile(nil, ammoType, projectileType, positionFrom, projectileRefId, initialVelocity, v14, v15, v12);
    end);
    ClientSyncEvents.FireClientProjectile:connect(function(p16) -- Line: 119
        -- upvalues: u10 (copy)
        u10:createLocalProjectile(p16.projectileSource, p16.ammoType, p16.projectileType, p16.positionFrom, p16.projectileRefId, p16.initialVelocity, p16.launchData, p16.config);
    end);
end;

function u6.enableTargeting(u17, p18, p19, u20, p21, p22) -- Line: 123
    -- upvalues: ProjectileHandler (copy), KnitClient (copy), GameAnimationUtil (copy), Players (copy)
    if u17.isTargeting then
        u17:disableTargeting();
    end;

    local u23 = (u17.targetingId + 1) % 10000;
    u17.targetingId = u23;
    u17.isTargeting = true;
    local v24;

    if p22 == nil then
        v24 = p22;
    else
        v24 = p22.initialVelocityMultiplier;
    end;

    local v25;

    if p21 == nil then
        v25 = nil;
    else
        v25 = {
            inputObject = p21
        };
        local v26;

        if p21 == nil then
            v26 = p21;
        else
            v26 = p21.Position.X;
        end;

        if p21 ~= nil then
            p21 = p21.Position.Y;
        end;

        v25.initialPosition = Vector2.new(v26, p21);
    end;

    local v27;

    if p22 == nil then
        v27 = p22;
    else
        v27 = p22.lockedAimPoint;
    end;

    local v28;

    if p22 == nil then
        v28 = p22;
    else
        v28 = p22.startAtCenterOfCamera;
    end;

    local u29 = ProjectileHandler.new(1, v24 == nil and 1 or v24, p19, v25, nil, nil, nil, v27, u23, v28);

    if p22 ~= nil then
        p22 = p22.displayBeamDelay;
    end;

    task.delay(p22 == nil and 0 or p22, function() -- Line: 176
        -- upvalues: u17 (copy), u20 (copy), KnitClient (ref), GameAnimationUtil (ref), Players (ref), u23 (copy), u29 (copy)
        if not u17.isTargeting then
            return nil;
        end;

        local firstPerson = u20.firstPerson;

        if firstPerson ~= nil then
            firstPerson = firstPerson.aimAnimation;
        end;

        if firstPerson ~= 0 and (firstPerson == firstPerson and firstPerson) then
            local u30 = KnitClient.Controllers.ViewmodelController:playAnimation(u20.firstPerson.aimAnimation, {
                looped = true,
                fadeTime = 0.18
            });
            u17.targetingMaid:GiveTask(function() -- Line: 190
                -- upvalues: u30 (copy)
                local v31 = u30;

                if v31 ~= nil then
                    v31:Stop();
                end;
            end);
        end;

        local thirdPerson = u20.thirdPerson;

        if thirdPerson ~= nil then
            thirdPerson = thirdPerson.aimAnimation;
        end;

        if thirdPerson ~= 0 and (thirdPerson == thirdPerson and thirdPerson) then
            local u32 = GameAnimationUtil:playAnimation(Players.LocalPlayer, u20.thirdPerson.aimAnimation, {
                looped = true
            });
            u17.targetingMaid:GiveTask(function() -- Line: 205
                -- upvalues: u32 (copy)
                local v33 = u32;

                if v33 ~= nil then
                    v33:Stop();
                end;
            end);
        end;

        local thirdPerson2 = u20.thirdPerson;

        if thirdPerson2 ~= nil then
            thirdPerson2 = thirdPerson2.drawAnimation;
        end;

        if thirdPerson2 ~= 0 and (thirdPerson2 == thirdPerson2 and thirdPerson2) then
            local u34 = GameAnimationUtil:playAnimation(Players.LocalPlayer, u20.thirdPerson.drawAnimation, {
                looped = false
            });
            u17.targetingMaid:GiveTask(function() -- Line: 220
                -- upvalues: u34 (copy)
                local v35 = u34;

                if v35 ~= nil then
                    v35:Stop();
                end;
            end);
        end;

        u17:enableBeam(u23, u29, nil, u20.beamModifier);
    end);

    return u29;
end;

function u6.getLaunchPosition(p36, p37) -- Line: 231
    -- upvalues: Players (copy)
    local v38;

    if p37 == nil then
        v38 = p37;
    else
        v38 = p37:IsA("BasePart");
    end;

    if v38 then
        return p37.Head.BulletOrigin.WorldPosition;
    end;

    if p37 ~= nil then
        p37 = p37:FindFirstChild("Handle");

        if p37 ~= nil then
            p37 = p37:FindFirstChild("BulletOrigin");
        end;
    end;

    if p37 and p37:IsA("Attachment") then
        return p37.WorldPosition;
    end;

    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    return Character;
end;

function u6.disableTargeting(p39, p40) -- Line: 260
    p39.targetingMaid:DoCleaning();
    p39.isTargeting = false;
end;

u6.launchProjectile = RuntimeLib.async(function(p41, p42, p43, p44, p45, p46, p47, p48, p49) -- Line: 264
    -- upvalues: getItemSkinMeta (copy)
    local v50 = p41:calculateImportantLaunchValues(p44, false, p45);

    if not v50 then
        p41:disableTargeting();

        return nil;
    end;

    local v51 = p45:GetAttribute("ItemSkin");

    if v51 then
        local v52 = getItemSkinMeta(v51);

        if v52 then
            p46 = {};

            for i, v in p46 do
                p46[i] = v;
            end;

            local projectileSourceOverrides = v52.projectileSourceOverrides;

            if type(projectileSourceOverrides) == "table" then
                for i, v in projectileSourceOverrides do
                    p46[i] = v;
                end;
            end;
        end;
    end;

    return p41:launchProjectileWithValues(v50, p45, p46, p43, p47, p48, p49);
end);
u6.launchProjectileWithValues = RuntimeLib.async(function(p53, p54, u55, p56, u57, p58, p59, p60) -- Line: 289
    -- upvalues: ClientSyncEvents (copy), IdUtil (copy), SoundManager (copy), RandomUtil (copy), KnitClient (copy), GameAnimationUtil (copy), Players (copy), EntityUtil (copy), default2 (copy), Workspace (copy), RuntimeLib (copy)
    local v61 = p58 == nil and {} or p58;

    if not p54 then
        return nil;
    end;

    if ClientSyncEvents.PerformCombat:fire():isCancelled() then
        return nil;
    end;

    local v62 = IdUtil.generateId(8);
    local v63 = p59 or p56.projectileType(u57);
    local v64 = ClientSyncEvents.StartLaunchProjectile:fire(v63, p56);

    if v64:isCancelled() then
        return nil;
    end;

    local projectileType = v64.projectileType;
    local initialVelocity = p54.initialVelocity;
    local positionFrom = p54.positionFrom;
    local _ = p54.deltaT;
    local _ = p54.gravitationalAcceleration;
    local v65 = {};

    for i, v in v61 do
        v65[i] = v;
    end;

    v65.shotId = v62;
    v65.drawDurationSec = p54.drawDurationSeconds;
    local u66 = v65;

    if p56.launchSound then
        local launchSoundConfig = p56.launchSoundConfig;
        local v67;

        if launchSoundConfig == nil then
            v67 = launchSoundConfig;
        else
            v67 = launchSoundConfig.pitch;
        end;

        local v68;

        if p56 == nil then
            v68 = p56;
        else
            v68 = p56.launchSound;
        end;

        local v69 = RandomUtil.fromList(unpack(v68));
        local v70 = {};
        local v71;

        if v67 then
            v71 = math.random() * (v67.Max - v67.Min) + v67.Min;
        else
            v71 = nil;
        end;

        v70.playbackSpeedMultiplier = v71;

        if launchSoundConfig ~= nil then
            launchSoundConfig = launchSoundConfig.volumeMultiplier;
        end;

        v70.volumeMultiplier = launchSoundConfig == nil and 1 or launchSoundConfig;
        SoundManager:playSound(v69, v70);
    end;

    local launchOverlaySound = p56.launchOverlaySound;

    if launchOverlaySound ~= "" and launchOverlaySound then
        local launchSoundConfig = p56.launchSoundConfig;

        if launchSoundConfig ~= nil then
            launchSoundConfig = launchSoundConfig.launchOverlayPitch;
        end;

        local launchOverlaySound2 = p56.launchOverlaySound;
        local v72 = {};
        local v73;

        if launchSoundConfig then
            v73 = math.random() * (launchSoundConfig.Max - launchSoundConfig.Min) + launchSoundConfig.Min;
        else
            v73 = nil;
        end;

        v72.playbackSpeedMultiplier = v73;
        SoundManager:playSound(launchOverlaySound2, v72);
    end;

    local firstPerson = p56.firstPerson;

    if firstPerson ~= nil then
        firstPerson = firstPerson.fireAnimation;
    end;

    if firstPerson ~= 0 and (firstPerson == firstPerson and firstPerson) then
        KnitClient.Controllers.ViewmodelController:playAnimation(p56.firstPerson.fireAnimation, {
            fadeTime = 0.12
        });
    end;

    local thirdPerson = p56.thirdPerson;

    if thirdPerson ~= nil then
        thirdPerson = thirdPerson.fireAnimation;
    end;

    if thirdPerson ~= 0 and (thirdPerson == thirdPerson and thirdPerson) then
        GameAnimationUtil:playAnimation(Players.LocalPlayer, p56.thirdPerson.fireAnimation);
    end;

    local u74 = IdUtil.generateId(8);
    local v75 = p53:createLocalProjectile(p56, u57, projectileType, positionFrom, u74, initialVelocity, u66, nil, nil, u55);

    if v75 then
        local ProjectileLaunched = ClientSyncEvents.ProjectileLaunched;
        local v76 = EntityUtil:getLocalPlayerEntity();

        if v76 ~= nil then
            v76 = v76:getInstance();
        end;

        ProjectileLaunched:fire(projectileType, v75, initialVelocity, positionFrom, v76, u66);
    end;

    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if Character == nil then
        return nil;
    end;

    if p60 then
        return nil;
    end;

    local v77 = default2.Client:WaitFor("ProjectileFire");
    local v79 = RuntimeLib.await(v77:andThen(function(p78) -- Line: 403
        -- upvalues: u55 (copy), u57 (copy), projectileType (ref), positionFrom (copy), Character (copy), initialVelocity (copy), u74 (copy), u66 (ref), Workspace (ref)
        p78:CallServerAsync(u55, u57, projectileType, positionFrom, Character, initialVelocity, u74, u66, Workspace:GetServerTimeNow() - 0.045);
    end));

    if v79 and v79.PrimaryPart then
        return v79;
    end;

    return nil;
end);

function u6.createLocalProjectile(p80, p81, p82, p83, p84, u85, p86, p87, p88, p89, p90) -- Line: 412
    -- upvalues: ProjectileMeta (copy), Players (copy), ProjectileUtil (copy), EntityUtil (copy), SoundManager (copy), default2 (copy), ClientSyncEvents (copy)
    local u91;

    if p83 then
        u91 = ProjectileMeta[p83];
    else
        u91 = nil;
    end;

    local v92 = Players.LocalPlayer.Character:GetPrimaryPartCFrame();
    local v93;

    if p81 then
        v93 = p81.relativeOverride;
    elseif p88 == nil then
        v93 = p88;
    else
        v93 = p88.relativeOverride;
    end;

    local v94 = EntityUtil:getLocalPlayerEntity();
    local v95 = {};
    local v96;

    if p88 == nil then
        v96 = p88;
    else
        v96 = p88.projectileModel;
    end;

    v95.projectileModel = v96;
    local v97;

    if p88 == nil then
        v97 = p88;
    else
        v97 = p88.projectileNameOverride;
    end;

    v95.projectileName = v97;
    local v98;

    if p88 == nil then
        v98 = p88;
    else
        v98 = p88.projectileModelScale;
    end;

    v95.projectileModelScale = v98;
    local u99 = ProjectileUtil.createProjectile(v94, p83, p82, v92, v95);

    if not u99 then
        return nil;
    end;

    local v100;

    if u91 == nil then
        v100 = u91;
    else
        v100 = u91.useServerModel;
    end;

    if not v100 then
        ProjectileUtil.setupProjectileConstantOrientation(u99, Players.LocalPlayer, p87.shotId);
        local v101 = 1;
        local v102 = p87.drawDurationSec ~= nil;

        if v102 then
            if p81 == nil then
                v102 = p81;
            else
                v102 = p81.maxStrengthChargeSec;
            end;
        end;

        if v102 ~= 0 and (v102 == v102 and v102) then
            v101 = math.clamp(p87.drawDurationSec / p81.maxStrengthChargeSec, 0, 1);
        end;

        local v103;

        if p88 == nil then
            v103 = p88;
        else
            v103 = p88.launchSound;
        end;

        if v103 ~= "" and v103 then
            SoundManager:playSound(p88.launchSound, {
                position = p84
            });
        end;

        local v104 = p89 or EntityUtil:getLocalPlayerEntity();
        local v105;

        if u91 == nil then
            v105 = u91;
        else
            v105 = u91.gravitationalAcceleration;
        end;

        ProjectileUtil.fireProjectile(v104, u99, u85, p84, p86, v105 == nil and 196.2 or v105, function(p106, p107) -- Line: 493
            -- upvalues: EntityUtil (ref), default2 (ref), u85 (copy), ClientSyncEvents (ref), u99 (copy), u91 (copy)
            local v108 = EntityUtil:getEntityFromDescendant(p107);
            local v109 = default2.Client:Get("ProjectileHit");
            local v110;

            if v108 == nil then
                v110 = v108;
            else
                v110 = v108:getInstance();
            end;

            v109:SendToServer(u85, v110);
            ClientSyncEvents.LocalProjectileImpact:fire(u99, p106, v108, p107);
            local v111 = u91;

            if v111 ~= nil then
                v111 = v111.returnOnHit;
            end;

            local v112 = not v111;

            if v112 then
                local v113 = u91;

                if v113 ~= nil then
                    v113 = v113.keepProjectileOnHit;
                end;

                v112 = not (v113 and v108);
            end;

            if v112 then
                u99:Destroy();
            end;
        end, nil, p87, {
            relative = v93,
            drawPercent = v101,
            projectileSource = p90
        });

        return u99;
    end;

    u99:Destroy();
end;

function u6.calculateImportantLaunchValues(p114, p115, p116, p117, p118) -- Line: 533
    -- upvalues: Workspace (copy), Players (copy), u5 (copy)
    local v119 = p118 or p114:getLaunchPosition(p117);

    if not v119 then
        return nil;
    end;

    local v120 = p115:getProjectileMeta();
    local v121;

    if v120.getProjectileOverridesFunction then
        v121 = v120.getProjectileOverridesFunction(p115.player);
    else
        v121 = nil;
    end;

    local v122;

    if v121 == nil then
        v122 = v121;
    else
        v122 = v121.launchVelocityOverride;
    end;

    if v122 == nil then
        local launchVelocity = v120.launchVelocity;
        v122 = launchVelocity == nil and 100 or launchVelocity;
    end;

    local v123 = v122 * p115.velocityMultiplier;
    local gravitationalAcceleration = v120.gravitationalAcceleration;
    local v124 = (gravitationalAcceleration == nil and 196.2 or gravitationalAcceleration) * p115.gravityMultiplier;
    local v125;

    if v121 == nil then
        v125 = v121;
    else
        v125 = v121.lifetimeOverride;
    end;

    if v125 == nil then
        v125 = v120.lifetimeSec;
    end;

    if v121 ~= nil then
        v121 = v121.predictionLifetimeOverride;
    end;

    if v121 == nil then
        v121 = v120.predictionLifetimeSec;
    end;

    if p116 then
        v125 = v121;
    end;

    local CFrame2 = Workspace.CurrentCamera.CFrame;
    local v126 = v119 + p115.fromPositionOffset;
    local v127;

    if p115.targetPoint == nil or p115.lockedAimPoint then
        local v128 = Players.LocalPlayer:GetMouse();
        local v129 = Vector2.new(v128.X, v128.Y);
        local inputInfo = p115.inputInfo;

        if inputInfo then
            v129 = inputInfo.initialPosition;
        end;

        if p115.lockedAimPoint then
            v129 = p115.lockedAimPoint;
        end;

        if p115.startAtCenterOfCamera then
            local ViewportSize = Workspace.CurrentCamera.ViewportSize;
            v129 = Vector2.new(ViewportSize.X / 2, ViewportSize.Y / 2);
        end;

        local Unit = (Workspace.CurrentCamera:ScreenPointToRay(v129.X, v129.Y).Unit.Direction + Vector3.new(0, u5.YTargetOffset, 0)).Unit;
        v127 = (CFrame2.Position + Unit * ((CFrame2.Position - v126).Magnitude * u5.CameraMultiplier) - v126).Unit;
    else
        v127 = (p115.targetPoint - v126).Unit;
    end;

    return {
        initialVelocity = v127 * v123,
        positionFrom = v126,
        deltaT = v125 == nil and 3 or v125,
        gravitationalAcceleration = v124,
        drawDurationSeconds = p115.drawDurationSeconds
    };
end;

function u6.enableBeam(u130, u131, u132, u133, p134) -- Line: 630
    -- upvalues: u3 (copy), GameQueryUtil (copy), DeviceUtil (copy), CollectionService (copy), u2 (copy), Workspace (copy), RunService (copy), u5 (copy), default (copy)
    if u131 ~= u130.targetingId then
        return nil;
    end;

    local v135 = {
        Transparency = 1,
        CanCollide = false,
        Anchored = true,
        Parent = u130.projectileTargetingFolder
    };
    local u136 = u3("Part", v135);
    local u137 = u3("Part", v135);
    GameQueryUtil:setQueryIgnored(u136, true);
    GameQueryUtil:setQueryIgnored(u137, true);
    u130.targetingMaid:GiveTask(u136);
    u130.targetingMaid:GiveTask(u137);
    local v138 = u3("Attachment", {
        Parent = u136
    });
    local v139 = u3("Attachment", {
        Parent = u137
    });
    local v140 = DeviceUtil.isMobileControls() and 3 or 1;
    local v141 = {
        FaceCamera = true,
        Segments = 300,
        Brightness = 1,
        Attachment0 = v138,
        Attachment1 = v139
    };
    local v142;

    if p134 == nil then
        v142 = p134;
    else
        v142 = p134.color;
    end;

    local v143;

    if v142 then
        v143 = p134.color;
    else
        v143 = ColorSequence.new(Color3.fromRGB(255, 229, 127));
    end;

    v141.Color = v143;
    v141.Transparency = NumberSequence.new(0);
    v141.Width0 = v140 * 0.08;
    v141.Width1 = (0.08 + 2.22 * ((u136.Position - u137.Position).Magnitude / 100)) * v140;
    v141.Parent = u130.projectileTargetingFolder;
    local u144 = u3("Beam", v141);
    CollectionService:AddTag(u144, "projectile-preview-beam");
    u130.targetingMaid:GiveTask(u144);
    u2.new();
    local u145 = u132:getProjectileMeta();
    local Map = Workspace:FindFirstChild("Map");
    local u146 = RaycastParams.new();

    if Map then
        u146.FilterType = Enum.RaycastFilterType.Include;
        u146.FilterDescendantsInstances = { Map };
    end;

    local u147 = false;
    local u148 = Vector3.new(0, 0, 0);
    local u149 = Vector3.new(0, 0, 0);
    local u150 = nil;
    local u151 = Vector3.new(0, 0, 0);
    local u152 = nil;
    u130.targetingMaid:GiveTask(function() -- Line: 693
        -- upvalues: u130 (copy)
        if u130.hitIndicatorPart then
            u130.hitIndicatorPart.Transparency = 1;
        end;
    end);
    local v153 = u130:calculateImportantLaunchValues(u132, true, u133);
    local v154;

    if v153 == nil then
        v154 = v153;
    else
        v154 = v153.initialVelocity;
    end;

    local u155 = v154;
    local v156;

    if v153 == nil then
        v156 = v153;
    else
        v156 = v153.positionFrom;
    end;

    local u157 = v156;
    local v158;

    if v153 == nil then
        v158 = v153;
    else
        v158 = v153.deltaT;
    end;

    local u159 = v158;

    if v153 ~= nil then
        v153 = v153.gravitationalAcceleration;
    end;

    local u160 = v153;
    RunService:BindToRenderStep("projectile-beam-targeting", Enum.RenderPriority.Camera.Value + 1, function() -- Line: 720
        -- upvalues: u131 (copy), u130 (copy), u132 (copy), u133 (copy), u155 (ref), u157 (ref), u159 (ref), u160 (ref), u5 (ref), u136 (copy), u137 (copy), u144 (copy), u147 (ref), u145 (copy), u150 (ref), default (ref), u148 (ref), u149 (ref), u151 (ref), Workspace (ref), u152 (ref), u146 (copy), CollectionService (ref)
        if u131 ~= u130.targetingId then
            return nil;
        end;

        local v161 = u130:calculateImportantLaunchValues(u132, true, u133);

        if not v161 then
            u130:disableTargeting();

            return nil;
        end;

        u155 = v161.initialVelocity;
        u157 = v161.positionFrom;
        u159 = v161.deltaT;
        u160 = v161.gravitationalAcceleration;
        u157 = (CFrame.new(u157, u157 + u155) * CFrame.new((Vector3.new(u5.RelX, u5.RelY, u5.RelZ)))).Position;

        local function _(p162) -- Line: 744
            -- upvalues: u155 (ref), u157 (ref)
            return u155.X * p162 + u157.X;
        end;

        local function _(p163) -- Line: 747
            -- upvalues: u160 (ref), u155 (ref), u157 (ref)
            return -0.5 * u160 * p163 ^ 2 + u155.Y * p163 + u157.Y;
        end;

        local function _(p164) -- Line: 750
            -- upvalues: u155 (ref), u157 (ref)
            return u155.Z * p164 + u157.Z;
        end;

        local v165 = u159 / 2;
        local v166 = Vector3.new(u155.X * (u159 / 2) + u157.X, -0.5 * u160 * v165 ^ 2 + u155.Y * v165 + u157.Y, u155.Z * (u159 / 2) + u157.Z);
        local v167 = u159;
        local v168 = Vector3.new(u155.X * u159 + u157.X, -0.5 * u160 * v167 ^ 2 + u155.Y * v167 + u157.Y, u155.Z * u159 + u157.Z);
        local v169 = (v166 - u157 * 0.25 - v168 * 0.25) * 2;
        local v170 = v169 * 0.6666666666666666 + u157 * 0.3333333333333333;
        local v171 = v169 * 0.6666666666666666 + v168 * 0.3333333333333333;
        u136.CFrame = CFrame.new(u157, v170) * CFrame.Angles(0, 1.5707963267948966, 0);
        u137.CFrame = CFrame.new(v168, v171) * CFrame.Angles(0, -1.5707963267948966, 0);
        u144.CurveSize0 = (v170 - u136.Position).Magnitude;
        u144.CurveSize1 = (v171 - u137.Position).Magnitude;
        u144.Width1 = 0.08 + u5.BeamGrowthMultiplier * ((u136.Position - u137.Position).Magnitude / 100);
        u147 = false;

        if u145.showIndicatorAtAimingBeamHit then
            u150 = default.new({
                u157,
                v170,
                v166,
                v171,
                v168
            });
            local v172 = false;
            local v173 = 0;

            while true do
                if v172 then
                    v173 = v173 + 1;
                else
                    v172 = true;
                end;

                if v173 >= 10 then
                    break;
                end;

                u148 = u150:calculate(v173 / 10);
                u149 = u150:calculate((v173 + 1) / 10);
                u151 = u149 - u148;
                u152 = Workspace:Raycast(u148, u151.Unit * (u151.Magnitude * 0.97), u146);

                if u152 and not CollectionService:HasTag(u152.Instance, "DontBlockProjectileRaycast") then
                    u130:showHitIndicator(u152.Position, Color3.fromRGB(56, 194, 33), u145.hitIndicatorConfig, u145.customHitIndicator);
                    u147 = true;
                    break;
                end;
            end;

            if not u147 then
                u130:showHitIndicator(v168, Color3.fromRGB(199, 41, 41), u145.hitIndicatorConfig, u145.customHitIndicator);
            end;
        end;
    end);
    u130.targetingMaid:GiveTask(function() -- Line: 822
        -- upvalues: RunService (ref)
        return RunService:UnbindFromRenderStep("projectile-beam-targeting");
    end);
end;

function u6.showHitIndicator(p174, p175, p176, p177, p178) -- Line: 826
    -- upvalues: KnitClient (copy), u3 (copy), Workspace (copy)
    if p178 == "" or not p178 then
        if p174.hitIndicatorPart == nil then
            local v179 = {
                CastShadow = false,
                Anchored = true
            };
            local v180;

            if p177 == nil then
                v180 = p177;
            else
                v180 = p177.radius;
            end;

            v179.Size = (v180 == 0 or (v180 ~= v180 or not v180)) and Vector3.new(2, 2, 2) or Vector3.new(p177.radius, p177.radius, p177.radius);
            v179.TopSurface = Enum.SurfaceType.Smooth;
            v179.Material = Enum.Material.Neon;
            local v181;

            if p177 == nil then
                v181 = p177;
            else
                v181 = p177.color;
            end;

            if v181 == nil then
                v181 = p176;
            end;

            v179.Color = v181;
            v179.Position = p175;
            v179.CanCollide = false;
            v179.CanQuery = false;
            v179.CanTouch = false;
            v179.Shape = Enum.PartType.Ball;
            local v182;

            if p177 == nil then
                v182 = p177;
            else
                v182 = p177.transparency;
            end;

            v179.Transparency = v182 == nil and 0.5 or v182;
            p174.hitIndicatorPart = u3("Part", v179);
            p174.hitIndicatorPart.Parent = Workspace;
        end;

        p174.hitIndicatorPart:PivotTo(CFrame.new(p175));
        local v183;

        if p177 == nil then
            v183 = p177;
        else
            v183 = p177.color;
        end;

        if v183 ~= nil then
            p176 = v183;
        end;

        p174.hitIndicatorPart.Color = p176;

        if p177 ~= nil then
            p177 = p177.transparency;
        end;

        p174.hitIndicatorPart.Transparency = p177 == nil and 0.5 or p177;
    elseif p178 == "spirit_summoner" then
        KnitClient.Controllers.SpiritSummonerIndicatorController:showHitIndicator(p175, p174.targetingMaid);
    end;
end;

return {
    ProjectileController = KnitClient.CreateController(u6.new())
};
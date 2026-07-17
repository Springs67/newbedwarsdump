-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local UILayers = v1.UILayers;
local WatchCharacter = v1.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u4 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "screen-space");
local ScreenWidthToWorldWidth = u4.ScreenWidthToWorldWidth;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ArmorTrimEffectRank = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank").ArmorTrimEffectRank;
local CharacterUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "character", "character-util").CharacterUtil;
local InventoryEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "inventory-entity").InventoryEntity;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local LockerPreviewUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-preview-util").LockerPreviewUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local LockerPreviewFullscreen = RuntimeLib.import(script, script.Parent, "ui", "preview", "locker-preview-fullscreen").LockerPreviewFullscreen;
local LockerPreviewPlainBackground = RuntimeLib.import(script, script.Parent, "ui", "preview", "locker-preview-plain-background").LockerPreviewPlainBackground;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 40, Name: __tostring
        return "LockerPreviewController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 46
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 50
    -- upvalues: KnitController (copy), Workspace (copy), Players (copy), u2 (copy)
    KnitController.constructor(p7);
    p7.Name = "LockerPreviewController";
    p7.camera = Workspace.CurrentCamera;
    p7.initialCameraMaxZoom = Players.LocalPlayer.CameraMaxZoomDistance;
    p7.initialCameraMinZoom = Players.LocalPlayer.CameraMinZoomDistance;
    p7.initialOcclusionMode = Players.LocalPlayer.DevCameraOcclusionMode;
    p7.previewOpen = false;
    p7.isFullscreen = false;
    p7.effectsPlaying = false;
    p7.viewportOffsetBound = false;
    p7.previewAngle = CFrame.Angles(0, 3.141592653589793, 0);
    p7.previewOffset = Vector3.new(0, 0, 0);
    p7.previewWorldPosition = CFrame.new(10000, 10000, 10000);
    p7.backstageWorldPosition = CFrame.new(-10000, 10000, 10000);
    p7.previewMaid = u2.new();
    p7.fullscreenMaid = u2.new();
    p7.effectsMaid = u2.new();
end;

function u5.KnitStart(u8) -- Line: 69
    -- upvalues: KnitController (copy), Players (copy), ReplicatedStorage (copy), Workspace (copy), default (copy), ColorUtil (copy), ArmorTrimEffectRank (copy), WatchCharacter (copy), CharacterUtil (copy), KnitClient (copy), InventoryEntity (copy), GameAnimationUtil (copy), u2 (copy)
    KnitController.KnitStart(u8);
    task.spawn(function() -- Line: 72
        -- upvalues: u8 (copy), Players (ref)
        while not game:IsLoaded() do
            task.wait(0.5);
        end;

        u8.initialCameraMaxZoom = Players.LocalPlayer.CameraMaxZoomDistance;
        u8.initialCameraMinZoom = Players.LocalPlayer.CameraMinZoomDistance;
    end);
    u8.previewScene = ReplicatedStorage.Assets.Misc.LockerPreview:Clone();
    u8.previewScene.Parent = Workspace;
    u8.previewScene:PivotTo(u8.previewWorldPosition);
    u8:toggleLighting(false);
    u8:setFloorVisible(false);
    default.Client:Get("OpenArmorTrimEffectPreview"):Connect(function(p9) -- Line: 85
        -- upvalues: u8 (copy), ColorUtil (ref), ArmorTrimEffectRank (ref)
        u8:openPlainArmorTrimPreview({
            type = p9.armorTrimType,
            color = ColorUtil.WHITE,
            effectRank = ArmorTrimEffectRank.T7,
            effectType = p9.armorTrimEffectType,
            armorSet = p9.armorSet
        });
    end);
    WatchCharacter(function(u10, u11, p12) -- Line: 95
        -- upvalues: Players (ref), u8 (copy), Workspace (ref), CharacterUtil (ref), KnitClient (ref), InventoryEntity (ref), GameAnimationUtil (ref), u2 (ref)
        if u10.UserId ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        task.spawn(function() -- Line: 99
            -- upvalues: u10 (copy), u11 (copy), u8 (ref), Workspace (ref), CharacterUtil (ref), KnitClient (ref), InventoryEntity (ref), GameAnimationUtil (ref), u2 (ref)
            if u10 and not u10:HasAppearanceLoaded() then
                u10.CharacterAppearanceLoaded:Wait();
            end;

            u11:WaitForChild("HumanoidRootPart");
            u11.Archivable = true;
            u8.characterClone = u11:Clone();
            u8.characterClone.Name = u11.Name .. "_LockerPreviewClone";
            u8.characterClone.Parent = Workspace;
            CharacterUtil.sanitizeBedwarsChar(u8.characterClone);
            u8.characterClone:FindFirstChild("HumanoidRootPart").Anchored = true;
            u8.characterClone:PivotTo(u8.backstageWorldPosition);
            KnitClient.Controllers.NametagController:hideNametag(u8.characterClone);
            u8.cloneEntityInstance = u8.characterClone;
            u8.cloneInventoryEntity = InventoryEntity.new(u8.cloneEntityInstance);
            local v13 = GameAnimationUtil:getAnimationFromCharacter(u8.characterClone, "idle");

            if v13 then
                u8.characterClone.Humanoid.Animator:LoadAnimation(v13):Play();
            end;

            KnitClient.Controllers.EmoteHandlerController:hookEmoteHandlers(-1, u8.characterClone, u2.new());
        end);
    end);
end;

function u5.openPreview(u14, p15, p16) -- Line: 124
    -- upvalues: u2 (copy), KnitClient (copy), BedwarsImageId (copy), Players (copy), default (copy)
    local v17 = u2.new();

    if KnitClient.Controllers.SprintController:isSprinting() then
        KnitClient.Controllers.SprintController:stopSprinting(true, true);

        if u14.camera then
            u14.camera.FieldOfView = KnitClient.Controllers.FovController:getBaseFOV();
        end;
    end;

    local BackdropController = KnitClient.Controllers.BackdropController;
    local v18 = {
        fov = 35,
        cframe = u14.previewWorldPosition
    };
    local v19;

    if p16 == nil then
        v19 = p16;
    else
        v19 = p16.image;
    end;

    if v19 == nil then
        v19 = BedwarsImageId.BW_IN_GAME_ILLUSTRATION_BACKGROUND;
    end;

    v18.image = v19;
    local v20;

    if p16 == nil then
        v20 = p16;
    else
        v20 = p16.backgroundColor;
    end;

    v18.backgroundColor = v20;

    if p16 ~= nil then
        p16 = p16.imageTransparency;
    end;

    v18.imageTransparency = p16;
    BackdropController:setupBackdrop(v18);
    v17:GiveTask(function() -- Line: 162
        -- upvalues: KnitClient (ref)
        return KnitClient.Controllers.BackdropController:clearBackdrop();
    end);
    u14:setupPreviewCamera();
    v17:GiveTask(function() -- Line: 167
        -- upvalues: u14 (copy), Players (ref), KnitClient (ref), default (ref)
        if u14.camera then
            local _ = Players.LocalPlayer.Character;
            KnitClient.Controllers.CameraController:deregisterCameraSubject("locker-preview");
            u14.camera.FieldOfView = KnitClient.Controllers.FovController:getBaseFOV();
            Players.LocalPlayer.CameraMinZoomDistance = u14.initialCameraMinZoom;
            Players.LocalPlayer.CameraMaxZoomDistance = u14.initialCameraMaxZoom;
        end;

        default.Client:Get("ChangeCameraOcclusionMode"):SendToServer({
            occlusionMode = u14.initialOcclusionMode
        });
    end);

    if not p15 then
        u14:enableViewportOffset();
        v17:GiveTask(function() -- Line: 182
            -- upvalues: u14 (copy)
            return u14:disableViewportOffset();
        end);
    end;

    u14:resetCamera();
    u14.previewOpen = true;
    u14.previewMaid = v17;
end;

function u5.enableViewportOffset(u21) -- Line: 190
    -- upvalues: RunService (copy), ScreenWidthToWorldWidth (copy), u4 (copy)
    RunService:BindToRenderStep("viewport-offset", Enum.RenderPriority.Camera.Value + 2, function() -- Line: 191
        -- upvalues: u21 (copy), ScreenWidthToWorldWidth (ref), u4 (ref)
        if u21.camera then
            local v22 = ScreenWidthToWorldWidth(u4.ViewSizeX(), 1, 35) * 9.5;
            local CFrame2 = u21.camera.CFrame;
            local v23 = CFrame.new(v22 + u21.previewOffset.X, 0.5 + u21.previewOffset.Y, 5 + u21.previewOffset.Z);
            u21.camera.CFrame = CFrame2 * v23;
        end;
    end);
    u21.viewportOffsetBound = true;
end;

function u5.disableViewportOffset(p24) -- Line: 201
    -- upvalues: RunService (copy)
    if p24.viewportOffsetBound then
        RunService:UnbindFromRenderStep("viewport-offset");
        p24.viewportOffsetBound = false;
    end;
end;

function u5.setupPreviewCamera(p25) -- Line: 207
    -- upvalues: Players (copy), KnitClient (copy), default (copy)
    if p25.camera then
        p25:resetCamera();
        Players.LocalPlayer.CameraMaxZoomDistance = 27;
        Players.LocalPlayer.CameraMinZoomDistance = 27;
        local camera = p25.camera;

        if camera ~= nil then
            camera:PivotTo(CFrame.new(p25.camera:GetPivot().Position) * p25.previewAngle);
        end;

        local previewScene = p25.previewScene;

        if previewScene ~= nil then
            previewScene = previewScene:FindFirstChild("CameraSubject");
        end;

        KnitClient.Controllers.CameraController:registerCameraSubject("locker-preview", 100, previewScene);
        p25.camera.FieldOfView = 35;
    end;

    default.Client:Get("ChangeCameraOcclusionMode"):SendToServer({
        occlusionMode = Enum.DevCameraOcclusionMode.Invisicam
    });
end;

function u5.setupFullscreenCamera(p26) -- Line: 230
    -- upvalues: Players (copy)
    if p26.camera then
        p26:resetCamera();
        Players.LocalPlayer.CameraMinZoomDistance = 12;
        Players.LocalPlayer.CameraMaxZoomDistance = 12;
        Players.LocalPlayer.CameraMaxZoomDistance = 30;
        Players.LocalPlayer.CameraMinZoomDistance = 3;
        p26.camera.FieldOfView = 70;
    end;
end;

function u5.resetCamera(p27) -- Line: 241
    -- upvalues: Players (copy)
    if p27.camera then
        p27.camera.CameraType = Enum.CameraType.Scriptable;
        p27.camera.CameraType = Enum.CameraType.Custom;
        Players.LocalPlayer.CameraMaxZoomDistance = 27;
        Players.LocalPlayer.CameraMinZoomDistance = 27;
        local camera = p27.camera;

        if camera ~= nil then
            camera:PivotTo(CFrame.new(p27.camera:GetPivot().Position) * p27.previewAngle);
        end;
    end;
end;

function u5.setFloorVisible(p28, p29) -- Line: 256
    local previewScene = p28.previewScene;

    if previewScene ~= nil then
        previewScene = previewScene:FindFirstChild("Floor");
    end;

    if p29 and previewScene then
        previewScene.Transparency = 0;

        local function _(p30) -- Line: 265
            if p30:IsA("Texture") then
                p30.Transparency = 0;
            end;
        end;

        for i, child in previewScene:GetChildren() do
            local _ = i - 1;

            if child:IsA("Texture") then
                child.Transparency = 0;
            end;
        end;

        return;
    end;

    previewScene.Transparency = 1;

    local function _(p31) -- Line: 276
        if p31:IsA("Texture") then
            p31.Transparency = 1;
        end;
    end;

    for i, child in previewScene:GetChildren() do
        local _ = i - 1;

        if child:IsA("Texture") then
            child.Transparency = 1;
        end;
    end;
end;

function u5.closePreview(p32) -- Line: 286
    p32:cleanup();
    p32.previewMaid:DoCleaning();
    p32.previewOpen = false;
end;

function u5.isPreviewOpen(p33) -- Line: 291
    return p33.previewOpen;
end;

function u5.isEffectsPlaying(p34) -- Line: 294
    return p34.effectsPlaying;
end;

function u5.cleanup(p35) -- Line: 297
    -- upvalues: ClientSyncEvents (copy), KnitClient (copy)
    p35.effectsPlaying = false;
    p35.effectsMaid:DoCleaning();
    ClientSyncEvents.LockerPreviewEnded:fire();
    KnitClient.Controllers.BackgroundMusicController:setMusicPaused(false);
    p35:setFloorVisible(false);
end;

function u5.openFullscreenPreview(u36, p37, p38) -- Line: 304
    -- upvalues: u2 (copy), KnitClient (copy), Flamework (copy), UILayers (copy), LockerPreviewUtil (copy), LockerPreviewFullscreen (copy)
    local v39 = u2.new();
    KnitClient.Controllers.FovController:setFOVOverride("locker-fullscreen-preview", 70, 100);
    local v40 = not u36.previewOpen;

    if v40 then
        u36:openPreview(true);
        v39:GiveTask(function() -- Line: 310
            -- upvalues: u36 (copy)
            return u36:cleanup();
        end);
    else
        v39:GiveTask(function() -- Line: 314
            -- upvalues: u36 (copy)
            return u36:enableViewportOffset();
        end);
    end;

    KnitClient.Controllers.BackdropController:changeBackdropFov(70);

    if v40 then
        v39:GiveTask(function() -- Line: 320
            -- upvalues: KnitClient (ref)
            return KnitClient.Controllers.BackdropController:changeBackdropFov(35);
        end);
    end;

    if not p38.fromLocker then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.MAIN);
    end;

    local v41 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
    local v42 = {
        appId = LockerPreviewUtil.LOCKER_PREVIEW_FULLSCREEN_APP_ID,
        app = LockerPreviewFullscreen
    };
    local v43;

    if p38.fromLocker then
        v43 = UILayers.OVERLAY;
    else
        v43 = UILayers.MAIN;
    end;

    v42.layer = v43;
    v41:openApp(v42, {
        AppId = LockerPreviewUtil.LOCKER_PREVIEW_FULLSCREEN_APP_ID,
        FromLocker = p38.fromLocker,
        PreviewItem = p37,
        OnClose = p38.onClose
    });

    if p38.onOpen then
        p38.onOpen();
    end;

    u36.isFullscreen = true;
    u36.fullscreenMaid = v39;
    u36:disableViewportOffset();
    u36:setupFullscreenCamera();
    u36:preview(p37);
end;

function u5.openPlainArmorTrimPreview(u44, p45) -- Line: 346
    -- upvalues: Theme (copy), Flamework (copy), LockerPreviewUtil (copy), LockerPreviewPlainBackground (copy), UILayers (copy), KnitClient (copy)
    u44:closePlainArmorTrimPreview();
    u44:openPreview(true, {
        imageTransparency = 1,
        backgroundColor = Theme.backgroundTertiary
    });
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = LockerPreviewUtil.LOCKER_PREVIEW_PLAIN_BACKGROUND_APP_ID,
        app = LockerPreviewPlainBackground,
        layer = UILayers.MAIN
    }, {
        AppId = LockerPreviewUtil.LOCKER_PREVIEW_PLAIN_BACKGROUND_APP_ID,

        OnClose = function() -- Line: 358, Name: OnClose
            -- upvalues: u44 (copy)
            return u44:closePlainArmorTrimPreview();
        end
    });
    u44.isFullscreen = true;
    u44:disableViewportOffset();
    u44:setupFullscreenCamera();
    KnitClient.Controllers.BackdropController:changeBackdropFov(70);
    u44:preview({
        armorTrim = p45
    });
end;

function u5.closePlainArmorTrimPreview(p46) -- Line: 370
    -- upvalues: Flamework (copy), LockerPreviewUtil (copy), KnitClient (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(LockerPreviewUtil.LOCKER_PREVIEW_PLAIN_BACKGROUND_APP_ID) then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(LockerPreviewUtil.LOCKER_PREVIEW_PLAIN_BACKGROUND_APP_ID);
    end;

    if p46.previewOpen then
        p46:closePreview();
    end;

    p46.isFullscreen = false;
    KnitClient.Controllers.FovController:removeFOVOverride("locker-fullscreen-preview");
end;

function u5.closeFullscreenPreview(p47, p48) -- Line: 380
    -- upvalues: KnitClient (copy), Flamework (copy), LockerPreviewUtil (copy)
    KnitClient.Controllers.FovController:removeFOVOverride("locker-fullscreen-preview");
    p47.fullscreenMaid:DoCleaning();
    p47:resetCamera();
    p47:setupPreviewCamera();

    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(LockerPreviewUtil.LOCKER_PREVIEW_FULLSCREEN_APP_ID) then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(LockerPreviewUtil.LOCKER_PREVIEW_FULLSCREEN_APP_ID);
    end;

    p47.isFullscreen = false;

    if p48 then
        p48();
    end;
end;

function u5.preview(p49, p50, p51) -- Line: 393
    -- upvalues: ClientSyncEvents (copy), KnitClient (copy)
    if not p49.previewOpen then
        p49:openPreview();
    end;

    p49:cleanup();
    p49.effectsPlaying = true;
    ClientSyncEvents.LockerPreviewStarted:fire();

    if p50.killEffect then
        KnitClient.Controllers.BackgroundMusicController:setMusicPaused(true);
        p49.effectsMaid = KnitClient.Controllers.KillEffectPreviewController:previewKillEffect(p50.killEffect);
    elseif p50.bedBreakEffect then
        KnitClient.Controllers.BackgroundMusicController:setMusicPaused(true);
        p49.effectsMaid = KnitClient.Controllers.BedBreakEffectPreviewController:previewBedBreakEffect(p50.bedBreakEffect);
    elseif p50.bedSkin then
        p49.effectsMaid = KnitClient.Controllers.BedSkinPreviewController:previewBedSkin(p50.bedSkin);
    elseif p50.itemSkin then
        p49.effectsMaid = KnitClient.Controllers.BedSkinPreviewController:previewBedSkin(p50.itemSkin);
    elseif p50.lobbyGadget then
        if p49.characterClone then
            p49.effectsMaid = KnitClient.Controllers.LobbyGadgetPreviewController:previewLobbyGadget(p50.lobbyGadget, p49.characterClone, p49.cloneInventoryEntity);
        end;
    elseif p50.emote then
        if p49.characterClone then
            KnitClient.Controllers.BackgroundMusicController:setMusicPaused(true);
            p49.effectsMaid = KnitClient.Controllers.EmotePreviewController:previewEmote(p50.emote, p49.characterClone);
        end;
    elseif p50.armorTrim then
        p49.effectsMaid = KnitClient.Controllers.KitPreviewController:previewArmorTrim(p50.armorTrim);
    elseif p50.kit and not p50.kitSkin then
        if p49.characterClone then
            p49.effectsMaid = KnitClient.Controllers.KitPreviewController:previewKit({
                kind = "kit",
                kit = p50.kit
            }, p49.characterClone);
        end;
    elseif p50.kitSkin and p49.characterClone then
        p49.effectsMaid = KnitClient.Controllers.KitPreviewController:previewKit({
            kind = "kitSkin",
            kitSkin = p50.kitSkin,
            kit = p50.kit
        }, p49.characterClone);
    end;

    if not (p49.isFullscreen or p51) then
        p49:resetCamera();
    end;
end;

function u5.setPreviewAngle(p52, p53) -- Line: 441
    p52.previewAngle = p53;
end;

function u5.setPreviewOffset(p54, p55) -- Line: 444
    p54.previewOffset = p55;
end;

function u5.getBackstageWorldPosition(p56) -- Line: 447
    return p56.backstageWorldPosition;
end;

function u5.getPreviewDummyPosition(p57) -- Line: 450
    local previewScene = p57.previewScene;

    if previewScene ~= nil then
        previewScene = previewScene:FindFirstChild("DummyPosition");
    end;

    return previewScene.WorldPosition;
end;

function u5.getBedAttachment(p58) -- Line: 457
    local previewScene = p58.previewScene;

    if previewScene ~= nil then
        previewScene = previewScene:FindFirstChild("BedPosition");
    end;

    return previewScene;
end;

function u5.getBedCenterAttachment(p59) -- Line: 464
    local previewScene = p59.previewScene;

    if previewScene ~= nil then
        previewScene = previewScene:FindFirstChild("BedCenterPosition");
    end;

    return previewScene;
end;

function u5.getCameraSubject(p60) -- Line: 471
    local previewScene = p60.previewScene;

    if previewScene ~= nil then
        previewScene = previewScene:FindFirstChild("CameraSubject");
    end;

    return previewScene;
end;

function u5.toggleLighting(p61, p62) -- Line: 478
    local previewScene = p61.previewScene;

    if previewScene ~= nil then
        previewScene = previewScene:FindFirstChild("BackLighting");

        if previewScene ~= nil then
            previewScene = previewScene:FindFirstChild("PointLight");
        end;
    end;

    local previewScene2 = p61.previewScene;

    if previewScene2 ~= nil then
        previewScene2 = previewScene2:FindFirstChild("Lighting");

        if previewScene2 ~= nil then
            previewScene2 = previewScene2:FindFirstChild("PointLight");
        end;
    end;

    previewScene2.Brightness = 0.5;

    if previewScene then
        previewScene.Enabled = p62;
    end;

    if previewScene2 then
        previewScene2.Enabled = p62;
    end;
end;

KnitClient.CreateController(u5.new());

return nil;
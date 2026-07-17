-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v6.CollectionService;
local ContextActionService = v6.ContextActionService;
local Players = v6.Players;
local RunService = v6.RunService;
local TweenService = v6.TweenService;
local Workspace = v6.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "cannon-constants");
local CANNON_COLLECTION_TAGS = v7.CANNON_COLLECTION_TAGS;
local TNTLoadResult = v7.TNTLoadResult;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ActiveCannonHud = RuntimeLib.import(script, script.Parent, "ui", "active-cannon-hud").ActiveCannonHud;
local CannonBillboard = RuntimeLib.import(script, script.Parent, "ui", "cannon-billboard").CannonBillboard;
local u8 = { "Aim", "Aim & Fire" };
local u9 = {
    mounted = {
        cameraMinZoomDistance = 6.5,
        cameraMaxZoomDistance = 6.5
    },
    unmounted = {
        cameraMinZoomDistance = 0,
        cameraMaxZoomDistance = 14
    }
};
local u10 = TweenInfo.new(0.2, Enum.EasingStyle.Linear);
local v11 = setmetatable({}, {
    __tostring = function() -- Line: 52, Name: __tostring
        return "BaseCannonController";
    end,

    __index = KnitController
});
v11.__index = v11;

function v11.constructor(p12, p13) -- Line: 58
    -- upvalues: KnitController (copy), u3 (copy)
    KnitController.constructor(p12);
    p12.Name = "BaseCannonController";
    p12.cleanupMaid = u3.new();
    p12.updateAccumulator = 0;
    p12.cannonConfig = p13;
end;

function v11.KnitStart(u14) -- Line: 65
    -- upvalues: WatchCollectionTag (copy), default (copy)
    WatchCollectionTag("cannon-type", function(p15) -- Line: 67
        -- upvalues: u14 (copy)
        if u14:isRelevantCannon(p15) and not u14:isBlockClientPredicted(p15) then
            u14:setupUI(p15);
            u14:updateCannon(p15);
            u14:offsetCannonCamera(p15);
            u14:startAutoFire(p15);

            if not u14:isFriendlyCannon(p15) then
                u14:highlightCannon(p15);
            end;
        end;
    end);
    default.Client:WaitFor("CannonSuccessfullyFired"):expect():Connect(function(p16) -- Line: 84
        -- upvalues: u14 (copy)
        if u14:isRelevantCannon(p16.cannon) then
            u14:preFire(p16.player, p16.cannon);
        end;
    end);
    default.Client:WaitFor("CannonLoadTNTResult"):expect():Connect(function(p17) -- Line: 89
        -- upvalues: u14 (copy)
        if u14:isRelevantCannon(p17.cannon) then
            u14:handleLoadResult(p17.result);
        end;
    end);
end;

function v11.setupUI(p18, p19) -- Line: 95
    p18:createCannonBillboard(p19);
    p18:createOperatePrompt(p19);
    p18:createAmmoLoadPrompt(p19);
end;

function v11.updateCannon(u20, u21) -- Line: 100
    -- upvalues: TweenService (copy), u10 (copy)
    local u26 = u21:GetAttributeChangedSignal("LookVector"):Connect(function() -- Line: 101
        -- upvalues: u21 (copy), u20 (copy), TweenService (ref), u10 (ref)
        local v22 = u21:GetAttribute("LookVector");

        if not v22 then
            return nil;
        end;

        if not (u21.Base and u21.Barrel) then
            return nil;
        end;

        local cannonConfig = u20.cannonConfig;

        if cannonConfig ~= nil then
            cannonConfig = cannonConfig.axesInverted;
        end;

        local v23 = cannonConfig and -90 or 180;
        local v24 = CFrame.new(u21.Base.Position, u21.Base.Position + v22 * Vector3.new(1, 0, 1)) * CFrame.Angles(0, math.rad(v23), 0);
        TweenService:Create(u21.Base, u10, {
            CFrame = v24
        }):Play();
        local v25 = CFrame.new(u21.Barrel.Position, u21.Barrel.Position + v22) * CFrame.Angles(0, math.rad(v23), 0);
        TweenService:Create(u21.Barrel, u10, {
            CFrame = v25
        }):Play();
    end);
    local u27 = nil;
    u27 = u21.AncestryChanged:Connect(function(p28, p29) -- Line: 138
        -- upvalues: u26 (copy), u27 (ref)
        if not p29 then
            u26:Disconnect();
            u27:Disconnect();
        end;
    end);
end;

function v11.offsetCannonCamera(p30, p31) -- Line: 145
    p31.Camera.Position = p31.Camera.Position + Vector3.new(0, 2, 0);
end;

function v11.handleLoadResult(p32, p33) -- Line: 150
    -- upvalues: TNTLoadResult (copy), GameSound (copy), SoundManager (copy)
    local v34;

    if p33 == TNTLoadResult.SUCCESS then
        v34 = GameSound.INFO_NOTIFICATION;
    else
        v34 = GameSound.ERROR_NOTIFICATION;
    end;

    SoundManager:playSound(v34, {
        position = nil
    });
end;

function v11.startAutoFire(u35, u36) -- Line: 156
    local autoFire = u35.cannonConfig.autoFire;

    if not autoFire then
        return nil;
    end;

    task.spawn(function() -- Line: 161
        -- upvalues: autoFire (copy), u36 (copy), u35 (copy)
        while true do
            local v37 = task.wait(autoFire.fireInterval);

            if v37 == 0 or (v37 ~= v37 or not (v37 and (u36 and u36.Parent))) then
                break;
            end;

            u35:requestCannonFire(u36);
        end;
    end);
end;

function v11.createCannonBillboard(p38, p39) -- Line: 174
    -- upvalues: u5 (copy), CannonBillboard (copy)
    u5.mount(u5.createElement(CannonBillboard, {
        config = p38.cannonConfig,
        cannon = p39
    }), p39);
end;

function v11.createOperatePrompt(u40, u41) -- Line: 180
    -- upvalues: KnitClient2 (copy), u8 (copy), CollectionService (copy), CANNON_COLLECTION_TAGS (copy), Players (copy)
    local cannonConfig = u40.cannonConfig;

    if cannonConfig ~= nil then
        cannonConfig = cannonConfig.isAimable;
    end;

    local v42 = not cannonConfig;

    if v42 then
        v42 = u40.cannonConfig;

        if v42 ~= nil then
            v42 = v42.autoFire;
        end;
    end;

    if v42 then
        return nil;
    end;

    local ProximityPromptController = KnitClient2.Controllers.ProximityPromptController;
    local v43 = {
        Name = "OperatePrompt",
        HoldDuration = 0.4,
        RequiresLineOfSight = false,
        MaxActivationDistance = 10,
        ClickablePrompt = false,
        UIOffset = Vector2.new(0, -40)
    };
    local cannonConfig2 = u40.cannonConfig;

    if cannonConfig2 ~= nil then
        cannonConfig2 = cannonConfig2.autoFire;
    end;

    local v44;

    if cannonConfig2 then
        v44 = u8[1];
    else
        v44 = u8[2];
    end;

    v43.ActionText = v44;
    v43.Parent = u41;
    local v45 = ProximityPromptController:createProximityPrompt(v43);
    CollectionService:AddTag(v45, CANNON_COLLECTION_TAGS.proximity);
    v45.Triggered:Connect(function(p46) -- Line: 215
        -- upvalues: Players (ref), u40 (copy), u41 (copy)
        if p46 == Players.LocalPlayer then
            u40:operateCannon(u41);
        end;
    end);
end;

function v11.highlightCannon(p47, p48) -- Line: 221
    -- upvalues: u4 (copy)
    local v49 = { p48.Base, p48.Barrel };

    local function v51(p50) -- Line: 223
        -- upvalues: u4 (ref)
        u4("Highlight", {
            OutlineTransparency = 0.1,
            FillTransparency = 0.6,
            Adornee = p50,
            OutlineColor = Color3.fromRGB(255, 0, 0),
            FillColor = Color3.fromRGB(255, 0, 0),
            DepthMode = Enum.HighlightDepthMode.AlwaysOnTop,
            Parent = p50
        });
    end;

    for i, v in v49 do
        v51(v, i - 1, v49);
    end;
end;

function v11.operateCannon(p52, p53) -- Line: 238
    p52:setPromptVisibility(false);
    p52:setBillboardVisibility(false);
    p52:toggleMovement(false);
    p52:setCharacterVisible(false);
    p52:setCannonTransparency(p53, 0.8);
    p52:setCameraTargetCannon(p53);
    p52:mountActiveHud(p53);
    p52:handleAiming(p53);
end;

function v11.stopOperatingCannon(p54, p55) -- Line: 248
    p54:setPromptVisibility(true);
    p54:setBillboardVisibility(true);
    p54:toggleMovement(true);
    p54:setCharacterVisible(true);
    p54:setCannonTransparency(p55, 0);
    p54:setCameraTargetHumanoid();
    p54:unmountActiveHud();
end;

function v11.requestCannonFire(p56, p57) -- Line: 257
    -- upvalues: default (copy)
    default.Client:Get("CannonFireRequest"):SendToServer({
        cannon = p57
    });
end;

function v11.handleAiming(u58, u59) -- Line: 262
    -- upvalues: RunService (copy), Workspace (copy), default (copy), Players (copy)
    u58:setCameraToCannon(u59);
    local u62 = RunService.Heartbeat:Connect(function(p60) -- Line: 264
        -- upvalues: u58 (copy), Workspace (ref), default (ref), u59 (copy)
        local v61 = u58;
        v61.updateAccumulator = v61.updateAccumulator + p60;

        if u58.updateAccumulator >= 0.2 then
            local CurrentCamera = Workspace.CurrentCamera;

            if CurrentCamera ~= nil then
                CurrentCamera = CurrentCamera.CFrame;
            end;

            local CurrentCamera2 = Workspace.CurrentCamera;

            if CurrentCamera2 ~= nil then
                CurrentCamera2 = CurrentCamera2.CFrame.LookVector;
            end;

            if not (CurrentCamera2 and CurrentCamera) then
                u58.updateAccumulator = 0;

                return nil;
            end;

            default.Client:Get("CannonLookVectorUpdate"):SendToServer({
                cannon = u59,
                cameraCFrame = CurrentCamera,
                lookVector = CurrentCamera2
            });
            u58.updateAccumulator = 0;
        end;
    end);
    local u65 = u59.AncestryChanged:Connect(function(p63, p64) -- Line: 291
        -- upvalues: u58 (copy)
        if not p64 then
            u58.cleanupMaid:DoCleaning();
        end;
    end);
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:WaitForChild("Humanoid");
    end;

    local u66 = Character.Died:Connect(function() -- Line: 301
        -- upvalues: u58 (copy)
        u58.cleanupMaid:DoCleaning();
    end);
    u58.cleanupMaid:GiveTask(function() -- Line: 304
        -- upvalues: u65 (copy), u62 (copy), u66 (copy), u58 (copy), u59 (copy)
        u65:Disconnect();
        u62:Disconnect();
        u66:Disconnect();
        u58:stopOperatingCannon(u59);
    end);
end;

function v11.setCannonTransparency(p67, p68, p69) -- Line: 311
    if p68 and (p68.Parent and (p68.Base and p68.Barrel)) then
        p68.Base.Transparency = p69;
        p68.Barrel.Transparency = p69;
    end;
end;

function v11.setCameraToCannon(p70, p71) -- Line: 317
    -- upvalues: Workspace (copy)
    local v72 = p71:GetAttribute("LastCameraCFrame");

    if v72 == "" or not v72 then
        return nil;
    end;

    local v73 = string.split(v72, ",");

    local function _(p74) -- Line: 325
        return tonumber(p74);
    end;

    local v75 = table.create(#v73);

    for i, v in v73 do
        local _ = i - 1;
        v75[i] = tonumber(v);
    end;

    local v76 = CFrame.new(v75[1], v75[2], v75[3], v75[4], v75[5], v75[6], v75[7], v75[8], v75[9], v75[10], v75[11], v75[12]);
    Workspace.CurrentCamera.CFrame = v76;
end;

function v11.setCameraTargetCannon(p77, p78) -- Line: 338
    -- upvalues: Workspace (copy), Players (copy), u9 (copy)
    Workspace.CurrentCamera.CameraSubject = p78.Camera;
    Players.LocalPlayer.CameraMinZoomDistance = u9.mounted.cameraMinZoomDistance;
    Players.LocalPlayer.CameraMaxZoomDistance = u9.mounted.cameraMaxZoomDistance;
end;

function v11.setCameraTargetHumanoid(p79) -- Line: 343
    -- upvalues: Players (copy), Workspace (copy), u9 (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:FindFirstChild("Humanoid");
    end;

    Workspace.CurrentCamera.CameraSubject = Character;
    Players.LocalPlayer.CameraMinZoomDistance = u9.unmounted.cameraMinZoomDistance;
    Players.LocalPlayer.CameraMaxZoomDistance = u9.unmounted.cameraMaxZoomDistance;
end;

function v11.createAmmoLoadPrompt(p80, u81) -- Line: 352
    -- upvalues: KnitClient2 (copy), CollectionService (copy), CANNON_COLLECTION_TAGS (copy), Players (copy), default (copy)
    local v82 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
        Name = "AmmoPrompt",
        HoldDuration = 0.4,
        RequiresLineOfSight = false,
        MaxActivationDistance = 10,
        ClickablePrompt = false,
        ActionText = "Load TNT",
        UIOffset = Vector2.new(0, 40),
        KeyboardKeyCode = Enum.KeyCode.X,
        Parent = u81
    });
    CollectionService:AddTag(v82, CANNON_COLLECTION_TAGS.proximity);
    v82.Triggered:Connect(function(p83) -- Line: 365
        -- upvalues: Players (ref), default (ref), u81 (copy)
        if p83 == Players.LocalPlayer then
            default.Client:Get("CannonLoadTNT"):SendToServer({
                cannon = u81
            });
        end;
    end);
end;

function v11.setPromptVisibility(p84, u85) -- Line: 373
    -- upvalues: CollectionService (copy), CANNON_COLLECTION_TAGS (copy)
    local function _(p86) -- Line: 375
        -- upvalues: u85 (copy)
        p86.Enabled = u85;
    end;

    for i, v in CollectionService:GetTagged(CANNON_COLLECTION_TAGS.proximity) do
        local _ = i - 1;
        v.Enabled = u85;
    end;
end;

function v11.setBillboardVisibility(p87, u88) -- Line: 383
    -- upvalues: CollectionService (copy), CANNON_COLLECTION_TAGS (copy)
    local function _(p89) -- Line: 385
        -- upvalues: u88 (copy)
        p89.Enabled = u88;
    end;

    for i, v in CollectionService:GetTagged(CANNON_COLLECTION_TAGS.billboard) do
        local _ = i - 1;
        v.Enabled = u88;
    end;
end;

function v11.toggleMovement(p90, p91) -- Line: 393
    -- upvalues: ContextActionService (copy), Players (copy)
    if p91 then
        local function _(p92) -- Line: 415
            -- upvalues: ContextActionService (ref)
            ContextActionService:UnbindAction("freeze-movement" .. "-" .. p92.Name);
        end;

        for i, v in Enum.PlayerActions:GetEnumItems() do
            local _ = i - 1;
            ContextActionService:UnbindAction("freeze-movement" .. "-" .. v.Name);
        end;

        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        if Character then
            Players.LocalPlayer.Character.PrimaryPart.Anchored = false;
        end;
    else
        local function _(p93) -- Line: 397
            -- upvalues: ContextActionService (ref)
            ContextActionService:BindAction("freeze-movement" .. "-" .. p93.Name, function() -- Line: 398
                return Enum.ContextActionResult.Sink;
            end, false, p93);
        end;

        for i, v in Enum.PlayerActions:GetEnumItems() do
            local _ = i - 1;
            ContextActionService:BindAction("freeze-movement" .. "-" .. v.Name, function() -- Line: 398
                return Enum.ContextActionResult.Sink;
            end, false, v);
        end;

        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        if Character then
            Players.LocalPlayer.Character.PrimaryPart.Anchored = true;
        end;
    end;
end;

function v11.setCharacterVisible(p94, p95) -- Line: 431
    -- upvalues: KnitClient (copy), Players (copy)
    KnitClient.Controllers.InvisibilityPotionController:setTransparencyOfCharacter(Players.LocalPlayer.Character, p95 and 0 or 1);
end;

function v11.mountActiveHud(u96, u97) -- Line: 434
    -- upvalues: u5 (copy), ActiveCannonHud (copy), Players (copy)
    u96.activeHud = u5.mount(u5.createElement(ActiveCannonHud, {
        cannon = u97,
        config = u96.cannonConfig,

        unmount = function() -- Line: 438, Name: unmount
            -- upvalues: u96 (copy), u97 (copy)
            u96:stopOperatingCannon(u97);
            u96.cleanupMaid:DoCleaning();
        end,

        requestFire = function(p98) -- Line: 442, Name: requestFire
            -- upvalues: u96 (copy)
            u96:requestCannonFire(p98);
        end
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
end;

function v11.unmountActiveHud(p99) -- Line: 447
    -- upvalues: u5 (copy)
    if p99.activeHud then
        u5.unmount(p99.activeHud);
    end;
end;

function v11.isRelevantCannon(p100, p101) -- Line: 452
    local cannonConfig = p100.cannonConfig;

    if cannonConfig ~= nil then
        cannonConfig = cannonConfig.cannonType;
    end;

    return cannonConfig == p101.Name;
end;

function v11.isBlockClientPredicted(p102, p103) -- Line: 459
    return p103:GetAttribute("ClientPlaced");
end;

function v11.isFriendlyCannon(p104, p105) -- Line: 462
    -- upvalues: Players (copy)
    local v106 = Players:GetPlayerByUserId((p105:GetAttribute("PlacedByUserId")));

    if v106 ~= nil then
        v106 = v106.Team;

        if v106 ~= nil then
            v106 = v106.Name;
        end;
    end;

    local Team = Players.LocalPlayer.Team;

    if Team ~= nil then
        Team = Team.Name;
    end;

    return v106 == Team;
end;

function v11.isLocalPlayer(p107, p108) -- Line: 478
    -- upvalues: Players (copy)
    return p108.UserId == Players.LocalPlayer.UserId;
end;

function v11.preFire(p109, p110, p111) -- Line: 481
    p109:playCannonSound(p110, p111);
    p109:playScreenShake(p110, p111);
    p109:onFire(p110, p111);
end;

function v11.playCannonSound(p112, p113, p114) -- Line: 486
    -- upvalues: SoundManager (copy), GameSound (copy)
    local cannonConfig = p112.cannonConfig;

    if cannonConfig ~= nil then
        cannonConfig = cannonConfig.autoFire;
    end;

    if cannonConfig then
        SoundManager:playSound(GameSound.CANNON_FIRE, {
            position = p114.Position
        });

        return nil;
    end;

    local CANNON_FIRE = GameSound.CANNON_FIRE;
    local v115 = {};
    local v116;

    if p112:isLocalPlayer(p113) then
        v116 = nil;
    else
        v116 = p114.Position;
    end;

    v115.position = v116;
    SoundManager:playSound(CANNON_FIRE, v115);
end;

function v11.playScreenShake(p117, p118, p119) -- Line: 502
    -- upvalues: KnitClient (copy)
    local cannonConfig = p117.cannonConfig;

    if cannonConfig ~= nil then
        cannonConfig = cannonConfig.autoFire;
    end;

    if cannonConfig then
        return nil;
    end;

    if p117:isLocalPlayer(p118) then
        KnitClient.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -2, 0));
    end;
end;

return {
    BaseCannonController = v11
};
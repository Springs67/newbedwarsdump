-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local MobileTouchType = v1.MobileTouchType;
local SoundManager = v1.SoundManager;
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "device-util").DeviceUtil;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local RunService = v4.RunService;
local UserInputService = v4.UserInputService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local DrillCameraViewWrapper = RuntimeLib.import(script, script.Parent, "ui", "drill-camera-view").DrillCameraViewWrapper;
local DrillCountDisplay = RuntimeLib.import(script, script.Parent, "ui", "drill-count-ui").DrillCountDisplay;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "DrillTabletController";
    end,

    __index = HandKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 39
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 43
    -- upvalues: HandKnitController (copy), Workspace (copy), DeviceUtil (copy)
    HandKnitController.constructor(p7);
    p7.Name = "DrillTabletController";
    p7.drillList = {};
    p7.camera = Workspace.CurrentCamera;
    p7.index = -1;
    p7.isFirstPerson = false;
    p7.lastAttackTime = -1;
    p7.YTargetOffset = DeviceUtil.isMobileControls() and 0.25 or 0.05;
    p7.playerAnimationMap = {};
end;

function u5.isRelevantItem(p8, p9) -- Line: 54
    -- upvalues: ItemType (copy)
    return p9.itemType == ItemType.DRILL_CONTROLLER;
end;

function u5.onEnable(u10, p11, p12) -- Line: 57
    -- upvalues: KnitClient (copy), u3 (copy), DrillCountDisplay (copy), Flamework (copy), MobileTouchType (copy), CreateRoduxApp (copy), DrillCameraViewWrapper (copy)
    u10:setupYield(function() -- Line: 58
        -- upvalues: KnitClient (ref), u10 (copy), u3 (ref), DrillCountDisplay (ref)
        local StatusInfoListController = KnitClient.Controllers.StatusInfoListController;
        local v13 = 0;
        local v14 = {};

        for _ in u10.drillList do
            v13 = v13 + 1;
        end;

        v14.count = v13;
        u10.drillCountTree = StatusInfoListController:waitForSetupAddElement(u3.createElement(DrillCountDisplay, v14));

        return function() -- Line: 69
            -- upvalues: u10 (ref), u3 (ref)
            if u10.drillCountTree then
                u3.unmount(u10.drillCountTree);
            end;
        end;
    end);
    local v15 = 0;

    for _ in u10.drillList do
        v15 = v15 + 1;
    end;

    if v15 == 0 then
        return nil;
    end;

    u10.index = 0;
    local u19 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "Drill Attack",

        boundFunction = function(p16, p17, p18) -- Line: 89, Name: boundFunction
            -- upvalues: u10 (copy)
            u10:attack();
        end,

        mobile = {
            touchType = MobileTouchType.TouchTap,

            mobileBoundFunction = function() -- Line: 94, Name: mobileBoundFunction
                -- upvalues: u10 (copy)
                u10:attack();
            end
        }
    });
    u10:setupYield(function() -- Line: 99
        -- upvalues: u10 (copy), CreateRoduxApp (ref), DrillCameraViewWrapper (ref), u19 (copy)
        u10:nextDrill();
        u10.tree = CreateRoduxApp("EngineerCameraView", DrillCameraViewWrapper);

        return function() -- Line: 102
            -- upvalues: u10 (ref), u19 (ref)
            u10:exitDrill();
            u19:DoCleaning();
        end;
    end);
end;

function u5.onDisable(p20) -- Line: 108
    p20:exitDrill();
end;

function u5.KnitStart(u21) -- Line: 111
    -- upvalues: HandKnitController (copy), CollectionService (copy), Players (copy), u3 (copy), DrillCountDisplay (copy), default (copy), GameAnimationUtil (copy), AnimationType (copy), KnitClient (copy), RunService (copy), KnitClient2 (copy), UserInputService (copy), ClientSyncEvents (copy)
    HandKnitController.KnitStart(u21);
    CollectionService:GetInstanceAddedSignal("Drill"):Connect(function(p22) -- Line: 113
        -- upvalues: Players (ref), u21 (copy), u3 (ref), DrillCountDisplay (ref)
        if p22:GetAttribute("PlacedByUserId") == Players.LocalPlayer.UserId then
            u21.drillList[p22] = true;

            if u21.drillCountTree then
                local drillCountTree = u21.drillCountTree;
                local v23 = 0;
                local v24 = {};

                for _ in u21.drillList do
                    v23 = v23 + 1;
                end;

                v24.count = v23;
                u3.update(drillCountTree, u3.createElement(DrillCountDisplay, v24));
            end;
        end;
    end);
    CollectionService:GetInstanceRemovedSignal("Drill"):Connect(function(p25) -- Line: 133
        -- upvalues: Players (ref), u21 (copy), u3 (ref), DrillCountDisplay (ref)
        if p25:GetAttribute("PlacedByUserId") ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        u21.drillList[p25] = nil;

        if u21.targetDrill == p25 then
            u21:exitDrill();
        end;

        if u21.drillCountTree then
            local drillCountTree = u21.drillCountTree;
            local v26 = 0;
            local v27 = {};

            for _ in u21.drillList do
                v26 = v26 + 1;
            end;

            v27.count = v26;
            u3.update(drillCountTree, u3.createElement(DrillCountDisplay, v27));
        end;
    end);
    default.Client:Get("UseTablet"):Connect(function(p28, p29) -- Line: 157
        -- upvalues: u21 (copy), GameAnimationUtil (ref), AnimationType (ref)
        local v30;

        if p29 then
            v30 = not (u21.playerAnimationMap[p28] ~= nil);
        else
            v30 = p29;
        end;

        local v31 = v30 and GameAnimationUtil:playAnimation(p28, AnimationType.USE_TABLET, {
            looped = true
        });

        if v31 then
            u21.playerAnimationMap[p28] = v31;
        end;

        if not p29 then
            local v32 = u21.playerAnimationMap[p28];

            if v32 ~= nil then
                v32:Stop();
            end;

            if v32 ~= nil then
                v32:Destroy();
            end;

            u21.playerAnimationMap[p28] = nil;
        end;
    end);
    default.Client:Get("ReceiveResourceFromDrill"):Connect(function(p33) -- Line: 191
        -- upvalues: Players (ref), KnitClient (ref)
        local Character = Players.LocalPlayer.Character;

        if not Character then
            return nil;
        end;

        local Position = Character.PrimaryPart.Position;

        if not Position then
            return nil;
        end;

        KnitClient.Controllers.ReceiveItemEffectController:playEffectForItems({
            {
                itemType = p33.item,
                amount = p33.amount
            }
        }, Position, function() -- Line: 203
            -- upvalues: Character (copy)
            local PrimaryPart = Character.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart.CFrame;
            end;

            return PrimaryPart;
        end, "PlayLocally");
    end);
    RunService.Heartbeat:Connect(function() -- Line: 211
        -- upvalues: u21 (copy), KnitClient2 (ref)
        if not u21.targetDrill then
            return nil;
        end;

        local camera = u21.camera;

        if camera ~= nil then
            camera = (camera.Focus.Position - u21.camera.CFrame.Position).Magnitude;
        end;

        if camera == 0 or (camera ~= camera or not camera) then
            return nil;
        end;

        if camera < 0.6 and not u21.isFirstPerson then
            u21.isFirstPerson = true;
            local targetDrill = u21.targetDrill;

            if targetDrill ~= nil then
                local function _(p34) -- Line: 231
                    return p34:IsA("MeshPart") or (p34:IsA("Decal") or p34:IsA("ParticleEmitter"));
                end;

                local v35 = 0;
                targetDrill = {};

                for i, descendant in targetDrill:GetDescendants() do
                    local _ = i - 1;

                    if (descendant:IsA("MeshPart") or (descendant:IsA("Decal") or descendant:IsA("ParticleEmitter"))) == true then
                        v35 = v35 + 1;
                        targetDrill[v35] = descendant;
                    end;
                end;
            end;

            local function _(p36) -- Line: 247
                if p36:IsA("MeshPart") or p36:IsA("Decal") then
                    p36.Transparency = 1;
                end;
            end;

            for i, v in targetDrill do
                local _ = i - 1;

                if v:IsA("MeshPart") or v:IsA("Decal") then
                    v.Transparency = 1;
                end;
            end;

            KnitClient2.Controllers.ViewmodelController:setHeldItem(nil);
        elseif camera > 0.6 and u21.isFirstPerson then
            u21.isFirstPerson = false;
            local targetDrill = u21.targetDrill;

            if targetDrill ~= nil then
                local function _(p37) -- Line: 261
                    return p37:IsA("MeshPart") or (p37:IsA("Decal") or p37:IsA("ParticleEmitter"));
                end;

                local v38 = 0;
                targetDrill = {};

                for i, descendant in targetDrill:GetDescendants() do
                    local _ = i - 1;

                    if (descendant:IsA("MeshPart") or (descendant:IsA("Decal") or descendant:IsA("ParticleEmitter"))) == true then
                        v38 = v38 + 1;
                        targetDrill[v38] = descendant;
                    end;
                end;
            end;

            local function _(p39) -- Line: 277
                if p39:IsA("MeshPart") or p39:IsA("Decal") then
                    p39.Transparency = 0;
                end;
            end;

            for i, v in targetDrill do
                local _ = i - 1;

                if v:IsA("MeshPart") or v:IsA("Decal") then
                    v.Transparency = 0;
                end;
            end;
        end;

        if u21.isFirstPerson then
            u21.targetDrill:PivotTo(CFrame.new(u21.targetDrill.PrimaryPart.Position) * u21.camera.CFrame.Rotation);
        end;
    end);
    UserInputService.TouchTapInWorld:Connect(function(p40, p41) -- Line: 293
        -- upvalues: u21 (copy)
        if not p41 and u21.targetDrill then
            u21:attack(p40);
        end;
    end);
    ClientSyncEvents.SwitchDrill:connect(function(p42) -- Line: 298
        -- upvalues: u21 (copy)
        local v43 = u21;
        v43.index = v43.index + p42.index;

        if u21.index < 0 then
            local v44 = 0;

            for _ in u21.drillList do
                v44 = v44 + 1;
            end;

            u21.index = v44 - 1;
        else
            local v45 = 0;

            for _ in u21.drillList do
                v45 = v45 + 1;
            end;

            if v45 <= u21.index then
                u21.index = 0;
            end;
        end;

        u21:nextDrill();
    end);
end;

function u5.nextDrill(p46) -- Line: 323
    -- upvalues: default (copy), SoundManager (copy), GameSound (copy)
    local v47 = 0;

    for _ in p46.drillList do
        v47 = v47 + 1;
    end;

    if v47 == 0 then
        p46:exitDrill();

        return nil;
    end;

    if not p46.camera then
        return nil;
    end;

    local v48 = {};
    local v49 = #v48;

    for i in p46.drillList do
        v49 = v49 + 1;
        v48[v49] = i;
    end;

    local v50 = v48[p46.index + 1];
    local v51 = default.Client:Get("PlayerUseDrillController"):CallServer({
        drill = v50
    });
    SoundManager:playSound(GameSound.TV_STATIC);

    if not v51 then
        return nil;
    end;

    if not v50.Parent then
        p46:nextDrill();

        return nil;
    end;

    p46.camera.CameraSubject = v50.PrimaryPart;
    p46.targetDrill = v50;
end;

function u5.exitDrill(p52) -- Line: 360
    -- upvalues: default (copy), Players (copy), u3 (copy)
    p52.targetDrill = nil;
    p52.index = -1;
    task.spawn(function() -- Line: 363
        -- upvalues: default (ref)
        default.Client:Get("PlayerUseDrillController"):CallServer({
            drill = nil
        });
    end);
    local Character = Players.LocalPlayer.Character;

    if Character then
        p52.camera.CameraSubject = Character.Humanoid;
    end;

    if p52.tree then
        u3.unmount(p52.tree);
        p52.tree = nil;
    end;
end;

function u5.attack(p53, p54) -- Line: 377
    -- upvalues: default (copy)
    if p53:isClickingTooFast() then
        return nil;
    end;

    local v55 = p53:getTargetPoint(p54);
    default.Client:Get("DrillAttack"):SendToServer({
        targetPosition = v55
    });
end;

function u5.isClickingTooFast(p56) -- Line: 386
    -- upvalues: ClientSyncEvents (copy), BalanceFile (copy), Workspace (copy)
    if ClientSyncEvents.ItemCooldownModifierCheck:fire(BalanceFile.DrillKit.DRILL_ATTACK_COOLDOWN).cooldown > Workspace:GetServerTimeNow() - p56.lastAttackTime then
        return true;
    end;

    p56.lastAttackTime = Workspace:GetServerTimeNow();

    return false;
end;

function u5.getTargetPoint(p57, p58) -- Line: 394
    -- upvalues: Players (copy), Workspace (copy)
    local Position = Players.LocalPlayer.Character:GetPrimaryPartCFrame().Position;
    local v59 = Players.LocalPlayer:GetMouse();
    local v60 = p58 or Vector2.new(v59.X, v59.Y);
    local CFrame2 = Workspace.CurrentCamera.CFrame;
    local Unit = (Workspace.CurrentCamera:ScreenPointToRay(v60.X, v60.Y).Unit.Direction + Vector3.new(0, p57.YTargetOffset, 0)).Unit;

    return CFrame2.Position + Unit * ((CFrame2.Position - Position).Magnitude * 10);
end;

KnitClient.CreateController(u5.new());

return nil;
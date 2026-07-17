-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConstantManager = v1.ConstantManager;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local RunService = v5.RunService;
local TweenService = v5.TweenService;
local UserInputService = v5.UserInputService;
local Workspace = v5.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-types");
local isLitTurretBlock = v6.isLitTurretBlock;
local isTurretBlock = v6.isTurretBlock;
local ItemSkinType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-types").ItemSkinType;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
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
    __tostring = function() -- Line: 43, Name: __tostring
        return "TurretCameraController";
    end,

    __index = KnitController
});
u8.__index = u8;

function u8.new(...) -- Line: 49
    -- upvalues: u8 (copy)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 53
    -- upvalues: KnitController (copy), default (copy), u3 (copy), u4 (copy)
    KnitController.constructor(p10);
    p10.Name = "TurretCameraController";
    p10.turretToMaid = {};
    p10.aimTurret = default.Client:Get("AimTurret");
    p10.nextSendAim = -1;
    p10.switchTurret = default.Client:Get("SwitchTurret");
    p10.angleX = 0;
    p10.angleY = 0;
    p10.angleMotor = u3.GroupMotor.new({
        x = 0,
        y = 0
    });
    p10.maid = u4.new();
end;

function u8.KnitStart(u11) -- Line: 68
    -- upvalues: KnitController (copy), Workspace (copy), ClientStore (copy), BlockEngine (copy), RunService (copy), UserInputService (copy), u7 (copy), u3 (copy), WatchCollectionTag (copy), isTurretBlock (copy), u4 (copy), isLitTurretBlock (copy), CollectionService (copy), KnitClient2 (copy)
    KnitController.KnitStart(u11);
    local CurrentCamera = Workspace.CurrentCamera;
    ClientStore.changed:connect(function(p12, p13) -- Line: 71
        -- upvalues: u11 (copy), BlockEngine (ref)
        if p12.Game.selectedTurret == p13.Game.selectedTurret then
            return nil;
        end;

        u11.maid:DoCleaning();
        local selectedTurret = p12.Game.selectedTurret;
        local switchTurret = u11.switchTurret;
        local v14 = {};
        local v15;

        if selectedTurret then
            v15 = BlockEngine:getBlockPosition(selectedTurret.Position);
        else
            v15 = nil;
        end;

        v14.turretBlockPos = v15;
        switchTurret:SendToServer(v14);

        if selectedTurret == nil then
            return nil;
        end;

        local v16 = selectedTurret:GetAttribute("AngleX");
        local v17 = selectedTurret:GetAttribute("AngleY");
        u11.angleX = v16 == nil and 0 or math.rad(v16);
        u11.angleY = v17 == nil and 0 or math.rad(v17);
    end);
    local u18 = nil;
    RunService.RenderStepped:Connect(function() -- Line: 89
        -- upvalues: ClientStore (ref), u18 (ref), UserInputService (ref), u11 (copy), u7 (ref), u3 (ref), CurrentCamera (copy)
        local selectedTurret = ClientStore:getState().Game.selectedTurret;

        if selectedTurret == nil then
            if u18 then
                UserInputService.MouseBehavior = u18;
                u18 = nil;
            end;

            return nil;
        end;

        if not UserInputService.TouchEnabled then
            if UserInputService.MouseBehavior ~= Enum.MouseBehavior.LockCenter then
                u18 = UserInputService.MouseBehavior;
            end;

            UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter;
        end;

        local v19;

        if u11.thumbstickPosition then
            v19 = Vector2.new(u11.thumbstickPosition.X, -u11.thumbstickPosition.Y) * u7.ControllerDeltaMultiplier;
        else
            v19 = UserInputService:GetMouseDelta();
        end;

        u11.angleX = u11.angleX - v19.X * u7.Sensitivity;
        u11.angleY = math.clamp(u11.angleY - v19.Y * u7.Sensitivity, -u7.AngleLowerLimitY, u7.AngleUpperLimitY);
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
        CurrentCamera.CFrame = selectedTurret.Head.CameraOrigin.WorldCFrame;
    end);
    RunService.Heartbeat:Connect(function() -- Line: 128
        -- upvalues: ClientStore (ref), u11 (copy), u7 (ref), BlockEngine (ref)
        local selectedTurret = ClientStore:getState().Game.selectedTurret;

        if selectedTurret == nil then
            return nil;
        end;

        if time() > u11.nextSendAim then
            u11.nextSendAim = time() + u7.AimSendRate;
            u11.aimTurret:SendToServer({
                turretBlockPos = BlockEngine:getBlockPosition(selectedTurret.Position),
                angleX = math.deg(u11.angleX % 6.283185307179586),
                angleY = math.deg(u11.angleY)
            });
        end;
    end);
    WatchCollectionTag("Turret", function(u20) -- Line: 142
        -- upvalues: isTurretBlock (ref), u4 (ref), u11 (copy), isLitTurretBlock (ref), ClientStore (ref), UserInputService (ref)
        if not isTurretBlock(u20) then
            return nil;
        end;

        local u21 = u4.new();
        u11:updateAngleOfTurret(u20);

        if isLitTurretBlock(u20) then
            u11:toggleLightsOnTurret(u20, false);
        end;

        local function v22() -- Line: 151
            -- upvalues: ClientStore (ref), u20 (copy), u11 (ref)
            if ClientStore:getState().Game.selectedTurret ~= u20 then
                u11:updateAngleOfTurret(u20);
            end;
        end;

        u21:GiveTask(u20:GetAttributeChangedSignal("AngleX"):Connect(v22));
        u21:GiveTask(u20:GetAttributeChangedSignal("AngleY"):Connect(v22));
        u21:GiveTask(u20:GetAttributeChangedSignal("IsActive"):Connect(function() -- Line: 158
            -- upvalues: isLitTurretBlock (ref), u20 (copy), u11 (ref)
            if isLitTurretBlock(u20) then
                u11:toggleLightsOnTurret(u20);
            end;
        end));
        u21:GiveTask(u20.AncestryChanged:Connect(function() -- Line: 163
            -- upvalues: u20 (copy), u21 (copy)
            if not u20.Parent then
                u21:DoCleaning();
            end;
        end));
        u21:GiveTask(UserInputService.InputChanged:Connect(function(p23) -- Line: 169
            -- upvalues: u11 (ref)
            if p23.UserInputType == Enum.UserInputType.Gamepad1 and p23.KeyCode == Enum.KeyCode.Thumbstick1 then
                u11:handleConsoleInput(p23);
            end;
        end));
        u21:GiveTask(UserInputService.InputEnded:Connect(function(p24) -- Line: 176
            -- upvalues: u11 (ref)
            if p24.UserInputType == Enum.UserInputType.Gamepad1 and p24.KeyCode == Enum.KeyCode.Thumbstick1 then
                u11.thumbstickPosition = nil;
            end;
        end));
    end);
    CollectionService:GetInstanceRemovedSignal("Turret"):Connect(function(p25) -- Line: 184
        -- upvalues: isTurretBlock (ref), u11 (copy), ClientStore (ref), KnitClient2 (ref)
        if isTurretBlock(p25) then
            local v26 = u11.turretToMaid[p25];

            if v26 ~= nil then
                v26:DoCleaning();
            end;

            u11.turretToMaid[p25] = nil;
            local selectedTurret = ClientStore:getState().Game.selectedTurret;

            if selectedTurret and p25 == selectedTurret then
                ClientStore:dispatch({
                    type = "SetSpectatedTurret",
                    selectedTurret = KnitClient2.Controllers.TurretController:getNextTurret(selectedTurret:GetAttribute("TurretId"))
                });
            end;
        end;
    end);
    u11.angleMotor:onStep(function(p27) -- Line: 205
        -- upvalues: ClientStore (ref)
        local selectedTurret = ClientStore:getState().Game.selectedTurret;

        if selectedTurret == nil then
            return nil;
        end;

        local v28 = CFrame.new(selectedTurret.Rotate.Position);
        local v29 = CFrame.Angles(0, p27.x, 0);
        local v30 = CFrame.Angles(p27.y, 0, 0);
        selectedTurret.Rotate.CFrame = v28 * v29 * v30;
    end);
end;

function u8.handleConsoleInput(p31, p32) -- Line: 216
    if p32.Position.Magnitude > 0.1 then
        p31.thumbstickPosition = p32.Position;

        return;
    end;

    p31.thumbstickPosition = nil;
end;

function u8.updateAngleOfTurret(p33, p34) -- Line: 223
    -- upvalues: SoundManager (copy), GameSound (copy), ItemSkinType (copy), BedwarsKitSkinMeta (copy), BedwarsKitSkin (copy), TweenService (copy)
    local v35 = p34:GetAttribute("AngleX");
    local v36 = p34:GetAttribute("AngleY");

    if v35 == nil or v36 == nil then
        return nil;
    end;

    local u37 = nil;
    local v38 = p34:GetAttribute("ItemSkin");

    if v38 ~= nil then
        v38 = string.lower(v38);
    end;

    local v39;

    if v38 == "" or not v38 then
        v39 = v38;
    else
        v39 = v38 == "camera_turret_vampire";
    end;

    if v39 == "" or not v39 then
        local v40;

        if v38 == "" or not v38 then
            v40 = v38;
        else
            v40 = v38 == "camera_turret_cream_soda";
        end;

        if v40 == "" or not v40 then
            if v38 ~= "" and v38 then
                v38 = v38 == ItemSkinType.CAMERA_TURRET_STARRYSOLDIER;
            end;

            if v38 == "" or not v38 then
                u37 = SoundManager:playSound(GameSound.TURRET_ROTATE, {
                    position = p34.Position
                });
            else
                SoundManager:playSound(BedwarsKitSkinMeta[BedwarsKitSkin.STARRYSOLDIER_VULCAN].vulcan.rotateSound, {
                    position = p34.Position
                });
            end;
        else
            u37 = SoundManager:playSound(GameSound.TURRET_CREAM_SODA_ROTATE, {
                position = p34.Position
            });
        end;
    else
        u37 = SoundManager:playSound(GameSound.TURRET_VAMPIRE_ROTATE, {
            position = p34.Position
        });
    end;

    local Rotate = p34.Rotate;
    local v41 = TweenInfo.new(0.2, Enum.EasingStyle.Linear);
    local v42 = {};
    local v43 = CFrame.new(p34.Rotate.Position);
    local v44 = CFrame.Angles(0, math.rad(v35), 0);
    local v45 = CFrame.Angles(math.rad(v36), 0, 0);
    v42.CFrame = v43 * v44 * v45;
    local v46 = TweenService:Create(Rotate, v41, v42);
    v46:Play();
    local u47 = nil;
    u47 = v46.Completed:Connect(function() -- Line: 280
        -- upvalues: u37 (ref), u47 (ref)
        local v48 = u37;

        if v48 ~= nil then
            v48:Stop();
        end;

        local v49 = u37;

        if v49 ~= nil then
            v49:Destroy();
        end;

        u47:Disconnect();
    end);
end;

function u8.toggleLightsOnTurret(p50, p51, p52) -- Line: 292
    -- upvalues: SoundManager (copy), GameSound (copy), ItemSkinType (copy), BedwarsKitSkinMeta (copy), BedwarsKitSkin (copy)
    local v53 = p52 == nil and true or p52;
    local v54 = p51:GetAttribute("IsActive");
    local v55 = p51:GetAttribute("ItemSkin");

    if v54 == nil then
        if v53 then
            local v56;

            if v55 == "" or not v55 then
                v56 = v55;
            else
                v56 = string.lower(v55) == "camera_turret_vampire";
            end;

            if v56 == "" or not v56 then
                local v57;

                if v55 == "" or not v55 then
                    v57 = v55;
                else
                    v57 = string.lower(v55) == "camera_turret_cream_soda";
                end;

                if v57 == "" or not v57 then
                    if v55 ~= "" and v55 then
                        v55 = string.lower(v55) == ItemSkinType.CAMERA_TURRET_STARRYSOLDIER;
                    end;

                    if v55 == "" or not v55 then
                        SoundManager:playSound(GameSound.TURRET_OFF, {
                            position = p51.Position
                        });
                    else
                        SoundManager:playSound(BedwarsKitSkinMeta[BedwarsKitSkin.STARRYSOLDIER_VULCAN].vulcan.offSound, {
                            position = p51.Position
                        });
                    end;
                else
                    SoundManager:playSound(GameSound.TURRET_CREAM_SODA_OFF, {
                        position = p51.Position
                    });
                end;
            else
                SoundManager:playSound(GameSound.TURRET_VAMPIRE_OFF, {
                    position = p51.Position
                });
            end;
        end;

        return nil;
    end;

    if v53 then
        local v58;

        if v55 == "" or not v55 then
            v58 = v55;
        else
            v58 = string.lower(v55) == "camera_turret_vampire";
        end;

        if v58 ~= "" and v58 then
            SoundManager:playSound(GameSound.TURRET_VAMPIRE_ON, {
                position = p51.Position
            });

            return;
        end;

        local v59;

        if v55 == "" or not v55 then
            v59 = v55;
        else
            v59 = string.lower(v55) == "camera_turret_cream_soda";
        end;

        if v59 ~= "" and v59 then
            SoundManager:playSound(GameSound.TURRET_CREAM_SODA_ON, {
                position = p51.Position
            });

            return;
        end;

        if v55 ~= "" and v55 then
            v55 = string.lower(v55) == ItemSkinType.CAMERA_TURRET_STARRYSOLDIER;
        end;

        if v55 ~= "" and v55 then
            SoundManager:playSound(BedwarsKitSkinMeta[BedwarsKitSkin.STARRYSOLDIER_VULCAN].vulcan.onSound, {
                position = p51.Position
            });

            return;
        end;

        SoundManager:playSound(GameSound.TURRET_ON, {
            position = p51.Position
        });
    end;
end;

KnitClient.CreateController(u8.new());

return nil;
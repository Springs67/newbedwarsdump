-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local GameQueryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local HapticService = v3.HapticService;
local Players = v3.Players;
local RunService = v3.RunService;
local UserInputService = v3.UserInputService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ProjectileHandler = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local TurretId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId;
local getProjectileTypeByEncoding = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "encoding", "projectile-type-encoding").getProjectileTypeByEncoding;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "CameraTurretFireController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 37
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 41
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p6);
    p6.Name = "CameraTurretFireController";
    p6.mouseDown = false;
    p6.nextAllowedShot = -1;
    p6.maid = u2.new();
end;

function u4.KnitStart(u7) -- Line: 48
    -- upvalues: KnitController (copy), CollectionService (copy), TurretId (copy), ItemType (copy), Players (copy), KnitClient (copy), default (copy), BlockEngine (copy), GameQueryUtil (copy), ClientSyncEvents (copy), BedwarsKitSkinMeta (copy), ClientStore (copy), UserInputService (copy), RunService (copy), EntityDamageEventZap (copy), getProjectileTypeByEncoding (copy), u2 (copy)
    KnitController.KnitStart(u7);
    CollectionService:GetInstanceAddedSignal(TurretId.VULCAN_TURRET):Connect(function(u8) -- Line: 50
        -- upvalues: ItemType (ref), Players (ref), KnitClient (ref), default (ref), BlockEngine (ref)
        if u8.Name ~= ItemType.CAMERA_TURRET then
            return nil;
        end;

        if u8:GetAttribute("PlacedByUserId") ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        KnitClient.Controllers.ProximityPromptController:createProximityPrompt({
            Name = "TakeBackPrompt",
            HoldDuration = 0.25,
            RequiresLineOfSight = false,
            MaxActivationDistance = 10,
            ActionText = "Take Back",
            ObjectText = "Camera Turret",
            Parent = u8
        }).Triggered:Connect(function(p9) -- Line: 67
            -- upvalues: Players (ref), u8 (copy), default (ref), BlockEngine (ref)
            if p9 ~= Players.LocalPlayer then
                return nil;
            end;

            if not u8:IsDescendantOf(game) then
                return nil;
            end;

            default.Client:Get("TakeBackCameraTurret"):SendToServer({
                turretBlockPos = BlockEngine:getBlockPosition(u8.Position)
            });
        end);
    end);
    CollectionService:GetInstanceAddedSignal(TurretId.VULCAN_TURRET):Connect(function(p10) -- Line: 79
        -- upvalues: GameQueryUtil (ref)
        p10:SetAttribute("ProjectilesIgnore", true);

        for _, descendant in p10:GetDescendants() do
            GameQueryUtil:setQueryIgnored(descendant, true);
        end;
    end);
    ClientSyncEvents.ProjectileLaunched:connect(function(p11) -- Line: 85
        -- upvalues: KnitClient (ref), BedwarsKitSkinMeta (ref)
        if p11.projectileType ~= "turretBullet" and p11.projectileType ~= "turretArtilleryBullet" then
            return nil;
        end;

        if not p11.shooter then
            return nil;
        end;

        local vulcan = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p11.shooter)].vulcan;

        if vulcan ~= nil then
            vulcan = vulcan.projectileColor;
        end;

        if not vulcan then
            return nil;
        end;

        local Handle = p11.projectile:FindFirstChild("Handle");

        if Handle then
            Handle.Color = vulcan;
        end;
    end);
    ClientStore.changed:connect(function(p12, p13) -- Line: 107
        -- upvalues: u7 (copy), CollectionService (ref), TurretId (ref), UserInputService (ref), RunService (ref)
        local selectedTurret = p12.Game.selectedTurret;

        if selectedTurret == p13.Game.selectedTurret then
            return nil;
        end;

        u7.maid:DoCleaning();
        local v14 = selectedTurret == nil;

        if not v14 then
            local v15 = CollectionService:GetTags(selectedTurret);
            local v16 = table.find(v15, TurretId.VULCAN_TURRET) ~= nil;
            v14 = not v16;
        end;

        if v14 then
            u7.mouseDown = false;

            return nil;
        end;

        u7.maid:GiveTask(UserInputService.InputBegan:Connect(function(p17, p18) -- Line: 124
            -- upvalues: u7 (ref)
            if not p18 and (u7:isAcceptableInput(p17) and p17.UserInputState == Enum.UserInputState.Begin) then
                u7.mouseDown = true;
            end;
        end));
        u7.maid:GiveTask(UserInputService.InputEnded:Connect(function(p19, p20) -- Line: 129
            -- upvalues: u7 (ref)
            if not p20 and (u7:isAcceptableInput(p19) and p19.UserInputState == Enum.UserInputState.End) then
                u7.mouseDown = false;
            end;
        end));
        u7.maid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 134
            -- upvalues: u7 (ref), selectedTurret (copy)
            if u7.mouseDown == true then
                u7:fire(selectedTurret);
            end;
        end));
        u7.maid:GiveTask(UserInputService.TouchTapInWorld:Connect(function(p21, p22) -- Line: 139
            -- upvalues: u7 (ref), selectedTurret (copy)
            if not p22 then
                u7:fire(selectedTurret);
            end;
        end));
    end);
    EntityDamageEventZap.On(function(p23, p24, p25, p26, p27, p28, p29, p30, p31, p32, p33, p34, p35, p36) -- Line: 145
        -- upvalues: getProjectileTypeByEncoding (ref), Players (ref), u2 (ref), KnitClient (ref)
        local v37;

        if p30 == nil then
            v37 = p30;
        else
            v37 = p30.projectileData;
        end;

        if v37 then
            local v38 = getProjectileTypeByEncoding(p30.projectileData.projectileType);

            if (v38 == "turretBullet" or v38 == "turretArtilleryBullet") and p23 == Players.LocalPlayer.Character then
                local u39 = u2.new();
                u39:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    moveSpeedMultiplier = 0.5
                }));
                task.delay(0.1, function() -- Line: 158
                    -- upvalues: u39 (copy)
                    u39:DoCleaning();
                end);
            end;
        end;
    end);
end;

function u4.isAcceptableInput(p40, p41) -- Line: 166
    -- upvalues: KnitClient2 (copy)
    local v42 = KnitClient2.Controllers.KeybindLoadController:getKeybinds();
    local v43;

    if v42 == nil then
        v43 = v42;
    else
        v43 = v42.keyboard;

        if v43 ~= nil then
            v43 = v43.controlActions.Attack;
        end;
    end;

    local v44 = v43 or Enum.UserInputType.MouseButton1;

    if v42 ~= nil then
        v42 = v42.gamepad;

        if v42 ~= nil then
            v42 = v42.controlActions.Attack;
        end;
    end;

    return false or (p41.UserInputType == v44 and true or p41.KeyCode == v44) or p41.UserInputType == Enum.UserInputType.Touch or (v42 or Enum.KeyCode.ButtonR2) == p41.KeyCode;
end;

function u4.fire(p45, p46) -- Line: 210
    -- upvalues: getItemMeta (copy), ClientSyncEvents (copy), ProjectileHandler (copy), KnitClient2 (copy), ItemType (copy), HapticService (copy), RuntimeLib (copy)
    local block = getItemMeta(p46.Name).block;

    if block ~= nil then
        block = block.projectileSource;
    end;

    if not block then
        return nil;
    end;

    if time() < p45.nextAllowedShot then
        return nil;
    end;

    local cooldown = ClientSyncEvents.ProjectileCooldownModifierCheck:fire(block.fireDelaySec).cooldown;
    p45.nextAllowedShot = time() + cooldown;
    local BulletOrigin = p46.Head.BulletOrigin;
    local v47 = ProjectileHandler.new(1, 1, "turretBullet", nil, BulletOrigin.WorldCFrame.LookVector * 5 + BulletOrigin.WorldPosition, Vector3.new(0, 0, 0));
    KnitClient2.Controllers.ProjectileController:launchProjectile(ItemType.CAMERA_TURRET, nil, v47, p46, block);
    local ShootParticles1 = BulletOrigin.ShootParticles1;
    local ShootParticles2 = BulletOrigin.ShootParticles2;

    if ShootParticles1 then
        ShootParticles1:Emit(1);
    end;

    if ShootParticles2 then
        ShootParticles2:Emit(2);
    end;

    if HapticService:IsVibrationSupported(Enum.UserInputType.Gamepad1) then
        local hapticCancelPromise = p45.hapticCancelPromise;

        if hapticCancelPromise ~= nil then
            hapticCancelPromise:cancel();
        end;

        local u48;

        if HapticService:IsMotorSupported(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.RightTrigger) then
            u48 = Enum.VibrationMotor.RightTrigger;
        else
            u48 = Enum.VibrationMotor.Small;
        end;

        HapticService:SetMotor(Enum.UserInputType.Gamepad1, u48, 1);
        p45.hapticCancelPromise = RuntimeLib.Promise.defer(function(p49, p50, p51) -- Line: 249
            -- upvalues: HapticService (ref), u48 (copy)
            local u52 = false;
            p51(function() -- Line: 251
                -- upvalues: u52 (ref)
                u52 = true;
            end);
            task.wait(0.1);

            if u52 then
                return nil;
            end;

            HapticService:SetMotor(Enum.UserInputType.Gamepad1, u48, 0);
        end);
    end;
end;

KnitClient.CreateController(u4.new());

return nil;
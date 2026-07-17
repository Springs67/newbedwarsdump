-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local CFrameUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local LassoWarsUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "lasso-wars", "lasso-wars-util").LassoWarsUtil;
local GrapplingHookConst = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "grappling-hook", "grappling-hook-util").GrapplingHookConst;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local LassoWarsDeathmatchHud = RuntimeLib.import(script, script.Parent, "ui", "lasso-wars-deathmatch-hud").LassoWarsDeathmatchHud;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "LassoWarsController";
    end,

    __index = GameKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 38
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 42
    -- upvalues: GameKnitController (copy), GameType (copy), u3 (copy)
    GameKnitController.constructor(p8, { GameType.LASSO_WARS });
    p8.Name = "LassoWarsController";
    p8.playerLassoModifierMap = {};
    p8.transitMaid = u3.new();
    p8.FORCE_SCALAR = 400;
    p8.RUNTIME_MULT = 0.12;
end;

function u6.KnitStart(u9) -- Line: 50
    -- upvalues: GameKnitController (copy), default (copy), MapUtil (copy), SoundManager (copy), GameSound (copy), KnitClient2 (copy), DeviceUtil (copy), Flamework (copy), BedwarsAppIds (copy), Players (copy), LassoWarsDeathmatchHud (copy)
    GameKnitController.KnitStart(u9);
    default.Client:Get("LassoWars_UpgradeComplete"):Connect(function(u10) -- Line: 66
        -- upvalues: MapUtil (ref), u9 (copy)
        local v11 = MapUtil.getOrCreate(u9.playerLassoModifierMap, u10.player, function() -- Line: 68
            return {};
        end);
        MapUtil.getOrCreate(v11, u10.upgradeType, function() -- Line: 72
            -- upvalues: u10 (copy)
            return {
                level = 0,
                upgradeType = u10.upgradeType
            };
        end).level = u10.level;
    end);
    default.Client:Get("LassoWars_LassoArmorBroken"):Connect(function(p12) -- Line: 80
        -- upvalues: SoundManager (ref), GameSound (ref)
        local Character = p12.player.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        if not Character then
            return nil;
        end;

        SoundManager:playSound(GameSound.EMERALD_SHIELD_BREAK, {
            position = Character.Position
        });
    end);
    default.Client:Get("LassoWars_AddCurrency"):Connect(function(p13) -- Line: 95
        -- upvalues: SoundManager (ref), GameSound (ref), u9 (copy)
        local Character = p13.player.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        if not Character then
            return nil;
        end;

        task.spawn(function() -- Line: 105
            -- upvalues: SoundManager (ref), GameSound (ref), Character (copy)
            local COIN_FOUNTAIN_2 = GameSound.COIN_FOUNTAIN_2;
            local v14 = {};
            local v15 = Character;

            if v15 ~= nil then
                v15 = v15.Position;
            end;

            v14.position = v15;
            v14.volumeMultiplier = 2;
            SoundManager:playSound(COIN_FOUNTAIN_2, v14);
            task.wait(0.1);
            local COIN_FOUNTAIN_1 = GameSound.COIN_FOUNTAIN_1;
            local v16 = {};
            local v17 = Character;

            if v17 ~= nil then
                v17 = v17.Position;
            end;

            v16.position = v17;
            v16.volumeMultiplier = 2;
            SoundManager:playSound(COIN_FOUNTAIN_1, v16);
        end);
        u9:createCoin(Vector3.new(0, 4, 0), Character, true);
    end);
    default.Client:Get("LassoWars_SetupShops"):Connect(function(p18) -- Line: 134
        -- upvalues: KnitClient2 (ref), DeviceUtil (ref), Flamework (ref), BedwarsAppIds (ref), u9 (copy)
        local shopParts = p18.shopParts;

        local function v20(p19) -- Line: 136
            -- upvalues: KnitClient2 (ref), DeviceUtil (ref), Flamework (ref), BedwarsAppIds (ref), u9 (ref)
            KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
                ObjectText = "Upgrades",
                ActionText = "Shop",
                AutoLocalize = false,
                RequiresLineOfSight = false,
                MaxActivationDistance = 10,
                ClickablePrompt = DeviceUtil.isMobileControls(),
                KeyboardKeyCode = Enum.KeyCode.F,
                Parent = p19
            }).Triggered:Connect(function() -- Line: 148
                -- upvalues: Flamework (ref), BedwarsAppIds (ref), u9 (ref)
                if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(BedwarsAppIds.LASSO_WARS_UPGRADE_SHOP_APP) then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.LASSO_WARS_UPGRADE_SHOP_APP);

                    return;
                end;

                u9:openUpgradeShop();
            end);
        end;

        for i, v in shopParts do
            v20(v, i - 1, shopParts);
        end;
    end);
    default.Client:Get("LassoGrapplingHookStartTransit"):Connect(function(p21) -- Line: 161
        -- upvalues: u9 (copy), Players (ref)
        u9:transit(Players.LocalPlayer, p21.endGoal, p21.hitBasePart);
    end);
    default.Client:Get("LassoGrapplingHookCutLine"):Connect(function(p22) -- Line: 164
        -- upvalues: u9 (copy)
        u9.transitMaid:DoCleaning();
    end);
    default.Client:Get("LassoWars_OpenHUD"):Connect(function(p23) -- Line: 167
        -- upvalues: Flamework (ref), LassoWarsDeathmatchHud (ref)
        if not Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("LassoWarsDeathmatchHud") then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                appId = "LassoWarsDeathmatchHud",
                app = LassoWarsDeathmatchHud
            }, {});
        end;
    end);
end;

function u6.onGameInit(p24) -- Line: 176
    -- upvalues: KnitClient (copy), GameSound (copy)
    KnitClient.Controllers.PreloadController:runPreload({
        sounds = { GameSound.COIN_FOUNTAIN_2, GameSound.COIN_FOUNTAIN_1, GameSound.EMERALD_SHIELD_BREAK }
    });
end;

function u6.createCoin(p25, u26, u27, u28) -- Line: 189
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), RunService (copy), CFrameUtil (copy)
    local u29 = ReplicatedStorage.Assets.Misc.LassoCoin:Clone();

    if u27 then
        u29.Parent = u27;
        u29:PivotTo(CFrame.new(u27.Position + u26));
    else
        u29.Parent = Workspace;
        u29:PivotTo(CFrame.new(u26));
    end;

    local SpinPivot = u29.Pivot.SpinPivot;
    local u30 = 0;
    local u31 = nil;
    u31 = RunService.Heartbeat:Connect(function(p32) -- Line: 209
        -- upvalues: u30 (ref), CFrameUtil (ref), SpinPivot (copy), u27 (copy), u26 (copy), u29 (copy), u28 (copy), u31 (ref)
        u30 = u30 + p32;
        CFrameUtil.rotateLocalDegrees(SpinPivot, Vector3.new(0, 1, 0) * (100 * p32));

        if u27 then
            CFrameUtil.setPosition(u29, u27.Position + u26);
        end;

        if u28 and u30 > 1 then
            local v33 = u30 - 1;

            if v33 >= 1 then
                u29:Destroy();

                if u31 then
                    u31:Disconnect();
                end;
            else
                u29.Pivot.SpinPivot.GoldCoin.Transparency = v33;
            end;
        end;
    end);
    u29.Destroying:Connect(function() -- Line: 239
        -- upvalues: u31 (ref)
        if u31 then
            u31:Disconnect();
        end;
    end);

    return u29;
end;

function u6.requestLassoUpgrade(p34, p35) -- Line: 246
    -- upvalues: default (copy), LassoWarsUtil (copy), Players (copy), SoundManager (copy), GameSound (copy)
    local v36 = default.Client:Get("LassoWars_RequestUpgrade"):CallServer({
        upgradeType = p35
    });

    if v36 == 0 or (v36 ~= v36 or not v36) then
        SoundManager:playSound(GameSound.ERROR_NOTIFICATION);

        return v36;
    end;

    LassoWarsUtil.setUpgradeLevelForPlayer(Players.LocalPlayer, p35, v36);
    SoundManager:playSound(GameSound.BEDWARS_PURCHASE_ITEM);

    return v36;
end;

function u6.openUpgradeShop(p37) -- Line: 263
    -- upvalues: Flamework (copy), BedwarsAppIds (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(BedwarsAppIds.LASSO_WARS_UPGRADE_SHOP_APP) then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.LASSO_WARS_UPGRADE_SHOP_APP);
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.LASSO_WARS_UPGRADE_SHOP_APP, {});
end;

function u6.transit(u38, u39, p40, p41) -- Line: 269
    -- upvalues: Players (copy), GameQueryUtil (copy), Workspace (copy), u4 (copy), KnitClient (copy), GrapplingHookConst (copy), RunService (copy)
    local u42 = p40 + Vector3.new(0, 1, 0);

    if u39 ~= Players.LocalPlayer then
        return nil;
    end;

    local Character = u39.Character;
    local Character2 = u39.Character;

    if Character2 ~= nil then
        Character2 = Character2:FindFirstChild("Humanoid");
    end;

    if not (Character and Character2) then
        return nil;
    end;

    local PrimaryPart = Character.PrimaryPart;

    if PrimaryPart == nil then
        return nil;
    end;

    local AssemblyMass = PrimaryPart.AssemblyMass;
    Character.PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 20, 0);

    if not GameQueryUtil:raycast(PrimaryPart.Position + Vector3.new(0, -5, 0), Vector3.new(0, -100, 0)) and Character2:GetState() == Enum.HumanoidStateType.Freefall then
        Character.PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, Workspace.Gravity / 3, 0);
    end;

    local _ = (u42 - Character.PrimaryPart.Position).Magnitude;
    local v43 = {
        Name = "LiftForce",
        Force = Vector3.new(0, 0, 0),
        ApplyAtCenterOfMass = true,
        Parent = Character2.RootPart,
        RelativeTo = Enum.ActuatorRelativeTo.World
    };
    local RootPart = Character2.RootPart;

    if RootPart ~= nil then
        RootPart = RootPart:WaitForChild("RootRigAttachment");
    end;

    v43.Attachment0 = RootPart;
    local u44 = u4("VectorForce", v43);
    local v45 = {
        Name = "SwivelForce",
        Force = Vector3.new(0, 0, 0),
        ApplyAtCenterOfMass = true,
        Parent = Character2.RootPart,
        RelativeTo = Enum.ActuatorRelativeTo.World
    };
    local RootPart2 = Character2.RootPart;

    if RootPart2 ~= nil then
        RootPart2 = RootPart2:WaitForChild("RootRigAttachment");
    end;

    v45.Attachment0 = RootPart2;
    local u46 = u4("VectorForce", v45);
    local u47 = u4("BodyForce", {
        Name = "AntiGravity",
        Force = Vector3.new(0, 0, 0),
        Parent = PrimaryPart
    });
    local u48 = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
        constantSpeedMultiplier = GrapplingHookConst.SPEED
    });
    Character2:ChangeState(Enum.HumanoidStateType.Freefall);
    Character2.PlatformStand = true;
    task.delay(0.1, function() -- Line: 341
        -- upvalues: Character2 (copy)
        Character2.PlatformStand = false;
    end);
    local u49 = 0.5;
    local u50 = 0;
    RunService:BindToRenderStep("LassoGrappleHook", Enum.RenderPriority.Last.Value, function(p51) -- Line: 346
        -- upvalues: u50 (ref), u49 (ref), u39 (copy), u42 (ref), AssemblyMass (ref), u38 (copy), u44 (copy), Character2 (copy), u46 (copy), GrapplingHookConst (ref), u47 (copy), Character (copy)
        u50 = u50 + p51;
        u49 = math.clamp(u49 - p51 / 0.5, 0, 0.5);
        local Character3 = u39.Character;

        if Character3 ~= nil then
            Character3 = Character3.PrimaryPart;

            if Character3 ~= nil then
                Character3 = Character3.Position;
            end;
        end;

        if Character3 == nil then
            return nil;
        end;

        local Unit = (u42 - Character3).Unit;
        local Character4 = u39.Character;

        if Character4 ~= nil then
            Character4 = Character4.PrimaryPart;

            if Character4 ~= nil then
                Character4 = Character4.AssemblyMass;
            end;
        end;

        if Character4 == nil then
            Character4 = AssemblyMass;
        end;

        AssemblyMass = Character4;
        u44.Force = Unit * u38.FORCE_SCALAR * AssemblyMass;
        local MoveDirection = Character2.MoveDirection;
        u46.Force = (MoveDirection - Unit * MoveDirection:Dot(Unit)) * u38.FORCE_SCALAR * u49 * AssemblyMass * 1.2;
        u47.Force = GrapplingHookConst.FORCE_ADDITIVE * AssemblyMass;
        Character.PrimaryPart.AssemblyLinearVelocity = Character.PrimaryPart.AssemblyLinearVelocity:Lerp(Unit * 20, (math.clamp(u50 * u38.RUNTIME_MULT, 0, 1)));
    end);
    u38.transitMaid:GiveTask(function() -- Line: 397
        -- upvalues: RunService (ref), u44 (copy), u46 (copy), u47 (copy), u48 (copy), Character2 (copy)
        RunService:UnbindFromRenderStep("LassoGrappleHook");
        u44:Destroy();
        u46:Destroy();
        u47:Destroy();
        u48.Destroy();
        Character2:ChangeState(Enum.HumanoidStateType.Landed);
    end);
end;

function u6.getLassoModifierMapForPlayer(p52, p53) -- Line: 407
    -- upvalues: Players (copy), MapUtil (copy)
    if p53 == nil then
        return nil;
    end;

    if p53 ~= Players.LocalPlayer then
        return nil;
    end;

    local v54 = MapUtil.getOrCreate(p52.playerLassoModifierMap, p53, function() -- Line: 414
        return {};
    end);

    if p53 then
        return v54;
    end;

    return nil;
end;

KnitClient.CreateController(u6.new());

return nil;
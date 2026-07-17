-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local MobileTouchType = v1.MobileTouchType;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local RunService = v5.RunService;
local TweenService = v5.TweenService;
local UserInputService = v5.UserInputService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local WaterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "water-gun", "water-gun-util").WaterType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "water-guns", "water-gun-util");
local WATER_ATTRIBUTE = v6.WATER_ATTRIBUTE;
local WATER_GUN_COST = v6.WATER_GUN_COST;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WaterBar = RuntimeLib.import(script, script.Parent, "ui", "water-bar").WaterBar;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 39, Name: __tostring
        return "RapidWaterGunController";
    end,

    __index = HandKnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 45
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 49
    -- upvalues: HandKnitController (copy), u3 (copy), DeviceUtil (copy), WaterType (copy)
    HandKnitController.constructor(p9);
    p9.Name = "RapidWaterGunController";
    p9.sprayingSpeedMaid = u3.new();
    p9.sprayerModeMaid = u3.new();
    p9.YTargetOffset = DeviceUtil.isMobileControls() and 0.25 or 0.05;
    p9.userVisualEffectMap = {};
    p9.abilityUiMaid = u3.new();
    p9.victimMap = {};
    p9.maid = u3.new();
    p9.tickCount = 0;
    p9.originalWaistPositions = {};
    p9.spraying = false;
    p9.waterType = WaterType.DEFAULT;
end;

function u7.isRelevantItem(p10, p11) -- Line: 64
    -- upvalues: ItemType (copy)
    return p11.itemType == ItemType.AQUA_47;
end;

function u7.KnitStart(u12) -- Line: 67
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), ItemType (copy), Players (copy), WaterType (copy)
    HandKnitController.KnitStart(u12);
    ClientSyncEvents.BeginProjectileTargeting:connect(function(p13) -- Line: 70
        -- upvalues: ItemType (ref)
        if p13.handItem.itemType ~= ItemType.AQUA_47 then
            return nil;
        end;

        p13:setCancelled(true);
    end);
    ClientSyncEvents.ProjectileLaunched:connect(function(p14) -- Line: 77
        if p14.projectileType == "water_bullet" or (p14.projectileType == "slime_water_bullet" or p14.projectileType == "frost_water_bullet") then
            p14:setCancelled(true);
        end;
    end);
    Players.LocalPlayer:GetAttributeChangedSignal("WaterType"):Connect(function() -- Line: 82
        -- upvalues: Players (ref), WaterType (ref), u12 (copy)
        local v15 = Players.LocalPlayer:GetAttribute("WaterType");

        if v15 == nil then
            v15 = WaterType.DEFAULT;
        end;

        u12.waterType = v15;
    end);
end;

function u7.onStartCharging(p16) -- Line: 91
end;

function u7.onStopCharging(p17) -- Line: 93
end;

function u7.onLaunch(p18, p19) -- Line: 95
end;

function u7.onStartReload(p20, p21) -- Line: 97
end;

function u7.onEnable(p22, p23, p24) -- Line: 99
    -- upvalues: Flamework (copy), u4 (copy), WaterBar (copy)
    p22.stillEnable = p24;
    p22.maid:GiveTask(p22.sprayerModeMaid);
    p22.maid:GiveTask(p22.sprayingSpeedMaid);
    p22.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createFragment({
        WaterBar = u4.createElement(WaterBar)
    })));
    p22:enableRapidMode();
end;

function u7.onDisable(u25) -- Line: 109
    u25:setupYield(function() -- Line: 110
        -- upvalues: u25 (copy)
        u25:cleanUp();

        return function() -- Line: 112
        end;
    end);
    u25.stillEnable = nil;
    u25.abilityUiMaid:DoCleaning();
    u25.maid:DoCleaning();
end;

function u7.beginHolding(u26, u27) -- Line: 125
    -- upvalues: KnitClient2 (copy), AnimationUtil (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), WATER_ATTRIBUTE (copy), WATER_GUN_COST (copy), KnitClient (copy), Workspace (copy)
    if u26.spraying then
        return nil;
    end;

    u26.spraying = true;
    u26.sprayingSpeedMaid:GiveTask(KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
        moveSpeedMultiplier = 0.5,
        blockSprint = true
    }));
    local u28 = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.HEADHUNTER_AIM));
    u26.sprayingSpeedMaid:GiveTask(task.spawn(function() -- Line: 141
        -- upvalues: Players (ref), u26 (copy), WATER_ATTRIBUTE (ref), WATER_GUN_COST (ref), u27 (copy)
        while true do
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;

                if Character ~= nil then
                    Character = Character.Position;
                end;
            end;

            if u26.stillEnable then
                local v29 = Players.LocalPlayer:GetAttribute(WATER_ATTRIBUTE);

                if (v29 == nil and 0 or v29) < WATER_GUN_COST then
                    u26:cleanUp();

                    return;
                end;

                u26:fireRapidBullet(u27);
            end;

            if Character then
                local v30 = u26;
                v30.tickCount = v30.tickCount + 1;
            end;

            local v31 = task.wait(0.12000000000000001);

            if v31 == 0 or (v31 ~= v31 or not v31) then
                return;
            end;
        end;
    end));
    u26.sprayingSpeedMaid:GiveTask(function() -- Line: 170
        -- upvalues: u28 (copy)
        local v32 = u28;

        if v32 ~= nil then
            v32:Stop();
        end;

        local v33 = u28;

        if v33 ~= nil then
            v33:Destroy();
        end;
    end);
    local v34 = KnitClient.Controllers.ViewmodelController:getFirstPersonHandItem();

    if v34 ~= nil then
        v34 = v34:WaitForChild("Handle", 1);

        if v34 ~= nil then
            v34 = v34:WaitForChild("EffectParticle", 1);
        end;
    end;

    if v34 then
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame.LookVector;
        end;

        if CurrentCamera then
            local _ = (Players.LocalPlayer.Character:GetPrimaryPartCFrame().Position + CurrentCamera) * 15;
        end;
    end;
end;

function u7.fireRapidBullet(p35, p36) -- Line: 205
    -- upvalues: EntityUtil (copy), KnitClient (copy), AnimationUtil (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy)
    local v37 = EntityUtil:getLocalPlayerEntity();

    if v37 ~= nil then
        v37 = v37:getHandItemInstanceFromCharacter();
    end;

    if not v37 then
        return nil;
    end;

    if KnitClient.Controllers.ViewmodelController:isVisible() then
        v37 = KnitClient.Controllers.ViewmodelController:getFirstPersonHandItem();
    end;

    KnitClient.Controllers.QuickCastBulletController:fireLocalProjectile(p35:getBulletType(), v37, p36);
    AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.HEADHUNTER_SHOOT));
    KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.HEADHUNTER_SHOOT_FP);
    SoundManager:playSound(RandomUtil.fromList(GameSound.WATER_SHOT_1, GameSound.WATER_SHOT_2, GameSound.WATER_SHOT_3, GameSound.WATER_SHOT_4));
end;

function u7.cleanUp(p38) -- Line: 221
    -- upvalues: RunService (copy), Players (copy), TweenService (copy)
    p38.spraying = false;
    p38.sprayingSpeedMaid:DoCleaning();
    pcall(function() -- Line: 224
        -- upvalues: RunService (ref)
        return RunService:UnbindFromRenderStep("water-gun-mobile-confirm");
    end);
    p38.tickCount = 0;
    local Character = Players.LocalPlayer.Character;

    if not Character then
        return nil;
    end;

    local UpperTorso = Character:FindFirstChild("UpperTorso");

    if not UpperTorso then
        return nil;
    end;

    local Waist = UpperTorso:FindFirstChild("Waist");

    if Waist and p38.originalWaistC0 then
        TweenService:Create(Waist, TweenInfo.new(0.085, Enum.EasingStyle.Linear), {
            Transform = p38.originalWaistC0
        }):Play();
    end;
end;

function u7.enableRapidMode(u39) -- Line: 244
    -- upvalues: Flamework (copy), RunService (copy), CooldownId (copy), MobileTouchType (copy), UserInputService (copy), Players (copy)
    local u40 = nil;
    u39.sprayerModeMaid = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "Water-Gun",

        boundFunction = function(p41, p42, u43) -- Line: 249, Name: boundFunction
            -- upvalues: u40 (ref), u39 (copy), RunService (ref), Flamework (ref), CooldownId (ref)
            if p42 == Enum.UserInputState.Begin then
                if u43.UserInputType == Enum.UserInputType.Touch then
                    u40 = u43;
                end;

                local function u46() -- Line: 254
                    -- upvalues: u39 (ref), u43 (copy), RunService (ref)
                    if not (u39.stillEnable and u39.stillEnable()) then
                        return nil;
                    end;

                    if u43.UserInputState == Enum.UserInputState.End or u43.UserInputState == Enum.UserInputState.Cancel then
                        return nil;
                    end;

                    if u43.UserInputType == Enum.UserInputType.Touch then
                        local u44 = 0;
                        RunService:BindToRenderStep("water-gun-mobile-confirm", 250, function(p45) -- Line: 264
                            -- upvalues: u44 (ref), u39 (ref), RunService (ref)
                            u44 = u44 + p45;

                            if u44 >= 0.3 then
                                if u39.spraying then
                                    return nil;
                                end;

                                RunService:UnbindFromRenderStep("water-gun-mobile-confirm");

                                if u39.stillEnable then
                                    u39:beginHolding(false);
                                end;
                            end;
                        end);

                        return Enum.ContextActionResult.Pass;
                    end;

                    u39:beginHolding(false);
                end;

                if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(CooldownId.FROSTY_GUN) then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(CooldownId.FROSTY_GUN, "callback", function() -- Line: 281
                        -- upvalues: u46 (copy)
                        u46();
                    end);
                end;

                u46();
            elseif p42 == Enum.UserInputState.End then
                if u40 and u43 ~= u40 then
                    return nil;
                end;

                u40 = nil;
                u39:cleanUp();
            end;

            return Enum.ContextActionResult.Pass;
        end,

        mobile = {
            touchType = MobileTouchType.TouchBeginEnd
        },
        priority = Enum.ContextActionPriority.Low.Value
    });
    u39.sprayerModeMaid:GiveTask(UserInputService.TouchMoved:Connect(function(p47, p48) -- Line: 301
        -- upvalues: u40 (ref), Players (ref), RunService (ref)
        if p47 ~= u40 then
            return nil;
        end;

        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:FindFirstChildWhichIsA("Humanoid");

            if Character ~= nil then
                Character = Character.MoveDirection;
            end;
        end;

        if Character ~= nil and Character ~= Vector3.new() then
            pcall(function() -- Line: 314
                -- upvalues: RunService (ref)
                return RunService:UnbindFromRenderStep("water-gun-mobile-confirm");
            end);
        end;
    end));
end;

function u7.disableRapidMode(p49) -- Line: 320
    p49.sprayerModeMaid:DoCleaning();
    p49:cleanUp();
end;

function u7.swap(p50) -- Line: 324
    -- upvalues: Flamework (copy), AbilityId (copy)
    if not p50:isEnabled() then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.WATER_GUN_SWAP);
end;

function u7.isInFront(p51, p52, p53, p54, p55) -- Line: 330
    local _ = p55 == nil;

    return p53:Dot((p52 - p54).Unit) > 0;
end;

function u7.getBulletType(p56) -- Line: 343
    -- upvalues: WaterType (copy)
    return p56.waterType == WaterType.FROSTY and "frost_water_bullet" or (p56.waterType == WaterType.SLIME and "slime_water_bullet" or "water_bullet");
end;

local function calculateLookAtAngles(p57, p58) -- Line: 354
    local v59 = p58 - p57.Position;
    local v60 = (-(math.atan(v59.Z / v59.X) + (v59.X > 0 and 3.141592653589793 or 0)) + 1.5707963267948966 - select(2, (p57 - p57.Position):ToEulerAnglesYXZ()) + 1.5707963267948966) % 6.283185307179586 - 1.5707963267948966;

    if math.abs(v60) > 1.7278759594743864 then
        return 0, 3.141592653589793;
    end;

    local v61 = math.clamp(v60, -1.288052987971815, 1.288052987971815) + 3.141592653589793;
    local v62 = math.pow(v59.X, 2) + math.pow(v59.Z, 2);
    local v63 = math.sqrt(v62);
    local v64 = math.atan(v59.Y / v63) - (p57 - p57.Position):ToEulerAnglesYXZ();

    return math.clamp(v64, -0.3141592653589793, 0.3141592653589793), v61;
end;

KnitClient.CreateController(u7.new());

return nil;
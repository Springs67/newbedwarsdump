-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local getAbilityMeta = v1.getAbilityMeta;
local MobileButton = v1.MobileButton;
local MobileTouchType = v1.MobileTouchType;
local PressMode = v1.PressMode;
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v5.ContextActionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local AbilityIndicatorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "ability-indicator", "ability-indicator-util").AbilityIndicatorUtil;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local WizardUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "wizard", "wizard-util").WizardUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local WIZARD_LIGHTNING_STORM = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound.WIZARD_LIGHTNING_STORM;
local u6 = ReplicatedStorage.Assets.Effects.StormCloud:Clone();
local u7 = Color3.fromRGB(4, 175, 236);
local u8 = Color3.fromRGB(219, 184, 0);
local u9 = Color3.fromRGB(219, 97, 99);
local u10 = setmetatable({}, {
    __tostring = function() -- Line: 50, Name: __tostring
        return "WizardStaffController";
    end,

    __index = KnitController
});
u10.__index = u10;

function u10.new(...) -- Line: 56
    -- upvalues: u10 (ref)
    local v11 = setmetatable({}, u10);

    return v11:constructor(...) or v11;
end;

function u10.constructor(p12) -- Line: 60
    -- upvalues: KnitController (copy), u3 (copy)
    KnitController.constructor(p12);
    p12.Name = "WizardStaffController";
    p12.castAvailable = false;
    p12.targetingMaid = u3.new();
    p12.itemMaid = u3.new();
    p12.shockwaveBound = false;
end;

function u10.KnitStart(u13) -- Line: 68
    -- upvalues: KnitController (copy), KnitClient (copy), AnimationType (copy), ClientSyncEvents (copy), AbilityId (copy), Players (copy), MatchState (copy), KnitClient2 (copy), BedwarsKit (copy), BedwarsKitSkin (copy), default (copy), SoundManager (copy), WIZARD_LIGHTNING_STORM (copy), AnimationUtil (copy), GameAnimationUtil (copy), WatchCharacter (copy)
    KnitController.KnitStart(u13);
    KnitClient.Controllers.PreloadController:runPreload({
        animations = {
            AnimationType.WIZARD_ABILITY_SWITCH,
            AnimationType.WIZARD_LIGHTNING_CAST,
            AnimationType.WIZARD_BALL_CAST,
            AnimationType.WIZARD_LIGHTNING_STRIKE_CAST
        }
    });
    ClientSyncEvents.CanUseLocalAbility:connect(function(p14) -- Line: 74
        -- upvalues: AbilityId (ref), u13 (copy)
        if table.find({ AbilityId.LIGHTNING_STRIKE, AbilityId.LIGHTNING_STORM, AbilityId.SHOCKWAVE }, p14.ability) == nil then
            return nil;
        end;

        if not u13:canCastAbility(p14.ability) then
            p14:setCancelled(true);
        end;
    end);
    Players.LocalPlayer:GetAttributeChangedSignal("WizardAbility"):Connect(function() -- Line: 84
        -- upvalues: u13 (copy), Players (ref), AbilityId (ref)
        u13.itemMaid:DoCleaning();
        local LocalPlayer = Players.LocalPlayer;
        local v15 = LocalPlayer:GetAttribute("WizardAbility");

        if not LocalPlayer then
            return nil;
        end;

        if v15 == AbilityId.LIGHTNING_STRIKE then
            u13:toggleStormIndicator(false);
            u13:activateIndicator(AbilityId.LIGHTNING_STRIKE);
            u13:createShockwaveAction();

            return;
        end;

        if v15 ~= AbilityId.LIGHTNING_STORM then
            if v15 ~= nil then
                return;
            end;

            u13.itemMaid:DoCleaning();

            return;
        end;

        u13:disableIndicator(AbilityId.LIGHTNING_STRIKE);
        u13:toggleStormIndicator(true);
        u13:createShockwaveAction();
    end);
    ClientSyncEvents.MatchStateChange:connect(function(p16) -- Line: 110
        -- upvalues: MatchState (ref), Players (ref), KnitClient2 (ref), BedwarsKit (ref), BedwarsKitSkin (ref)
        if p16.matchState ~= MatchState.RUNNING then
            return nil;
        end;

        for _, v in Players:GetPlayers() do
            task.spawn(function() -- Line: 115
                -- upvalues: KnitClient2 (ref), v (copy), BedwarsKit (ref), BedwarsKitSkin (ref)
                if not KnitClient2.Controllers.KitController:isUsingKit(v, BedwarsKit.WIZARD) then
                    return nil;
                end;

                local v17 = KnitClient2.Controllers.KitController:getKitSkin(v.Character);

                if not v17 then
                    return nil;
                end;

                if v17 == BedwarsKitSkin.EMERALD_VICTORIOUS_WIZARD or v17 == BedwarsKitSkin.NIGHTMARE_VICTORIOUS_WIZARD then
                    local Character = v.Character;

                    if Character ~= nil then
                        local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");

                        if HumanoidRootPart ~= nil then
                            local Summon = HumanoidRootPart:WaitForChild("Summon");

                            if Summon ~= nil then
                                local function _(p18) -- Line: 132
                                    if p18:IsA("ParticleEmitter") then
                                        p18.Enabled = false;
                                    end;
                                end;

                                for i, child in Summon:GetChildren() do
                                    local _ = i - 1;

                                    if child:IsA("ParticleEmitter") then
                                        child.Enabled = false;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end);
        end;
    end);
    default.Client:OnEvent("WizardLightningStorm", function(u19) -- Line: 147
        -- upvalues: Players (ref), KnitClient2 (ref), BedwarsKitSkin (ref), SoundManager (ref), WIZARD_LIGHTNING_STORM (ref), KnitClient (ref)
        local target = u19.target;

        if not (target and Players.LocalPlayer.Character) then
            return nil;
        end;

        task.spawn(function() -- Line: 153
            -- upvalues: KnitClient2 (ref), u19 (copy), BedwarsKitSkin (ref)
            local v20 = KnitClient2.Controllers.KitController:getKitSkin(u19.caster.Character);

            if v20 == BedwarsKitSkin.EMERALD_VICTORIOUS_WIZARD or v20 == BedwarsKitSkin.NIGHTMARE_VICTORIOUS_WIZARD then
                local Character = u19.caster.Character;

                if Character ~= nil then
                    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");

                    if HumanoidRootPart ~= nil then
                        local Summon = HumanoidRootPart:WaitForChild("Summon");

                        if Summon ~= nil then
                            local function _(u21) -- Line: 164
                                if u21:IsA("ParticleEmitter") then
                                    u21.Enabled = true;
                                    task.delay(2, function() -- Line: 167
                                        -- upvalues: u21 (copy)
                                        u21.Enabled = false;
                                    end);
                                end;
                            end;

                            for i, child in Summon:GetChildren() do
                                local _ = i - 1;

                                if child:IsA("ParticleEmitter") then
                                    child.Enabled = true;
                                    task.delay(2, function() -- Line: 167
                                        -- upvalues: child (copy)
                                        child.Enabled = false;
                                    end);
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end);
        SoundManager:playSound(WIZARD_LIGHTNING_STORM, {
            rollOffMaxDistance = 200,
            rollOffMinDistance = 35,
            volumeMultiplier = 0.7,
            position = target
        });
        KnitClient.Controllers.WizardLightningStrikeController:playStrikeImpactEffects(target, u19.caster == Players.LocalPlayer, u19.caster);
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p22) -- Line: 190
        -- upvalues: Players (ref), AbilityId (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        local v23 = Players:GetPlayerFromCharacter(p22.userCharacter);

        if not v23 then
            return nil;
        end;

        if p22.ability == AbilityId.SHOCKWAVE then
            local v24 = AnimationUtil:playAnimation(v23, GameAnimationUtil:getAssetId(AnimationType.RAVEN_THROW));

            if v24 then
                v24:AdjustSpeed(2.5);
            end;
        elseif p22.ability == AbilityId.LIGHTNING_STORM or p22.ability == AbilityId.LIGHTNING_STRIKE then
            AnimationUtil:playAnimation(v23, GameAnimationUtil:getAssetId(AnimationType.WIZARD_LIGHTNING_CAST));
        end;
    end);
    WatchCharacter(function(p25, u26) -- Line: 204
        -- upvalues: Players (ref), u13 (copy), KnitClient (ref)
        if p25 ~= Players.LocalPlayer then
            return nil;
        end;

        u26:GetAttributeChangedSignal("WizardCastSlow"):Connect(function() -- Line: 208
            -- upvalues: u26 (copy), u13 (ref), KnitClient (ref)
            if u26:GetAttribute("WizardCastSlow") ~= nil then
                u13.speedMaid = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    blockSprint = false,
                    moveSpeedMultiplier = u26:GetAttribute("WizardCastSlow")
                });

                return;
            end;

            local speedMaid = u13.speedMaid;

            if speedMaid ~= nil then
                speedMaid:Destroy();
            end;

            u13.speedMaid = nil;
        end);
    end);
end;

function u10.createShockwaveAction(u27) -- Line: 224
    -- upvalues: Flamework (copy), AbilityId (copy)
    if u27.shockwaveBound then
        return nil;
    end;

    local u31 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "ItemSecondary",
        actionId = "shockwave",

        boundFunction = function(p28, p29, p30) -- Line: 232, Name: boundFunction
            -- upvalues: u27 (copy), Flamework (ref), AbilityId (ref)
            if p29 == Enum.UserInputState.Cancel then
                return Enum.ContextActionResult.Pass;
            end;

            if not u27:isStaffInHand() then
                return nil;
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.SHOCKWAVE, p30, {
                target = Vector3.new()
            });
        end
    });
    u27.shockwaveBound = true;
    u27.itemMaid:GiveTask(function() -- Line: 249
        -- upvalues: u31 (copy), u27 (copy)
        u31:DoCleaning();
        u27.shockwaveBound = false;
    end);
end;

function u10.canCastAbility(p32, p33) -- Line: 254
    -- upvalues: InventoryUtil (copy), Players (copy), WizardUtil (copy), getAbilityMeta (copy), Flamework (copy)
    local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

    if hand ~= nil then
        hand = hand.itemType;
    end;

    if not hand then
        return false;
    end;

    if not WizardUtil:hasAbility(hand, p33) then
        return false;
    end;

    local v34 = WizardUtil:getManaId(hand);

    if v34 == nil then
        return false;
    end;

    local usableProgress = getAbilityMeta(v34).usableProgress;

    if usableProgress ~= nil then
        usableProgress = usableProgress.progressNeededPerUse;
    end;

    local v35 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getProgress(v34);

    if usableProgress == nil or v35 == nil then
        return false;
    end;

    local v36 = WizardUtil:getAbilityCost(p33);

    if v36 == nil then
        return false;
    end;

    if v35 < usableProgress * v36 then
        return false;
    end;

    local v37 = getAbilityMeta(p33);

    return not (v37.cooldown and Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(v37.cooldown.id));
end;

function u10.toggleStormIndicator(u38, p39) -- Line: 295
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), ContextActionService (copy), Flamework (copy), AbilityId (copy), MobileTouchType (copy)
    local wizardIndicator = u38.wizardIndicator;

    if wizardIndicator ~= nil then
        wizardIndicator = wizardIndicator.Parent;
    end;

    if not wizardIndicator then
        u38.wizardIndicator = ReplicatedStorage.Assets.Misc.WizardIndicator:Clone();
        u38.wizardIndicator.Parent = Workspace;
    end;

    if not p39 then
        local wizardIndicator2 = u38.wizardIndicator;

        if wizardIndicator2 ~= nil then
            wizardIndicator2:Destroy();
        end;

        u38.wizardIndicator = nil;
        ContextActionService:UnbindAction("Lightning Storm");

        return nil;
    end;

    ContextActionService:UnbindAction("Lightning Strike");
    local v45 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "Lightning Storm",

        boundFunction = function(p40, p41, p42) -- Line: 318, Name: boundFunction
            -- upvalues: u38 (copy), Flamework (ref), AbilityId (ref)
            if p41 == Enum.UserInputState.Cancel then
                return Enum.ContextActionResult.Pass;
            end;

            if not u38.castAvailable then
                return Enum.ContextActionResult.Pass;
            end;

            if p42.UserInputType == Enum.UserInputType.Touch and p41 ~= Enum.UserInputState.End then
                return Enum.ContextActionResult.Pass;
            end;

            local v43 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
            local LIGHTNING_STORM = AbilityId.LIGHTNING_STORM;
            local v44 = {};
            local wizardIndicator2 = u38.wizardIndicator;

            if wizardIndicator2 ~= nil then
                wizardIndicator2 = wizardIndicator2.Position;
            end;

            v44.target = wizardIndicator2;
            v43:useAbility(LIGHTNING_STORM, p42, v44);
        end,

        mobile = {
            touchType = MobileTouchType.TouchBeginEnd
        }
    });
    u38.itemMaid:GiveTask(v45);
    u38:enableAbilityTargeting(AbilityId.LIGHTNING_STORM);
end;

function u10.enableAbilityTargeting(u46, u47) -- Line: 348
    -- upvalues: DeviceUtil (copy), u4 (copy), BedwarsImageId (copy), BedwarsUI (copy), PressMode (copy), MobileButton (copy), Players (copy), RunService (copy), Workspace (copy), AbilityIndicatorUtil (copy), ReplicatedStorage (copy), u7 (copy), u8 (copy), InventoryUtil (copy), WizardUtil (copy), u9 (copy)
    u46.targetingMaid:DoCleaning();
    u46.itemMaid:GiveTask(u46.targetingMaid);
    local wizardIndicator = u46.wizardIndicator;

    if wizardIndicator ~= nil then
        wizardIndicator = wizardIndicator.Parent;
    end;

    if wizardIndicator then
        u46.targetingMaid:GiveTask(u46.wizardIndicator);
    end;

    local u48 = false;

    if DeviceUtil.isMobileControls() then
        local v49 = {};
        local v50 = {
            Image = BedwarsImageId.BOW_MOBILE,
            Position = BedwarsUI:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0),
            PressMode = PressMode.FREE_MOVING_HOLD,

            OnPressDown = function() -- Line: 386
                -- upvalues: u48 (ref)
                u48 = true;
            end,

            OnPressUp = function() -- Line: 389
                -- upvalues: u48 (ref)
                u48 = false;
            end
        };
        v49[#v49 + 1] = u4.createElement(MobileButton, v50);
        local u51 = u4.mount(u4.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, v49), Players.LocalPlayer:WaitForChild("PlayerGui"));
        u46.targetingMaid:GiveTask(function() -- Line: 394
            -- upvalues: u4 (ref), u51 (copy)
            return u4.unmount(u51);
        end);
    end;

    u46.targetingMaid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 398
        -- upvalues: Players (ref), u46 (copy), DeviceUtil (ref), u48 (ref), Workspace (ref), AbilityIndicatorUtil (ref), ReplicatedStorage (ref), u7 (ref), u47 (copy), u8 (ref), InventoryUtil (ref), WizardUtil (ref), u9 (ref)
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:GetPivot().Position;
        end;

        if not Character then
            u46.targetingMaid:DoCleaning();

            return nil;
        end;

        local UnitRay = Players.LocalPlayer:GetMouse().UnitRay;
        local v52;

        if DeviceUtil.isMobileControls() and not u48 then
            v52 = nil;
        else
            local CurrentCamera = Workspace.CurrentCamera;

            if u48 and CurrentCamera then
                local v53 = CurrentCamera.ViewportSize / 2 - Vector2.new(0, game:GetService("GuiService"):GetGuiInset().Y / 2);
                UnitRay = CurrentCamera:ViewportPointToRay(v53.X, v53.Y).Unit;
            end;

            v52 = AbilityIndicatorUtil:calculatePlayerTargetPoint(Players.LocalPlayer, UnitRay.Origin, UnitRay.Direction, 300);
        end;

        if not v52 then
            u46.castAvailable = false;
            local wizardIndicator2 = u46.wizardIndicator;

            if wizardIndicator2 ~= nil then
                wizardIndicator2 = wizardIndicator2.Parent;
            end;

            if wizardIndicator2 then
                local wizardIndicator3 = u46.wizardIndicator;

                if wizardIndicator3 ~= nil then
                    wizardIndicator3:Destroy();
                end;
            end;

            return;
        end;

        local wizardIndicator2 = u46.wizardIndicator;

        if wizardIndicator2 ~= nil then
            wizardIndicator2 = wizardIndicator2.Parent;
        end;

        if not wizardIndicator2 then
            u46.wizardIndicator = ReplicatedStorage.Assets.Misc.WizardIndicator:Clone();
            u46.wizardIndicator.Parent = Workspace;
            u46.targetingMaid:GiveTask(u46.wizardIndicator);
        end;

        u46.wizardIndicator:PivotTo(CFrame.new(v52));
        u46.wizardIndicator.Position = v52;
        u46.castAvailable = true;
        local u54 = u7;

        if not u46:canCastAbility(u47) then
            u54 = u8;
        end;

        local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

        if hand ~= nil then
            hand = hand.itemType;
        end;

        if (v52 - Character).Magnitude > WizardUtil:getCastRange(hand) then
            u54 = u9;
            u46.castAvailable = false;
        end;

        local function _(p55) -- Line: 454
            -- upvalues: u54 (ref)
            if p55:IsA("BasePart") then
                p55.Color = u54;
            end;
        end;

        for i, child in u46.wizardIndicator:GetChildren() do
            local _ = i - 1;

            if child:IsA("BasePart") then
                child.Color = u54;
            end;
        end;
    end));
end;

function u10.activateIndicator(u56, u57) -- Line: 477
    -- upvalues: AbilityId (copy), ReplicatedStorage (copy), Workspace (copy), Flamework (copy), MobileTouchType (copy)
    local v58 = "Lightning Strike";

    if u57 == AbilityId.LIGHTNING_STRIKE then
        u56.wizardIndicator = ReplicatedStorage.Assets.Misc.WizardIndicator:Clone();
    elseif u57 == AbilityId.LIGHTNING_STORM then
        u56.wizardIndicator = ReplicatedStorage.Assets.Misc.WizardIndicator:Clone();
        v58 = "Lightning Storm";
    end;

    u56.wizardIndicator.Parent = Workspace;
    local v64 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = v58,

        boundFunction = function(p59, p60, p61) -- Line: 495, Name: boundFunction
            -- upvalues: u56 (copy), Flamework (ref), u57 (copy)
            if p60 == Enum.UserInputState.Cancel then
                return Enum.ContextActionResult.Pass;
            end;

            if not (u56.castAvailable and u56:isStaffInHand()) then
                return Enum.ContextActionResult.Pass;
            end;

            if p61.UserInputType == Enum.UserInputType.Touch and p60 ~= Enum.UserInputState.End then
                return Enum.ContextActionResult.Pass;
            end;

            local v62 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
            local v63 = {};
            local wizardIndicator = u56.wizardIndicator;

            if wizardIndicator ~= nil then
                wizardIndicator = wizardIndicator.Position;
            end;

            v63.target = wizardIndicator;
            v62:useAbility(u57, p61, v63);
        end,

        mobile = {
            touchType = MobileTouchType.TouchBeginEnd
        }
    });
    u56.itemMaid:GiveTask(v64);
    u56:enableAbilityTargeting(AbilityId.LIGHTNING_STRIKE);
end;

function u10.disableIndicator(p65, p66) -- Line: 525
    -- upvalues: AbilityId (copy), ContextActionService (copy)
    local wizardIndicator = p65.wizardIndicator;

    if wizardIndicator ~= nil then
        wizardIndicator:Destroy();
    end;

    p65.wizardIndicator = nil;
    ContextActionService:UnbindAction((p66 == AbilityId.LIGHTNING_STRIKE or p66 ~= AbilityId.LIGHTNING_STORM) and "Lightning Strike" or "Lightning Storm");
end;

function u10.isStaffInHand(p67) -- Line: 543
    -- upvalues: InventoryUtil (copy), Players (copy), ItemType (copy)
    local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

    if hand then
        return table.find({ ItemType.WIZARD_STAFF, ItemType.WIZARD_STAFF_2, ItemType.WIZARD_STAFF_3 }, hand.itemType) ~= nil;
    end;

    return false;
end;

function u10.createStormCloud(p68, p69, p70) -- Line: 552
    -- upvalues: u6 (copy), Workspace (copy)
    local v71 = math.random(9, 12);
    local v72 = false;
    local v73 = 0;

    while true do
        if v72 then
            v73 = v73 + 1;
        else
            v72 = true;
        end;

        if v73 > v71 then
            return;
        end;

        local u74 = u6:Clone();
        local v75 = math.random(-20, 20);
        local v76 = math.random(25, 33);
        local v77 = p69 + Vector3.new(v75, v76, math.random(-20, 20));
        local v78 = math.random(0, 259);
        local v79 = math.rad(v78);
        local v80 = CFrame.Angles(0, v79, 0);
        u74:PivotTo(CFrame.new(v77));
        local PrimaryPart = u74.PrimaryPart;

        if PrimaryPart then
            u74:PivotTo(PrimaryPart.CFrame * v80);
        end;

        u74.Parent = Workspace;
        task.delay(p70 + 1, function() -- Line: 578
            -- upvalues: u74 (copy)
            u74:Destroy();
        end);
    end;
end;

KnitClient.CreateController(u10.new());

return nil;
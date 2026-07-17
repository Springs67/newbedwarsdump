-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local GameQueryUtil = v1.GameQueryUtil;
local MobileTouchType = v1.MobileTouchType;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Player = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src", "Knit", "KnitClient").Player;
local InOutExpo = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutExpo;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v5.ContextActionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local InfernalShieldBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "infernal-shield-balance").InfernalShieldBalance;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local AbilityIndicatorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "ability-indicator", "ability-indicator-util").AbilityIndicatorUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local ShieldEnergyComponent = RuntimeLib.import(script, script.Parent, "shield-energy-component").ShieldEnergyComponent;
local ShieldUltChargeComponent = RuntimeLib.import(script, script.Parent, "shield-ult-charge-component").ShieldUltChargeComponent;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 43, Name: __tostring
        return "InfernalShieldController";
    end,

    __index = HandKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 49
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 53
    -- upvalues: HandKnitController (copy), Workspace (copy), default2 (copy), u2 (copy)
    HandKnitController.constructor(p8);
    p8.Name = "InfernalShieldController";
    p8.camera = Workspace.CurrentCamera;
    p8.infernalShieldState = default2.Client:Get("UseInfernalShield");
    p8.maid = u2.new();
    p8.raisedMaid = u2.new();
    p8.lastShieldRaised = 0;
    p8.uiMaid = u2.new();
    p8.targetMarked = false;
    p8.indicatorShown = false;
    p8.launchMaid = u2.new();
    p8.effectMaids = {};
    p8.initializedEnergyBar = false;
end;

function u6.KnitStart(u9) -- Line: 68
    -- upvalues: HandKnitController (copy), Workspace (copy), default2 (copy), SoundManager (copy), GameSound (copy), Players (copy), ClientSyncEvents (copy), AbilityId (copy), Player (copy), Flamework (copy), InfernalShieldBalance (copy), AbilityState (copy), MatchState (copy), KnitClient (copy), BedwarsKitSkinMeta (copy)
    HandKnitController.KnitStart(u9);
    u9.camera = Workspace.CurrentCamera;
    default2.Client:OnEvent("ReflectProjectileEffects", function(p10) -- Line: 71
        -- upvalues: u9 (copy)
        u9:playEffects(p10.player);
    end);
    default2.Client:OnEvent("ProjectileDeflected", function(p11) -- Line: 74
        -- upvalues: SoundManager (ref), GameSound (ref), Players (ref)
        local SHIELD_BLOCKED = GameSound.SHIELD_BLOCKED;
        local v12 = {};
        local v13;

        if p11.deflector == Players.LocalPlayer then
            v13 = nil;
        else
            v13 = p11.position;
        end;

        v12.position = v13;
        SoundManager:playSound(SHIELD_BLOCKED, v12);
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p14) -- Line: 79
        -- upvalues: Players (ref), AbilityId (ref), u9 (copy)
        if p14.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        if p14.ability == AbilityId.ACTIVE_SHIELDER_INDICATOR then
            if u9.indicator then
                local Character = Players.LocalPlayer.Character;

                if Character ~= nil then
                    Character:SetAttribute("Transparency", 0);
                end;

                u9:setIndicatorTransparency(1);
                u9:useUlt();
                u9:disableIndicator(true);
            else
                u9:activateIndicator();
            end;
        end;

        if p14.ability == AbilityId.SHIELDER_ULT then
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character:SetAttribute("Transparency", 0);
            end;

            u9:setIndicatorTransparency(1);
            u9:useUlt();
            u9:disableIndicator(true);
        end;
    end);
    Players.LocalPlayer:GetAttributeChangedSignal("InfernalShieldUltCharge"):Connect(function() -- Line: 106
        -- upvalues: Player (ref), Flamework (ref), AbilityId (ref), InfernalShieldBalance (ref), AbilityState (ref)
        local v15 = Player:GetAttribute("InfernalShieldUltCharge");
        local v16 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.ACTIVE_SHIELDER_INDICATOR);

        if not v16 then
            return nil;
        end;

        if (v15 == nil and 0 or v15) < InfernalShieldBalance.SHIELD_ULT_CHARGE_REQ then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v16, AbilityState.DISABLED);

            return;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v16, AbilityState.READY);
    end);
    ClientSyncEvents.MatchStateChange:connect(function(p17) -- Line: 122
        -- upvalues: MatchState (ref), Players (ref), KnitClient (ref), BedwarsKitSkinMeta (ref)
        if p17.matchState == MatchState.RUNNING then
            for _, v in Players:GetPlayers() do
                local Character = v.Character;

                if Character then
                    local v18 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(Character)];
                    local shielder = v18.shielder;

                    if shielder ~= nil then
                        shielder = shielder.sound;
                    end;

                    if shielder then
                        local PreloadController = KnitClient.Controllers.PreloadController;
                        local v19 = {};
                        local shielder2 = v18.shielder;

                        if shielder2 ~= nil then
                            shielder2 = shielder2.sound.landingSound;
                        end;

                        local shielder3 = v18.shielder;

                        if shielder3 ~= nil then
                            shielder3 = shielder3.sound.launchSound;
                        end;

                        local shielder4 = v18.shielder;

                        if shielder4 ~= nil then
                            shielder4 = shielder4.sound.leapSound;
                        end;

                        v19.sounds = { shielder2, shielder3, shielder4 };
                        PreloadController:runPreload(v19);

                        return;
                    end;
                end;
            end;
        end;
    end);
end;

function u6.isRelevantItem(p20, p21) -- Line: 159
    -- upvalues: ItemType (copy)
    return p21.itemType == ItemType.INFERNAL_SHIELD;
end;

function u6.onEnable(p22, p23) -- Line: 162
    -- upvalues: Flamework (copy), AbilityId (copy), Player (copy), InfernalShieldBalance (copy), AbilityState (copy), u4 (copy), ShieldEnergyComponent (copy), Players (copy)
    p22:raiseShield();
    p22.uiMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.ACTIVE_SHIELDER_INDICATOR, {
        abilityType = "ItemPrimary",
        abilityButton = {
            icon = "rbxassetid://7051149149"
        }
    }):expect());
    local v24 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.ACTIVE_SHIELDER_INDICATOR);
    local v25 = Player:GetAttribute("InfernalShieldUltCharge");

    if (v25 == nil and 0 or v25) < InfernalShieldBalance.SHIELD_ULT_CHARGE_REQ and v24 then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v24, AbilityState.DISABLED);
    end;

    if not p22.initializedEnergyBar then
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(ShieldEnergyComponent, {
            player = Players.LocalPlayer
        }));
        p22.initializedEnergyBar = true;
    end;
end;

function u6.onDisable(p26) -- Line: 187
    p26:lowerShield();
    p26.maid:DoCleaning();
    p26:disableIndicator();
end;

function u6.raiseShield(u27) -- Line: 192
    -- upvalues: u3 (copy), GameAnimationUtil (copy), AnimationType (copy), Players (copy), KnitClient (copy), Flamework (copy), u4 (copy), ShieldUltChargeComponent (copy)
    if os.clock() - u27.lastShieldRaised < 0.2 then
        return nil;
    end;

    u27.lastShieldRaised = os.clock();
    u27.infernalShieldState:SendToServer({
        raised = true
    });
    u27.raisedMaid:GiveTask(function() -- Line: 200
        -- upvalues: u27 (copy)
        u27.infernalShieldState:SendToServer({
            raised = false
        });
    end);
    local v28 = u3("Animation", {
        AnimationId = GameAnimationUtil:getAssetId(AnimationType.KNIGHT_SHIELD_RAISE_SHIELD)
    });
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:FindFirstChild("Humanoid");
    end;

    local v29;

    if Character == nil then
        v29 = Character;
    else
        v29 = Character:FindFirstChild("Animator");
    end;

    if Character and v29 then
        local u30 = v29:LoadAnimation(v28);
        u30.Looped = true;
        u30:Play();
        u27.raisedMaid:GiveTask(function() -- Line: 222
            -- upvalues: u30 (copy)
            u30:Stop();
            u30:Destroy();
        end);
        local u31 = KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_SHIELD_USE, {
            looped = true
        });
        u27.raisedMaid:GiveTask(function() -- Line: 229
            -- upvalues: u31 (copy)
            local v32 = u31;

            if v32 ~= nil then
                v32:Stop();
            end;
        end);
        u27.uiMaid:DoCleaning();
        u27.uiMaid = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(ShieldUltChargeComponent, {
            player = Players.LocalPlayer
        }));
    end;
end;

function u6.lowerShield(p33) -- Line: 241
    p33.raisedMaid:DoCleaning();
    p33.uiMaid:DoCleaning();
end;

function u6.playEffects(u34, p35) -- Line: 245
    -- upvalues: EntityUtil (copy), u2 (copy), ReplicatedStorage (copy), scaleModel (copy), Workspace (copy), GameQueryUtil (copy), ModelUtil (copy), InOutExpo (copy), RunService (copy), default (copy)
    local u36 = EntityUtil:getEntity(p35);

    if u36 == nil then
        return nil;
    end;

    local u37 = u2.new();
    local v38 = u34.effectMaids[p35];

    if v38 ~= nil then
        v38:DoCleaning();
    end;

    u34.effectMaids[p35] = u37;
    local u39 = ReplicatedStorage.Assets.Effects.InfernalShields:Clone();
    u34:changeShielderColor(p35, u39);
    u39:PivotTo(u36:getInstance():GetPivot());
    scaleModel(u39, 0.06);
    u39.Parent = Workspace;

    for _, child in u39:GetChildren() do
        if child:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(child, true);
        end;
    end;

    ModelUtil.tweenModelSize(u39, 0, InOutExpo, 10);
    local u40 = 0;
    local u45 = RunService.Heartbeat:Connect(function(p41) -- Line: 272
        -- upvalues: u36 (copy), u40 (ref), u39 (copy), u34 (copy), u37 (copy), default (ref)
        local v42 = u36:getInstance():GetPivot();
        local v43 = CFrame.new(v42.Position);
        local v44 = CFrame.Angles(0, u40 * 0.8, 0);
        u39.Shields.CFrame = (v43 + Vector3.new(0, -0.25, 0)) * v44;

        if not u34:validPlayerConditions(u36) then
            u37:DoCleaning();

            return nil;
        end;

        u40 = u40 + p41;

        if u39.PrimaryPart == nil then
            default.Error("Shield effect has no primary part");

            return nil;
        end;
    end);
    u37:GiveTask(function() -- Line: 288
        -- upvalues: u45 (copy), u39 (copy)
        u45:Disconnect();
        u39:Destroy();
    end);
end;

function u6.validPlayerConditions(p46, p47) -- Line: 293
    -- upvalues: ItemType (copy)
    if not p47:isAlive() then
        return false;
    end;

    if p47:getInstance():GetAttribute("InfernalShieldRaised") ~= true then
        return false;
    end;

    local v48 = p47:getItemInHand();

    if v48 ~= nil then
        v48 = v48.Name;
    end;

    if v48 ~= ItemType.INFERNAL_SHIELD then
        return false;
    end;

    if p47:getInstance().PrimaryPart == nil then
        return false;
    end;

    local v49 = p47:getPlayer();

    if v49 ~= nil then
        v49 = v49:GetAttribute("InfernalShieldEnergy");
    end;

    return v49 == nil or v49 > 0;
end;

function u6.activateIndicator(u50) -- Line: 320
    -- upvalues: Players (copy), ReplicatedStorage (copy), Workspace (copy), Flamework (copy), AbilityId (copy), MobileTouchType (copy), RunService (copy), AbilityIndicatorUtil (copy), InfernalShieldBalance (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character:SetAttribute("Transparency", 0.9);
    end;

    if u50.indicator then
        return nil;
    end;

    u50.indicator = ReplicatedStorage.Assets.Misc.ShieldIndicator:Clone();
    u50:changeIndicatorColor(Players.LocalPlayer, u50.indicator);
    u50.indicator.Parent = Workspace;
    local v54 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "Shield Ult",

        boundFunction = function(p51, p52, p53) -- Line: 335, Name: boundFunction
            -- upvalues: Flamework (ref), AbilityId (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.SHIELDER_ULT);
        end,

        mobile = {
            touchType = MobileTouchType.TouchTap,

            mobileBoundFunction = function() -- Line: 340, Name: mobileBoundFunction
                -- upvalues: Flamework (ref), AbilityId (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.SHIELDER_ULT);
            end
        }
    });
    u50.maid:GiveTask(v54);
    local u55 = nil;
    u55 = RunService.Heartbeat:Connect(function() -- Line: 347
        -- upvalues: u50 (copy), u55 (ref), Players (ref), AbilityIndicatorUtil (ref), InfernalShieldBalance (ref)
        if not u50.camera then
            return nil;
        end;

        if not u50.indicator then
            u55:Disconnect();

            return nil;
        end;

        local Character2 = Players.LocalPlayer.Character;

        if Character2 ~= nil then
            Character2 = Character2.PrimaryPart;

            if Character2 ~= nil then
                Character2 = Character2.Position;
            end;
        end;

        local v56 = AbilityIndicatorUtil:calculateBlockTargetPoint(u50.camera.CFrame.Position, u50.camera.CFrame.LookVector.Unit, InfernalShieldBalance.SHIELD_ULT_RANGE, Character2);

        if not v56 then
            if u50.indicatorShown then
                u50:setIndicatorTransparency(1);
                u50.indicatorShown = false;
            end;

            u50.targetMarked = false;

            return;
        end;

        local v57 = Vector3.new(u50.camera.CFrame.Position.X, v56.Y, u50.camera.CFrame.Position.Z);
        u50.indicator:PivotTo(CFrame.lookAt(v56, v57) * CFrame.Angles(0, 3.141592653589793, 0));

        if not u50.indicatorShown then
            u50:setIndicatorTransparency(0);
            u50.indicatorShown = true;
        end;

        u50.targetMarked = true;
    end);
end;

function u6.disableIndicator(p58, p59) -- Line: 384
    -- upvalues: ContextActionService (copy), Players (copy)
    local indicator = p58.indicator;

    if indicator ~= nil then
        indicator:Destroy();
    end;

    p58.launchMaid:DoCleaning();
    p58.indicator = nil;
    ContextActionService:UnbindAction("Shield Ult");

    if p59 then
        return nil;
    end;

    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character:SetAttribute("Transparency", 0);
    end;
end;

function u6.useUlt(p60) -- Line: 400
    -- upvalues: default2 (copy)
    if p60.targetMarked and p60.indicator then
        return default2.Client:Get("ShieldUlt"):CallServer({
            target = p60.indicator.Position
        });
    end;

    return false;
end;

function u6.setIndicatorTransparency(p61, u62) -- Line: 409
    if not p61.indicator then
        return nil;
    end;

    local function _(p63) -- Line: 414
        -- upvalues: u62 (copy)
        if p63:IsA("Part") or (p63:IsA("MeshPart") or p63:IsA("UnionOperation")) then
            p63.Transparency = u62;
        end;
    end;

    for i, child in p61.indicator:GetChildren() do
        local _ = i - 1;

        if child:IsA("Part") or (child:IsA("MeshPart") or child:IsA("UnionOperation")) then
            child.Transparency = u62;
        end;
    end;
end;

function u6.getKitSkinMeta(p64, p65) -- Line: 423
    -- upvalues: KnitClient (copy), BedwarsKitSkinMeta (copy)
    local Character = p65.Character;

    if Character then
        return BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(Character)];
    end;

    return nil;
end;

function u6.changeShielderColor(p66, p67, p68) -- Line: 432
    -- upvalues: Players (copy)
    if p67.Team ~= Players.LocalPlayer.Team then
        return nil;
    end;

    local v69 = p66:getKitSkinMeta(p67);

    if not v69 then
        return nil;
    end;

    local shielder = v69.shielder;

    if shielder ~= nil then
        shielder = shielder.effectColor;
    end;

    if shielder then
        local function _(p70) -- Line: 447
            -- upvalues: shielder (copy)
            if p70:IsA("MeshPart") then
                p70.Color = shielder;
            end;

            if p70:IsA("ImageLabel") then
                p70.ImageColor3 = shielder;
            end;
        end;

        for i, descendant in p68:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("MeshPart") then
                descendant.Color = shielder;
            end;

            if descendant:IsA("ImageLabel") then
                descendant.ImageColor3 = shielder;
            end;
        end;
    end;
end;

function u6.changeIndicatorColor(p71, p72, p73) -- Line: 460
    local v74 = p71:getKitSkinMeta(p72);

    if not v74 then
        return nil;
    end;

    local v75;

    if v74 == nil then
        v75 = v74;
    else
        v75 = v74.shielder;
    end;

    if v75 then
        local bubbleColor = v74.shielder.bubbleColor;
        local effectColor = v74.shielder.effectColor;

        if bubbleColor then
            p73:WaitForChild("DragonSymbol", 1).Color = bubbleColor;
        end;

        if effectColor then
            p73:WaitForChild("Inner", 1).Color = effectColor;
        end;
    end;
end;

KnitClient.CreateController(u6.new());

return nil;
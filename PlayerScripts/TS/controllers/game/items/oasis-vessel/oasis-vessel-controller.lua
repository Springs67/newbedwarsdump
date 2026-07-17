-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local OutQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v5.ContextActionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local TweenService = v5.TweenService;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "oasis", "oasis-constants");
local OasisBalance = v6.OasisBalance;
local OasisTargetIndicator = v6.OasisTargetIndicator;
local OasisVesselMode = v6.OasisVesselMode;
local OasisVesselScaling = v6.OasisVesselScaling;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local v7 = RuntimeLib.import(script, script.Parent.Parent.Parent, "target-selector", "target-selector-util");
local TargetSelector = v7.TargetSelector;
local TargetType = v7.TargetType;
local OasisVesselModeUi = RuntimeLib.import(script, script.Parent, "ui", "oasis-vessel-indicator-ui").OasisVesselModeUi;
local u8 = {
    GameSound.OASIS_HEAL_PROJECTILE_1,
    GameSound.OASIS_HEAL_PROJECTILE_2,
    GameSound.OASIS_HEAL_PROJECTILE_3,
    GameSound.OASIS_HEAL_PROJECTILE_4
};
local u9 = {
    GameSound.OASIS_HEAL_PROJECTILE_1,
    GameSound.OASIS_HEAL_PROJECTILE_2,
    GameSound.OASIS_HEAL_PROJECTILE_3,
    GameSound.OASIS_HEAL_PROJECTILE_4
};
local u10 = setmetatable({}, {
    __tostring = function() -- Line: 48, Name: __tostring
        return "OasisVesselController";
    end,

    __index = HandKnitController
});
u10.__index = u10;

function u10.new(...) -- Line: 54
    -- upvalues: u10 (ref)
    local v11 = setmetatable({}, u10);

    return v11:constructor(...) or v11;
end;

function u10.constructor(p12) -- Line: 58
    -- upvalues: HandKnitController (copy), u3 (copy), OasisVesselMode (copy), default2 (copy)
    HandKnitController.constructor(p12);
    p12.Name = "OasisVesselController";
    p12.maid = u3.new();
    p12.vesselMode = OasisVesselMode.HEAL;
    p12.enabledAbility = nil;
    p12.handItemModel = nil;
    p12.viewmodelHandItemModel = nil;
    p12.attemptFireProjectilesRemote = default2.Client:Get("AttemptFireOasisProjectiles");
    p12.projectilesFiredEvent = default2.Client:Get("OasisProjectileFired");
    p12.projectileLoopMaid = u3.new();
    p12.modeTree = nil;
    p12.settingUpStackTree = false;
    p12.lastFire = 0;
end;

function u10.KnitStart(u13) -- Line: 73
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), Players (copy), AbilityId (copy), OasisVesselMode (copy), TargetSelector (copy)
    HandKnitController.KnitStart(u13);
    ClientSyncEvents.AbilityUsed:connect(function(p14) -- Line: 75
        -- upvalues: Players (ref), AbilityId (ref), u13 (copy), OasisVesselMode (ref)
        if p14:isCancelled() then
            return nil;
        end;

        if p14.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        if p14.ability ~= AbilityId.OASIS_SWAP_STAFF then
            return nil;
        end;

        local v15;

        if u13.vesselMode == OasisVesselMode.HEAL then
            v15 = OasisVesselMode.BUFF;
        else
            v15 = OasisVesselMode.HEAL;
        end;

        u13:setState(v15);
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p16) -- Line: 88
        -- upvalues: Players (ref), u13 (copy)
        if p16:isCancelled() then
            return nil;
        end;

        if p16.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        if not u13:isOrbAbility(p16.ability) then
            return nil;
        end;

        u13:attemptFireProjectile(false);
    end);
    ClientSyncEvents.CanUseLocalAbility:connect(function(p17) -- Line: 100
        -- upvalues: Players (ref), u13 (copy), TargetSelector (ref)
        if p17:isCancelled() then
            return nil;
        end;

        if p17.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        if not u13:isOrbAbility(p17.ability) then
            return nil;
        end;

        if not TargetSelector:getTargetEntity() then
            p17:setCancelled(true);

            return nil;
        end;
    end);
    ClientSyncEvents.AbilityInputStateChanged:connect(function(p18) -- Line: 115
        -- upvalues: u13 (copy)
        if not u13:isOrbAbility(p18.ability.abilityId) then
            return nil;
        end;

        local inputState = p18.inputState;

        if inputState == Enum.UserInputState.Begin then
            u13:beginProjectileFireLoop();

            return;
        end;

        if inputState ~= Enum.UserInputState.End then
            return;
        end;

        u13:endProjectileFireLoop();
    end);
    u13.projectilesFiredEvent:Connect(function(p19, p20, p21, p22) -- Line: 133
        -- upvalues: Players (ref), u13 (copy)
        local v23 = Players:GetPlayerByUserId(p19);
        local v24 = Players:GetPlayerByUserId(p20);

        if not (v23 and v24) then
            return nil;
        end;

        u13:createProjectilesEffect(v23, v24, p21, p22);
    end);
end;

function u10.beginProjectileFireLoop(u25) -- Line: 142
    -- upvalues: u3 (copy), ClientSyncEvents (copy), OasisBalance (copy)
    u25.projectileLoopMaid:DoCleaning();
    local v26 = u3.new();
    u25.projectileLoopMaid = v26;
    local u27 = 0;
    local cooldown = ClientSyncEvents.AbilityCooldownModifierCheck:fire(OasisBalance.ProjectileCooldown).cooldown;
    v26:GiveTask(task.spawn(function() -- Line: 148
        -- upvalues: u27 (ref), u25 (copy), cooldown (copy)
        while true do
            u27 = os.clock();
            u25:attemptFireProjectile(true);
            task.wait(cooldown);
        end;
    end));
end;

function u10.endProjectileFireLoop(p28) -- Line: 156
    p28.projectileLoopMaid:DoCleaning();
end;

function u10.isOrbAbility(p29, p30) -- Line: 159
    -- upvalues: AbilityId (copy)
    return p30 == AbilityId.OASIS_HEAL_PROJECTILE and true or p30 == AbilityId.OASIS_BUFF_PROJECTILE;
end;

function u10.setState(p31, p32) -- Line: 162
    -- upvalues: OasisVesselMode (copy)
    p31.vesselMode = p32;

    if p31.vesselMode == OasisVesselMode.HEAL then
        p31:enableHealAbility();
    else
        p31:enableBuffAbility();
    end;

    p31:swapHandItemColorScheme();
    p31:swapTargetIndicator();
    p31:updateTree();
end;

function u10.swapTargetIndicator(p33) -- Line: 177
    -- upvalues: TargetSelector (copy), OasisTargetIndicator (copy)
    local v34 = TargetSelector:getBillboard();

    if not v34 then
        return nil;
    end;

    local v35 = OasisTargetIndicator[p33.vesselMode];
    TargetSelector:setTargetIcon(v35.Icon);
    v34.ImageLabel.Size = v35.ImageSize;
    local TextLabel = v34:WaitForChild("TextLabel", 3);

    if TextLabel then
        TextLabel.Size = v35.TextLabelSize;
    end;
end;

function u10.swapHandItemColorScheme(p36) -- Line: 192
    -- upvalues: OasisVesselMode (copy), OasisBalance (copy), TweenService (copy)
    local u37;

    if p36.vesselMode == OasisVesselMode.HEAL then
        u37 = OasisBalance.HealingColor;
    else
        u37 = OasisBalance.DamageBuffColor;
    end;

    local function _(u38) -- Line: 194
        -- upvalues: TweenService (ref), u37 (copy)
        task.spawn(function() -- Line: 195
            -- upvalues: TweenService (ref), u38 (copy), u37 (ref)
            TweenService:Create(u38, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {
                Color = u37
            }):Play();
        end);
    end;

    if p36.handItemModel then
        local Light = p36.handItemModel.Light;
        task.spawn(function() -- Line: 195
            -- upvalues: TweenService (ref), Light (copy), u37 (copy)
            TweenService:Create(Light, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {
                Color = u37
            }):Play();
        end);

        if p36.handItemModel.Beads then
            local Beads = p36.handItemModel.Beads;
            task.spawn(function() -- Line: 195
                -- upvalues: TweenService (ref), Beads (copy), u37 (copy)
                TweenService:Create(Beads, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {
                    Color = u37
                }):Play();
            end);
        end;
    end;

    if p36.viewmodelHandItemModel then
        local Light = p36.viewmodelHandItemModel.Light;
        task.spawn(function() -- Line: 195
            -- upvalues: TweenService (ref), Light (copy), u37 (copy)
            TweenService:Create(Light, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {
                Color = u37
            }):Play();
        end);

        if p36.viewmodelHandItemModel.Beads then
            local Beads = p36.viewmodelHandItemModel.Beads;
            task.spawn(function() -- Line: 195
                -- upvalues: TweenService (ref), Beads (copy), u37 (copy)
                TweenService:Create(Beads, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {
                    Color = u37
                }):Play();
            end);
        end;
    end;
end;

function u10.createProjectilesEffect(p39, p40, u41, u42, p43) -- Line: 214
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), Players (copy), KnitClient (copy), OasisVesselScaling (copy), OasisVesselMode (copy), ReplicatedStorage (copy), Workspace (copy), OasisBalance (copy), default (copy), OutQuad (copy), u8 (copy), u9 (copy), SoundManager (copy)
    local Character = p40.Character;

    if Character ~= nil then
        Character = Character:GetPivot();
    end;

    if not Character then
        return nil;
    end;

    AnimationUtil:playAnimation(p40, GameAnimationUtil:getAssetId(AnimationType.PUNCH));

    if p40 == Players.LocalPlayer then
        KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_USE_ITEM);
    end;

    local numberOrbs = OasisVesselScaling[p43].numberOrbs;
    local u44 = 0;
    local v45 = false;

    while true do
        if v45 then
            u44 = u44 + 1;
        else
            v45 = true;
        end;

        if u44 >= numberOrbs then
            return;
        end;

        local u46;

        if u42 == OasisVesselMode.HEAL then
            u46 = ReplicatedStorage.Assets.Effects.OasisHealProjectile:Clone();
        else
            u46 = ReplicatedStorage.Assets.Effects.OasisBuffProjectile:Clone();
        end;

        u46.Parent = Workspace;
        u46:PivotTo(Character);
        local v47 = math.random(-2, 2);
        local v48 = math.random(3, 4);
        local u49 = Vector3.new(v47, v48, math.random(-2, 2));
        task.spawn(function() -- Line: 245
            -- upvalues: u44 (ref), OasisBalance (ref), default (ref), OutQuad (ref), u41 (copy), Character (copy), u49 (copy), u46 (copy), u42 (copy), OasisVesselMode (ref), u8 (ref), u9 (ref), SoundManager (ref)
            task.wait(u44 * OasisBalance.ProjectileInterval);
            default(OasisBalance.ProjectileTravelTime, OutQuad, function(p50) -- Line: 247
                -- upvalues: u41 (ref), Character (ref), u49 (ref), u46 (ref)
                local Character2 = u41.Character;

                if Character2 ~= nil then
                    Character2 = Character2:GetPivot();
                end;

                if not Character2 then
                    return nil;
                end;

                local v51 = math.sin(p50 * 3.141592653589793);
                u46:PivotTo((Character:Lerp(Character2, p50) + u49 * Vector3.new(v51, v51, v51)) * CFrame.Angles(6.283185307179586 * (p50 % 2), 6.283185307179586 * (p50 % 3), 6.283185307179586 * (p50 % 1.5)));
            end, 0, 1):Wait();
            local v52;

            if u42 == OasisVesselMode.HEAL then
                v52 = u8[math.min(u44, #u8 - 1) + 1];
            else
                v52 = u9[math.min(u44, #u9 - 1) + 1];
            end;

            local v53 = {};
            local Character2 = u41.Character;

            if Character2 ~= nil then
                Character2 = Character2:GetPivot().Position;
            end;

            v53.position = Character2;
            SoundManager:playSound(v52, v53);

            local function _(p54) -- Line: 277
                if p54:IsA("BasePart") then
                    p54.Transparency = 1;

                    return;
                end;

                if p54:IsA("ParticleEmitter") then
                    p54.Enabled = false;
                end;
            end;

            for i, descendant in u46:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    descendant.Transparency = 1;
                elseif descendant:IsA("ParticleEmitter") then
                    descendant.Enabled = false;
                end;
            end;

            task.delay(2, function() -- Line: 287
                -- upvalues: u46 (ref)
                u46:Destroy();
            end);
        end);
        u44 = u44;
    end;
end;

function u10.attemptFireProjectile(p55, u56) -- Line: 295
    -- upvalues: TargetSelector (copy), ClientSyncEvents (copy), OasisBalance (copy), SoundManager (copy), GameSound (copy)
    local v57 = TargetSelector:getTargetEntity();

    if not v57 then
        return nil;
    end;

    local v58 = v57:getPlayer();

    if v58 ~= nil then
        v58 = v58.UserId;
    end;

    if v58 == 0 or (v58 ~= v58 or not v58) then
        return nil;
    end;

    local cooldown = ClientSyncEvents.AbilityCooldownModifierCheck:fire(OasisBalance.ProjectileCooldown).cooldown;

    if os.clock() - p55.lastFire <= cooldown * 0.99 then
        return nil;
    end;

    p55.lastFire = os.clock();
    p55.attemptFireProjectilesRemote:CallServerAsync(v58, p55.vesselMode):andThen(function(p59) -- Line: 314
        -- upvalues: u56 (copy), SoundManager (ref), GameSound (ref)
        if not (p59 or u56) then
            SoundManager:playSound(GameSound.OASIS_CANNOT_TARGET);
        end;
    end);
end;

function u10.isRelevantItem(p60, p61) -- Line: 322
    -- upvalues: OasisBalance (copy)
    return table.find(OasisBalance.VesselItems, p61.itemType) ~= nil;
end;

function u10.onEnable(u62, u63, u64) -- Line: 327
    -- upvalues: TargetSelector (copy), TargetType (copy), OasisBalance (copy), OasisVesselMode (copy), StatusEffectUtil (copy), StatusEffectType (copy), ReplicatedStorage (copy), Flamework (copy), AbilityId (copy), BedwarsImageId (copy)
    TargetSelector:enableTargetSelector(TargetType.TEAMMATES, {
        requireSight = true,
        positionDistanceOnly = true,
        overrideOriginDistance = 70,
        distance = OasisBalance.ProjectileRange,

        callback = function(p65) -- Line: 333, Name: callback
            -- upvalues: u62 (copy), OasisVesselMode (ref), StatusEffectUtil (ref), StatusEffectType (ref), OasisBalance (ref), TargetSelector (ref)
            local v66;

            if u62.vesselMode == OasisVesselMode.HEAL then
                v66 = p65:getHealthPercent() ~= 1;
            else
                v66 = StatusEffectUtil:getStacks(p65:getInstance(), StatusEffectType.OASIS_BUFF_CHARGE) < OasisBalance.MaxBuffStacks;
            end;

            if v66 and u62.vesselMode == OasisVesselMode.BUFF then
                local v67 = p65:getInstance();
                local v68 = tostring(StatusEffectUtil:getStacks(v67, StatusEffectType.OASIS_BUFF_CHARGE));
                local v69 = TargetSelector:getBillboard();

                if v69 ~= nil then
                    v69 = v69:WaitForChild("TextLabel", 3);
                end;

                if v69 then
                    v69.Text = v68;
                end;
            end;

            return v66;
        end
    });
    TargetSelector:setCustomBillboard((ReplicatedStorage.Assets.Misc.TargetSelectorBillboard_Oasis:Clone()));
    u62.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.OASIS_SWAP_STAFF, {
        abilityType = "ItemSecondary",
        abilityButton = {
            icon = BedwarsImageId.OASIS_SWAP
        }
    }):expect());
    u62:setState(u62.vesselMode);
    u62.maid:GiveTask(function() -- Line: 360
        -- upvalues: u62 (copy)
        if u62.enabledAbility then
            u62.enabledAbility.Destroy();
        end;
    end);
    task.delay(0.5, function() -- Line: 366
        -- upvalues: u64 (copy), u62 (copy), u63 (copy)
        if not u64() then
            return nil;
        end;

        u62:storeHandItem(u63.itemType);
    end);
    u62:setUpTree();
end;

function u10.setUpTree(p70) -- Line: 375
    -- upvalues: KnitClient (copy), u4 (copy), OasisVesselModeUi (copy)
    if not (p70.modeTree or p70.settingUpStackTree) then
        p70.settingUpStackTree = true;
        p70.modeTree = KnitClient.Controllers.StatusInfoListController:waitForSetupAddElement(u4.createElement(OasisVesselModeUi, {
            mode = p70.vesselMode
        }));
    end;
end;

function u10.updateTree(p71) -- Line: 383
    -- upvalues: u4 (copy), OasisVesselModeUi (copy)
    if p71.modeTree then
        u4.update(p71.modeTree, u4.createElement(OasisVesselModeUi, {
            mode = p71.vesselMode
        }));
    end;
end;

function u10.storeHandItem(u72, u73) -- Line: 390
    -- upvalues: EntityUtil (copy), Players (copy), ItemType (copy), KnitClient2 (copy)
    task.spawn(function() -- Line: 391
        -- upvalues: EntityUtil (ref), Players (ref), u72 (copy), ItemType (ref)
        local v74 = EntityUtil:getEntity(Players.LocalPlayer);

        if v74 ~= nil then
            v74 = v74:getHandItemInstanceFromCharacter();
        end;

        if not v74 then
            return nil;
        end;

        local Handle = v74:WaitForChild("Handle", 3);

        if not Handle then
            return nil;
        end;

        local v75 = {
            Light = Handle:WaitForChild("Light", 3)
        };
        local v76;

        if v74.Name == ItemType.OASIS_VESSEL_3 then
            v76 = Handle:WaitForChild("Beads", 1);
        else
            v76 = nil;
        end;

        v75.Beads = v76;
        u72.handItemModel = v75;
        u72:swapHandItemColorScheme();
    end);
    task.spawn(function() -- Line: 410
        -- upvalues: KnitClient2 (ref), u73 (copy), u72 (copy), ItemType (ref)
        local v77 = KnitClient2.Controllers.ViewmodelController:getViewModel();

        if v77 ~= nil then
            v77 = v77:FindFirstChild(u73);
        end;

        if not v77 then
            return nil;
        end;

        local Handle = v77:WaitForChild("Handle", 3);

        if not Handle then
            return nil;
        end;

        local v78 = {
            Light = Handle:WaitForChild("Light", 3)
        };
        local v79;

        if v77.Name == ItemType.OASIS_VESSEL_3 then
            v79 = Handle:WaitForChild("Beads", 1);
        else
            v79 = nil;
        end;

        v78.Beads = v79;
        u72.viewmodelHandItemModel = v78;
        u72:swapHandItemColorScheme();
    end);
end;

function u10.enableHealAbility(p80) -- Line: 430
    -- upvalues: Flamework (copy), AbilityId (copy), SoundManager (copy), GameSound (copy)
    local enabledAbility = p80.enabledAbility;

    if enabledAbility ~= nil then
        enabledAbility.Destroy();
    end;

    p80.enabledAbility = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.OASIS_HEAL_PROJECTILE, {
        clickToTrigger = true,
        abilityType = "ItemPrimary"
    }):expect();
    SoundManager:playSound(GameSound.OASIS_SWAP_HEAL, {
        position = nil
    });
end;

function u10.enableBuffAbility(p81) -- Line: 443
    -- upvalues: Flamework (copy), AbilityId (copy), SoundManager (copy), GameSound (copy)
    local enabledAbility = p81.enabledAbility;

    if enabledAbility ~= nil then
        enabledAbility.Destroy();
    end;

    p81.enabledAbility = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.OASIS_BUFF_PROJECTILE, {
        clickToTrigger = true,
        abilityType = "ItemPrimary"
    }):expect();
    SoundManager:playSound(GameSound.OASIS_SWAP_BUFF, {
        position = nil
    });
end;

function u10.onDisable(p82) -- Line: 456
    -- upvalues: TargetSelector (copy), ContextActionService (copy)
    TargetSelector:disableTargetSelector();
    p82.maid:DoCleaning();
    ContextActionService:UnbindAction("OASIS-VESSEL");
end;

KnitClient.CreateController(u10.new());

return nil;
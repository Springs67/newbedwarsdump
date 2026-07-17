-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ClickHold = v1.ClickHold;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local HttpService = v4.HttpService;
local Players = v4.Players;
local UserInputService = v4.UserInputService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ChargeState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SharedSyncEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 30, Name: __tostring
        return "SwordChargeController";
    end,

    __index = HandKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 36
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 40
    -- upvalues: HandKnitController (copy), u3 (copy), ChargeState (copy)
    HandKnitController.constructor(p7);
    p7.Name = "SwordChargeController";
    p7.maid = u3.new();
    p7.chargingMaid = u3.new();
    p7.chargeStartTime = 0;
    p7.chargeTime = 0;
    p7.chargeState = ChargeState.Idle;
    p7.chargingWeapons = {};
end;

function u5.KnitStart(p8) -- Line: 50
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), SyncEventPriority (copy), default (copy)
    HandKnitController.KnitStart(p8);
    ClientSyncEvents.SwordCharge:setPriority(SyncEventPriority.LOWEST):connect(function(u9) -- Line: 53
        -- upvalues: default (ref)
        if u9:isCancelled() then
            return nil;
        end;

        task.spawn(function() -- Line: 57
            -- upvalues: default (ref), u9 (copy)
            default.Client:Get("SwordChargeState"):SendToServer({
                itemType = u9.itemType,
                chargeState = u9.chargeState
            });
        end);
    end);
end;

function u5.onEnable(u10, u11) -- Line: 65
    -- upvalues: getItemMeta (copy), ClientSyncEvents (copy), ChargeState (copy), ClickHold (copy), KnitClient2 (copy), KnitClient (copy), SharedSyncEvents (copy), Players (copy), UserInputService (copy), HttpService (copy), Flamework (copy)
    local v12 = getItemMeta(u11.itemType);
    local sword = v12.sword;

    if sword ~= nil then
        sword = sword.chargedAttack;
    end;

    if not sword then
        return nil;
    end;

    local minChargeTime = ClientSyncEvents.SwordChargeTimeModifierCheck:fire(sword.maxChargeTimeSec, sword.minChargeTimeSec).minChargeTime;
    local maxChargeTime = ClientSyncEvents.SwordChargeTimeModifierCheck:fire(sword.maxChargeTimeSec, sword.minChargeTimeSec).maxChargeTime;
    local sword2 = v12.sword;

    if sword2 ~= nil then
        sword2 = sword2.chargedAttack;

        if sword2 ~= nil then
            sword2 = sword2.fireAtFullCharge;
        end;
    end;

    local u13 = sword2 and true or false;
    u10.chargeStartTime = 0;
    u10:updateChargeState(ChargeState.Idle, u11.itemType);
    local showHoldProgressAfterSec = sword.showHoldProgressAfterSec;
    u10.clickHold = ClickHold.new(maxChargeTime, false, showHoldProgressAfterSec == nil and 0.1 or showHoldProgressAfterSec);

    local function u22(u14) -- Line: 95
        -- upvalues: u10 (copy), ChargeState (ref), KnitClient2 (ref), u11 (copy), minChargeTime (copy), maxChargeTime (copy), u13 (copy), KnitClient (ref)
        if u10:getChargeState() ~= ChargeState.Idle then
            return nil;
        end;

        if KnitClient2.Controllers.SwordController:getSwordSwingDisabled() then
            return nil;
        end;

        local function u19() -- Line: 106
            -- upvalues: u10 (ref), u11 (ref), minChargeTime (ref), maxChargeTime (ref), ChargeState (ref), u13 (ref), KnitClient2 (ref)
            u10:startCharging(u11.itemType);
            local chargeStartTime = u10.chargeStartTime;
            local v15 = minChargeTime;

            if v15 == nil then
                local v16 = maxChargeTime;
                v15 = v16 == nil and 0 or v16;
            end;

            task.delay(v15, function() -- Line: 119
                -- upvalues: u10 (ref), u11 (ref), chargeStartTime (copy), ChargeState (ref), u13 (ref), KnitClient2 (ref)
                if not u10:isWeaponCharging(u11.itemType) then
                    u10:stopCharging(u11.itemType);
                    u10.chargingMaid:DoCleaning();

                    return nil;
                end;

                local v17;

                if u10.chargeStartTime == chargeStartTime then
                    v17 = u10:getChargeState() == ChargeState.Charging;
                else
                    v17 = false;
                end;

                if v17 then
                    u10:updateChargeState(ChargeState.Charged, u11.itemType);

                    if u13 then
                        local v18 = u10:stopCharging(u11.itemType);
                        KnitClient2.Controllers.SwordController:swingSwordAtMouse(v18);
                    end;
                end;
            end);
        end;

        if not KnitClient.Controllers.SwordController:isOnChargeAttackCooldown(u11.itemType) then
            u19();

            return;
        end;

        local chargeStartTime = u10.chargeStartTime;
        local delay = task.delay;
        local v20 = KnitClient.Controllers.SwordController:getRemainingChargeCooldown(u11.itemType);
        local v21 = KnitClient.Controllers.SwordController:getRemainingSwingCooldown(u11.itemType);
        delay(math.max(v20, v21, KnitClient.Controllers.SwordController:getRemainingCastingTime()), function() -- Line: 139
            -- upvalues: u14 (copy), u10 (ref), chargeStartTime (copy), u19 (copy)
            if u14.UserInputState == Enum.UserInputState.End then
                return nil;
            end;

            if u10.chargeStartTime ~= chargeStartTime then
                return nil;
            end;

            u19();
        end);
    end;

    local function u28(p23) -- Line: 152
        -- upvalues: u10 (copy), u11 (copy), ChargeState (ref), KnitClient2 (ref), getItemMeta (ref), minChargeTime (copy), SharedSyncEvents (ref), Players (ref)
        local v24 = u10:stopCharging(u11.itemType);

        if u10:getChargeState() ~= ChargeState.Idle then
            u10.chargingMaid:DoCleaning();

            return nil;
        end;

        if KnitClient2.Controllers.SwordController:getSwordSwingDisabled() then
            return nil;
        end;

        local v25 = u10:getHandItem();

        if v25 ~= nil then
            v25 = v25.tool;
        end;

        local v26;

        if v25 then
            v26 = getItemMeta(v25.Name).sword;

            if v26 ~= nil then
                v26 = v26.chargedAttack;
            end;
        else
            v26 = v25;
        end;

        if v26 then
            v26 = v26.skipSwingDamage;
        end;

        if v26 then
            local v27 = minChargeTime;
            v26 = (v27 == nil and 0 or v27) < v24;
        end;

        if not (v25 and v26) then
            KnitClient2.Controllers.SwordController:swingSwordAtMouse(v24);
        end;

        SharedSyncEvents.SwordChargedSwing:fire(Players.LocalPlayer, v25, {
            chargeTime = v24
        });
    end;

    if UserInputService.TouchEnabled then
        u10.maid:GiveTask(ClientSyncEvents.MobileSwordButtonPressed:connect(function(p29) -- Line: 196
            -- upvalues: u22 (copy), u28 (copy)
            if p29.state ~= "down" then
                if p29.state == "up" then
                    u28(p29.input);
                end;

                return;
            end;

            p29:setCancelled(true);
            u22(p29.input);
        end));
        u10.maid:GiveTask(ClientSyncEvents.BeginProjectileTargeting:connect(function(p30) -- Line: 206
            -- upvalues: getItemMeta (ref), u22 (copy)
            local sword3 = getItemMeta(p30.handItem.itemType).sword;

            if sword3 ~= nil then
                sword3 = sword3.chargedAttack;
            end;

            if not sword3 then
                return nil;
            end;

            if p30.inputObject then
                u22(p30.inputObject);
            end;
        end));
        u10.maid:GiveTask(ClientSyncEvents.ProjectileTargetingEnded:connect(function(p31) -- Line: 219
            -- upvalues: getItemMeta (ref), u28 (copy)
            local sword3 = getItemMeta(p31.handItem.itemType).sword;

            if sword3 ~= nil then
                sword3 = sword3.chargedAttack;
            end;

            if not sword3 then
                return nil;
            end;

            if p31.inputObject then
                u28(p31.inputObject);
            end;
        end));
    end;

    local v32 = "charge-sword:" .. HttpService:GenerateGUID(false);
    local v36 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = v32,

        boundFunction = function(p33, p34, p35) -- Line: 238, Name: boundFunction
            -- upvalues: u22 (copy), u28 (copy)
            if p35.UserInputType == Enum.UserInputType.Touch then
                return print("Early cancel");
            end;

            if p34 == Enum.UserInputState.Begin then
                u22(p35);

                return Enum.ContextActionResult.Sink;
            end;

            if p34 == Enum.UserInputState.End then
                u28(p35);

                return Enum.ContextActionResult.Pass;
            end;
        end,

        priority = Enum.ContextActionPriority.High.Value
    });
    u10.maid:GiveTask(v36);
    u10.maid:GiveTask(u10.chargingMaid);
    u10.maid:GiveTask(function() -- Line: 255
        -- upvalues: u10 (copy), ChargeState (ref), u11 (copy)
        local clickHold = u10.clickHold;

        if clickHold ~= nil then
            clickHold:cancelClick();
        end;

        local clickHold2 = u10.clickHold;

        if clickHold2 ~= nil then
            clickHold2:disable();
        end;

        u10.clickHold = nil;
        u10:updateChargeState(ChargeState.Idle, u11.itemType);
    end);
end;

function u5.getChargeStartTime(p37) -- Line: 270
    return p37.chargeStartTime;
end;

function u5.getChargeState(p38) -- Line: 273
    return p38.chargeState;
end;

function u5.isWeaponCharging(p39, p40) -- Line: 276
    local v41 = p39.chargingWeapons[p40];

    if v41 == nil then
        v41 = false;
    end;

    return v41;
end;

function u5.startCharging(u42, u43) -- Line: 285
    -- upvalues: ChargeState (copy), getItemMeta (copy), InventoryUtil (copy), Players (copy), ClientSyncEvents (copy), EntityUtil (copy), KnitClient (copy), SoundManager (copy), KnitClient2 (copy)
    if u42.chargeState ~= ChargeState.Idle then
        return nil;
    end;

    local v44 = getItemMeta(u43);
    local sword = v44.sword;

    if sword ~= nil then
        sword = sword.chargedAttack;
    end;

    if not sword then
        return nil;
    end;

    local sword2 = v44.sword;

    if sword2 ~= nil then
        sword2 = sword2.chargedAttack;

        if sword2 ~= nil then
            sword2 = sword2.enableCondition;
        end;
    end;

    if sword2 then
        local v45 = InventoryUtil.getToolFromInventory(Players.LocalPlayer, u43);

        if v45 and not v44.sword.chargedAttack.enableCondition(v45) then
            return nil;
        end;
    end;

    local maxChargeTime = ClientSyncEvents.SwordChargeTimeModifierCheck:fire(sword.maxChargeTimeSec, sword.minChargeTimeSec).maxChargeTime;
    local v46 = EntityUtil:getEntity(Players.LocalPlayer);

    if v46 ~= nil then
        v46 = v46:getHandItemInstanceFromCharacter();
    end;

    if not v46 or v46.Name ~= u43 then
        return nil;
    end;

    if KnitClient.Controllers.SwordController:isOnChargeAttackCooldown(u43) then
        return nil;
    end;

    u42.chargeStartTime = tick();
    local v47 = u42:updateChargeState(ChargeState.Charging, u43);

    if not v47 or v47:isCancelled() then
        return nil;
    end;

    Players.LocalPlayer:SetAttribute("IsCharging", true);
    u42.chargingWeapons[u43] = true;
    local chargingEffects = sword.chargingEffects;
    local showHoldProgressAfterSec = sword.showHoldProgressAfterSec;
    task.delay(showHoldProgressAfterSec == nil and 0.1 or showHoldProgressAfterSec, function() -- Line: 342
        -- upvalues: u42 (copy), u43 (copy), chargingEffects (copy), maxChargeTime (copy), SoundManager (ref)
        if not u42:isWeaponCharging(u43) then
            return nil;
        end;

        local v48 = chargingEffects;

        if v48 ~= nil then
            v48 = v48.thirdPersonAnim;
        end;

        if v48 == 0 or (v48 ~= v48 or not v48) then
            v48 = chargingEffects;

            if v48 ~= nil then
                v48 = v48.firstPersonAnim;
            end;
        end;

        if v48 ~= 0 and (v48 == v48 and v48) then
            local v49 = u42:playAnimation(chargingEffects.thirdPersonAnim, chargingEffects.firstPersonAnim, {
                dynamicUpdateOnPerspectiveChange = true
            });
            local v50 = v49[1];
            local v51 = v49[2];

            if v50 then
                v50:AdjustSpeed(v50.Length / maxChargeTime);
            end;

            if v51 then
                u42.chargingMaid:GiveTask(v51);
            end;
        end;

        local v52 = chargingEffects;

        if v52 ~= nil then
            v52 = v52.sound;
        end;

        local u53 = v52 ~= "" and (v52 and SoundManager:playSound(chargingEffects.sound));

        if u53 then
            u42.chargingMaid:GiveTask(function() -- Line: 382
                -- upvalues: u53 (copy)
                u53:Destroy();
            end);
        end;
    end);
    local walkSpeedModifier = sword.walkSpeedModifier;

    if walkSpeedModifier ~= nil then
        walkSpeedModifier = walkSpeedModifier.delay;
    end;

    task.delay(walkSpeedModifier == nil and 0 or walkSpeedModifier, function() -- Line: 398
        -- upvalues: Players (ref), u42 (copy), KnitClient2 (ref), sword (copy)
        local v54 = Players.LocalPlayer:GetAttribute("IsCharging");

        if v54 == 0 or (v54 ~= v54 or (v54 == "" or not v54)) then
            return nil;
        end;

        local chargingMaid = u42.chargingMaid;
        local v55 = KnitClient2.Controllers.SprintController:getMovementStatusModifier();
        local v56 = {};
        local walkSpeedModifier2 = sword.walkSpeedModifier;

        if walkSpeedModifier2 ~= nil then
            walkSpeedModifier2 = walkSpeedModifier2.multiplier;
        end;

        v56.moveSpeedMultiplier = walkSpeedModifier2;
        chargingMaid:GiveTask(v55:addModifier(v56));
    end);
    local clickHold = u42.clickHold;

    if clickHold ~= nil then
        clickHold:startClick();
    end;
end;

function u5.stopCharging(p57, p58) -- Line: 419
    -- upvalues: EntityUtil (copy), Players (copy), ChargeState (copy)
    local chargeStartTime = p57.chargeStartTime;
    local v59 = (chargeStartTime == 0 or (chargeStartTime ~= chargeStartTime or not chargeStartTime)) and 0 or tick() - p57.chargeStartTime;
    local v60 = EntityUtil:getEntity(Players.LocalPlayer);

    if v60 ~= nil then
        v60 = v60:getHandItemInstanceFromCharacter();
    end;

    if not v60 or v60.Name ~= p58 then
        return v59;
    end;

    local clickHold = p57.clickHold;

    if clickHold ~= nil then
        clickHold:endClick();
    end;

    p57.chargingMaid:DoCleaning();
    p57.chargingWeapons[p58] = nil;
    Players.LocalPlayer:SetAttribute("IsCharging", false);
    p57.chargeStartTime = 0;
    p57:updateChargeState(ChargeState.Idle, p58);

    return v59;
end;

function u5.updateChargeState(p61, p62, p63) -- Line: 444
    -- upvalues: ClientSyncEvents (copy)
    if p61.chargeState == p62 then
        return nil;
    end;

    local v64 = ClientSyncEvents.SwordCharge:fire(p62, p63);

    if v64:isCancelled() then
        return v64;
    end;

    p61.chargeState = v64.chargeState;

    return v64;
end;

function u5.playAnimation(u65, u66, u67, u68) -- Line: 455
    -- upvalues: KnitClient (copy), u3 (copy), Players (copy), GameAnimationUtil (copy)
    local v69 = KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0;
    local v70;

    if v69 then
        v70 = u67;
    else
        v70 = u66;
    end;

    if v70 == nil then
        return { nil, nil };
    end;

    local u71 = u3.new();
    local u72;

    if v69 then
        u72 = KnitClient.Controllers.ViewmodelController:playAnimation(v70);
    else
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:FindFirstChild("Humanoid");

            if Character ~= nil then
                Character = Character:FindFirstChild("Animator");
            end;
        end;

        if not Character then
            return { nil, nil };
        end;

        u72 = Character:LoadAnimation(GameAnimationUtil:getAnimation(v70));
        u72:Play();
    end;

    if u72 then
        local v73 = u72;

        if v73 ~= nil then
            v73 = v73:GetMarkerReachedSignal("end"):Connect(function() -- Line: 487
                -- upvalues: u72 (ref)
                local v74 = u72;

                if v74 ~= nil then
                    v74:AdjustSpeed(0);
                end;
            end);
        end;

        u71:GiveTask(v73);
        u71:GiveTask(function() -- Line: 495
            -- upvalues: u72 (ref)
            local v75 = u72;

            if v75 ~= nil then
                v75:Stop(0.2);
            end;

            local v76 = u72;

            if v76 ~= nil then
                v76:Destroy();
            end;
        end);
    end;

    local v77;

    if u68 == nil then
        v77 = u68;
    else
        v77 = u68.dynamicUpdateOnPerspectiveChange;
    end;

    if v77 then
        u71:GiveTask(KnitClient.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p78) -- Line: 512
            -- upvalues: u71 (copy), u65 (copy), u66 (copy), u67 (copy), u68 (copy)
            u71:DoCleaning();
            local v79 = u65:playAnimation(u66, u67, u68)[2];

            if v79 then
                u71:GiveTask(v79);
            end;
        end));
    end;

    return { u72, u71 };
end;

function u5.isRelevantItem(p80, p81) -- Line: 524
    -- upvalues: getItemMeta (copy)
    local sword = getItemMeta(p81.itemType).sword;

    if sword ~= nil then
        sword = sword.chargedAttack;
    end;

    return sword ~= nil;
end;

function u5.onDisable(p82) -- Line: 532
    p82.maid:DoCleaning();
end;

KnitClient.CreateController(u5.new());

return nil;
-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local scalePart = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scalePart;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ProjectileHandler = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-handler").ProjectileHandler;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ChargeState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "HotPotatoController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 32
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, ...) -- Line: 36
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p6, ...);
    p6.Name = "HotPotatoController";
    p6.animationMaid = u2.new();
end;

function u4.KnitStart(u7) -- Line: 41
    -- upvalues: KnitController (copy), default (copy), ReplicatedStorage (copy), scalePart (copy), Workspace (copy), EffectUtil (copy), ClientSyncEvents (copy), getItemMeta (copy), ItemType (copy), KnitClient2 (copy), ChargeState (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy), KnitClient (copy)
    KnitController.KnitStart(u7);
    default.Client:OnEvent("HotPotatoExplode", function(p8) -- Line: 44
        -- upvalues: ReplicatedStorage (ref), scalePart (ref), Workspace (ref), EffectUtil (ref)
        local u9 = ReplicatedStorage.Assets.Effects.Explosion:Clone();
        scalePart(u9, 3.5);
        u9.Parent = Workspace;
        EffectUtil:playEffects({ u9 }, nil);
        u9.CFrame = CFrame.new(p8.position);
        task.delay(2, function() -- Line: 50
            -- upvalues: u9 (copy)
            u9:Destroy();
        end);
    end);
    ClientSyncEvents.SwordChargedSwing:connect(function(p10) -- Line: 54
        -- upvalues: getItemMeta (ref), ItemType (ref), KnitClient2 (ref), u7 (copy)
        local v11 = getItemMeta(ItemType.HOT_POTATO);

        if not v11 then
            return nil;
        end;

        if p10.weapon.Name ~= ItemType.HOT_POTATO then
            return nil;
        end;

        local chargedAttack = p10.chargedAttack;

        if chargedAttack ~= nil then
            chargedAttack = chargedAttack.chargeTime;
        end;

        if chargedAttack == 0 or (chargedAttack ~= chargedAttack or not chargedAttack) then
            return nil;
        end;

        if p10.chargedAttack.chargeTime < v11.sword.chargedAttack.minChargeTimeSec then
            KnitClient2.Controllers.DefaultProjectileSourceController:clearProjectileHandler();

            return nil;
        end;

        if p10.chargedAttack.chargeTime >= v11.sword.chargedAttack.maxChargeTimeSec then
            u7:fire(p10.fromPlayer, p10.weapon, p10.chargedAttack.chargeTime);
        end;
    end);
    local u12 = nil;
    local u13 = nil;
    ClientSyncEvents.SwordCharge:connect(function(u14) -- Line: 79
        -- upvalues: ItemType (ref), ChargeState (ref), Players (ref), getItemMeta (ref), u12 (ref), GameAnimationUtil (ref), AnimationType (ref), u13 (ref), KnitClient (ref), u7 (copy)
        if u14.itemType ~= ItemType.HOT_POTATO then
            return nil;
        end;

        task.spawn(function() -- Line: 83
            -- upvalues: u14 (copy), ChargeState (ref), Players (ref), getItemMeta (ref), u12 (ref), GameAnimationUtil (ref), AnimationType (ref), u13 (ref), KnitClient (ref), u7 (ref)
            if u14.chargeState == ChargeState.Charging then
                Players.LocalPlayer:SetAttribute("IsCharging", true);
                local Character = Players.LocalPlayer.Character;

                if Character ~= nil then
                    Character = Character:FindFirstChild("Humanoid");

                    if Character ~= nil then
                        Character = Character:FindFirstChild("Animator");
                    end;
                end;

                if not Character then
                    return nil;
                end;

                local v15 = getItemMeta(u14.itemType);
                local sword = v15.sword;

                if sword ~= nil then
                    sword = sword.chargedAttack;
                end;

                if not sword then
                    return nil;
                end;

                local sword2 = v15.sword;

                if sword2 ~= nil then
                    sword2 = sword2.chargedAttack.walkSpeedModifier;

                    if sword2 ~= nil then
                        sword2 = sword2.delay;
                    end;
                end;

                task.wait(sword2 == nil and 0 or sword2);
                local v16 = Players.LocalPlayer:GetAttribute("IsCharging");

                if v16 == 0 or (v16 ~= v16 or (v16 == "" or not v16)) then
                    return nil;
                end;

                u12 = Character:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.HEAVENLY_SWORD_CHARGE));
                u12:Play();
                u12:AdjustSpeed(0.683);
                u12:GetMarkerReachedSignal("end"):Connect(function() -- Line: 127
                    -- upvalues: u12 (ref)
                    local v17 = u12;

                    if v17 ~= nil then
                        v17:AdjustSpeed(0);
                    end;
                end);
                u13 = KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_HEAVENLY_SWORD_CHARGE);

                if u13 then
                    u13:GetMarkerReachedSignal("end"):Connect(function() -- Line: 136
                        -- upvalues: u13 (ref)
                        local v18 = u13;

                        if v18 ~= nil then
                            v18:AdjustSpeed(0);
                        end;
                    end);
                end;

                u7.animationMaid:GiveTask(function() -- Line: 143
                    -- upvalues: u12 (ref), u13 (ref)
                    local v19 = u12;

                    if v19 ~= nil then
                        v19:Stop();
                    end;

                    local v20 = u12;

                    if v20 ~= nil then
                        v20:Destroy();
                    end;

                    local v21 = u13;

                    if v21 ~= nil then
                        v21:Stop();
                    end;

                    local v22 = u13;

                    if v22 ~= nil then
                        v22:Destroy();
                    end;
                end);
            else
                local _ = u14.chargeState == ChargeState.Charged;
            end;

            if u14.chargeState == ChargeState.Idle then
                Players.LocalPlayer:SetAttribute("IsCharging", false);
                local v23 = u12;

                if v23 ~= nil then
                    v23:Stop();
                end;

                local v24 = u12;

                if v24 ~= nil then
                    v24:Destroy();
                end;

                local v25 = u13;

                if v25 ~= nil then
                    v25:Stop();
                end;

                local v26 = u13;

                if v26 ~= nil then
                    v26:Destroy();
                end;

                u7.animationMaid:DoCleaning();
            end;
        end);
    end);
end;

function u4.fire(p27, p28, p29, p30) -- Line: 186
    -- upvalues: getItemMeta (copy), ItemType (copy), KnitClient2 (copy), ProjectileHandler (copy)
    local v31 = getItemMeta(ItemType.HOT_POTATO);

    if not v31 then
        return nil;
    end;

    local v32 = KnitClient2.Controllers.DefaultProjectileSourceController:getProjectileHandler() or ProjectileHandler.new(1, 1, "hot_potato", nil, nil, Vector3.new(0, 2, 0), 0, nil);
    KnitClient2.Controllers.DefaultProjectileSourceController:clearProjectileHandler();
    local v33;

    if v31.sword.chargedAttack.maxChargeTimeSec - (v31.sword.chargedAttack.maxChargeTimeSec - v31.sword.chargedAttack.minChargeTimeSec) / 2.5 <= p30 then
        v33 = ItemType.HOT_POTATO;
    else
        v33 = nil;
    end;

    KnitClient2.Controllers.ProjectileController:launchProjectile(ItemType.HOT_POTATO, v33, v32, p29, v31.projectileSource);
end;

KnitClient.CreateController(u4.new());

return nil;
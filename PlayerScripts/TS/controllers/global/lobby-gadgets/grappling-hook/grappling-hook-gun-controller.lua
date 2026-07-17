-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local InventoryEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "inventory-entity").InventoryEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "grappling-hook", "grappling-hook-util");
local GrapplingHookConst = v3.GrapplingHookConst;
local GrapplingHookFunctions = v3.GrapplingHookFunctions;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local SharedSyncEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local GrapplingHookGunHandler = RuntimeLib.import(script, script.Parent, "grappling-hook-gun-handler").GrapplingHookGunHandler;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "GrapplingHookGunController";
    end,

    __index = GrapplingHookGunHandler
});
u4.__index = u4;

function u4.new(...) -- Line: 32
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 36
    -- upvalues: GrapplingHookGunHandler (copy)
    GrapplingHookGunHandler.constructor(p6);
    p6.Name = "GrapplingHookGunController";
    p6.hook = "grappling_hook_projectile";
end;

function u4.KnitStart(u7) -- Line: 41
    -- upvalues: GrapplingHookGunHandler (copy), default (copy), GrapplingHookFunctions (copy), Flamework (copy), CooldownId (copy), GrapplingHookConst (copy), SharedSyncEvents (copy), Players (copy), ClientSyncEvents (copy), ItemType (copy), EntityUtil (copy), RuntimeLib (copy), InventoryEntity (copy), u1 (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), Workspace (copy)
    GrapplingHookGunHandler.KnitStart(u7);
    default.Client:Get("GrapplingHookFunctions"):Connect(function(p8) -- Line: 43
        -- upvalues: u7 (copy), GrapplingHookFunctions (ref), Flamework (ref), CooldownId (ref), GrapplingHookConst (ref), SharedSyncEvents (ref), Players (ref)
        if p8.shotId ~= u7.shotId then
            return nil;
        end;

        local v9 = u7:getHookState() == GrapplingHookFunctions.HOOK_FORWARD_TRANSIT;
        local v10 = u7:getHookState() == GrapplingHookFunctions.HOOK_BACKWARD_TRANSIT;
        local v11 = u7:getHookState() == GrapplingHookFunctions.PLAYER_IN_TRANSIT;

        if p8.hitEntity then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.GRAPPLING_HOOK, GrapplingHookConst.GRAPPLING_HOOK_HIT_COOLDOWN);
            SharedSyncEvents.HookFunctionSwapEvent:fire(Players.LocalPlayer, p8.hookFunction);
            u7:transit(Players.LocalPlayer, p8.endGoal, p8.hitBasePart);

            return nil;
        end;

        if not (v9 or v10) then
            if v11 and p8.hookFunction == GrapplingHookFunctions.HOOK_CHAMBERED then
                SharedSyncEvents.HookFunctionSwapEvent:fire(Players.LocalPlayer, p8.hookFunction);
            end;

            return;
        end;

        SharedSyncEvents.HookFunctionSwapEvent:fire(Players.LocalPlayer, p8.hookFunction);
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.GRAPPLING_HOOK, GrapplingHookConst.GRAPPLING_HOOK_HIT_COOLDOWN);
        u7:transit(Players.LocalPlayer, p8.endGoal, p8.hitBasePart);
    end);
    ClientSyncEvents.BeginProjectileTargeting:connect(function(p12) -- Line: 64
        -- upvalues: ItemType (ref), u7 (copy), GrapplingHookFunctions (ref)
        if p12.handItem.itemType ~= ItemType.GRAPPLING_HOOK then
            return nil;
        end;

        if not u7:canUseGrapplingHook() then
            p12:setCancelled(true);

            return nil;
        end;

        if u7:getHookState() ~= GrapplingHookFunctions.HOOK_CHAMBERED then
            p12:setCancelled(true);

            return nil;
        end;
    end);
    ClientSyncEvents.StartLaunchProjectile:connect(function(p13) -- Line: 77
        -- upvalues: u7 (copy), GrapplingHookFunctions (ref), SharedSyncEvents (ref), Players (ref)
        if p13:isCancelled() then
            return nil;
        end;

        if p13.projectileType ~= u7.hook then
            return nil;
        end;

        if not u7:canUseGrapplingHook() then
            p13:setCancelled(true);

            return nil;
        end;

        if u7:getHookState() ~= GrapplingHookFunctions.HOOK_CHAMBERED then
            p13:setCancelled(true);

            return nil;
        end;

        u7:setHookState(GrapplingHookFunctions.HOOK_FORWARD_TRANSIT);
        SharedSyncEvents.HookFunctionSwapEvent:fire(Players.LocalPlayer, GrapplingHookFunctions.HOOK_FORWARD_TRANSIT);
    end);
    ClientSyncEvents.ProjectileLaunched:connect(function(p14) -- Line: 95
        -- upvalues: EntityUtil (ref), RuntimeLib (ref), InventoryEntity (ref), ItemType (ref), u1 (ref), KnitClient (ref), SoundManager (ref), GameSound (ref)
        if p14:isCancelled() then
            return nil;
        end;

        if p14.projectileType ~= "grappling_hook_projectile" then
            return nil;
        end;

        if not p14.shooter then
            return nil;
        end;

        local v15 = EntityUtil:getEntity(p14.shooter);

        if not v15 then
            return nil;
        end;

        if RuntimeLib.instanceof(v15, InventoryEntity) then
            local v16 = v15:getItemInstanceFromCharacter(ItemType.GRAPPLING_HOOK);

            if not v16 then
                return nil;
            end;

            local Handle = p14.projectile:FindFirstChild("Handle");

            if not Handle then
                return nil;
            end;

            local Handle2 = p14.projectile:FindFirstChild("Handle");

            if Handle2 ~= nil then
                Handle2 = Handle2:FindFirstChild("RopeBeam");
            end;

            if not Handle2 then
                return nil;
            end;

            local u17 = u1.new();
            Handle2.Destroying:Connect(function() -- Line: 127
                -- upvalues: u17 (copy)
                u17:DoCleaning();
            end);
            local Handle3 = v16:FindFirstChild("Handle");

            if Handle3 ~= nil then
                Handle3 = Handle3:FindFirstChild("RopeAttachment");
            end;

            if not Handle3 then
                return nil;
            end;

            local Handle4 = p14.projectile:FindFirstChild("Handle");

            if Handle4 ~= nil then
                Handle4 = Handle4:FindFirstChild("RopeAttachment");
            end;

            if not Handle4 then
                return nil;
            end;

            if p14:isLocalShooter() and KnitClient.Controllers.ViewmodelController:isVisible() then
                local v18 = KnitClient.Controllers.ViewmodelController:getViewModel();

                if v18 ~= nil then
                    v18 = v18:FindFirstChild(ItemType.GRAPPLING_HOOK);

                    if v18 ~= nil then
                        v18 = v18:FindFirstChild("Handle");

                        if v18 ~= nil then
                            v18 = v18:FindFirstChild("RopeAttachment");
                        end;
                    end;
                end;

                if v18 then
                    Handle2.Attachment0 = v18;
                else
                    Handle2.Attachment0 = Handle3;
                end;
            else
                Handle2.Attachment0 = Handle3;
            end;

            local UpperTorso = v15:getInstance():FindFirstChild("UpperTorso");

            if UpperTorso ~= nil then
                UpperTorso = UpperTorso:FindFirstChild("BodyFrontAttachment");
            end;

            Handle3.Destroying:Connect(function() -- Line: 172
                -- upvalues: UpperTorso (copy), Handle2 (copy)
                if UpperTorso and Handle2.Parent then
                    Handle2.Attachment0 = UpperTorso;
                end;
            end);
            local u19 = SoundManager:playSound(GameSound.GRAPPLING_HOOK_EXTEND_LOOP, {
                rollOffMaxDistance = 150,
                looped = true,
                position = Handle.Position,
                parent = Handle
            });
            u17:GiveTask(function() -- Line: 183
                -- upvalues: u19 (copy)
                local v20 = u19;

                if v20 ~= nil then
                    v20:Stop();
                end;

                local v21 = u19;

                if v21 ~= nil then
                    v21:Destroy();
                end;
            end);
        end;
    end);
    ClientSyncEvents.LocalProjectileImpact:connect(function(p22) -- Line: 195
        -- upvalues: u1 (ref), Workspace (ref)
        if p22.projectile.Name ~= "grappling_hook_projectile" then
            return nil;
        end;

        local u23 = u1.new();
        local u24 = p22.projectile:Clone();
        u24.Parent = Workspace;
        u23:GiveTask(function() -- Line: 202
            -- upvalues: u24 (copy)
            u24:Destroy();
        end);
        task.delay(1, function() -- Line: 205
            -- upvalues: u23 (copy)
            u23:DoCleaning();
        end);

        for _, descendant in u24:GetDescendants() do
            if descendant:IsA("BasePart") then
                descendant.Anchored = true;
            end;
        end;

        local Handle = u24:FindFirstChild("Handle");

        if Handle ~= nil then
            Handle = Handle:FindFirstChild("RopeBeam");
        end;

        if not Handle then
            return nil;
        end;

        if Handle.Attachment0 then
            local Parent = Handle.Attachment0.Parent;

            if Parent ~= nil then
                Parent = Parent.Parent;

                if Parent ~= nil then
                    Parent = Parent:IsA("Accessory");
                end;
            end;

            local u25 = Parent and Handle.Attachment0.Parent.Parent.Parent;

            if u25 then
                Handle.Attachment0.Destroying:Connect(function() -- Line: 232
                    -- upvalues: u25 (copy), Handle (copy)
                    local UpperTorso = u25:FindFirstChild("UpperTorso");

                    if UpperTorso ~= nil then
                        UpperTorso = UpperTorso:FindFirstChild("BodyFrontAttachment");
                    end;

                    Handle.Attachment0 = UpperTorso;
                end);
            end;
        end;
    end);
end;

function u4.canUseGrapplingHook(p26) -- Line: 244
    -- upvalues: Flamework (copy), CooldownId (copy)
    return not Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(CooldownId.GRAPPLING_HOOK);
end;

KnitClient.CreateController(u4.new());

return nil;
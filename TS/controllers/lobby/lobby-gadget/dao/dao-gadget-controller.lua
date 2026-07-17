-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local RunService = v5.RunService;
local StarterPlayer = v5.StarterPlayer;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local DasherProgressBar = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "dasher", "dasher-progress-bar").DasherProgressBar;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local DasherKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "dasher", "dasher-kit").DasherKit;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes");
local GetAttribute = v6.GetAttribute;
local GetAttributeChangedSignal = v6.GetAttributeChangedSignal;
local SetAttribute = v6.SetAttribute;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 37, Name: __tostring
        return "DaoGadgetController";
    end,

    __index = HandKnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 43
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 47
    -- upvalues: HandKnitController (copy), u3 (copy)
    HandKnitController.constructor(p9);
    p9.Name = "DaoGadgetController";
    p9.maid = u3.new();
end;

function u7.KnitStart(p10) -- Line: 52
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), AbilityId (copy), GameSound (copy), SoundManager (copy), Players (copy)
    HandKnitController.KnitStart(p10);
    ClientSyncEvents.AbilityUsed:connect(function(p11) -- Line: 54
        -- upvalues: AbilityId (ref), GameSound (ref), SoundManager (ref), Players (ref)
        if p11.ability ~= AbilityId.DASH then
            return nil;
        end;

        if p11:isCancelled() then
            return nil;
        end;

        if not p11.userCharacter.PrimaryPart then
            return nil;
        end;

        local DAO_DASH = GameSound.DAO_DASH;
        local v12 = {
            volumeMultiplier = 1
        };
        local v13;

        if p11.userCharacter == Players.LocalPlayer.Character then
            v13 = nil;
        else
            v13 = p11.userCharacter.PrimaryPart;
        end;

        v12.parent = v13;
        SoundManager:playSound(DAO_DASH, v12);
    end);
end;

function u7.onEnable(u14, u15) -- Line: 71
    -- upvalues: Flamework (copy), AbilityId (copy), ClientSyncEvents (copy), WatchCharacter (copy), Players (copy), GetAttributeChangedSignal (copy), DasherKit (copy), Workspace (copy), u3 (copy), CooldownId (copy), RunService (copy), EntityUtil (copy), default (copy), GetAttribute (copy), SetAttribute (copy)
    local u16 = false;
    u14:setupDestroyableYield(function() -- Line: 73
        -- upvalues: Flamework (ref), AbilityId (ref)
        return Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.DASH, nil):expect();
    end);
    u14.maid:GiveTask(ClientSyncEvents.SwordSwingDown:connect(function() -- Line: 76
        -- upvalues: u16 (ref)
        u16 = true;
    end));
    u14.maid:GiveTask(ClientSyncEvents.SwordSwingUp:connect(function() -- Line: 79
        -- upvalues: u16 (ref)
        u16 = false;
    end));
    WatchCharacter(function(p17, p18, p19) -- Line: 82
        -- upvalues: Players (ref), GetAttributeChangedSignal (ref), DasherKit (ref), Workspace (ref), u14 (copy), u3 (ref), Flamework (ref), CooldownId (ref)
        if p17 ~= Players.LocalPlayer then
            return nil;
        end;

        p19:GiveTask(GetAttributeChangedSignal(p18, DasherKit.canDashAttribute, function(p20) -- Line: 86
            -- upvalues: Workspace (ref), u14 (ref), u3 (ref), Flamework (ref), CooldownId (ref)
            if p20 == nil then
                return nil;
            end;

            local v21 = p20 - Workspace:GetServerTimeNow();

            if u14.cooldownMaid then
                u14.cooldownMaid:DoCleaning();
            end;

            u14.cooldownMaid = u3.new();
            u14.cooldownMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(CooldownId.DASHER_ABILITY));
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.DASHER_ABILITY, v21, {
                cooldownBar = {
                    color = Color3.fromRGB(166, 38, 38)
                }
            });
            u14.cooldownMaid:GiveTask(function() -- Line: 101
                -- upvalues: Flamework (ref), CooldownId (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(CooldownId.DASHER_ABILITY);
            end);
            task.delay(v21, function() -- Line: 104
                -- upvalues: u14 (ref)
                if u14.cooldownMaid then
                    u14.cooldownMaid:DoCleaning();
                    u14.cooldownMaid = nil;
                end;
            end);
        end));
        p19:GiveTask(function() -- Line: 111
            -- upvalues: u14 (ref)
            local cooldownMaid = u14.cooldownMaid;

            if cooldownMaid ~= nil then
                cooldownMaid:DoCleaning();
            end;
        end);
    end);
    u14.maid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 118
        -- upvalues: Players (ref), EntityUtil (ref), u14 (copy), default (ref), GetAttribute (ref), DasherKit (ref), u16 (ref), Workspace (ref), Flamework (ref), AbilityId (ref), u15 (copy), SetAttribute (ref)
        local Character = Players.LocalPlayer.Character;

        if Character == nil or not Character.PrimaryPart then
            return nil;
        end;

        local v22 = EntityUtil:getEntity(Character);

        if v22 == nil or v22:isAlive() == false then
            u14.beginChargeTime = nil;
            local chargingMaid = u14.chargingMaid;

            if chargingMaid ~= nil then
                chargingMaid:DoCleaning();
            end;

            u14.chargingMaid = nil;
            default.Debug("Removed");

            return nil;
        end;

        local v23 = GetAttribute(Character, DasherKit.canDashAttribute);
        local v24 = v23 == nil and 0 or v23;
        local v25 = u16;

        if v25 then
            local beginChargeTime = u14.beginChargeTime;

            if beginChargeTime == 0 then
                beginChargeTime = false;
            elseif beginChargeTime ~= beginChargeTime then
                beginChargeTime = false;
            end;

            v25 = not beginChargeTime;

            if v25 then
                if v24 == nil then
                    v25 = false;
                else
                    v25 = v24 < Workspace:GetServerTimeNow();
                end;
            end;
        end;

        if v25 and Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(AbilityId.DASH, {
            disableBlockedAbilityAlert = true
        }) then
            u14.beginChargeTime = time();
        end;

        local beginChargeTime = u14.beginChargeTime;

        if beginChargeTime ~= 0 and (beginChargeTime == beginChargeTime and beginChargeTime) then
            if time() - u14.beginChargeTime > DasherKit.CHARGE_TIME_BEFORE_CHARGING_STATE then
                beginChargeTime = not u14.chargingMaid;
            else
                beginChargeTime = false;
            end;
        end;

        if beginChargeTime ~= 0 and (beginChargeTime == beginChargeTime and beginChargeTime) then
            u14.beginChargeTime = nil;
            u14:enterChargingState();

            return nil;
        end;

        if not u16 then
            local chargingMaid = u14.chargingMaid;

            if chargingMaid ~= nil then
                chargingMaid:DoCleaning();
            end;

            u14.chargingMaid = nil;
            local beginChargeTime2 = u14.beginChargeTime;

            if beginChargeTime2 ~= 0 and (beginChargeTime2 == beginChargeTime2 and beginChargeTime2) then
                beginChargeTime2 = time() - u14.beginChargeTime >= DasherKit.CHARGE_TIME;
            end;

            if beginChargeTime2 ~= 0 and (beginChargeTime2 == beginChargeTime2 and beginChargeTime2) then
                local LookVector = Workspace.CurrentCamera.CFrame.LookVector;

                if Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(AbilityId.DASH) then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.DASH, nil, {
                        direction = LookVector,
                        origin = Character.PrimaryPart.Position,
                        weapon = u15.itemType
                    });
                    u14:dashForward(LookVector);
                    SetAttribute(Character, DasherKit.canDashAttribute, Workspace:GetServerTimeNow() + 500);
                end;
            end;

            u14.beginChargeTime = nil;

            return nil;
        end;
    end));
    u14.maid:GiveTask(function() -- Line: 194
        -- upvalues: u14 (copy)
        local chargingMaid = u14.chargingMaid;

        if chargingMaid ~= nil then
            chargingMaid:DoCleaning();
        end;

        u14.chargingMaid = nil;
        local cooldownMaid = u14.cooldownMaid;

        if cooldownMaid ~= nil then
            cooldownMaid:DoCleaning();
        end;

        u14.cooldownMaid = nil;
        u14.beginChargeTime = nil;
    end);
end;

function u7.enterChargingState(p26) -- Line: 208
    -- upvalues: u3 (copy), GameAnimationUtil (copy), Players (copy), AnimationType (copy), u4 (copy), DasherProgressBar (copy), DasherKit (copy), KnitClient2 (copy)
    p26.chargingMaid = u3.new();
    local u27 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.DAO_CHARGE, {
        looped = true
    });
    local chargingMaid = p26.chargingMaid;

    if chargingMaid ~= nil then
        chargingMaid:GiveTask(function() -- Line: 215
            -- upvalues: u27 (copy)
            local v28 = u27;

            if v28 ~= nil then
                v28:Stop();
            end;
        end);
    end;

    local u29 = u4.mount(u4.createElement("ScreenGui", {}, { u4.createElement(DasherProgressBar, {
            chargeTime = DasherKit.CHARGE_TIME
        }) }), Players.LocalPlayer:WaitForChild("PlayerGui"), "DasherCharge");
    local chargingMaid2 = p26.chargingMaid;

    if chargingMaid2 ~= nil then
        chargingMaid2:GiveTask(function() -- Line: 229
            -- upvalues: u4 (ref), u29 (copy)
            u4.unmount(u29);
        end);
    end;

    KnitClient2.Controllers.EmoteController:setCanEmote(false);
    p26.chargingMaid:GiveTask(function() -- Line: 234
        -- upvalues: KnitClient2 (ref)
        KnitClient2.Controllers.EmoteController:setCanEmote(true);
    end);
end;

function u7.dashForward(p30, p31) -- Line: 238
    -- upvalues: Players (copy), KnitClient2 (copy), StarterPlayer (copy), SoundManager (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy)
    local Character = Players.LocalPlayer.Character;

    if Character then
        Character.HumanoidRootPart.CFrame = CFrame.lookAt(Character.HumanoidRootPart.Position, Character.HumanoidRootPart.Position + p31 * Vector3.new(1, 0, 1));
        Character.Humanoid.JumpHeight = 0.5;
        Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
        local PrimaryPart = Character.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.AssemblyMass;
        end;

        Character.HumanoidRootPart:ApplyImpulse(p31.Unit * Vector3.new(1, 0, 1) * (PrimaryPart == nil and 1 or PrimaryPart) * 70);
        KnitClient2.Controllers.JumpHeightController:setJumpHeight(StarterPlayer.CharacterJumpHeight);
        SoundManager:playSound(GameSound.DAO_SLASH);
        local v32 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.DAO_DASH);

        if v32 ~= nil then
            v32:AdjustSpeed(2.5);
        end;
    end;
end;

function u7.onDisable(p33) -- Line: 271
    p33.maid:DoCleaning();
end;

function u7.isRelevantItem(p34, p35) -- Line: 274
    -- upvalues: getItemMeta (copy)
    local sword = getItemMeta(p35.itemType).sword;

    if sword ~= nil then
        sword = sword.daoDash;
    end;

    return sword == true;
end;

KnitClient.CreateController(u7.new());

return nil;
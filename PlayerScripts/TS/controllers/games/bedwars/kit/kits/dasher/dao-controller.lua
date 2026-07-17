-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
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
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local DasherKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "dasher", "dasher-kit").DasherKit;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes");
local GetAttribute = v6.GetAttribute;
local GetAttributeChangedSignal = v6.GetAttributeChangedSignal;
local SetAttribute = v6.SetAttribute;
local DasherProgressBar = RuntimeLib.import(script, script.Parent, "dasher-progress-bar").DasherProgressBar;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 39, Name: __tostring
        return "DaoController";
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
    -- upvalues: HandKnitController (copy), u3 (copy)
    HandKnitController.constructor(p9);
    p9.Name = "DaoController";
    p9.maid = u3.new();
end;

function u7.KnitStart(p10) -- Line: 54
    -- upvalues: HandKnitController (copy), KnitClient (copy), AnimationType (copy), ClientSyncEvents (copy), AbilityId (copy), GameSound (copy), BedwarsKitSkinMeta (copy), RandomUtil (copy), SoundManager (copy), Players (copy)
    HandKnitController.KnitStart(p10);
    KnitClient.Controllers.PreloadController:runPreload({
        animations = { AnimationType.DAO_CHARGE, AnimationType.DAO_DASH }
    });
    ClientSyncEvents.AbilityUsed:connect(function(p11) -- Line: 59
        -- upvalues: AbilityId (ref), GameSound (ref), KnitClient (ref), BedwarsKitSkinMeta (ref), RandomUtil (ref), SoundManager (ref), Players (ref)
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
        local v12 = KnitClient.Controllers.KitController:getKitSkin(p11.userCharacter);
        local v13 = 1;
        local v14;

        if v12 then
            local yuzi = BedwarsKitSkinMeta[v12].yuzi;

            if yuzi ~= nil then
                yuzi = yuzi.dashSound;
            end;

            if yuzi and #yuzi > 0 then
                DAO_DASH = RandomUtil.fromList(unpack(yuzi));
            end;

            v14 = BedwarsKitSkinMeta[v12].yuzi;

            if v14 ~= nil then
                v14 = v14.soundVolume;
            end;

            if v14 == 0 or v14 ~= v14 then
                v14 = v13;
            elseif not v14 then
                v14 = v13;
            end;
        else
            v14 = v13;
        end;

        local v15 = {};
        local v16;

        if p11.userCharacter == Players.LocalPlayer.Character then
            v16 = nil;
        else
            v16 = p11.userCharacter.PrimaryPart;
        end;

        v15.parent = v16;
        v15.volumeMultiplier = v14;
        SoundManager:playSound(DAO_DASH, v15);
    end);
end;

function u7.onEnable(u17, u18) -- Line: 96
    -- upvalues: Flamework (copy), AbilityId (copy), ClientSyncEvents (copy), WatchCharacter (copy), Players (copy), GetAttributeChangedSignal (copy), DasherKit (copy), Workspace (copy), u3 (copy), CooldownId (copy), RunService (copy), EntityUtil (copy), default (copy), GetAttribute (copy), SetAttribute (copy)
    local u19 = false;
    u17:setupDestroyableYield(function() -- Line: 98
        -- upvalues: Flamework (ref), AbilityId (ref)
        return Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.DASH, nil):expect();
    end);
    u17.maid:GiveTask(ClientSyncEvents.SwordSwingDown:connect(function() -- Line: 101
        -- upvalues: u19 (ref)
        u19 = true;
    end));
    u17.maid:GiveTask(ClientSyncEvents.SwordSwingUp:connect(function() -- Line: 104
        -- upvalues: u19 (ref)
        u19 = false;
    end));
    u17.maid:GiveTask(WatchCharacter(function(p20, p21, p22) -- Line: 107
        -- upvalues: Players (ref), GetAttributeChangedSignal (ref), DasherKit (ref), Workspace (ref), u17 (copy), u3 (ref), Flamework (ref), CooldownId (ref)
        if p20 ~= Players.LocalPlayer then
            return nil;
        end;

        p22:GiveTask(GetAttributeChangedSignal(p21, DasherKit.canDashAttribute, function(p23) -- Line: 111
            -- upvalues: Workspace (ref), u17 (ref), u3 (ref), Flamework (ref), CooldownId (ref)
            if p23 == nil then
                return nil;
            end;

            local v24 = p23 - Workspace:GetServerTimeNow();

            if u17.cooldownMaid then
                u17.cooldownMaid:DoCleaning();
            end;

            u17.cooldownMaid = u3.new();
            u17.cooldownMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(CooldownId.DASHER_ABILITY));
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.DASHER_ABILITY, v24, {
                cooldownBar = {
                    color = Color3.fromRGB(166, 38, 38)
                }
            });
            u17.cooldownMaid:GiveTask(function() -- Line: 126
                -- upvalues: Flamework (ref), CooldownId (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):removeCooldown(CooldownId.DASHER_ABILITY);
            end);
            task.delay(v24, function() -- Line: 129
                -- upvalues: u17 (ref)
                if u17.cooldownMaid then
                    u17.cooldownMaid:DoCleaning();
                    u17.cooldownMaid = nil;
                end;
            end);
        end));
        p22:GiveTask(function() -- Line: 136
            -- upvalues: u17 (ref)
            local cooldownMaid = u17.cooldownMaid;

            if cooldownMaid ~= nil then
                cooldownMaid:DoCleaning();
            end;
        end);
    end));
    u17.maid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 143
        -- upvalues: Players (ref), EntityUtil (ref), u17 (copy), default (ref), GetAttribute (ref), DasherKit (ref), u19 (ref), Workspace (ref), Flamework (ref), AbilityId (ref), u18 (copy), SetAttribute (ref)
        local Character = Players.LocalPlayer.Character;

        if Character == nil or not Character.PrimaryPart then
            return nil;
        end;

        local v25 = EntityUtil:getEntity(Character);

        if v25 == nil or v25:isAlive() == false then
            u17.beginChargeTime = nil;
            local chargingMaid = u17.chargingMaid;

            if chargingMaid ~= nil then
                chargingMaid:DoCleaning();
            end;

            u17.chargingMaid = nil;
            default.Debug("Removed");

            return nil;
        end;

        local v26 = GetAttribute(Character, DasherKit.canDashAttribute);
        local v27 = v26 == nil and 0 or v26;
        local v28 = u19;

        if v28 then
            local beginChargeTime = u17.beginChargeTime;

            if beginChargeTime == 0 then
                beginChargeTime = false;
            elseif beginChargeTime ~= beginChargeTime then
                beginChargeTime = false;
            end;

            v28 = not beginChargeTime;

            if v28 then
                if v27 == nil then
                    v28 = false;
                else
                    v28 = v27 < Workspace:GetServerTimeNow();
                end;
            end;
        end;

        if v28 and Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(AbilityId.DASH, {
            disableBlockedAbilityAlert = true
        }) then
            u17.beginChargeTime = time();
        end;

        local beginChargeTime = u17.beginChargeTime;

        if beginChargeTime ~= 0 and (beginChargeTime == beginChargeTime and beginChargeTime) then
            if time() - u17.beginChargeTime > DasherKit.CHARGE_TIME_BEFORE_CHARGING_STATE then
                beginChargeTime = not u17.chargingMaid;
            else
                beginChargeTime = false;
            end;
        end;

        if beginChargeTime ~= 0 and (beginChargeTime == beginChargeTime and beginChargeTime) then
            u17.beginChargeTime = nil;
            u17:enterChargingState();

            return nil;
        end;

        if not u19 then
            local chargingMaid = u17.chargingMaid;

            if chargingMaid ~= nil then
                chargingMaid:DoCleaning();
            end;

            u17.chargingMaid = nil;
            local beginChargeTime2 = u17.beginChargeTime;

            if beginChargeTime2 ~= 0 and (beginChargeTime2 == beginChargeTime2 and beginChargeTime2) then
                beginChargeTime2 = time() - u17.beginChargeTime >= DasherKit.CHARGE_TIME;
            end;

            if beginChargeTime2 ~= 0 and (beginChargeTime2 == beginChargeTime2 and beginChargeTime2) then
                local LookVector = Workspace.CurrentCamera.CFrame.LookVector;

                if Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):canUseAbility(AbilityId.DASH) then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.DASH, nil, {
                        direction = LookVector,
                        origin = Character.PrimaryPart.Position,
                        weapon = u18.itemType
                    });
                    u17:dashForward(LookVector);
                    SetAttribute(Character, DasherKit.canDashAttribute, Workspace:GetServerTimeNow() + 500);
                end;
            end;

            u17.beginChargeTime = nil;

            return nil;
        end;
    end));
    u17.maid:GiveTask(function() -- Line: 219
        -- upvalues: u17 (copy)
        local chargingMaid = u17.chargingMaid;

        if chargingMaid ~= nil then
            chargingMaid:DoCleaning();
        end;

        u17.chargingMaid = nil;
        local cooldownMaid = u17.cooldownMaid;

        if cooldownMaid ~= nil then
            cooldownMaid:DoCleaning();
        end;

        u17.cooldownMaid = nil;
        u17.beginChargeTime = nil;
    end);
end;

function u7.enterChargingState(p29) -- Line: 233
    -- upvalues: u3 (copy), GameAnimationUtil (copy), Players (copy), AnimationType (copy), KnitClient (copy), u4 (copy), DasherProgressBar (copy), DasherKit (copy), KnitClient2 (copy)
    p29.chargingMaid = u3.new();
    local u30 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.DAO_CHARGE, {
        looped = true
    });
    KnitClient.Controllers.SwordController:disableHoldAutoSwing();
    Players.LocalPlayer:SetAttribute("IsCasting", true);
    local chargingMaid = p29.chargingMaid;

    if chargingMaid ~= nil then
        chargingMaid:GiveTask(function() -- Line: 242
            -- upvalues: Players (ref), KnitClient (ref)
            Players.LocalPlayer:SetAttribute("IsCasting", false);
            KnitClient.Controllers.SwordController:enableHoldAutoSwing();
        end);
    end;

    local chargingMaid2 = p29.chargingMaid;

    if chargingMaid2 ~= nil then
        chargingMaid2:GiveTask(function() -- Line: 249
            -- upvalues: u30 (copy)
            local v31 = u30;

            if v31 ~= nil then
                v31:Stop();
            end;
        end);
    end;

    local u32 = u4.mount(u4.createElement("ScreenGui", {}, { u4.createElement(DasherProgressBar, {
            chargeTime = DasherKit.CHARGE_TIME
        }) }), Players.LocalPlayer:WaitForChild("PlayerGui"), "DasherCharge");
    local chargingMaid3 = p29.chargingMaid;

    if chargingMaid3 ~= nil then
        chargingMaid3:GiveTask(function() -- Line: 263
            -- upvalues: u4 (ref), u32 (copy)
            u4.unmount(u32);
        end);
    end;

    KnitClient2.Controllers.EmoteController:setCanEmote(false);
    p29.chargingMaid:GiveTask(function() -- Line: 268
        -- upvalues: KnitClient2 (ref)
        KnitClient2.Controllers.EmoteController:setCanEmote(true);
    end);
    KnitClient.Controllers.YuziSkinController:windUpMotor(Players.LocalPlayer.Character);
end;

function u7.dashForward(p33, p34) -- Line: 273
    -- upvalues: Players (copy), KnitClient2 (copy), StarterPlayer (copy), SoundManager (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy)
    local Character = Players.LocalPlayer.Character;

    if Character then
        Character.HumanoidRootPart.CFrame = CFrame.lookAt(Character.HumanoidRootPart.Position, Character.HumanoidRootPart.Position + p34 * Vector3.new(1, 0, 1));
        Character.Humanoid.JumpHeight = 0.5;
        Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
        local PrimaryPart = Character.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.AssemblyMass;
        end;

        Character.HumanoidRootPart:ApplyImpulse(p34.Unit * Vector3.new(1, 0, 1) * (PrimaryPart == nil and 1 or PrimaryPart) * 70);
        KnitClient2.Controllers.JumpHeightController:setJumpHeight(StarterPlayer.CharacterJumpHeight);
        SoundManager:playSound(GameSound.DAO_SLASH);
        local v35 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.DAO_DASH);

        if v35 ~= nil then
            v35:AdjustSpeed(2.5);
        end;
    end;
end;

function u7.onDisable(p36) -- Line: 306
    p36.maid:DoCleaning();
end;

function u7.isRelevantItem(p37, p38) -- Line: 309
    -- upvalues: getItemMeta (copy)
    local sword = getItemMeta(p38.itemType).sword;

    if sword ~= nil then
        sword = sword.daoDash;
    end;

    return sword == true;
end;

KnitClient.CreateController(u7.new());

return nil;
-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local WerewolfTailBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "werewolf-tail-balance").WerewolfTailBalance;
local WerewolfTailAttributes = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "werewolf-tail", "werewolf-tail-attributes").WerewolfTailAttributes;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local GetAttributeChangedSignal = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttributeChangedSignal;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 30, Name: __tostring
        return "WerewolfAOEIndicatorData";
    end
});
u4.__index = u4;

function u4.new(...) -- Line: 35
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, p7, p8, p9) -- Line: 39
    p6.player = p7;
    p6.indicator = p8;
    p6.chargingEffect = p9;
end;

local u10 = setmetatable({}, {
    __tostring = function() -- Line: 49, Name: __tostring
        return "WerewolfTailController";
    end,

    __index = KnitController
});
u10.__index = u10;

function u10.new(...) -- Line: 55
    -- upvalues: u10 (ref)
    local v11 = setmetatable({}, u10);

    return v11:constructor(...) or v11;
end;

function u10.constructor(p12) -- Line: 59
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p12);
    p12.Name = "WerewolfTailController";
    p12.aoeIndicators = {};
    p12.isChargingHowl = false;
    p12.fearStatusEffectMaid = u2.new();
    p12.chargingHowlMaid = u2.new();
    p12.abilityMaid = u2.new();
end;

function u10.onDisable(p13) -- Line: 68
    p13.isChargingHowl = false;
end;

function u10.becomeWerewolf(u14, p15) -- Line: 71
    -- upvalues: Players (copy), Flamework (copy), AbilityId (copy), BedwarsImageId (copy)
    if p15.entityInstance ~= Players.LocalPlayer.Character then
        return nil;
    end;

    local u16 = true;
    u14.abilityMaid:GiveTask(function() -- Line: 77
        -- upvalues: u16 (ref)
        u16 = false;

        return u16;
    end);
    task.spawn(function() -- Line: 81
        -- upvalues: Flamework (ref), AbilityId (ref), BedwarsImageId (ref), u16 (ref), u14 (copy)
        local v17 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.WEREWOLF_HOWL, {
            abilityType = "MiscPrimary",
            abilityButton = {
                icon = BedwarsImageId.WEREWOLF_HOWL_ABILITY
            }
        }):expect();

        if u16 then
            u14.abilityMaid:GiveTask(v17);

            return;
        end;

        v17.Destroy();
    end);
end;

function u10.removeWerewolf(p18, p19) -- Line: 95
    -- upvalues: Players (copy)
    if p19.entityInstance ~= Players.LocalPlayer.Character then
        return nil;
    end;

    p18.abilityMaid:DoCleaning();
    p18.isChargingHowl = false;
end;

function u10.useHowlAbility(p20, p21) -- Line: 102
    -- upvalues: AbilityId (copy), Players (copy), default (copy)
    if p21.ability == AbilityId.WEREWOLF_HOWL and p21.userCharacter == Players.LocalPlayer.Character then
        if not default.Client:Get("UseWerewolfHowlAbility"):CallServer({
            player = Players.LocalPlayer
        }) then
            return nil;
        end;

        p20.isChargingHowl = true;
    end;
end;

function u10.playerStartedChargingHowl(p22, p23) -- Line: 114
    -- upvalues: SoundManager (copy), GameSound (copy), Players (copy), GameAnimationUtil (copy), AnimationType (copy)
    p22:showAoeIndicator(p23);
    local WEREWOLF_CHARGE = GameSound.WEREWOLF_CHARGE;
    local v24 = {};
    local Character = p23.Character;

    if Character ~= nil then
        Character = Character:GetPivot().Position;
    end;

    v24.position = Character;
    SoundManager:playSound(WEREWOLF_CHARGE, v24);

    if p23 ~= Players.LocalPlayer then
        return nil;
    end;

    GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.WEREWOLF_CHARGE);
end;

function u10.showAoeIndicator(p25, p26) -- Line: 134
    -- upvalues: ReplicatedStorage (copy), WeldUtil (copy), WerewolfTailBalance (copy), Players (copy), u4 (ref)
    local v27;

    if p26 == nil then
        v27 = p26;
    else
        v27 = p26.Character;

        if v27 ~= nil then
            v27 = v27.PrimaryPart;
        end;
    end;

    if not v27 then
        return nil;
    end;

    local v28 = ReplicatedStorage.Assets.Misc.WerewolfAOEIndicator:Clone();
    local Position = p26.Character:GetPivot().Position;
    v28.Position = Position;
    v28.Parent = p26.Character;
    WeldUtil:weldParts(v28, p26.Character.PrimaryPart);
    v28.Size = Vector3.new(WerewolfTailBalance.HOWL_RADIUS * 2, WerewolfTailBalance.HOWL_RADIUS * 2, WerewolfTailBalance.HOWL_RADIUS * 2);
    local v29 = ReplicatedStorage.Assets.Effects.WerewolfCharging:Clone();
    v29:PivotTo(CFrame.new(Position));
    v29.Parent = p26.Character;
    WeldUtil:weldParts(v29.PrimaryPart, p26.Character.PrimaryPart);

    if p26 == Players.LocalPlayer then
        p25.myChargingParticleParent = v29;

        local function _(p30) -- Line: 166
            p30:SetAttribute("FirstPersonVisible", false);
        end;

        for i, descendant in p25.myChargingParticleParent:GetDescendants() do
            local _ = i - 1;
            descendant:SetAttribute("FirstPersonVisible", false);
        end;
    end;

    if p25.aoeIndicators[p26.UserId] ~= nil then
        local v31 = p25.aoeIndicators[p26.UserId];

        if v31 ~= nil then
            local indicator = v31.indicator;

            if indicator ~= nil then
                indicator:Destroy();
            end;
        end;

        local v32 = p25.aoeIndicators[p26.UserId];

        if v32 ~= nil then
            local chargingEffect = v32.chargingEffect;

            if chargingEffect ~= nil then
                chargingEffect:Destroy();
            end;
        end;
    end;

    p25.aoeIndicators[p26.UserId] = u4.new(p26, v28, v29);
end;

function u10.addFearStatusEffect(p33, p34) -- Line: 202
    -- upvalues: Players (copy), RunService (copy), WerewolfTailBalance (copy)
    if p34.entityInstance ~= Players.LocalPlayer.Character then
        return nil;
    end;

    RunService:BindToRenderStep("werewolf-fear-status", Enum.RenderPriority.Character.Value + 1, function(p35) -- Line: 207
        -- upvalues: Players (ref), WerewolfTailBalance (ref)
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:FindFirstChild("Humanoid");
        end;

        if not Character then
            return nil;
        end;

        Character:Move(Character.RootPart.CFrame.LookVector * (p35 * WerewolfTailBalance.FEAR_WALK_SPEED));
    end);
    p33.fearStatusEffectMaid:GiveTask(function() -- Line: 226
        -- upvalues: RunService (ref)
        return RunService:UnbindFromRenderStep("werewolf-fear-status");
    end);
end;

function u10.removeFearStatusEffect(p36, p37) -- Line: 230
    -- upvalues: Players (copy)
    if p37.entityInstance ~= Players.LocalPlayer.Character then
        return nil;
    end;

    p36.fearStatusEffectMaid:DoCleaning();
end;

function u10.addFeralStatusEffect(p38, p39) -- Line: 236
    -- upvalues: Players (copy)
    if p39.entityInstance ~= Players.LocalPlayer.Character then
        return nil;
    end;
end;

function u10.werewolfSpeedBoostAttributeChanged(p40, p41, p42, p43) -- Line: 241
    -- upvalues: KnitClient (copy)
    if p43 == nil then
        if p40.speedBoostMaid then
            p40.speedBoostMaid:Destroy();
            p40.speedBoostMaid = nil;
        end;

        return;
    end;

    p40.speedBoostMaid = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
        blockSprint = false,
        moveSpeedMultiplier = p43
    });
end;

function u10.werewolfJumpBoostAttributeChanged(p44, p45, p46, p47) -- Line: 254
    -- upvalues: KnitClient (copy)
    if p47 == nil then
        if p44.jumpBoostMaid then
            p44.jumpBoostMaid:Destroy();
            p44.jumpBoostMaid = nil;
        end;

        return;
    end;

    p44.jumpBoostMaid = KnitClient.Controllers.JumpHeightController:getJumpModifier():addModifier({
        jumpHeightMultiplier = p47
    });
end;

function u10.KnitStart(u48) -- Line: 266
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), default (copy), StatusEffectType (copy), WatchCharacter (copy), Players (copy), GetAttributeChangedSignal (copy), WerewolfTailAttributes (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), WeldUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SyncEventPriority (copy)
    KnitController.KnitStart(u48);
    ClientSyncEvents.AbilityUsed:connect(function(p49) -- Line: 273
        -- upvalues: u48 (copy)
        return u48:useHowlAbility(p49);
    end);
    default.Client:WaitFor("WerewolfStartChargingHowl"):andThen(function(p50) -- Line: 278
        -- upvalues: u48 (copy)
        p50:Connect(function(p51) -- Line: 279
            -- upvalues: u48 (ref)
            return u48:playerStartedChargingHowl(p51.player);
        end);
    end);
    ClientSyncEvents.StatusEffectAdded:connect(function(p52) -- Line: 285
        -- upvalues: StatusEffectType (ref), u48 (copy)
        if p52.statusEffect == StatusEffectType.WEREWOLF then
            u48:becomeWerewolf(p52);
        end;

        if p52.statusEffect == StatusEffectType.WEREWOLF_FEAR then
            u48:addFearStatusEffect(p52);
        end;

        if p52.statusEffect == StatusEffectType.WEREWOLF_FERAL then
            u48:addFeralStatusEffect(p52);
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p53) -- Line: 297
        -- upvalues: StatusEffectType (ref), u48 (copy)
        if p53.statusEffect == StatusEffectType.WEREWOLF then
            u48:removeWerewolf(p53);
        end;

        if p53.statusEffect == StatusEffectType.WEREWOLF_FEAR then
            u48:removeFearStatusEffect(p53);
        end;
    end);
    WatchCharacter(function(u54, u55, p56) -- Line: 306
        -- upvalues: Players (ref), GetAttributeChangedSignal (ref), WerewolfTailAttributes (ref), u48 (copy)
        if u54 ~= Players.LocalPlayer then
            return nil;
        end;

        p56:GiveTask(GetAttributeChangedSignal(u55, WerewolfTailAttributes.WerewolfSpeedBoostAttr, function(p57) -- Line: 310
            -- upvalues: u48 (ref), u54 (copy), u55 (copy)
            u48:werewolfSpeedBoostAttributeChanged(u54, u55, p57);
        end));
        p56:GiveTask(GetAttributeChangedSignal(u55, WerewolfTailAttributes.WerewolfJumpBoostAttr, function(p58) -- Line: 313
            -- upvalues: u48 (ref), u54 (copy), u55 (copy)
            u48:werewolfJumpBoostAttributeChanged(u54, u55, p58);
        end));
    end);
    default.Client:WaitFor("WerewolfDestroyIndicator"):andThen(function(p59) -- Line: 344
        -- upvalues: u48 (copy)
        p59:Connect(function(p60) -- Line: 345
            -- upvalues: u48 (ref)
            if u48.aoeIndicators[p60.playerID] ~= nil then
                local v61 = u48.aoeIndicators[p60.playerID];

                if v61 ~= nil then
                    local indicator = v61.indicator;

                    if indicator ~= nil then
                        indicator:Destroy();
                    end;
                end;

                local v62 = u48.aoeIndicators[p60.playerID];

                if v62 ~= nil then
                    local chargingEffect = v62.chargingEffect;

                    if chargingEffect ~= nil then
                        chargingEffect:Destroy();
                    end;
                end;

                u48.aoeIndicators[p60.playerID] = nil;
            end;
        end);
    end);
    default.Client:WaitFor("WerewolfHowl"):andThen(function(p63) -- Line: 376
        -- upvalues: SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), WeldUtil (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref), u48 (copy)
        p63:Connect(function(p64) -- Line: 377
            -- upvalues: SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), WeldUtil (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref), u48 (ref)
            local WEREWOLF_HOWL = GameSound.WEREWOLF_HOWL;
            local v65 = {};
            local Character = p64.player.Character;

            if Character ~= nil then
                Character = Character:GetPivot().Position;
            end;

            v65.position = Character;
            SoundManager:playSound(WEREWOLF_HOWL, v65);
            local u66 = ReplicatedStorage.Assets.Effects.WerewolfHowl:Clone();
            u66.Position = p64.player.Character:GetPivot().Position;
            u66.Parent = p64.player.Character;
            WeldUtil:weldParts(u66, p64.player.Character.PrimaryPart);

            if p64.player == Players.LocalPlayer then
                GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.WEREWOLF_HOWL);
                u48.myChargingParticleParent = nil;
            end;

            task.delay(2, function() -- Line: 401
                -- upvalues: u66 (copy)
                return u66:Destroy();
            end);

            if p64.player ~= Players.LocalPlayer then
                return nil;
            end;

            u48.chargingHowlMaid:DoCleaning();
            u48.isChargingHowl = false;
        end);
    end);
    ClientSyncEvents.SwordSwing:setPriority(SyncEventPriority.HIGHEST):connect(function(p67) -- Line: 414
        -- upvalues: u48 (copy)
        if u48.isChargingHowl then
            p67:setCancelled(true);
        end;
    end);
    ClientSyncEvents.AbilityUsed:setPriority(SyncEventPriority.HIGHEST):connect(function(p68) -- Line: 419
        -- upvalues: u48 (copy)
        if u48.isChargingHowl then
            p68:setCancelled(true);
        end;
    end);
    ClientSyncEvents.StartLaunchProjectile:setPriority(SyncEventPriority.HIGHEST):connect(function(p69) -- Line: 424
        -- upvalues: u48 (copy)
        if u48.isChargingHowl then
            p69:setCancelled(true);
        end;
    end);
    ClientSyncEvents.BeginProjectileTargeting:setPriority(SyncEventPriority.HIGHEST):connect(function(p70) -- Line: 429
        -- upvalues: u48 (copy)
        if u48.isChargingHowl then
            p70:setCancelled(true);
        end;
    end);
    ClientSyncEvents.PlaceBlock:setPriority(SyncEventPriority.HIGHEST):connect(function(p71) -- Line: 434
        -- upvalues: u48 (copy)
        if u48.isChargingHowl then
            p71:setCancelled(true);
        end;
    end);
end;

KnitClient.CreateController(u10.new());

return nil;
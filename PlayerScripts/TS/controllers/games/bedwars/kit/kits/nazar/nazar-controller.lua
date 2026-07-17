-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local NazarKitBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "nazar", "nazar-kit-balance").NazarKitBalance;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ArmorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "armor-util").ArmorUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "NazarController";
    end,

    __index = BaseKitController
});
u3.__index = u3;

function u3.new(...) -- Line: 34
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 38
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), GameSound (copy), BedwarsImageId (copy)
    BaseKitController.constructor(p5, BedwarsKit.NAZAR, {
        sounds = { GameSound.CONSUME_ACTIVATE, GameSound.EMPOWER_ENABLE, GameSound.EMPOWER_DISABLE },
        imageIds = { BedwarsImageId.CONSUME_ICON, BedwarsImageId.EMPOWER_ENABLE_ICON, BedwarsImageId.EMPOWER_DISABLE_ICON }
    });
    p5.Name = "NazarController";
    p5.empowerMaid = {};
end;

function u3.KnitStart(p6) -- Line: 46
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p6);
end;

function u3.onKitLocalActivated(u7, u8) -- Line: 49
    -- upvalues: ClientSyncEvents (copy), SyncEventPriority (copy), NazarKitBalance (copy), getItemMeta (copy), MatchState (copy), WatchCharacter (copy), Players (copy), KnitClient (copy), Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    u8:GiveTask(ClientSyncEvents.ProjectileLaunched:setPriority(SyncEventPriority.HIGH):connect(function(p9) -- Line: 50
        -- upvalues: NazarKitBalance (ref), u7 (copy)
        local v10 = not p9:isLocalShooter();

        if not v10 then
            v10 = not (NazarKitBalance.HEALTH_TAKEN_BY_PROJECTILE[p9.projectileType] ~= nil);
        end;

        if v10 then
            return nil;
        end;

        if not u7:hasHealthToFireProjectile(p9.projectileType) then
            p9.projectile:Destroy();
            p9:setCancelled(true);
        end;
    end));
    u8:GiveTask(ClientSyncEvents.BeginProjectileTargeting:setPriority(SyncEventPriority.HIGH):connect(function(p11) -- Line: 65
        -- upvalues: getItemMeta (ref), NazarKitBalance (ref), u7 (copy)
        local projectileSource = getItemMeta(p11.handItem.itemType).projectileSource;

        if projectileSource ~= nil then
            projectileSource = projectileSource.projectileType(nil);
        end;

        if not projectileSource or NazarKitBalance.HEALTH_TAKEN_BY_PROJECTILE[projectileSource] == nil then
            return nil;
        end;

        if not u7:hasHealthToFireProjectile(projectileSource) then
            p11:setCancelled(true);
        end;
    end));
    u8:GiveTask(ClientSyncEvents.MatchStateChange:connect(function(p12) -- Line: 78
        -- upvalues: MatchState (ref), u8 (copy), WatchCharacter (ref), Players (ref), KnitClient (ref), Flamework (ref), AbilityId (ref), u7 (copy), AbilityMeta (ref)
        if p12.matchState == MatchState.RUNNING then
            task.delay(0.5, function() -- Line: 80
                -- upvalues: u8 (ref), WatchCharacter (ref), Players (ref), KnitClient (ref), MatchState (ref), Flamework (ref), AbilityId (ref), u7 (ref), AbilityMeta (ref)
                u8:GiveTask(WatchCharacter(function(p13) -- Line: 81
                    -- upvalues: Players (ref), KnitClient (ref), MatchState (ref), Flamework (ref), AbilityId (ref), u7 (ref), AbilityMeta (ref)
                    local v14;

                    if p13 == Players.LocalPlayer then
                        v14 = KnitClient.Controllers.MatchController:getMatchState() == MatchState.RUNNING;
                    else
                        v14 = false;
                    end;

                    if v14 then
                        local v15 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbilities()[AbilityId.ENABLE_LIFE_FORCE_ATTACK] ~= nil;
                        v14 = not v15;
                    end;

                    if v14 then
                        u7.logger:Debug("Resetting player abilities.");
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(AbilityId.DISABLE_LIFE_FORCE_ATTACK);
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.ENABLE_LIFE_FORCE_ATTACK, AbilityMeta[AbilityId.ENABLE_LIFE_FORCE_ATTACK].triggerConfig);
                    end;
                end));
            end);
        end;
    end));
end;

function u3.onKitLocalDeactivated(p16) -- Line: 98
end;

function u3.onKitReplicationActivated(u17, p18) -- Line: 100
    -- upvalues: ClientSyncEvents (copy), AbilityId (copy)
    p18:GiveTask(ClientSyncEvents.AbilityUsed:connect(function(p19) -- Line: 101
        -- upvalues: AbilityId (ref), u17 (copy)
        if p19:isCancelled() then
            return nil;
        end;

        if p19.ability == AbilityId.ENABLE_LIFE_FORCE_ATTACK then
            u17:addEmpowerParticles(p19.userCharacter);

            return;
        end;

        if p19.ability == AbilityId.DISABLE_LIFE_FORCE_ATTACK then
            local v20 = u17.empowerMaid[p19.userCharacter];

            if v20 ~= nil then
                v20:DoCleaning();
            end;
        end;
    end));
end;

function u3.onKitReplicationDeactivated(p21) -- Line: 117
end;

function u3.onInnateAbilityEnabled(p22, p23, p24) -- Line: 119
end;

function u3.onAbilityUsed(p25, p26, p27) -- Line: 121
end;

function u3.hasHealthToFireProjectile(p28, p29) -- Line: 123
    -- upvalues: NazarKitBalance (copy), ArmorUtil (copy), Players (copy), EntityUtil (copy)
    local v30 = NazarKitBalance.HEALTH_TAKEN_BY_PROJECTILE[p29];

    if not v30 then
        return true;
    end;

    local v31 = ArmorUtil.calculateDamageAfterArmor(Players.LocalPlayer, v30.damage, v30.armorMult);
    local v32 = EntityUtil:getEntity(Players.LocalPlayer);

    if v32 ~= nil then
        v32 = v32:getHealth();
    end;

    return v31 < (v32 == nil and 0 or v32);
end;

function u3.addEmpowerParticles(p33, u34) -- Line: 141
    -- upvalues: ReplicatedStorage (copy), MapUtil (copy), u1 (copy)
    local v35 = ReplicatedStorage.Assets.Effects.Empower:Clone():GetChildren();
    local v36 = ReplicatedStorage.Assets.Effects.Empower:Clone():GetChildren();
    local u37 = MapUtil.getOrCreate(p33.empowerMaid, u34, u1.new());

    local function _(p38) -- Line: 145
        -- upvalues: u34 (copy), u37 (copy)
        p38.Parent = u34.LeftHand;
        u37:GiveTask(p38);
    end;

    for i, v in v35 do
        local _ = i - 1;
        v.Parent = u34.LeftHand;
        u37:GiveTask(v);
    end;

    local function _(p39) -- Line: 152
        -- upvalues: u34 (copy), u37 (copy)
        p39.Parent = u34.RightHand;
        u37:GiveTask(p39);
    end;

    for i, v in v36 do
        local _ = i - 1;
        v.Parent = u34.RightHand;
        u37:GiveTask(v);
    end;
end;

KnitClient.CreateController(u3.new());

return nil;
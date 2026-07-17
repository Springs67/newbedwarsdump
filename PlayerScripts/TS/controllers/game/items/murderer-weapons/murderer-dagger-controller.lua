-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local DeviceUtil = v1.DeviceUtil;
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "color-util").ColorUtil;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local Signal = v2.Signal;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local v5 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v5.InteractionCategory;
local InteractionPriority = v5.InteractionPriority;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game-knit-controller").GameKnitController;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 36, Name: __tostring
        return "MurdererDaggerController";
    end,

    __index = GameKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 42
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 46
    -- upvalues: GameKnitController (copy), GameType (copy), u3 (copy)
    GameKnitController.constructor(p8, { GameType.MURDERER_GAME });
    p8.maid = u3.new();
    p8.Name = "MurdererDaggerController";
    p8.registered = false;
    p8.promptCount = 0;
end;

function u6.KnitStart(p9) -- Line: 53
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p9);
end;

function u6.onGameInit(u10) -- Line: 56
    -- upvalues: KnitClient (copy), AnimationType (copy), GameType (copy), default (copy), Players (copy), Flamework (copy), CooldownId (copy), ClientSyncEvents (copy), ColorUtil (copy), MatchState (copy), AbilityId (copy), BedwarsImageId (copy), AbilityState (copy), KnitClient2 (copy), EntityUtil (copy), ItemUtil (copy), ItemType (copy), WeldUtil (copy)
    KnitClient.Controllers.PreloadController:runPreload({
        animations = { AnimationType.TWIRLBLADE_ATTACK_1 },
        loadOnGameTypes = { GameType.MURDERER_GAME }
    });
    default.Client:Get("MurdererKillsTarget"):Connect(function(p11) -- Line: 61
        -- upvalues: Players (ref), Flamework (ref), CooldownId (ref), u10 (copy)
        if p11.killer == Players.LocalPlayer then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.MURDERER_KILL, p11.cooldown);
            u10:disableDaggerPrompt();
        end;
    end);
    ClientSyncEvents.CooldownExpired:connect(function(p12) -- Line: 67
        -- upvalues: CooldownId (ref), u10 (copy)
        if p12.cooldownId == CooldownId.MURDERER_KILL then
            u10:enableDaggerPrompt();
        end;
    end);
    u10.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(CooldownId.MURDERER_KILL, {
        title = {
            text = "KILL COOLDOWN",
            color = ColorUtil.WHITE
        }
    }));
    ClientSyncEvents.MatchStateChange:connect(function(p13) -- Line: 78
        -- upvalues: Players (ref), MatchState (ref), u10 (copy), Flamework (ref), AbilityId (ref), BedwarsImageId (ref), AbilityState (ref)
        local v14 = Players.LocalPlayer:GetAttribute("IsMurderer");

        if v14 == 0 or (v14 ~= v14 or (v14 == "" or not v14)) then
            return nil;
        end;

        if p13.matchState == MatchState.RUNNING then
            task.wait(1);
            u10:initDaggerPrompt();
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.MURDERER_DAGGER_KILL, {
                abilityType = "ItemPrimary",
                abilityButton = {
                    icon = BedwarsImageId.KILL_ABILITY_ICON
                }
            }):expect();
            u10.enabledAbility = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.MURDERER_DAGGER_KILL);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u10.enabledAbility, AbilityState.DISABLED);
        end;
    end);
    default.Client:Get("EntityDeathEvent"):Connect(function(p15) -- Line: 96
        -- upvalues: Players (ref), KnitClient2 (ref)
        local v16 = Players:GetPlayerFromCharacter(p15.entityInstance);
        local v17;

        if v16 == nil then
            v17 = v16;
        else
            v17 = v16.Character;
        end;

        if v17 then
            KnitClient2.Controllers.InteractionRegistryController:removePrompt(v16.Character, "Civilian");
        end;
    end);
    default.Client:Get("TweenTeleport"):Connect(function(p18) -- Line: 106
        -- upvalues: AnimationType (ref), EntityUtil (ref), ItemUtil (ref), ItemType (ref), WeldUtil (ref)
        if p18.animation == AnimationType.TWIRLBLADE_ATTACK_1 then
            local Character = p18.player.Character;

            if not Character then
                return nil;
            end;

            local v19 = EntityUtil:getEntity(p18.player);
            local v20;

            if v19 == nil then
                v20 = v19;
            else
                v20 = v19:getHandItemInstanceFromCharacter();

                if v20 ~= nil then
                    v20 = v20:WaitForChild("Handle", 3);
                end;
            end;

            if v20 then
                v20.Transparency = 1;
            end;

            local v21 = ItemUtil.createItemInstance(ItemType.SPIRIT_DAGGER, 1);

            if v19 ~= nil then
                local v22 = v19:getHumanoid();

                if v22 ~= nil then
                    v22:AddAccessory(v21);
                end;
            end;

            WeldUtil:weldCharacterAccessories(Character);
            task.wait(0.5);
            v21:Destroy();

            if v20 then
                v20.Transparency = 0;
            end;
        end;
    end);
    KnitClient.Controllers.InteractionRegistryController.onPromptCreated:Connect(function(p23, p24) -- Line: 141
        -- upvalues: Flamework (ref), CooldownId (ref), u10 (copy), AbilityState (ref)
        if p24 ~= "Civilian" then
            return nil;
        end;

        local u25 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(CooldownId.MURDERER_KILL);
        p23.PromptShown:Connect(function() -- Line: 146
            -- upvalues: u10 (ref), u25 (copy), Flamework (ref), AbilityState (ref)
            local v26 = u10;
            v26.promptCount = v26.promptCount + 1;

            if u10.promptCount > 0 then
                if u25 > 0.1 then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u10.enabledAbility, AbilityState.ON_COOLDOWN);

                    return;
                end;

                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u10.enabledAbility, AbilityState.READY);
            end;
        end);
        p23.PromptHidden:Connect(function() -- Line: 156
            -- upvalues: u10 (ref), Flamework (ref), AbilityState (ref), u25 (copy)
            local v27 = u10;
            v27.promptCount = v27.promptCount - 1;

            if u10.promptCount == 0 then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u10.enabledAbility, AbilityState.DISABLED);

                if u25 > 0.1 then
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(u10.enabledAbility, AbilityState.ON_COOLDOWN);
                end;
            end;
        end);
    end);
end;

function u6.initDaggerPrompt(p28) -- Line: 167
    -- upvalues: Signal (copy), KnitClient (copy), DeviceUtil (copy), InteractionPriority (copy), InteractionCategory (copy), Players (copy), EntityUtil (copy), default (copy)
    local v29 = Signal.new();
    KnitClient.Controllers.InteractionRegistryController:RegisterInteraction({
        interactionLabel = "Kill!",
        interactionObjectText = "Execute",
        interactionTag = "Civilian",
        instantActivation = true,
        maxActivationDistance = 20,
        removePromptOnInteract = true,
        clickablePrompt = DeviceUtil.isMobileControls(),
        priority = InteractionPriority.ABILITY,
        category = InteractionCategory.ABILITY,
        KeyCode = Enum.KeyCode.R,

        onInteracted = function(p30, p31, p32) -- Line: 180, Name: onInteracted
            -- upvalues: Players (ref), EntityUtil (ref), default (ref)
            if not p31:IsA("Model") then
                return nil;
            end;

            local v33 = Players:GetPlayerFromCharacter(p31);

            if not v33 then
                return nil;
            end;

            local v34 = EntityUtil:getEntity(v33);

            if v34 ~= nil then
                v34 = v34:isDead();
            end;

            if v34 then
                return nil;
            end;

            default.Client:Get("MurderDaggerKill"):CallServer({
                target = v33
            });
        end,

        onVisibilityStateChanged = v29
    });
end;

function u6.enableDaggerPrompt(p35) -- Line: 203
    -- upvalues: Players (copy), CollectionService (copy)
    for _, v in Players:GetPlayers() do
        local v36 = v:GetAttribute("IsMurderer");

        if v36 == 0 or (v36 ~= v36 or (v36 == "" or not v36)) then
            CollectionService:AddTag(v.Character, "Civilian");
        end;
    end;
end;

function u6.disableDaggerPrompt(p37) -- Line: 211
    -- upvalues: Players (copy), KnitClient2 (copy)
    for _, v in Players:GetPlayers() do
        KnitClient2.Controllers.InteractionRegistryController:removePrompt(v.Character, "Civilian");
    end;
end;

KnitClient.CreateController(u6.new());

return nil;
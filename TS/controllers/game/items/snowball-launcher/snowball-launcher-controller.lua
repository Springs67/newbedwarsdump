-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local VignetteType = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "effect", "vignette", "vignette-meta").VignetteType;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "snowball-launcher", "snowball-launcher-util");
local SnowballLauncherMode = v4.SnowballLauncherMode;
local SnowballLauncherUtil = v4.SnowballLauncherUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local SnowballLauncherProgressBar = RuntimeLib.import(script, script.Parent, "snowball-launcher-progress-bar").SnowballLauncherProgressBar;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "SnowballLauncherController";
    end,

    __index = HandKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 37
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 41
    -- upvalues: HandKnitController (copy), u1 (copy), getItemMeta (copy), ItemType (copy)
    HandKnitController.constructor(p7);
    p7.Name = "SnowballLauncherController";
    p7.abilityMaid = u1.new();
    p7.abilityIcon = getItemMeta(ItemType.SNOWBALL_LAUNCHER).image;
    p7.frostedMaids = {};
    p7.frozenMaids = {};
end;

function u5.KnitStart(u8) -- Line: 49
    -- upvalues: HandKnitController (copy), KnitClient (copy), ItemType (copy), GameSound (copy), ClientSyncEvents (copy), StatusEffectType (copy), EntityUtil (copy), Players (copy), StatusEffectUtil (copy), AbilityId (copy), SoundManager (copy), u2 (copy), SnowballLauncherProgressBar (copy), SnowballLauncherUtil (copy)
    HandKnitController.KnitStart(u8);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.SNOWBALL_LAUNCHER, {
        sounds = {
            GameSound.SNOWBALL_LAUNCHER_SINGLE_SHOT_1,
            GameSound.SNOWBALL_LAUNCHER_SINGLE_SHOT_2,
            GameSound.SNOWBALL_LAUNCHER_SINGLE_SHOT_3,
            GameSound.SNOWBALL_LAUNCHER_SINGLE_SHOT_4,
            GameSound.SNOWBALL_LAUNCHER_POWER_SHOT,
            GameSound.SNOWBALL_LAUNCHER_SPREAD_SHOT,
            GameSound.SNOWBALL_LAUNCHER_RAPID_SHOT,
            GameSound.SNOWBALL_LAUNCHER_CHARGE_UP,
            GameSound.SNOWBALL_LAUNCHER_SWITCH_MODE
        }
    });
    ClientSyncEvents.StatusEffectAdded:connect(function(p9) -- Line: 55
        -- upvalues: StatusEffectType (ref), EntityUtil (ref), u8 (copy)
        if p9.statusEffect ~= StatusEffectType.FROZEN then
            return nil;
        end;

        local v10 = EntityUtil:getPlayerFromEntityInstance(p9.entityInstance);
        u8.frozenMaids[p9.entityInstance] = u8:setFrozenEffects(p9.entityInstance, v10);
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p11) -- Line: 65
        -- upvalues: StatusEffectType (ref), u8 (copy)
        if p11.statusEffect ~= StatusEffectType.FROZEN then
            return nil;
        end;

        u8:removeFrozenEffects(p11.entityInstance);
    end);
    ClientSyncEvents.StatusEffectAdded:connect(function(p12) -- Line: 72
        -- upvalues: StatusEffectType (ref), EntityUtil (ref), Players (ref), u8 (copy), KnitClient (ref)
        if p12.statusEffect ~= StatusEffectType.FROSTED then
            return nil;
        end;

        local v13 = EntityUtil:getPlayerFromEntityInstance(p12.entityInstance);

        if Players.LocalPlayer == v13 then
            u8.speedMaid = KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                blockSprint = false,
                moveSpeedMultiplier = 0.5
            });
        end;

        u8:setFrostedEffects(p12.entityInstance, v13);
    end);
    ClientSyncEvents.BeginProjectileTargeting:connect(function(p14) -- Line: 88
        -- upvalues: ItemType (ref), EntityUtil (ref), Players (ref), StatusEffectUtil (ref), StatusEffectType (ref)
        if p14.handItem.itemType == ItemType.TELEPEARL then
            local v15 = EntityUtil:getEntity(Players.LocalPlayer);

            if v15 ~= nil then
                v15 = v15:getInstance();
            end;

            if v15 and StatusEffectUtil:isActive(v15, StatusEffectType.FROSTED) then
                p14:setCancelled(true);
            end;
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p16) -- Line: 100
        -- upvalues: StatusEffectType (ref), EntityUtil (ref), Players (ref), u8 (copy)
        if p16.statusEffect ~= StatusEffectType.FROSTED then
            return nil;
        end;

        if EntityUtil:getPlayerFromEntityInstance(p16.entityInstance) == Players.LocalPlayer and u8.speedMaid then
            u8.speedMaid:Destroy();
            u8.speedMaid = nil;
        end;

        u8:removeFrostedEffects(p16.entityInstance);
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p17) -- Line: 114
        -- upvalues: AbilityId (ref), Players (ref), SoundManager (ref), GameSound (ref), u8 (copy), u2 (ref), SnowballLauncherProgressBar (ref), SnowballLauncherUtil (ref)
        if p17.ability ~= AbilityId.SNOWBALL_LAUNCHER_CYCLE then
            return nil;
        end;

        if p17.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        SoundManager:playSound(GameSound.SNOWBALL_LAUNCHER_SWITCH_MODE);
        task.spawn(function() -- Line: 122
            -- upvalues: u8 (ref), u2 (ref), SnowballLauncherProgressBar (ref), SnowballLauncherUtil (ref), Players (ref)
            if u8.tree then
                u2.unmount(u8.tree);
            end;

            u8.tree = u2.mount(u2.createElement("ScreenGui", {}, { u2.createElement(SnowballLauncherProgressBar, {
                    noBar = true,
                    chargeTime = 1,
                    title = SnowballLauncherUtil.getTitle(Players.LocalPlayer:GetAttribute("SnowballLauncherCycle"))
                }) }), Players.LocalPlayer:WaitForChild("PlayerGui"), "ChargeSnowballLauncher");
        end);
    end);
end;

function u5.isRelevantItem(p18, p19) -- Line: 136
    -- upvalues: ItemType (copy)
    return p19.itemType == ItemType.SNOWBALL_LAUNCHER;
end;

function u5.onEnable(p20, p21, p22) -- Line: 139
    -- upvalues: Players (copy), SnowballLauncherMode (copy)
    Players.LocalPlayer:SetAttribute("SnowballLauncherCycle", SnowballLauncherMode.POWER);
    p20:mountCycleAbility();
end;

function u5.onDisable(p23) -- Line: 143
    p23:unmountAbility();
end;

function u5.mountCycleAbility(p24) -- Line: 146
    -- upvalues: Flamework (copy), AbilityId (copy)
    local v25 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
    local SNOWBALL_LAUNCHER_CYCLE = AbilityId.SNOWBALL_LAUNCHER_CYCLE;
    local v26 = {};
    local v27 = {};
    local abilityIcon = p24.abilityIcon;
    v27.icon = abilityIcon == nil and "" or abilityIcon;
    v26.abilityButton = v27;
    v26.abilityType = "ItemPrimary";
    local u28 = v25:enableAbility(SNOWBALL_LAUNCHER_CYCLE, v26):expect();
    p24.abilityMaid:GiveTask(function() -- Line: 161
        -- upvalues: u28 (copy)
        u28.Destroy();
    end);
end;

function u5.unmountAbility(p29) -- Line: 165
    p29.abilityMaid:DoCleaning();
end;

function u5.removeFrozenEffects(p30, p31) -- Line: 168
    local v32 = p30.frozenMaids[p31];

    if v32 ~= nil then
        v32:DoCleaning();
    end;
end;

function u5.setFrozenEffects(p33, p34, p35) -- Line: 176
    -- upvalues: u1 (copy), Players (copy), KnitClient (copy), VignetteType (copy)
    local v36 = u1.new();

    if p35 == Players.LocalPlayer then
        KnitClient.Controllers.VignetteController:createVignette(VignetteType.ICE);
        v36:GiveTask(function() -- Line: 180
            -- upvalues: KnitClient (ref), VignetteType (ref)
            KnitClient.Controllers.VignetteController:destroyVignette(VignetteType.ICE);
        end);
    end;

    return v36;
end;

function u5.removeFrostedEffects(p37, p38) -- Line: 186
    local v39 = p37.frostedMaids[p38];

    if v39 then
        v39:DoCleaning();
        p37.frostedMaids[p38] = nil;
    end;
end;

function u5.setFrostedEffects(p40, u41, p42, p43) -- Line: 197
    -- upvalues: u1 (copy), ReplicatedStorage (copy), Workspace (copy), CollectionService (copy), Players (copy), KnitClient (copy), VignetteType (copy)
    local u44 = u1.new();

    if p40.frostedMaids[u41] ~= nil then
        return u44;
    end;

    local v45 = ReplicatedStorage.Assets.Effects.FrostedEffect:Clone();
    v45.Parent = Workspace;

    local function _(p46) -- Line: 207
        -- upvalues: u41 (copy), u44 (copy), CollectionService (ref)
        p46.Parent = u41.UpperTorso;
        u44:GiveTask(p46);
        CollectionService:AddTag(p46, "FirstPersonHidden");
        p46:SetAttribute("FirstPersonVisible", false);
    end;

    for i, child in v45:GetChildren() do
        local _ = i - 1;
        child.Parent = u41.UpperTorso;
        u44:GiveTask(child);
        CollectionService:AddTag(child, "FirstPersonHidden");
        child:SetAttribute("FirstPersonVisible", false);
    end;

    if p42 == Players.LocalPlayer then
        KnitClient.Controllers.VignetteController:createVignette(VignetteType.FROSTED, {
            transparencyMultiplier = p43
        });
        u44:GiveTask(function() -- Line: 220
            -- upvalues: KnitClient (ref), VignetteType (ref)
            KnitClient.Controllers.VignetteController:destroyVignette(VignetteType.FROSTED);
        end);
    end;

    p40.frostedMaids[u41] = u44;

    return u44;
end;

KnitClient.CreateController(u5.new());

return nil;
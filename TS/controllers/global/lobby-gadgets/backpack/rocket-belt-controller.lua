-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "RocketBeltController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 33
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 37
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p6);
    p6.Name = "RocketBeltController";
    p6.rocketMaid = u2.new();
end;

function u4.isRelevantItem(p7, p8) -- Line: 42
    -- upvalues: ItemType (copy)
    return p8.itemType == ItemType.ROCKET_BELT;
end;

function u4.equip(u9) -- Line: 45
    -- upvalues: SoundManager (copy), GameSound (copy), Flamework (copy), AbilityId (copy), getItemMeta (copy), ItemType (copy)
    SoundManager:playSound(GameSound.EQUIP_JET_PACK);
    local u10 = true;
    u9.rocketMaid:GiveTask(function() -- Line: 48
        -- upvalues: u10 (ref)
        u10 = false;

        return u10;
    end);
    task.spawn(function() -- Line: 52
        -- upvalues: Flamework (ref), AbilityId (ref), getItemMeta (ref), ItemType (ref), u10 (ref), u9 (copy)
        local v11 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
        local ROCKET_BELT = AbilityId.ROCKET_BELT;
        local v12 = {};
        local v13 = {};
        local image = getItemMeta(ItemType.ROCKET_BELT).image;
        v13.icon = image == nil and "" or image;
        v12.abilityButton = v13;
        v12.abilityType = "MiscPrimary";
        local v14 = v11:enableAbility(ROCKET_BELT, v12):expect();

        if u10 then
            u9.rocketMaid:GiveTask(v14);

            return;
        end;

        v14.Destroy();
    end);
end;

function u4.unequip(p15) -- Line: 74
    p15.rocketMaid:DoCleaning();
end;

function u4.KnitStart(u16) -- Line: 77
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), AbilityId (copy), Players (copy), InventoryUtil (copy), ItemType (copy), default (copy), CooldownId (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(u16);
    ClientSyncEvents.AbilityUsed:connect(function(p17) -- Line: 79
        -- upvalues: AbilityId (ref), Players (ref), InventoryUtil (ref), ItemType (ref), default (ref)
        local v18;

        if p17.ability == AbilityId.ROCKET_BELT then
            v18 = p17.userCharacter == Players.LocalPlayer.Character;
        else
            v18 = false;
        end;

        if v18 then
            local backpack = InventoryUtil.getInventory(Players.LocalPlayer).backpack;

            if backpack ~= nil then
                backpack = backpack.itemType;
            end;

            v18 = backpack == ItemType.ROCKET_BELT;
        end;

        if v18 then
            default.Client:Get("RocktBeltUsed"):SendToServer({
                player = Players.LocalPlayer
            });
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;
            end;

            local AssemblyMass = Character.AssemblyMass;
            local Character2 = Players.LocalPlayer.Character;

            if Character2 ~= nil then
                Character2 = Character2:FindFirstChild("Humanoid");
            end;

            local Character3 = Players.LocalPlayer.Character;

            if Character3 ~= nil then
                Character3 = Character3:GetPrimaryPartCFrame().LookVector * 100;
            end;

            if Character ~= nil then
                Character:ApplyImpulse((Vector3.new(0, 65, 0) + Character3) * (AssemblyMass * 1.2));
            end;
        end;
    end);
    ClientSyncEvents.CooldownExpired:connect(function(p19) -- Line: 116
        -- upvalues: CooldownId (ref), InventoryUtil (ref), Players (ref), ItemType (ref), SoundManager (ref), GameSound (ref)
        local v20 = p19.cooldownId == CooldownId.ROCKET_BELT;

        if v20 then
            local backpack = InventoryUtil.getInventory(Players.LocalPlayer).backpack;

            if backpack ~= nil then
                backpack = backpack.itemType;
            end;

            v20 = backpack == ItemType.ROCKET_BELT;
        end;

        if v20 then
            SoundManager:playSound(GameSound.JETPACK_COOLDOWN_READY);
        end;
    end);
    default.Client:Get("RocketBeltLaunch"):Connect(function(p21) -- Line: 129
        -- upvalues: u16 (copy)
        u16:playEffect(p21.player);
    end);
    ClientSyncEvents.BackpackEquipEvent:connect(function(p22) -- Line: 132
        -- upvalues: Players (ref), ItemType (ref), u16 (copy)
        if p22.player == Players.LocalPlayer then
            if p22.item == ItemType.ROCKET_BELT then
                u16:equip();

                return;
            end;

            u16:unequip();
        end;
    end);
end;

function u4.playEffect(p23, p24) -- Line: 142
    -- upvalues: EntityUtil (copy), ItemType (copy)
    EntityUtil:getEntity(p24);
    local Character = p24.Character;

    if Character ~= nil then
        Character = Character:WaitForChild(ItemType.ROCKET_BELT);
    end;

    local v25;

    if Character == nil then
        v25 = Character;
    else
        v25 = Character.Name;
    end;

    if v25 ~= ItemType.ROCKET_BELT then
        return nil;
    end;

    local Effect = Character:WaitForChild("Handle"):WaitForChild("LeftEffectAttachment"):WaitForChild("Effect");
    local Effect2 = Character:WaitForChild("Handle"):WaitForChild("RightEffectAttachment"):WaitForChild("Effect");

    if not (Effect and Effect2) then
        return nil;
    end;

    Effect.Enabled = true;
    Effect2.Enabled = true;
    local Character2 = p24.Character;

    if Character2 ~= nil then
        Character2 = Character2:GetPrimaryPartCFrame().Position;
    end;

    p23:playLaunchEffect(Character2);
    task.delay(0.5, function() -- Line: 169
        -- upvalues: Effect (copy), Effect2 (copy)
        if Effect then
            Effect.Enabled = false;
        end;

        if Effect2 then
            Effect2.Enabled = false;
        end;
    end);
end;

function u4.playLaunchEffect(p26, p27) -- Line: 178
    -- upvalues: SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy), GameQueryUtil (copy)
    if not p27 then
        return nil;
    end;

    SoundManager:playSound(GameSound.JETPACK_LAUNCH, {
        rollOffMaxDistance = 45,
        volumeMultiplier = 0.5,
        position = p27
    });
    local u28 = ReplicatedStorage.Assets.Effects.RocketLaunchEffect:Clone();
    u28:PivotTo(CFrame.new(p27 - Vector3.new(0, 2, 0)));
    u28.Parent = Workspace;
    GameQueryUtil:setQueryIgnored(u28, true);
    task.delay(0.5, function() -- Line: 194
        -- upvalues: u28 (copy)
        u28:Destroy();
    end);
end;

KnitClient.CreateController(u4.new());

return nil;
-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local Workspace = v5.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local InvisibleCloakEnergyComponent = RuntimeLib.import(script, script.Parent, "ui", "invisible-cloak-energy-component").InvisibleCloakEnergyComponent;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "InvisibleCloakController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 34
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 38
    -- upvalues: KnitController (copy), u2 (copy)
    KnitController.constructor(p8);
    p8.Name = "InvisibleCloakController";
    p8.playerMaid = {};
    p8.partialInvisibility = {
        transparency = 0.9
    };
    p8.fullInvisibility = {
        transparency = 1
    };
    p8.uiMaid = u2.new();
end;

function u6.KnitStart(u9) -- Line: 50
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ItemType (copy), Players (copy), default (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), EntityUtil (copy)
    KnitController.KnitStart(u9);
    ClientSyncEvents.BackpackEquipEvent:connect(function(p10) -- Line: 52
        -- upvalues: ItemType (ref), u9 (copy), Players (ref)
        if p10.item == ItemType.INVISIBLE_CLOAK then
            u9:equip(p10.player);
        else
            u9:unequip(p10.player);
        end;

        if p10.player == Players.LocalPlayer then
            if p10.item == ItemType.INVISIBLE_CLOAK then
                u9:onEquip(p10.backpack);

                return;
            end;

            u9:cleanUp();
        end;
    end);
    default.Client:Get("InvisibleCloakState"):Connect(function(p11) -- Line: 66
        -- upvalues: Players (ref), KnitClient (ref), u9 (copy), SoundManager (ref), GameSound (ref), EntityUtil (ref)
        local Character = p11.player.Character;

        if not Character then
            return nil;
        end;

        if p11.active then
            if p11.player == Players.LocalPlayer then
                KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(Character):addModifier(u9.partialInvisibility);
                SoundManager:playSound(GameSound.INVISIBLE_CLOAK);
            else
                KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(Character):removeModifier(u9.partialInvisibility);
                KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(Character):addModifier(u9.fullInvisibility);
            end;

            local v12 = EntityUtil:getEntity(p11.player);

            if v12 ~= nil then
                v12 = v12:getInstance();
            end;

            if v12 then
                u9:playSmokePuff(v12);
            end;
        else
            KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(Character):removeModifier(u9.partialInvisibility);
            KnitClient.Controllers.CharacterTransparencyController:getTransparencyModifier(Character):removeModifier(u9.fullInvisibility);
        end;
    end);
end;

function u6.onEquip(p13, p14) -- Line: 93
    -- upvalues: ItemType (copy), Flamework (copy), u4 (copy), InvisibleCloakEnergyComponent (copy)
    if not p14 then
        return nil;
    end;

    if p14.itemType ~= ItemType.INVISIBLE_CLOAK then
        return nil;
    end;

    p13.uiMaid = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u4.createElement(InvisibleCloakEnergyComponent, {
        backpack = p14.tool
    }));
end;

function u6.cleanUp(p15) -- Line: 104
    p15.uiMaid:DoCleaning();
end;

function u6.equip(u16, u17) -- Line: 107
    -- upvalues: u2 (copy), ReplicatedStorage (copy), WeldUtil (copy)
    task.spawn(function() -- Line: 108
        -- upvalues: u17 (copy), u2 (ref), ReplicatedStorage (ref), WeldUtil (ref), u16 (copy)
        if not u17.Character then
            return nil;
        end;

        local v18 = u2.new();
        local v19 = ReplicatedStorage.Assets.Misc.CloakCape:Clone();
        local v20 = ReplicatedStorage.Assets.Misc.CloakHood:Clone();
        v18:GiveTask(v19);
        v18:GiveTask(v20);
        v19.Parent = u17.Character;
        v20.Parent = u17.Character;
        WeldUtil:weldAccessory(u17.Character, v19);
        WeldUtil:weldAccessory(u17.Character, v20);
        u16.playerMaid[u17.UserId] = v18;
    end);
end;

function u6.unequip(p21, p22) -- Line: 126
    local v23 = p21.playerMaid[p22.UserId];

    if v23 ~= nil then
        v23:DoCleaning();
    end;
end;

function u6.playSmokePuff(p24, p25) -- Line: 134
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), u3 (copy), GameQueryUtil (copy), EffectUtil (copy)
    local v26 = ReplicatedStorage.Assets.Effects.CloakSmokePuff:Clone();
    local v27 = {};
    local PrimaryPart = p25.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.CFrame;
    end;

    v27.CFrame = PrimaryPart;
    v27.Anchored = true;
    v27.CanQuery = false;
    v27.CanCollide = false;
    v27.Transparency = 1;
    v27.Parent = Workspace;
    local u28 = u3("Part", v27);
    GameQueryUtil:setQueryIgnored(u28, true);
    v26.Parent = u28;
    v26.Speed = NumberRange.new(5);
    EffectUtil:playEffects({ v26 }, p25);
    task.delay(5, function() -- Line: 153
        -- upvalues: u28 (copy)
        u28:Destroy();
    end);
end;

KnitClient.CreateController(u6.new());

return nil;
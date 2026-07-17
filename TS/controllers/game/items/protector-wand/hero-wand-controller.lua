-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local ItemUpgradeTierAttr = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").ItemUpgradeTierAttr;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local ProtectorWandConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "protector-wand", "protector-wand-constants").ProtectorWandConstants;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GetAttribute = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute;
local ProtectorWandController = RuntimeLib.import(script, script.Parent, "protector-wand-controller").ProtectorWandController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "HeroWandController";
    end,

    __index = ProtectorWandController
});
u2.__index = u2;

function u2.new(...) -- Line: 29
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 33
    -- upvalues: ProtectorWandController (copy), u1 (copy), ProtectorWandConstants (copy)
    ProtectorWandController.constructor(p4);
    p4.Name = "HeroWandController";
    p4.maid = u1.new();
    p4.targetIcon = ProtectorWandConstants.HERO_TARGET_ICON;
    p4.targetIconColor = ProtectorWandConstants.HERO_TARGET_COLOR;
    p4.targetIconSize = ProtectorWandConstants.HERO_TARGET_ICON_SIZE;
end;

function u2.KnitStart(u5) -- Line: 41
    -- upvalues: ProtectorWandController (copy), ClientSyncEvents (copy), MatchState (copy), default (copy), InventoryUtil (copy), Players (copy), GetAttribute (copy), ItemUpgradeTierAttr (copy), Flamework (copy), AbilityId (copy), BedwarsImageId (copy)
    ProtectorWandController.KnitStart(u5);
    ClientSyncEvents.MatchStateChange:connect(function(p6) -- Line: 43
        -- upvalues: MatchState (ref)
        if p6.matchState ~= MatchState.RUNNING then
            return nil;
        end;
    end);
    default.Client:OnEvent("ItemUpgraded", function(p7) -- Line: 49
        -- upvalues: InventoryUtil (ref), Players (ref), u5 (copy), GetAttribute (ref), ItemUpgradeTierAttr (ref), Flamework (ref), AbilityId (ref), BedwarsImageId (ref)
        local v8 = InventoryUtil.getToolFromInventory(Players.LocalPlayer, p7.item);

        if not v8 then
            return nil;
        end;

        if not u5:isRelevantItem(v8) then
            return nil;
        end;

        local v9 = u5:getHandItem();

        if not v9 then
            return nil;
        end;

        local v10 = GetAttribute(v8.tool, ItemUpgradeTierAttr);

        if v9.itemType == v8.itemType and v10 == 1 then
            u5.bubbleAbilityRef = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.HERO_WAND_BUBBLE, {
                abilityType = "ItemPrimary",
                abilityButton = {
                    icon = BedwarsImageId.WAND_BUBBLE
                }
            }):expect();
        end;
    end);
end;

function u2.isRelevantItem(p11, p12) -- Line: 75
    -- upvalues: ItemType (copy)
    return p12.itemType == ItemType.HERO_PROTECTOR_WAND;
end;

function u2.enableWand(u13, u14) -- Line: 78
    -- upvalues: GetAttribute (copy), ItemUpgradeTierAttr (copy), Flamework (copy), AbilityId (copy), BedwarsImageId (copy), ClientSyncEvents (copy), Players (copy), CooldownId (copy)
    u13:endAutoTargeting(u13.maid);

    if u13.healAbilityRef then
        u13.healAbilityRef.Destroy();
    end;

    if u13.bubbleAbilityRef then
        u13.bubbleAbilityRef.Destroy();
    end;

    local v15 = GetAttribute(u14.tool, ItemUpgradeTierAttr);
    u13:beginAutoTargeting(u13.maid, u14, u13.targetIcon, u13.targetIconColor, u13.targetIconSize);
    u13.healAbilityRef = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.HERO_WAND_HEAL, nil):expect();

    if v15 ~= 0 and (v15 == v15 and v15) then
        v15 = v15 >= 1;
    end;

    if v15 ~= 0 and (v15 == v15 and v15) then
        u13.bubbleAbilityRef = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.HERO_WAND_BUBBLE, {
            abilityType = "ItemPrimary",
            abilityButton = {
                icon = BedwarsImageId.WAND_BUBBLE
            }
        }):expect();
    end;

    u13.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "hero_wand_heal",

        boundFunction = function(p16, p17, p18) -- Line: 106, Name: boundFunction
            -- upvalues: Flamework (ref), AbilityId (ref)
            if p17 == Enum.UserInputState.Begin then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.HERO_WAND_HEAL);
            end;
        end
    }));
    u13.maid:GiveTask(ClientSyncEvents.AbilityUsed:connect(function(p19) -- Line: 113
        -- upvalues: Players (ref), u13 (copy), u14 (copy), AbilityId (ref), CooldownId (ref)
        if p19.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        if not u13:isRelevantItem(u14) then
            return nil;
        end;

        if p19.ability == AbilityId.HERO_WAND_HEAL then
            u13:castToTarget(u14, p19.ability, u13.randomCastingSound, CooldownId.HERO_WAND_HEAL, 5, u13.targetIconColor);
        end;

        if p19.ability == AbilityId.HERO_WAND_BUBBLE then
            u13:castToTarget(u14, p19.ability, u13.randomCastingSound);
        end;
    end));
end;

function u2.onEnable(p20, p21, p22) -- Line: 128
    p20:enableWand(p21);
    p20:setUpAnimations();
end;

function u2.onDisable(p23) -- Line: 132
    if p23.healAbilityRef then
        p23.healAbilityRef.Destroy();
    end;

    if p23.bubbleAbilityRef then
        p23.bubbleAbilityRef.Destroy();
    end;

    p23:endAutoTargeting(p23.maid);
    p23:cleanUpAnimations();
end;

KnitClient.CreateController(u2.new());

return nil;
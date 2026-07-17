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
        return "VillainWandController";
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
    p4.Name = "VillainWandController";
    p4.maid = u1.new();
    p4.targetIcon = ProtectorWandConstants.VILLAIN_TARGET_ICON;
    p4.targetIconColor = ProtectorWandConstants.VILLAIN_TARGET_COLOR;
    p4.targetIconSize = ProtectorWandConstants.VILLAIN_TARGET_ICON_SIZE;
end;

function u2.KnitStart(u5) -- Line: 41
    -- upvalues: ProtectorWandController (copy), ClientSyncEvents (copy), MatchState (copy), default (copy), InventoryUtil (copy), Players (copy), GetAttribute (copy), ItemUpgradeTierAttr (copy), Flamework (copy), AbilityId (copy), BedwarsImageId (copy), KnitClient (copy)
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
            u5.bubbleAbilityRef = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.VILLAIN_WAND_BUBBLE, {
                abilityType = "ItemPrimary",
                abilityButton = {
                    icon = BedwarsImageId.WAND_BUBBLE
                }
            }):expect();
        end;
    end);
    KnitClient.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p11) -- Line: 74
        -- upvalues: u5 (copy)
        local v12 = u5:getHandItem();

        if not v12 then
            return nil;
        end;

        if not u5:isRelevantItem(v12) then
            return nil;
        end;

        u5:enableWand(v12);
    end);
end;

function u2.isRelevantItem(p13, p14) -- Line: 85
    -- upvalues: ItemType (copy)
    return p14.itemType == ItemType.VILLAIN_PROTECTOR_WAND;
end;

function u2.enableWand(u15, u16) -- Line: 88
    -- upvalues: GetAttribute (copy), ItemUpgradeTierAttr (copy), Flamework (copy), AbilityId (copy), BedwarsImageId (copy), ClientSyncEvents (copy), Players (copy), CooldownId (copy)
    u15:endAutoTargeting(u15.maid);

    if u15.healAbilityRef then
        u15.healAbilityRef.Destroy();
    end;

    if u15.bubbleAbilityRef then
        u15.bubbleAbilityRef.Destroy();
    end;

    local v17 = GetAttribute(u16.tool, ItemUpgradeTierAttr);
    u15:beginAutoTargeting(u15.maid, u16, u15.targetIcon, u15.targetIconColor, u15.targetIconSize);
    u15.healAbilityRef = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.VILLAIN_WAND_HEAL, nil):expect();

    if v17 ~= 0 and (v17 == v17 and v17) then
        v17 = v17 >= 1;
    end;

    if v17 ~= 0 and (v17 == v17 and v17) then
        u15.bubbleAbilityRef = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.VILLAIN_WAND_BUBBLE, {
            abilityType = "ItemPrimary",
            abilityButton = {
                icon = BedwarsImageId.WAND_BUBBLE
            }
        }):expect();
    end;

    u15.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "villain_wand_heal",

        boundFunction = function(p18, p19, p20) -- Line: 116, Name: boundFunction
            -- upvalues: Flamework (ref), AbilityId (ref)
            if p19 == Enum.UserInputState.Begin then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(AbilityId.VILLAIN_WAND_HEAL);
            end;
        end
    }));
    u15.maid:GiveTask(ClientSyncEvents.AbilityUsed:connect(function(p21) -- Line: 123
        -- upvalues: Players (ref), u15 (copy), u16 (copy), AbilityId (ref), CooldownId (ref)
        if p21.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        if not u15:isRelevantItem(u16) then
            return nil;
        end;

        if p21.ability == AbilityId.VILLAIN_WAND_HEAL then
            u15:castToTarget(u16, p21.ability, u15.randomCastingSound, CooldownId.VILLAIN_WAND_HEAL, 5, u15.targetIconColor);
        end;

        if p21.ability == AbilityId.VILLAIN_WAND_BUBBLE then
            u15:castToTarget(u16, p21.ability, u15.randomCastingSound);
        end;
    end));
end;

function u2.onEnable(p22, p23, p24) -- Line: 138
    p22:enableWand(p23);
    p22:setUpAnimations();
end;

function u2.onDisable(p25) -- Line: 142
    if p25.healAbilityRef then
        p25.healAbilityRef.Destroy();
    end;

    if p25.bubbleAbilityRef then
        p25.bubbleAbilityRef.Destroy();
    end;

    p25:endAutoTargeting(p25.maid);
    p25:cleanUpAnimations();
end;

KnitClient.CreateController(u2.new());

return nil;
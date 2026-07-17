-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AbilityState = v1.AbilityState;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "alchemist", "alchemist-flask-stage");
local ALCHEMIST_FLASK_BREW_SEQ_ATTR = v4.ALCHEMIST_FLASK_BREW_SEQ_ATTR;
local ALCHEMIST_FLASK_STAGE_ATTR = v4.ALCHEMIST_FLASK_STAGE_ATTR;
local countStagedIngredient = v4.countStagedIngredient;
local parseAlchemistFlaskStage = v4.parseAlchemistFlaskStage;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local AlchemistRecipeSidebar = RuntimeLib.import(script, script.Parent, "ui", "alchemist-recipe-sidebar").AlchemistRecipeSidebar;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 28, Name: __tostring
        return "AlchemistFlaskController";
    end,

    __index = HandKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 34
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 38
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p7);
    p7.Name = "AlchemistFlaskController";
    p7.maid = u2.new();
end;

function u5.KnitStart(p8) -- Line: 43
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p8);
end;

function u5.isRelevantItem(p9, p10) -- Line: 46
    -- upvalues: ItemType (copy)
    return p10.itemType == ItemType.ALCHEMIST_FLASK and true or p10.tool.Name == ItemType.ALCHEMIST_FLASK;
end;

function u5.onEnable(u11, p12, p13) -- Line: 49
    -- upvalues: Players (copy), parseAlchemistFlaskStage (copy), ALCHEMIST_FLASK_STAGE_ATTR (copy), ALCHEMIST_FLASK_BREW_SEQ_ATTR (copy), InventoryUtil (copy), ItemType (copy), SoundManager (copy), GameSound (copy), u3 (copy), AlchemistRecipeSidebar (copy), ClientSyncEvents (copy), getItemMeta (copy), Flamework (copy), AbilityId (copy), AbilityState (copy), countStagedIngredient (copy)
    u11:setupYield(function() -- Line: 50
        -- upvalues: Players (ref), parseAlchemistFlaskStage (ref), ALCHEMIST_FLASK_STAGE_ATTR (ref), ALCHEMIST_FLASK_BREW_SEQ_ATTR (ref), InventoryUtil (ref), ItemType (ref), SoundManager (ref), GameSound (ref), u3 (ref), AlchemistRecipeSidebar (ref), ClientSyncEvents (ref), getItemMeta (ref), u11 (copy), Flamework (ref), AbilityId (ref), AbilityState (ref), countStagedIngredient (ref)
        local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui");

        local function _() -- Line: 52
            -- upvalues: parseAlchemistFlaskStage (ref), Players (ref), ALCHEMIST_FLASK_STAGE_ATTR (ref)
            return parseAlchemistFlaskStage(Players.LocalPlayer:GetAttribute(ALCHEMIST_FLASK_STAGE_ATTR));
        end;

        local function _() -- Line: 55
            -- upvalues: Players (ref), ALCHEMIST_FLASK_BREW_SEQ_ATTR (ref)
            local v14 = Players.LocalPlayer:GetAttribute(ALCHEMIST_FLASK_BREW_SEQ_ATTR);

            return type(v14) ~= "number" and 0 or v14;
        end;

        local function u15() -- Line: 59
            -- upvalues: InventoryUtil (ref), Players (ref), ItemType (ref)
            return {
                wildFlowerCount = InventoryUtil.getAmount(Players.LocalPlayer, ItemType.WILD_FLOWER),
                mushroomsCount = InventoryUtil.getAmount(Players.LocalPlayer, ItemType.MUSHROOMS),
                thornsCount = InventoryUtil.getAmount(Players.LocalPlayer, ItemType.THORNS)
            };
        end;

        SoundManager:playSound(GameSound.UI_OPEN);
        local u16 = #parseAlchemistFlaskStage(Players.LocalPlayer:GetAttribute(ALCHEMIST_FLASK_STAGE_ATTR));
        local v17 = Players.LocalPlayer:GetAttribute(ALCHEMIST_FLASK_BREW_SEQ_ATTR);
        local u18 = type(v17) ~= "number" and 0 or v17;
        local v19 = {
            stagedIngredients = parseAlchemistFlaskStage(Players.LocalPlayer:GetAttribute(ALCHEMIST_FLASK_STAGE_ATTR))
        };

        for i, v in u15() do
            v19[i] = v;
        end;

        local u20 = u3.mount(u3.createElement(AlchemistRecipeSidebar, v19), PlayerGui);

        local function u22() -- Line: 77
            -- upvalues: u3 (ref), parseAlchemistFlaskStage (ref), Players (ref), ALCHEMIST_FLASK_STAGE_ATTR (ref), u15 (copy), u20 (copy), AlchemistRecipeSidebar (ref)
            local v21 = {
                stagedIngredients = parseAlchemistFlaskStage(Players.LocalPlayer:GetAttribute(ALCHEMIST_FLASK_STAGE_ATTR))
            };

            for i, v in u15() do
                v21[i] = v;
            end;

            u3.update(u20, u3.createElement(AlchemistRecipeSidebar, v21));
        end;

        local u24 = Players.LocalPlayer:GetAttributeChangedSignal(ALCHEMIST_FLASK_STAGE_ATTR):Connect(function() -- Line: 87
            -- upvalues: parseAlchemistFlaskStage (ref), Players (ref), ALCHEMIST_FLASK_STAGE_ATTR (ref), u16 (ref), SoundManager (ref), GameSound (ref), u22 (copy)
            local v23 = parseAlchemistFlaskStage(Players.LocalPlayer:GetAttribute(ALCHEMIST_FLASK_STAGE_ATTR));

            if u16 < #v23 then
                SoundManager:playSound(GameSound.DEPOSIT_BEE);
            end;

            u16 = #v23;
            u22();
        end);
        local u27 = Players.LocalPlayer:GetAttributeChangedSignal(ALCHEMIST_FLASK_BREW_SEQ_ATTR):Connect(function() -- Line: 95
            -- upvalues: Players (ref), ALCHEMIST_FLASK_BREW_SEQ_ATTR (ref), u18 (ref), SoundManager (ref), GameSound (ref), u22 (copy)
            local v25 = Players.LocalPlayer:GetAttribute(ALCHEMIST_FLASK_BREW_SEQ_ATTR);
            local v26 = type(v25) ~= "number" and 0 or v25;

            if u18 < v26 then
                SoundManager:playSound(GameSound.WAND_BUBBLE_SPAWN);
            end;

            u18 = v26;
            u22();
        end);
        local u28 = ClientSyncEvents.ItemAdded:connect(function() -- Line: 103
            -- upvalues: u22 (copy)
            return u22();
        end);
        local u29 = ClientSyncEvents.ItemRemoved:connect(function() -- Line: 106
            -- upvalues: u22 (copy)
            return u22();
        end);
        local u30 = ClientSyncEvents.NewHandItem:connect(function() -- Line: 109
            -- upvalues: u22 (copy)
            return u22();
        end);
        local image = getItemMeta(ItemType.WILD_FLOWER).image;
        local image2 = getItemMeta(ItemType.MUSHROOMS).image;
        local image3 = getItemMeta(ItemType.THORNS).image;
        u11.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.ALCHEMIST_ADD_FLOWER, {
            abilityType = "KitPrimary",
            abilityButton = {
                icon = image == nil and "" or image,
                stateColors = {
                    [AbilityState.READY] = Color3.fromRGB(72, 120, 168)
                }
            }
        }):expect());
        u11.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.ALCHEMIST_ADD_MUSHROOMS, {
            abilityType = "KitSecondary",
            abilityButton = {
                icon = image2 == nil and "" or image2,
                stateColors = {
                    [AbilityState.READY] = Color3.fromRGB(72, 120, 168)
                }
            }
        }):expect());
        u11.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.ALCHEMIST_ADD_THORNS, {
            abilityType = "KitTertiary",
            abilityButton = {
                icon = image3 == nil and "" or image3,
                stateColors = {
                    [AbilityState.READY] = Color3.fromRGB(72, 120, 168)
                }
            }
        }):expect());

        local function u32(p31) -- Line: 154
            -- upvalues: AbilityId (ref), ItemType (ref)
            if p31 == AbilityId.ALCHEMIST_ADD_FLOWER then
                return ItemType.WILD_FLOWER;
            end;

            if p31 == AbilityId.ALCHEMIST_ADD_MUSHROOMS then
                return ItemType.MUSHROOMS;
            end;

            if p31 == AbilityId.ALCHEMIST_ADD_THORNS then
                return ItemType.THORNS;
            end;

            return nil;
        end;

        u11.maid:GiveTask(ClientSyncEvents.CanUseLocalAbility:connect(function(p33) -- Line: 168
            -- upvalues: AbilityId (ref), Players (ref), u32 (copy), InventoryUtil (ref), ItemType (ref), parseAlchemistFlaskStage (ref), ALCHEMIST_FLASK_STAGE_ATTR (ref), countStagedIngredient (ref)
            if p33.ability ~= AbilityId.ALCHEMIST_ADD_FLOWER and (p33.ability ~= AbilityId.ALCHEMIST_ADD_MUSHROOMS and p33.ability ~= AbilityId.ALCHEMIST_ADD_THORNS) then
                return nil;
            end;

            if p33.userCharacter ~= Players.LocalPlayer.Character then
                return nil;
            end;

            local v34 = u32(p33.ability);

            if v34 == nil then
                return nil;
            end;

            local hand = InventoryUtil.getInventory(Players.LocalPlayer).hand;

            if hand ~= nil then
                hand = hand.itemType;
            end;

            if hand ~= ItemType.ALCHEMIST_FLASK then
                p33:setCancelled(true);

                return nil;
            end;

            local v35 = countStagedIngredient(parseAlchemistFlaskStage(Players.LocalPlayer:GetAttribute(ALCHEMIST_FLASK_STAGE_ATTR)), v34);

            if not InventoryUtil.hasEnough(Players.LocalPlayer, v34, v35 + 1) then
                p33:setCancelled(true);
            end;
        end));

        return function() -- Line: 194
            -- upvalues: u24 (copy), u27 (copy), u28 (copy), u29 (copy), u30 (copy), u3 (ref), u20 (copy)
            u24:Disconnect();
            u27:Disconnect();
            u28:Destroy();
            u29:Destroy();
            u30:Destroy();
            u3.unmount(u20);
        end;
    end);
end;

function u5.onDisable(p36) -- Line: 204
    p36.maid:DoCleaning();
end;

KnitClient.CreateController(u5.new());

return nil;
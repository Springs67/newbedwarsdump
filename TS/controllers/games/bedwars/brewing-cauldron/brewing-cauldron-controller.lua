-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CraftingStatus = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "crafting-entity", "crafting-entity-types").CraftingStatus;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local BrewingCauldron = RuntimeLib.import(script, script.Parent, "ui", "brewing-cauldron").BrewingCauldron;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "BrewingCauldronController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 31
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 35
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "BrewingCauldronController";
    p6.whitelist = {};
    p6.activeBillboards = {};
    p6.activeInteractivePrompts = {};
    p6.activeStatus = {};
end;

function u4.KnitStart(u7) -- Line: 43
    -- upvalues: KnitController (copy), CollectionService (copy), Workspace (copy), default (copy), CraftingStatus (copy), Players (copy), isUsingKit (copy)
    KnitController.KnitStart(u7);
    CollectionService:GetInstanceRemovedSignal("brewing_cauldron"):Connect(function(p8) -- Line: 51
        -- upvalues: Workspace (ref), u7 (copy)
        if p8.Parent == Workspace then
            return nil;
        end;

        local v9 = p8:GetAttribute("id");
        u7.activeBillboards[v9] = nil;
        u7.activeStatus[v9] = nil;
    end);
    default.Client:WaitFor("CraftingEntityInventoryUpdate"):andThen(function(p10) -- Line: 61
        -- upvalues: u7 (copy), CraftingStatus (ref)
        p10:Connect(function(p11) -- Line: 62
            -- upvalues: u7 (ref), CraftingStatus (ref)
            local craftingEntity = p11.craftingEntity;
            local inventory = p11.inventory;
            local status = p11.status;
            local timeToCraft = p11.timeToCraft;
            local v12 = u7.activeInteractivePrompts[craftingEntity.id];

            if v12 == nil then
                return nil;
            end;

            if status == CraftingStatus.standby then
                u7.activeStatus[craftingEntity.id] = "STANDBY";
                u7:updateBillboard(craftingEntity, status, inventory);
                u7:updatePrompt(craftingEntity, "Deposit");

                return;
            end;

            if status == CraftingStatus.validate then
                u7:updateBillboard(craftingEntity, status, inventory);
                u7:updatePrompt(craftingEntity, "Deposit");
                u7.activeStatus[craftingEntity.id] = "VALIDATE";

                return;
            end;

            if status == CraftingStatus.crafting then
                u7.activeStatus[craftingEntity.id] = "CRAFTING";
                u7:updateBillboard(craftingEntity, CraftingStatus.crafting, inventory, "Crafting", timeToCraft);
                v12.Enabled = false;

                return;
            end;

            if status ~= CraftingStatus.finished then
                return;
            end;

            v12.Enabled = true;
            u7.activeStatus[craftingEntity.id] = "FINISHED";
            u7:updateBillboard(craftingEntity, CraftingStatus.finished, inventory, "Item Collection");
            u7:updatePrompt(craftingEntity, "Collect");
        end);
    end);
    default.Client:WaitFor("CraftingEntityAccess"):andThen(function(p13) -- Line: 113
        -- upvalues: Players (ref), u7 (copy), isUsingKit (ref), CraftingStatus (ref)
        p13:Connect(function(p14) -- Line: 114
            -- upvalues: Players (ref), u7 (ref), isUsingKit (ref), CraftingStatus (ref)
            local v15 = {};

            for i, v in p14.craftingEntity do
                v15[i] = v;
            end;

            local owner = v15.owner;
            local LocalPlayer = Players.LocalPlayer;
            local v16 = false;
            u7.whitelist = p14.whitelist;
            local accessLevel = p14.accessLevel;

            if accessLevel == "OWNER" then
                if isUsingKit(LocalPlayer, p14.kit) and owner == Players.LocalPlayer then
                    u7:updateBillboard(p14.craftingEntity, CraftingStatus.standby);
                    u7:createPrompts(p14.craftingEntity);
                end;
            elseif accessLevel == "TEAM" then
                local Team = LocalPlayer.Team;

                if Team ~= nil then
                    Team = Team:GetPlayers();
                end;

                if Team ~= nil then
                    for _, v in Team do
                        if isUsingKit(v, p14.kit) then
                            v16 = true;
                        end;
                    end;

                    if isUsingKit(LocalPlayer, p14.kit) or v16 then
                        u7:updateBillboard(p14.craftingEntity, CraftingStatus.standby);
                        u7:createPrompts(p14.craftingEntity);
                    end;
                end;
            elseif accessLevel == "ANY" then
                if isUsingKit(LocalPlayer, p14.kit) then
                    u7:updateBillboard(p14.craftingEntity, CraftingStatus.standby);
                    u7:createPrompts(p14.craftingEntity);
                end;
            elseif isUsingKit(LocalPlayer, p14.kit) then
                u7:updateBillboard(p14.craftingEntity, CraftingStatus.standby);
                u7:createPrompts(p14.craftingEntity);
            end;
        end);
    end);
end;

function u4.updateBillboard(p17, p18, p19, p20, p21, p22) -- Line: 173
    -- upvalues: u2 (copy), BrewingCauldron (copy)
    local v23 = p17.activeBillboards[p18.id];
    local v24 = p20 or {};
    local v25 = p21 == nil and "Ingredients" or p21;
    local v26 = p22 == nil and 8 or p22;

    if v23 then
        u2.update(v23, u2.createElement(BrewingCauldron, {
            Inventory = v24,
            CraftingStatus = p19,
            Text = v25,
            timeToCraft = v26
        }));

        return;
    end;

    p17.activeBillboards[p18.id] = u2.mount(u2.createElement(BrewingCauldron, {
        Text = "Deposit Ingredients",
        Inventory = v24,
        CraftingStatus = p19,
        timeToCraft = v26
    }), p18.craftingBlock);
end;

function u4.updatePrompt(p27, p28, p29) -- Line: 203
    -- upvalues: EntityUtil (copy), Players (copy)
    local v30 = p27.activeInteractivePrompts[p28.id];

    if v30 == nil then
        return nil;
    end;

    v30.ActionText = p29;
    local v31 = EntityUtil:getEntity(Players.LocalPlayer);

    if v31 == nil then
        return nil;
    end;

    local v32 = v31:getItemInHand();

    if v32 ~= nil then
        v32 = v32.Name;
    end;

    if v32 == nil then
        return nil;
    end;

    if p27.activeStatus[p28.id] == "STANDBY" then
        p27:TogglePrompt(p28.id, v32, v30);
    end;
end;

function u4.onItemSwap(u33, u34) -- Line: 229
    -- upvalues: WatchCharacter (copy), Players (copy), EntityUtil (copy)
    WatchCharacter(function(p35, p36) -- Line: 230
        -- upvalues: Players (ref), EntityUtil (ref), u33 (copy), u34 (copy)
        if p35 ~= Players.LocalPlayer then
            return nil;
        end;

        local u37 = EntityUtil:getEntity(p35);

        if not u37 then
            return nil;
        end;

        task.spawn(function() -- Line: 238
            -- upvalues: u37 (copy), u33 (ref), u34 (ref)
            u37:getInstance():WaitForChild("HandInvItem");
            u37:getInstance().HandInvItem.Changed:Connect(function(p38) -- Line: 240
                -- upvalues: u33 (ref), u34 (ref)
                local v39 = u33.activeInteractivePrompts[u34];

                if p38 == nil or v39 == nil then
                    return nil;
                end;

                u33:TogglePrompt(u34, p38.Name, v39);
            end);
        end);
    end);
end;

function u4.TogglePrompt(p40, p41, p42, p43) -- Line: 252
    local v44 = p40.activeStatus[p41] == "STANDBY";

    if p40.activeStatus[p41] == "CRAFTING" or p40.activeStatus[p41] == "VALIDATE" then
        p43.Enabled = false;

        return;
    end;

    if not v44 then
        p43.Enabled = true;

        return;
    end;

    if table.find(p40.whitelist, p42) == nil then
        p43.Enabled = false;

        return;
    end;

    p43.Enabled = true;
end;

function u4.createPrompts(p45, u46) -- Line: 278
    -- upvalues: KnitClient2 (copy), Players (copy), InventoryUtil (copy), GameAnimationUtil (copy), AnimationType (copy), KnitClient (copy), default (copy)
    local v47 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
        Name = "InteractPrompt",
        RequiresLineOfSight = false,
        MaxActivationDistance = 6,
        ActionText = "Deposit",
        ClickablePrompt = false,
        Parent = u46.craftingBlock
    });
    v47.Enabled = false;
    v47.Triggered:Connect(function(p48) -- Line: 288
        -- upvalues: Players (ref), InventoryUtil (ref), GameAnimationUtil (ref), AnimationType (ref), KnitClient (ref), default (ref), u46 (copy)
        if p48 == Players.LocalPlayer then
            local hand = InventoryUtil.getInventory(p48).hand;

            if hand ~= nil then
                hand = hand.itemType;
            end;

            GameAnimationUtil:playAnimation(p48, AnimationType.PUNCH);
            KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_USE_ITEM);
            default.Client:Get("CraftingEntityInteract"):SendToServer({
                craftingEntity = u46,
                itemInHand = hand
            });
        end;
    end);
    p45.activeInteractivePrompts[u46.id] = v47;
    p45.activeStatus[u46.id] = "STANDBY";
    p45:onItemSwap(u46.id);
end;

KnitClient.CreateController(u4.new());

return nil;
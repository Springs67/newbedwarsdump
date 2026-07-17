-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ConstantManager = v1.ConstantManager;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AppConfiguration = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "apps").AppConfiguration;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local ShopUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shop", "shop-util").ShopUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = ConstantManager.registerConstants(script, {
    PickupPerItemCooldown = 0.3
});
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "ItemDropController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 35
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 39
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "ItemDropController";
end;

function u4.KnitStart(u7) -- Line: 43
    -- upvalues: RuntimeLib (copy), Flamework (copy), AppConfiguration (copy)
    RuntimeLib.Promise.defer(function() -- Line: 44
        -- upvalues: RuntimeLib (ref), u7 (copy)
        while true do
            local v8 = task.wait(0.2);

            if v8 == 0 or (v8 ~= v8 or not v8) then
                break;
            end;

            RuntimeLib.Promise.defer(function() -- Line: 50
                -- upvalues: u7 (ref)
                u7:checkForPickup();
            end);
        end;
    end);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        actionId = "drop-item",
        action = "DropItem",

        boundFunction = function(p9, p10, p11) -- Line: 58, Name: boundFunction
            -- upvalues: Flamework (ref), AppConfiguration (ref), u7 (copy)
            if p10 == Enum.UserInputState.Begin and not Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(AppConfiguration.INVENTORY) then
                u7:dropItemInHand();
            end;
        end
    });
end;

function u4.dropItemInHand(p12) -- Line: 98
    -- upvalues: ClientStore (copy), default (copy), SoundManager (copy), GameSound (copy)
    local hand = ClientStore:getState().Inventory.observedInventory.inventory.hand;
    local v13 = hand ~= nil and default.Client:Get("DropItem"):CallServer({
        item = hand.tool
    });

    if v13 then
        SoundManager:playSound(GameSound.DROP_ITEM);
        v13:SetAttribute("ClientDropTime", tick());
    end;
end;

function u4.dropHotbarItem(p14, p15) -- Line: 110
    -- upvalues: ClientStore (copy), default (copy), SoundManager (copy), GameSound (copy)
    local item = ClientStore:getState().Inventory.observedInventory.hotbar[p15 + 1].item;

    if not item then
        return false;
    end;

    local v16 = default.Client:Get("DropItem"):CallServer({
        item = item.tool,
        amount = item.amount
    });

    if v16 then
        SoundManager:playSound(GameSound.DROP_ITEM);
        v16:SetAttribute("ClientDropTime", tick());
    end;

    return v16 ~= nil;
end;

function u4.checkForPickup(p17) -- Line: 126
    -- upvalues: Players (copy), CollectionService (copy), ItemType (copy), Workspace (copy), u3 (copy), getItemMeta (copy), ShopUtil (copy), InventoryUtil (copy), default (copy), SoundManager (copy), GameSound (copy)
    if Players.LocalPlayer:GetAttribute("BlockItemPickup") == true then
        return nil;
    end;

    local u18 = Players.LocalPlayer.Character and Players.LocalPlayer.Character.PrimaryPart;

    if u18 then
        local v19 = CollectionService:GetTagged("ItemDrop");
        local u20 = Players.LocalPlayer:GetAttribute("ResourcePickupRange");

        local function v24(p21) -- Line: 137
            -- upvalues: ItemType (ref), u20 (copy), u18 (copy)
            local v22;

            if (p21.Name == ItemType.DIAMOND or p21.Name == ItemType.EMERALD) and u20 ~= nil then
                v22 = p21:GetAttribute("OreGenDrop") == true;
            else
                v22 = false;
            end;

            if v22 then
                local v23 = p21:GetAttribute("TeamGeneratorItemDrop");

                if v23 == 0 or v23 ~= v23 then
                    v23 = false;
                elseif v23 == "" then
                    v23 = false;
                end;

                v22 = not v23;
            end;

            if v22 then
                return (u18.Position - p21.Position).Magnitude <= u20;
            end;

            return (u18.Position - p21.Position).Magnitude <= 6;
        end;

        local v25 = 0;
        local v26 = {};

        for i, v in v19 do
            if v24(v, i - 1, v19) == true then
                v25 = v25 + 1;
                v26[v25] = v;
            end;
        end;

        local function _(p27) -- Line: 165
            -- upvalues: Workspace (ref)
            return Workspace:GetServerTimeNow() > p27:GetAttribute("PickupReadyTime");
        end;

        local v28 = 0;
        local v29 = {};

        for i, v in v26 do
            local _ = i - 1;

            if Workspace:GetServerTimeNow() > v:GetAttribute("PickupReadyTime") == true then
                v28 = v28 + 1;
                v29[v28] = v;
            end;
        end;

        local function _(p30) -- Line: 180
            -- upvalues: u3 (ref)
            local v31 = p30:GetAttribute("ClientPickupAttemptTime");

            return v31 == nil and true or tick() - v31 > u3.PickupPerItemCooldown;
        end;

        local v32 = 0;
        local v33 = {};

        for i, v in v29 do
            local _ = i - 1;
            local v34 = v:GetAttribute("ClientPickupAttemptTime");

            if (v34 == nil and true or tick() - v34 > u3.PickupPerItemCooldown) == true then
                v32 = v32 + 1;
                v33[v32] = v;
            end;
        end;

        local function _(p35) -- Line: 199
            -- upvalues: getItemMeta (ref), ShopUtil (ref), Players (ref), InventoryUtil (ref)
            getItemMeta(p35.Name);
            local v36 = ShopUtil:getMaxStackForPlayer(Players.LocalPlayer, p35.Name);

            if v36 ~= nil then
                local v37 = InventoryUtil.getToolFromInventory(Players.LocalPlayer, p35.Name);
                local v38;

                if v37 == nil then
                    v38 = v37;
                else
                    v38 = v37.amount;
                end;

                if v38 ~= nil and v36 <= v37.amount then
                    return false;
                end;
            end;

            return true;
        end;

        local v39 = 0;
        local v40 = {};

        for i, v in v33 do
            local _ = i - 1;
            getItemMeta(v.Name);
            local v41 = ShopUtil:getMaxStackForPlayer(Players.LocalPlayer, v.Name);
            local v42;

            if v41 == nil then
                v42 = true;
            else
                local v43 = InventoryUtil.getToolFromInventory(Players.LocalPlayer, v.Name);
                local v44;

                if v43 == nil then
                    v44 = v43;
                else
                    v44 = v43.amount;
                end;

                v42 = v44 == nil or v41 > v43.amount;
            end;

            if v42 == true then
                v39 = v39 + 1;
                v40[v39] = v;
            end;
        end;

        local v45 = false;
        local v46 = 0;
        local u47 = false;

        while true do
            if true then
                if v45 then
                    v46 = v46 + 1;
                else
                    v45 = true;
                end;
            end;

            if v46 >= math.min(5, #v40) then
                break;
            end;

            local u48 = v40[v46 + 1];
            u48:SetAttribute("ClientPickupAttemptTime", tick());
            default.Client:Get("PickupItemDrop"):CallServerAsync({
                itemDrop = u48
            }):andThen(function(p49) -- Line: 245
                -- upvalues: u47 (ref), SoundManager (ref), GameSound (ref), getItemMeta (ref), u48 (copy), u18 (copy)
                if p49 and not u47 then
                    SoundManager:playSound(GameSound.PICKUP_ITEM_DROP);
                    local pickUpOverlaySound = getItemMeta(u48.Name).pickUpOverlaySound;

                    if pickUpOverlaySound ~= "" and pickUpOverlaySound then
                        SoundManager:playSound(pickUpOverlaySound, {
                            volumeMultiplier = 0.9,
                            position = u18.Position
                        });
                    end;

                    u47 = true;
                end;
            end);
        end;
    end;
end;

return {
    ItemDropController = KnitClient.CreateController(u4.new())
};
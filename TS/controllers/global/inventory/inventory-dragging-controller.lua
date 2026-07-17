-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out");
local Reflect = v1.Reflect;
local Flamework = v1.Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Controller = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "InventoryDraggingController";
    end
});
u3.__index = u3;

function u3.new(...) -- Line: 21
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 25
    p5.screenSinks = {};
end;

function u3.onStart(u6) -- Line: 28
    -- upvalues: UserInputService (copy), KnitClient (copy)
    local function _(p7) -- Line: 29
        return table.find({ Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch }, p7.UserInputType) ~= nil;
    end;

    UserInputService.InputBegan:Connect(function(p8, p9) -- Line: 34
        -- upvalues: u6 (copy)
        if table.find({ Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch }, p8.UserInputType) == nil then
            return nil;
        end;

        local v10 = u6:getActiveScreenSink(p8);

        if v10 ~= nil then
            v10.inputEventOccured("began", p8);
        end;
    end);
    UserInputService.InputEnded:Connect(function(p11, p12) -- Line: 43
        -- upvalues: u6 (copy), KnitClient (ref)
        if not u6.pickedUpInventoryItem then
            return nil;
        end;

        if table.find({ Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch }, p11.UserInputType) == nil then
            return nil;
        end;

        local pickedUpInventoryItem = u6.pickedUpInventoryItem;

        if pickedUpInventoryItem ~= nil then
            pickedUpInventoryItem = pickedUpInventoryItem.inputObject;
        end;

        if p11 == pickedUpInventoryItem then
            local v13 = u6:getActiveScreenSink(p11);

            if v13 then
                v13.inputEventOccured("ended", p11);
            else
                KnitClient.Controllers.ItemDropController:dropHotbarItem(u6.pickedUpInventoryItem.slotId);
            end;

            u6:deselectInventoryItem();
        end;
    end);
end;

function u3.dragItem(p14, p15, p16, p17) -- Line: 66
    -- upvalues: PlaceUtil (copy), KnitClient (copy), ClientStore (copy), getItemMeta (copy), Flamework (copy)
    if PlaceUtil.isGameServer() and KnitClient.Controllers.SpectateController:isSpectating() then
        return nil;
    end;

    local hotbar = ClientStore:getState().Inventory.observedInventory.hotbar;

    if not hotbar then
        return nil;
    end;

    local v18 = hotbar[p15 + 1];

    if not v18.item then
        return nil;
    end;

    local image = getItemMeta(v18.item.itemType).image;
    Flamework.resolveDependency("client/controllers/global/mouse/mouse-icon-controller@MouseIconController"):setMouseIcon(image == nil and "" or image);
    p14.pickedUpInventoryItem = {
        slotId = p15,
        slotData = v18.item,
        inputObject = p16
    };
end;

function u3.dragItemOntoSlot(p19, p20, p21, p22) -- Line: 90
    -- upvalues: ClientStore (copy)
    if not p19.pickedUpInventoryItem then
        return nil;
    end;

    if p19.pickedUpInventoryItem.inputObject ~= p21 then
        print("[Inventory Dragging Controller]: Error - Wrong input object.");

        return nil;
    end;

    if p19.pickedUpInventoryItem.slotId ~= p20 then
        ClientStore:dispatch({
            type = "InventorySwapHotbarSlots",
            slotIndex1 = p20,
            slotIndex2 = p19.pickedUpInventoryItem.slotId
        });
    end;

    p19:deselectInventoryItem();
end;

function u3.deselectInventoryItem(p23) -- Line: 107
    -- upvalues: Flamework (copy)
    if not p23.pickedUpInventoryItem then
        return nil;
    end;

    p23.pickedUpInventoryItem = nil;
    Flamework.resolveDependency("client/controllers/global/mouse/mouse-icon-controller@MouseIconController"):clearMouseIcon();
end;

function u3.getActiveDragItem(p24) -- Line: 114
    return p24.pickedUpInventoryItem;
end;

function u3.registerScreenSink(u25, p26, p27, p28) -- Line: 117
    -- upvalues: u2 (copy)
    local v29 = u2.new();
    local u30 = {
        position = p26,
        size = p27,
        inputEventOccured = p28,
        maid = v29
    };
    table.insert(u25.screenSinks, u30);
    v29:GiveTask(function() -- Line: 126
        -- upvalues: u25 (copy), u30 (copy)
        local v31 = (table.find(u25.screenSinks, u30) or 0) - 1;

        if v31 >= 0 then
            table.remove(u25.screenSinks, v31 + 1);
        end;
    end);

    return u30;
end;

function u3.getActiveScreenSink(p32, p33) -- Line: 134
    for _, v in p32.screenSinks do
        local v34 = v.position + v.size;
        local position = v.position;
        local v35 = Vector2.new(math.max(v34.X, position.X), (math.max(v34.Y, position.Y)));
        local v36 = Vector2.new(math.min(v34.X, position.X), (math.min(v34.Y, position.Y)));

        if p33.Position.Y > v36.Y and (p33.Position.Y < v35.Y and (p33.Position.X > v36.X and p33.Position.X < v35.X)) then
            return v;
        end;
    end;

    return nil;
end;

Reflect.defineMetadata(u3, "identifier", "client/controllers/global/inventory/inventory-dragging-controller@InventoryDraggingController");
Reflect.defineMetadata(u3, "flamework:implements", { "$:flamework@OnStart" });
Reflect.decorate(u3, "$:flamework@Controller", Controller, { {} });

return {
    InventoryDraggingController = u3
};
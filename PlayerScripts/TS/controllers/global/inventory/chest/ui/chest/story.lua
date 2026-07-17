-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local HotbarApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "hotbar", "ui", "hotbar-app").HotbarApp;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ChestInventoryApp = RuntimeLib.import(script, script.Parent, "chest-inventory-app").ChestInventoryApp;

local function createItem(p3, p4) -- Line: 11
    -- upvalues: u1 (copy), Workspace (copy)
    local v5 = u1("Accessory", {
        Name = p3,
        Children = { u1("Part", {
                Name = "Handle",
                Size = Vector3.new(0.8, 0.8, 0.8),
                Material = Enum.Material.SmoothPlastic,
                CFrame = CFrame.new(),
                Children = { u1("Attachment", {
                        Name = "RightGripAttachment",
                        CFrame = CFrame.new()
                    }) }
            }) }
    });
    v5:SetAttribute("InvItem", true);
    v5:SetAttribute("Amount", p4 == nil and 1 or p4);
    v5:SetAttribute("AddedToBackpackTime", Workspace:GetServerTimeNow());

    return v5;
end;

return function(p6) -- Line: 33
    -- upvalues: CreateRoduxApp (copy), ChestInventoryApp (copy), HotbarApp (copy), ClientStore (copy), createItem (copy), ItemType (copy), u2 (copy)
    local u7 = CreateRoduxApp("ChestInventory", ChestInventoryApp, {}, {}, {
        Parent = p6
    });
    local u8 = CreateRoduxApp("Hotbar", HotbarApp, {}, {}, {
        Parent = p6
    });
    ClientStore:dispatch({
        type = "InventoryAddItem",
        tool = createItem(ItemType.STONE)
    });
    ClientStore:dispatch({
        type = "InventoryAddItem",
        tool = createItem(ItemType.STONE_BRICK, 5)
    });
    ClientStore:dispatch({
        type = "InventoryAddItem",
        tool = createItem(ItemType.WOOL_RED, 4)
    });
    ClientStore:dispatch({
        type = "InventoryAddItem",
        tool = createItem(ItemType.WOOL_WHITE, 20)
    });
    ClientStore:dispatch({
        type = "InventoryAddItem",
        tool = createItem(ItemType.WOOL_BLUE, 45)
    });

    return function() -- Line: 72
        -- upvalues: u2 (ref), u7 (copy), u8 (copy)
        u2.unmount(u7);
        u2.unmount(u8);
    end;
end;
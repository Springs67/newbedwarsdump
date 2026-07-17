-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local InventoryEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "inventory-entity").InventoryEntity;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "CustomEntityController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "CustomEntityController";
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), u1 (copy), InventoryEntity (copy), getItemMeta (copy), ItemUtil (copy), ReplicatedStorage (copy), WeldUtil (copy)
    KnitController.KnitStart(p5);
    WatchCollectionTag("entity", function(u6) -- Line: 32
        -- upvalues: u1 (ref), InventoryEntity (ref), getItemMeta (ref), ItemUtil (ref), ReplicatedStorage (ref), WeldUtil (ref)
        if u6:GetAttribute("KitEntityType") ~= nil then
            local u7 = u1.new();
            local u8 = u1.new();
            task.spawn(function() -- Line: 36
                -- upvalues: InventoryEntity (ref), u6 (copy), u7 (copy), getItemMeta (ref), ItemUtil (ref), ReplicatedStorage (ref), WeldUtil (ref), u8 (copy)
                if not InventoryEntity.new(u6) then
                    return nil;
                end;

                u6:WaitForChild("Humanoid");

                local function u11(p9) -- Line: 42
                    -- upvalues: u7 (ref), getItemMeta (ref), ItemUtil (ref), u6 (ref), ReplicatedStorage (ref), WeldUtil (ref)
                    u7:DoCleaning();

                    if not (p9 and getItemMeta(p9)) then
                        return nil;
                    end;

                    ItemUtil.createItemInstance(p9).Parent = u6;
                    local v10 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Armor"):WaitForChild(p9):WaitForChild(p9):Clone();
                    v10.Parent = u6;
                    u7:GiveTask(v10);
                    WeldUtil:weldCharacterAccessories(u6);
                end;

                local function u14(p12) -- Line: 54
                    -- upvalues: u8 (ref), getItemMeta (ref), ItemUtil (ref), u6 (ref), WeldUtil (ref)
                    u8:DoCleaning();

                    if not (p12 and getItemMeta(p12)) then
                        return nil;
                    end;

                    local v13 = ItemUtil.createItemInstance(p12);
                    v13.Parent = u6;
                    u8:GiveTask(v13);
                    WeldUtil:weldCharacterAccessories(u6);
                end;

                u11((u6:GetAttribute("ArmorType")));
                u14((u6:GetAttribute("HandItemType")));
                u6:GetAttributeChangedSignal("ArmorType"):Connect(function() -- Line: 70
                    -- upvalues: u6 (ref), u11 (copy)
                    u11((u6:GetAttribute("ArmorType")));
                end);
                u6:GetAttributeChangedSignal("HandItemType"):Connect(function() -- Line: 74
                    -- upvalues: u6 (ref), u14 (copy)
                    u14((u6:GetAttribute("HandItemType")));
                end);
            end);
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;
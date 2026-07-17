-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local BedWarsArmor = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-armor-set").BedWarsArmor;
local BedwarsBows = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-bows").BedwarsBows;
local BedwarsMelees = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-melees").BedwarsMelees;
local BedwarsPickaxes = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-pickaxes").BedwarsPickaxes;
local BedwarsShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

local function _() -- Line: 19
    return {
        item = nil
    };
end;

local v3 = not Players.LocalPlayer and {
    hand = nil,
    backpack = nil,
    items = {},
    armor = { "empty", "empty", "empty" }
} or InventoryUtil.getInventory(Players.LocalPlayer);
local u4 = {
    taxState = 0,
    observedPlayer = Players.LocalPlayer,
    observedInventory = {
        hotbarSlot = 0,
        hotbar = { {
                item = nil
            }, {
                item = nil
            }, {
                item = nil
            }, {
                item = nil
            }, {
                item = nil
            }, {
                item = nil
            }, {
                item = nil
            }, {
                item = nil
            }, {
                item = nil
            } },
        inventory = v3,
        observedChest = {
            items = {}
        }
    }
};

local function makeEmptyChest() -- Line: 54
    local v5 = false;
    local v6 = 0;
    local v7 = {};

    while true do
        if v5 then
            v6 = v6 + 1;
        else
            v5 = true;
        end;

        if v6 >= 20 then
            return v7;
        end;

        table.insert(v7, "empty");
    end;
end;

local u8 = Workspace:GetServerTimeNow();

local function playArmorEquipSound() -- Line: 74
    -- upvalues: Workspace (copy), u8 (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy)
    if Workspace:GetServerTimeNow() - u8 > 0.3 then
        task.spawn(function() -- Line: 76
            -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref)
            SoundManager:playSound(RandomUtil.fromList(GameSound.ARMOR_EQUIP));
        end);
    end;
end;

return {
    InventoryReducer = function(p9, u10) -- Line: 81, Name: InventoryReducer
        -- upvalues: u4 (copy), getItemMeta (copy), Workspace (copy), u8 (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), BedWarsArmor (copy), BedwarsMelees (copy), BedwarsBows (copy), BedwarsPickaxes (copy), ClientSyncEvents (copy), makeEmptyChest (copy), ItemType (copy), BedwarsShop (copy)
        if p9 == nil then
            p9 = u4;
        end;

        if u10.type == "InventoryFullUpdate" then
            local v11 = {};

            for i, v in p9 do
                v11[i] = v;
            end;

            local v12 = {};

            for i, v in p9.observedInventory do
                v12[i] = v;
            end;

            v12.inventory = u10.inventory;
            v11.observedInventory = v12;

            return v11;
        end;

        if u10.type == "InventorySetItemAmount" then
            local u13 = nil;
            local items = p9.observedInventory.inventory.items;

            local function _(p14) -- Line: 102
                -- upvalues: u10 (copy), u13 (ref)
                if p14.itemType ~= u10.tool.Name then
                    return p14;
                end;

                local v15 = {};

                for i, v in p14 do
                    v15[i] = v;
                end;

                v15.amount = u10.amount;
                u13 = v15;

                return u13;
            end;

            local v16 = table.create(#items);

            for i, v in items do
                local _ = i - 1;

                if v.itemType == u10.tool.Name then
                    local v17 = {};

                    for i2, v4 in v do
                        v17[i2] = v4;
                    end;

                    v17.amount = u10.amount;
                    u13 = v17;
                    local v = u13;
                end;

                v16[i] = v;
            end;

            local v18 = {};

            for i, v in p9 do
                v18[i] = v;
            end;

            local v19 = {};

            for i, v in p9.observedInventory do
                v19[i] = v;
            end;

            local v20 = {};

            for i, v in p9.observedInventory.inventory do
                v20[i] = v;
            end;

            v20.items = v16;
            v19.inventory = v20;
            local hotbar = p9.observedInventory.hotbar;

            local function _(p21) -- Line: 139
                -- upvalues: u10 (copy), u13 (ref)
                local item = p21.item;

                if item ~= nil then
                    item = item.tool;
                end;

                if not (item == u10.tool and u13) then
                    return p21;
                end;

                local v22 = {};

                for i, v in p21 do
                    v22[i] = v;
                end;

                v22.item = u13;

                return v22;
            end;

            local v23 = table.create(#hotbar);

            for i, v in hotbar do
                local _ = i - 1;
                local item = v.item;

                if item ~= nil then
                    item = item.tool;
                end;

                if item == u10.tool and u13 then
                    local v = {};

                    for i2, v4 in v do
                        v[i2] = v4;
                    end;

                    v.item = u13;
                end;

                v23[i] = v;
            end;

            v19.hotbar = v23;
            v18.observedInventory = v19;

            return v18;
        end;

        if u10.type == "InventoryAddItem" then
            local u24 = getItemMeta(u10.tool.Name);

            local function _(p25) -- Line: 171
                -- upvalues: u10 (copy)
                return p25.tool == u10.tool;
            end;

            local v26 = nil;

            for i, v in p9.observedInventory.inventory.items do
                local _ = i - 1;

                if v.tool == u10.tool == true then
                    v26 = v;
                    break;
                end;
            end;

            if v26 then
                return p9;
            end;

            local u27 = {
                tool = u10.tool,
                itemType = u10.tool.Name,
                itemSkin = u10.tool:GetAttribute("ItemSkin"),
                amount = u10.tool:GetAttribute("Amount"),
                addedToBackpackTime = Workspace:GetServerTimeNow()
            };
            local items = p9.observedInventory.inventory.items;
            local v28 = false;
            local v29 = false;
            local armor = p9.observedInventory.inventory.armor;
            local backpack = p9.observedInventory.inventory.backpack;

            if u24.armor then
                local u30 = p9.observedInventory.inventory.armor[u24.armor.slot + 1];

                if u30 == "empty" then
                    local v31 = {};
                    table.move(armor, 1, #armor, #v31 + 1, v31);
                    v31[u24.armor.slot + 1] = u27;
                    v29 = true;

                    if Workspace:GetServerTimeNow() - u8 > 0.3 then
                        task.spawn(function() -- Line: 76
                            -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref)
                            SoundManager:playSound(RandomUtil.fromList(GameSound.ARMOR_EQUIP));
                        end);
                        armor = v31;
                    else
                        armor = v31;
                    end;
                else
                    local function _(p32) -- Line: 211
                        -- upvalues: u30 (copy)
                        return table.find(p32, u30.itemType) ~= nil;
                    end;

                    local v33 = -1;

                    for i, v in BedWarsArmor do
                        local _ = i - 1;

                        if table.find(v, u30.itemType) ~= nil == true then
                            v33 = i - 1;
                            break;
                        end;
                    end;

                    local function _(p34) -- Line: 226
                        -- upvalues: u10 (copy)
                        return table.find(p34, u10.tool.Name) ~= nil;
                    end;

                    local v35 = -1;

                    for i, v in BedWarsArmor do
                        local _ = i - 1;

                        if table.find(v, u10.tool.Name) ~= nil == true then
                            v35 = i - 1;
                            break;
                        end;
                    end;

                    if v33 < v35 then
                        local v36 = {};
                        table.move(armor, 1, #armor, #v36 + 1, v36);
                        armor = v36;
                        armor[u24.armor.slot + 1] = u27;
                        v29 = true;
                        items = {};
                        local v37 = #items;
                        local items2 = p9.observedInventory.inventory.items;
                        local v38 = #items2;
                        table.move(items2, 1, v38, v37 + 1, items);
                        items[v37 + v38 + 1] = u30;

                        if Workspace:GetServerTimeNow() - u8 > 0.3 then
                            task.spawn(function() -- Line: 76
                                -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref)
                                SoundManager:playSound(RandomUtil.fromList(GameSound.ARMOR_EQUIP));
                            end);
                        end;
                    else
                        v28 = true;
                    end;
                end;
            end;

            if u24.backpack then
                local backpack2 = p9.observedInventory.inventory.backpack;
                v29 = true;

                if backpack2 then
                    items = {};
                    local v39 = #items;
                    local items2 = p9.observedInventory.inventory.items;
                    local v40 = #items2;
                    table.move(items2, 1, v40, v39 + 1, items);
                    items[v39 + v40 + 1] = backpack2;
                end;

                if Workspace:GetServerTimeNow() - u8 > 0.3 then
                    task.spawn(function() -- Line: 76
                        -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref)
                        SoundManager:playSound(RandomUtil.fromList(GameSound.ARMOR_EQUIP));
                    end);
                end;
            end;

            local hotbar = p9.observedInventory.hotbar;
            local hand = p9.observedInventory.inventory.hand;
            local v41;

            if v29 then
                v41 = hotbar;
            else
                items = {};
                local v42 = #items;
                local items2 = p9.observedInventory.inventory.items;
                local v43 = #items2;
                table.move(items2, 1, v43, v42 + 1, items);
                items[v42 + v43 + 1] = u27;
                local v44 = -1;
                local u45;

                if u24.hotbarFillRight then
                    u45 = #hotbar - 1;
                    local v46 = false;

                    while true do
                        if v46 then
                            u45 = u45 - 1;
                        else
                            v46 = true;
                        end;

                        if u45 < 0 then
                            u45 = v44;
                            break;
                        end;

                        if hotbar[u45 + 1].item == nil then
                            break;
                        end;
                    end;
                else
                    local function _(p47) -- Line: 313
                        return p47.item == nil;
                    end;

                    u45 = -1;

                    for i, v in p9.observedInventory.hotbar do
                        local _ = i - 1;

                        if v.item == nil == true then
                            u45 = i - 1;
                            break;
                        end;
                    end;
                end;

                local v48 = false;
                local u49;

                if u24.sword then
                    local function _(p50) -- Line: 333
                        -- upvalues: getItemMeta (ref)
                        if p50.item then
                            return getItemMeta(p50.item.itemType).sword ~= nil;
                        end;

                        return false;
                    end;

                    local v51 = -1;

                    for i, v in hotbar do
                        local _ = i - 1;
                        local v52;

                        if v.item then
                            v52 = getItemMeta(v.item.itemType).sword ~= nil;
                        else
                            v52 = false;
                        end;

                        if v52 == true then
                            v51 = i - 1;
                            break;
                        end;
                    end;

                    local v53 = hotbar[v51 + 1];

                    if v53 ~= nil then
                        v53 = v53.item;

                        if v53 ~= nil then
                            v53 = v53.itemType;
                        end;
                    end;

                    if v53 then
                        local v54 = (table.find(BedwarsMelees, v53) or 0) - 1;
                        local v55 = (table.find(BedwarsMelees, u10.tool.Name) or 0) - 1;

                        if v54 < v55 then
                            u49 = v51;

                            local function _(p56, p57) -- Line: 362
                                -- upvalues: u49 (ref), u27 (copy)
                                return p57 == u49 and {
                                    item = u27
                                } or p56;
                            end;

                            hotbar = table.create(#hotbar);

                            for i, v in hotbar do
                                hotbar[i] = i - 1 == u49 and {
                                    item = u27
                                } or v;
                            end;

                            v48 = true;
                        elseif v55 >= 0 and v54 >= 0 then
                            v28 = true;
                        end;
                    end;
                elseif table.find(BedwarsBows, u10.tool.Name) == nil then
                    if table.find(BedwarsPickaxes, u10.tool.Name) == nil then
                        if u24.replaces then
                            local function _(p58) -- Line: 501
                                -- upvalues: u24 (copy)
                                local item = p58.item;

                                if item then
                                    item = u24.replaces;

                                    if item ~= nil then
                                        item = table.find(item, p58.item.itemType) ~= nil;
                                    end;
                                end;

                                return item;
                            end;

                            local v59 = -1;

                            for i, v in hotbar do
                                local _ = i - 1;
                                local item = v.item;

                                if item then
                                    item = u24.replaces;

                                    if item ~= nil then
                                        item = table.find(item, v.item.itemType) ~= nil;
                                    end;
                                end;

                                if item == true then
                                    v59 = i - 1;
                                    break;
                                end;
                            end;

                            local v60 = hotbar[v59 + 1];

                            if v60 ~= nil then
                                v60 = v60.item;

                                if v60 ~= nil then
                                    v60 = v60.itemType;
                                end;
                            end;

                            if v60 then
                                u49 = v59;

                                local function _(p61, p62) -- Line: 534
                                    -- upvalues: u49 (ref), u27 (copy)
                                    return p62 == u49 and {
                                        item = u27
                                    } or p61;
                                end;

                                local v63 = table.create(#hotbar);
                                hotbar = v63;

                                for i, v in hotbar do
                                    hotbar[i] = i - 1 == u49 and {
                                        item = u27
                                    } or v;
                                    v63 = hotbar;
                                    hotbar = v63;
                                end;

                                v48 = true;
                            end;
                        end;
                    else
                        local function _(p64) -- Line: 446
                            -- upvalues: BedwarsPickaxes (ref)
                            local v65 = p64.item and table.find(BedwarsPickaxes, p64.item.itemType) ~= nil;

                            return v65;
                        end;

                        local v66 = -1;

                        for i, v in hotbar do
                            local _ = i - 1;
                            local v67 = v.item and table.find(BedwarsPickaxes, v.item.itemType) ~= nil;

                            if v67 == true then
                                v66 = i - 1;
                                break;
                            end;
                        end;

                        local v68 = hotbar[v66 + 1];

                        if v68 ~= nil then
                            v68 = v68.item;

                            if v68 ~= nil then
                                v68 = v68.itemType;
                            end;
                        end;

                        if v68 and (table.find(BedwarsPickaxes, v68) or 0) - 1 < (table.find(BedwarsPickaxes, u10.tool.Name) or 0) - 1 then
                            u49 = v66;

                            local function _(p69, p70) -- Line: 480
                                -- upvalues: u49 (ref), u27 (copy)
                                return p70 == u49 and {
                                    item = u27
                                } or p69;
                            end;

                            local v71 = table.create(#hotbar);
                            hotbar = v71;

                            for i, v in hotbar do
                                hotbar[i] = i - 1 == u49 and {
                                    item = u27
                                } or v;
                                v71 = hotbar;
                                hotbar = v71;
                            end;

                            v48 = true;
                        end;
                    end;
                else
                    local function _(p72) -- Line: 387
                        -- upvalues: BedwarsBows (ref)
                        local v73 = p72.item and table.find(BedwarsBows, p72.item.itemType) ~= nil;

                        return v73;
                    end;

                    local v74 = -1;

                    for i, v in hotbar do
                        local _ = i - 1;
                        local v75 = v.item and table.find(BedwarsBows, v.item.itemType) ~= nil;

                        if v75 == true then
                            v74 = i - 1;
                            break;
                        end;
                    end;

                    local v76 = hotbar[v74 + 1];

                    if v76 ~= nil then
                        v76 = v76.item;

                        if v76 ~= nil then
                            v76 = v76.itemType;
                        end;
                    end;

                    if v76 then
                        if (table.find(BedwarsBows, v76) or 0) - 1 < (table.find(BedwarsBows, u10.tool.Name) or 0) - 1 then
                            u49 = v74;

                            local function _(p77, p78) -- Line: 421
                                -- upvalues: u49 (ref), u27 (copy)
                                return p78 == u49 and {
                                    item = u27
                                } or p77;
                            end;

                            local v79 = table.create(#hotbar);
                            hotbar = v79;

                            for i, v in hotbar do
                                hotbar[i] = i - 1 == u49 and {
                                    item = u27
                                } or v;
                                v79 = hotbar;
                                hotbar = v79;
                            end;

                            v48 = true;
                        else
                            v28 = true;
                        end;
                    end;
                end;

                if u45 > -1 and not (v48 or v28) then
                    local function _(p80, p81) -- Line: 557
                        -- upvalues: u45 (ref), u27 (copy)
                        return p81 == u45 and {
                            item = u27
                        } or p80;
                    end;

                    v41 = table.create(#hotbar);

                    for i, v in hotbar do
                        v41[i] = i - 1 == u45 and {
                            item = u27
                        } or v;
                    end;
                else
                    v41 = hotbar;
                end;

                if u49 == p9.observedInventory.hotbarSlot then
                    hand = v41[u49 + 1].item;
                end;
            end;

            if ClientSyncEvents.NewHandItem:fire():isCancelled() then
                hand = nil;
            end;

            ClientSyncEvents.ItemAdded:fire(u27.tool);
            local v82 = {};

            for i, v in p9 do
                v82[i] = v;
            end;

            local v83 = {};

            for i, v in p9.observedInventory do
                v83[i] = v;
            end;

            local v84 = {};

            for i, v in p9.observedInventory.inventory do
                v84[i] = v;
            end;

            v84.items = items;
            v84.hand = hand;
            v84.armor = armor;
            v84.backpack = backpack;
            v83.inventory = v84;
            v83.hotbar = v41;
            v82.observedInventory = v83;

            return v82;
        end;

        if u10.type == "RestoreHotBar" then
            local savedHotbar = u10.savedHotbar;
            local u85 = { {
                    item = nil
                }, {
                    item = nil
                }, {
                    item = nil
                }, {
                    item = nil
                }, {
                    item = nil
                }, {
                    item = nil
                }, {
                    item = nil
                }, {
                    item = nil
                }, {
                    item = nil
                } };

            local function v92(p86) -- Line: 608
                -- upvalues: BedwarsMelees (ref)
                local u87 = 0;
                local u88 = nil;

                local function v91(p89, p90) -- Line: 612
                    -- upvalues: BedwarsMelees (ref), u88 (ref), u87 (ref)
                    if not p89.item then
                        return nil;
                    end;

                    if table.find(BedwarsMelees, p89.item.itemType) == nil then
                        return nil;
                    end;

                    if not u88 then
                        u88 = p89.item;
                        u87 = p90;

                        return nil;
                    end;

                    if (table.find(BedwarsMelees, u88.itemType) or 0) - 1 < (table.find(BedwarsMelees, p89.item.itemType) or 0) - 1 then
                        u88 = p89.item;
                        u87 = p90;
                    end;
                end;

                for i, v in p86 do
                    v91(v, i - 1, p86);
                end;

                if u87 ~= nil and u88 then
                    return {
                        slotIndex = u87,
                        inventoryItem = u88
                    };
                end;
            end;

            local v93 = v92(savedHotbar);
            local v94 = v92(p9.observedInventory.hotbar);

            if v93 and v94 then
                savedHotbar[v93.slotIndex + 1] = {
                    item = v94.inventoryItem
                };
            end;

            local hotbar = p9.observedInventory.hotbar;

            local function v99(p95, u96) -- Line: 658
                -- upvalues: savedHotbar (copy)
                if not u96.item then
                    return p95;
                end;

                local function _(p97) -- Line: 664
                    -- upvalues: u96 (copy)
                    local item = p97.item;

                    if item ~= nil then
                        item = item.itemType;
                    end;

                    local item2 = u96.item;

                    if item2 ~= nil then
                        item2 = item2.itemType;
                    end;

                    return item == item2;
                end;

                local v98 = -1;

                for i, v in savedHotbar do
                    local _ = i - 1;
                    local item = v.item;

                    if item ~= nil then
                        item = item.itemType;
                    end;

                    local item2 = u96.item;

                    if item2 ~= nil then
                        item2 = item2.itemType;
                    end;

                    if item == item2 == true then
                        v98 = i - 1;
                        break;
                    end;
                end;

                if v98 >= 0 then
                    table.insert(p95.savedItems, {
                        index = v98,
                        item = u96.item
                    });

                    return p95;
                end;

                table.insert(p95.extraItems, u96.item);

                return p95;
            end;

            local v100 = {
                savedItems = {},
                extraItems = {}
            };

            for i = 1, #hotbar do
                v100 = v99(v100, hotbar[i], i - 1, hotbar);
            end;

            local function _(p101) -- Line: 712
                -- upvalues: u85 (copy)
                u85[p101.index + 1] = {
                    item = p101.item
                };
            end;

            for i, v in v100.savedItems do
                local _ = i - 1;
                u85[v.index + 1] = {
                    item = v.item
                };
            end;

            local extraItems = v100.extraItems;

            local function v105(p102) -- Line: 722
                -- upvalues: u85 (copy)
                local function _(p103) -- Line: 723
                    return p103.item == nil;
                end;

                local v104 = -1;

                for i, v in u85 do
                    local _ = i - 1;

                    if v.item == nil == true then
                        v104 = i - 1;
                        break;
                    end;
                end;

                u85[v104 + 1] = {
                    item = p102
                };
            end;

            for i, v in extraItems do
                v105(v, i - 1, extraItems);
            end;

            local v106 = {};

            for i, v in p9 do
                v106[i] = v;
            end;

            local v107 = {};

            for i, v in p9.observedInventory do
                v107[i] = v;
            end;

            local v108 = {};

            for i, v in p9.observedInventory.inventory do
                v108[i] = v;
            end;

            v107.inventory = v108;
            v107.hotbar = u85;
            v106.observedInventory = v107;

            return v106;
        end;

        if u10.type == "InventoryRemoveItem" then
            local hotbar = p9.observedInventory.hotbar;

            local function _(p109) -- Line: 765
                -- upvalues: u10 (copy)
                local item = p109.item;

                if item ~= nil then
                    item = item.tool;
                end;

                return item == u10.tool;
            end;

            local u110 = nil;

            for i, v in hotbar do
                local _ = i - 1;
                local item = v.item;

                if item ~= nil then
                    item = item.tool;
                end;

                if item == u10.tool == true then
                    u110 = v;
                    break;
                end;
            end;

            local v111;

            if u110 then
                local function _(p112, p113) -- Line: 785
                    -- upvalues: u110 (copy)
                    return p112 == u110 and {
                        item = nil
                    } or p112;
                end;

                v111 = table.create(#hotbar);

                for i, v in hotbar do
                    local _ = i - 1;
                    v111[i] = v == u110 and {
                        item = nil
                    } or v;
                end;
            else
                v111 = hotbar;
            end;

            local function _(p114) -- Line: 802
                -- upvalues: u10 (copy)
                return p114.tool ~= u10.tool;
            end;

            local v115 = 0;
            local v116 = {};

            for i, v in p9.observedInventory.inventory.items do
                local _ = i - 1;

                if v.tool ~= u10.tool == true then
                    v115 = v115 + 1;
                    v116[v115] = v;
                end;
            end;

            local armor = p9.observedInventory.inventory.armor;

            local function _(p117) -- Line: 818
                -- upvalues: u10 (copy)
                local v118;

                if p117 == "empty" then
                    v118 = false;
                else
                    v118 = p117.tool == u10.tool;
                end;

                return v118;
            end;

            local u119 = -1;

            for i, v in armor do
                local _ = i - 1;
                local v120;

                if v == "empty" then
                    v120 = false;
                else
                    v120 = v.tool == u10.tool;
                end;

                if v120 == true then
                    u119 = i - 1;
                    break;
                end;
            end;

            local v121;

            if u119 > -1 then
                local function _(p122, p123) -- Line: 833
                    -- upvalues: u119 (copy)
                    return p123 == u119 and "empty" or p122;
                end;

                v121 = table.create(#armor);

                for i, v in armor do
                    v121[i] = i - 1 == u119 and "empty" or v;
                end;
            else
                v121 = armor;
            end;

            local backpack = p9.observedInventory.inventory.backpack;
            local v124;

            if backpack == nil then
                v124 = backpack;
            else
                v124 = backpack.tool;
            end;

            if v124 == u10.tool then
                backpack = nil;
            end;

            local hand = p9.observedInventory.inventory.hand;
            hand = hand;
            local v125;

            if hand ~= nil then
                v125 = hand.tool;
            end;

            if v125 == u10.tool then
                hand = nil;
            end;

            if ClientSyncEvents.NewHandItem:fire():isCancelled() then
                hand = nil;
            end;

            local v126 = {};

            for i, v in p9 do
                v126[i] = v;
            end;

            local v127 = {};

            for i, v in p9.observedInventory do
                v127[i] = v;
            end;

            v127.hotbar = v111;
            local v128 = {};

            for i, v in p9.observedInventory.inventory do
                v128[i] = v;
            end;

            v128.items = v116;
            v128.hand = hand;
            v128.armor = v121;
            v128.backpack = backpack;
            v127.inventory = v128;
            v126.observedInventory = v127;

            return v126;
        end;

        if u10.type == "InventoryAddToHotbar" then
            local hotbar = p9.observedInventory.hotbar;
            local hand = p9.observedInventory.inventory.hand;
            local items = p9.observedInventory.inventory.items;
            local item = p9.observedInventory.hotbar[u10.slot + 1].item;
            local u129 = Workspace:GetServerTimeNow();

            if item then
                local v130 = hotbar;

                local function v137(u131, p132) -- Line: 900
                    -- upvalues: u10 (copy), u129 (ref), items (ref)
                    if p132 ~= u10.slot then
                        return u131;
                    end;

                    u129 = u10.item.addedToBackpackTime;
                    local v133 = items;

                    local function _(p134) -- Line: 904
                        -- upvalues: u131 (copy), u10 (ref)
                        local item2 = u131.item;

                        if item2 ~= nil then
                            item2 = item2.tool;
                        end;

                        if p134.tool ~= item2 then
                            return p134;
                        end;

                        local v135 = {};

                        for i, v in p134 do
                            v135[i] = v;
                        end;

                        v135.addedToBackpackTime = u10.item.addedToBackpackTime;

                        return v135;
                    end;

                    local v136 = table.create(#v133);

                    for i, v in v133 do
                        local _ = i - 1;
                        local item2 = u131.item;

                        if item2 ~= nil then
                            item2 = item2.tool;
                        end;

                        if v.tool == item2 then
                            local v = {};

                            for i2, v4 in v do
                                v[i2] = v4;
                            end;

                            v.addedToBackpackTime = u10.item.addedToBackpackTime;
                        end;

                        v136[i] = v;
                    end;

                    items = v136;

                    return {
                        item = nil
                    };
                end;

                hotbar = table.create(#v130);

                for i, v in v130 do
                    hotbar[i] = v137(v, i - 1, v130);
                end;

                if u10.slot == p9.observedInventory.hotbarSlot then
                    hand = nil;
                end;
            end;

            local function _(p138, p139) -- Line: 946
                -- upvalues: u10 (copy)
                return p139 == u10.slot and {
                    item = u10.item
                } or p138;
            end;

            local v140 = table.create(#hotbar);

            for i, v in hotbar do
                v140[i] = i - 1 == u10.slot and {
                    item = u10.item
                } or v;
            end;

            if u10.slot == p9.observedInventory.hotbarSlot then
                hand = v140[u10.slot + 1].item;
            end;

            if ClientSyncEvents.NewHandItem:fire():isCancelled() then
                hand = nil;
            end;

            local v141 = {};

            for i, v in p9 do
                v141[i] = v;
            end;

            local v142 = {};

            for i, v in p9.observedInventory do
                v142[i] = v;
            end;

            v142.hotbar = v140;
            local v143 = {};

            for i, v in p9.observedInventory.inventory do
                v143[i] = v;
            end;

            v143.items = items;
            v143.hand = hand;
            v142.inventory = v143;
            v141.observedInventory = v142;

            return v141;
        end;

        if u10.type == "InventorySwapHotbarSlots" then
            local hotbar = p9.observedInventory.hotbar;
            local u144 = hotbar[u10.slotIndex1 + 1];
            local u145 = hotbar[u10.slotIndex2 + 1];
            local v146 = hotbar;
            local v147 = table.create(#v146);

            local function v150(p148, p149) -- Line: 993
                -- upvalues: u10 (copy), u145 (copy), u144 (copy)
                return p149 == u10.slotIndex1 and {
                    item = u145.item
                } or (p149 == u10.slotIndex2 and {
                    item = u144.item
                } or p148);
            end;

            for i, v in v146 do
                v147[i] = v150(v, i - 1, v146);
            end;

            local hand = p9.observedInventory.inventory.hand;

            if u10.slotIndex1 == p9.observedInventory.hotbarSlot then
                hand = u145.item;
            elseif u10.slotIndex2 == p9.observedInventory.hotbarSlot then
                hand = u144.item;
            end;

            if ClientSyncEvents.NewHandItem:fire():isCancelled() then
                hand = nil;
            end;

            local v151 = {};

            for i, v in p9 do
                v151[i] = v;
            end;

            local v152 = {};

            for i, v in p9.observedInventory do
                v152[i] = v;
            end;

            v152.hotbar = v147;
            local v153 = {};

            for i, v in p9.observedInventory.inventory do
                v153[i] = v;
            end;

            v153.hand = hand;
            v152.inventory = v153;
            v151.observedInventory = v152;

            return v151;
        end;

        if u10.type == "InventoryRemoveFromHotbar" then
            local item = p9.observedInventory.hotbar[u10.slot + 1].item;
            local hotbar = p9.observedInventory.hotbar;

            local function _(p154, p155) -- Line: 1045
                -- upvalues: u10 (copy)
                return p155 == u10.slot and {
                    item = nil
                } or p154;
            end;

            local v156 = table.create(#hotbar);

            for i, v in hotbar do
                v156[i] = i - 1 == u10.slot and {
                    item = nil
                } or v;
            end;

            local hand = p9.observedInventory.inventory.hand;

            if u10.slot == p9.observedInventory.hotbarSlot then
                hand = nil;
            end;

            local v157 = {};
            local items = p9.observedInventory.inventory.items;
            table.move(items, 1, #items, #v157 + 1, v157);

            local function _(p158, p159) -- Line: 1069
                -- upvalues: item (copy), Workspace (ref)
                local v160 = item;

                if v160 ~= nil then
                    v160 = v160.itemType;
                end;

                if p158.itemType ~= v160 then
                    return p158;
                end;

                local v161 = {};

                for i, v in p158 do
                    v161[i] = v;
                end;

                v161.addedToBackpackTime = Workspace:GetServerTimeNow();

                return v161;
            end;

            local v162 = table.create(#v157);

            for i, v in v157 do
                local _ = i - 1;
                local v163;

                if item ~= nil then
                    v163 = item.itemType;
                end;

                if v.itemType == v163 then
                    local v = {};

                    for i2, v4 in v do
                        v[i2] = v4;
                    end;

                    v.addedToBackpackTime = Workspace:GetServerTimeNow();
                end;

                v162[i] = v;
            end;

            if ClientSyncEvents.NewHandItem:fire():isCancelled() then
                hand = nil;
            end;

            local v164 = {};

            for i, v in p9 do
                v164[i] = v;
            end;

            local v165 = {};

            for i, v in p9.observedInventory do
                v165[i] = v;
            end;

            v165.hotbar = v156;
            local v166 = {};

            for i, v in p9.observedInventory.inventory do
                v166[i] = v;
            end;

            v166.items = v162;
            v166.hand = hand;
            v165.inventory = v166;
            v164.observedInventory = v165;

            return v164;
        end;

        if u10.type == "UnequipItemInHand" then
            local _ = p9.observedInventory.inventory.items;

            if u10.equip then
                local v167 = {};

                for i, v in p9 do
                    v167[i] = v;
                end;

                local v168 = {};

                for i, v in p9.observedInventory do
                    v168[i] = v;
                end;

                local v169 = {};

                for i, v in p9.observedInventory.inventory do
                    v169[i] = v;
                end;

                v169.hand = p9.observedInventory.hotbar[p9.observedInventory.hotbarSlot + 1].item;
                v168.inventory = v169;
                v167.observedInventory = v168;

                return v167;
            end;

            local v170 = {};

            for i, v in p9 do
                v170[i] = v;
            end;

            local v171 = {};

            for i, v in p9.observedInventory do
                v171[i] = v;
            end;

            local v172 = {};

            for i, v in p9.observedInventory.inventory do
                v172[i] = v;
            end;

            v172.hand = nil;
            v171.inventory = v172;
            v170.observedInventory = v171;

            return v170;
        end;

        if u10.type == "InventorySetArmorItem" then
            local items = p9.observedInventory.inventory.items;
            local v173 = p9.observedInventory.inventory.armor[u10.armorSlot + 1];
            local v174;

            if v173 == "empty" then
                v174 = items;
            else
                v174 = {};
                local v175 = #v174;
                local v176 = #items;
                table.move(items, 1, v176, v175 + 1, v174);
                local v177 = {};

                for i, v in v173 do
                    v177[i] = v;
                end;

                v177.addedToBackpackTime = Workspace:GetServerTimeNow();
                v174[v175 + v176 + 1] = v177;
            end;

            local hotbar = p9.observedInventory.hotbar;
            local hand = p9.observedInventory.inventory.hand;
            local v178;

            if u10.item == nil then
                v178 = hotbar;
            else
                local function _(p179) -- Line: 1180
                    -- upvalues: u10 (copy)
                    return p179 ~= u10.item;
                end;

                local v180 = 0;
                v174 = {};

                for i, v in v174 do
                    local _ = i - 1;

                    if v ~= u10.item == true then
                        v180 = v180 + 1;
                        v174[v180] = v;
                    end;
                end;

                local function _(p181) -- Line: 1195
                    -- upvalues: u10 (copy)
                    return p181.item == u10.item and {
                        item = nil
                    } or p181;
                end;

                v178 = table.create(#hotbar);

                for i, v in hotbar do
                    local _ = i - 1;
                    v178[i] = v.item == u10.item and {
                        item = nil
                    } or v;
                end;

                local hand2 = p9.observedInventory.inventory.hand;

                if hand2 ~= nil then
                    hand2 = hand2.tool;
                end;

                if hand2 == u10.item.tool then
                    hand = nil;
                end;
            end;

            local v182 = {};
            local armor = p9.observedInventory.inventory.armor;
            table.move(armor, 1, #armor, #v182 + 1, v182);
            v182[u10.armorSlot + 1] = u10.item or "empty";
            local v183 = {};

            for i, v in p9 do
                v183[i] = v;
            end;

            local v184 = {};

            for i, v in p9.observedInventory do
                v184[i] = v;
            end;

            v184.hotbar = v178;
            local v185 = {};

            for i, v in p9.observedInventory.inventory do
                v185[i] = v;
            end;

            v185.items = v174;
            v185.armor = v182;
            v185.hand = hand;
            v184.inventory = v185;
            v183.observedInventory = v184;

            return v183;
        end;

        if u10.type == "InventorySetBackpack" then
            local items = p9.observedInventory.inventory.items;
            local backpack = p9.observedInventory.inventory.backpack;
            local v186;

            if backpack then
                v186 = {};
                local v187 = #v186;
                local v188 = #items;
                table.move(items, 1, v188, v187 + 1, v186);
                local v189 = {};

                for i, v in backpack do
                    v189[i] = v;
                end;

                v189.addedToBackpackTime = Workspace:GetServerTimeNow();
                v186[v187 + v188 + 1] = v189;
            else
                v186 = items;
            end;

            local hotbar = p9.observedInventory.hotbar;
            local hand = p9.observedInventory.inventory.hand;
            local v190;

            if u10.item == nil then
                v190 = hotbar;
            else
                local function _(p191) -- Line: 1270
                    -- upvalues: u10 (copy)
                    return p191 ~= u10.item;
                end;

                local v192 = 0;
                v186 = {};

                for i, v in v186 do
                    local _ = i - 1;

                    if v ~= u10.item == true then
                        v192 = v192 + 1;
                        v186[v192] = v;
                    end;
                end;

                local function _(p193) -- Line: 1285
                    -- upvalues: u10 (copy)
                    return p193.item == u10.item and {
                        item = nil
                    } or p193;
                end;

                v190 = table.create(#hotbar);

                for i, v in hotbar do
                    local _ = i - 1;
                    v190[i] = v.item == u10.item and {
                        item = nil
                    } or v;
                end;

                local hand2 = p9.observedInventory.inventory.hand;

                if hand2 ~= nil then
                    hand2 = hand2.tool;
                end;

                if hand2 == u10.item.tool then
                    hand = nil;
                end;
            end;

            local item = u10.item;
            local v194 = {};

            for i, v in p9 do
                v194[i] = v;
            end;

            local v195 = {};

            for i, v in p9.observedInventory do
                v195[i] = v;
            end;

            v195.hotbar = v190;
            local v196 = {};

            for i, v in p9.observedInventory.inventory do
                v196[i] = v;
            end;

            v196.items = v186;
            v196.backpack = item;
            v196.hand = hand;
            v195.inventory = v196;
            v194.observedInventory = v195;

            return v194;
        end;

        if u10.type == "ChestAddItem" then
            local v197 = p9.observedInventory.observedChest or {
                items = {}
            };
            local u198 = u10.itemInstance == "empty" and "empty" or {
                tool = u10.itemInstance,
                itemType = u10.itemInstance.Name,
                amount = u10.itemInstance:GetAttribute("Amount"),
                addedToBackpackTime = Workspace:GetServerTimeNow(),
                itemSkin = u10.itemInstance:GetAttribute("ItemSkin")
            };
            local v199 = {};
            local items = v197.items;
            table.move(items, 1, #items, #v199 + 1, v199);
            local v200 = v199;
            local v201 = false;

            if u10.itemInstance ~= "empty" then
                local v202 = u10.itemInstance:GetAttribute("ChestSlot");

                if v202 ~= nil and v200[v202 + 1] == "empty" then
                    v200[v202 + 1] = u198;
                    v201 = true;
                end;
            end;

            if not v201 then
                local u203 = false;
                local v204 = v200;

                local function _(p205, p206) -- Line: 1371
                    -- upvalues: u203 (ref), u198 (ref)
                    if u203 then
                        return p205;
                    end;

                    if p205 ~= "empty" then
                        return p205;
                    end;

                    u203 = true;

                    return u198;
                end;

                v200 = table.create(#v204);

                for i, v in v204 do
                    local _ = i - 1;

                    if not u203 and v == "empty" then
                        u203 = true;
                        local v = u198;
                    end;

                    v200[i] = v;
                end;

                if not u203 then
                    table.insert(v200, u198);
                end;
            end;

            local v207 = {};

            for i, v in p9 do
                v207[i] = v;
            end;

            local v208 = {};

            for i, v in p9.observedInventory do
                v208[i] = v;
            end;

            local v209 = {};

            for i, v in p9.observedInventory.observedChest do
                v209[i] = v;
            end;

            v209.items = v200;
            v208.observedChest = v209;
            v207.observedInventory = v208;

            return v207;
        end;

        if u10.type == "ChestRemoveItem" then
            local v210 = p9.observedInventory.observedChest or {
                items = {}
            };
            local v211 = {};

            for i, v in p9 do
                v211[i] = v;
            end;

            local v212 = {};

            for i, v in p9.observedInventory do
                v212[i] = v;
            end;

            local v213 = {};

            for i, v in p9.observedInventory.observedChest do
                v213[i] = v;
            end;

            local v214 = {};
            local items = v210.items;

            local function _(p215) -- Line: 1436
                -- upvalues: u10 (copy)
                return p215 ~= "empty" and p215.tool == u10.itemInstance and "empty" or p215;
            end;

            local v216 = table.create(#items);

            for i, v in items do
                local _ = i - 1;
                v216[i] = v ~= "empty" and v.tool == u10.itemInstance and "empty" or v;
            end;

            table.move(v216, 1, #v216, #v214 + 1, v214);
            v213.items = v214;
            v212.observedChest = v213;
            v211.observedInventory = v212;

            return v211;
        end;

        if u10.type == "ChestItemSetAmount" then
            local v217 = p9.observedInventory.observedChest or {
                items = {}
            };
            local v218 = {};

            for i, v in p9 do
                v218[i] = v;
            end;

            local v219 = {};

            for i, v in p9.observedInventory do
                v219[i] = v;
            end;

            local v220 = {};

            for i, v in p9.observedInventory.observedChest do
                v220[i] = v;
            end;

            local items = v217.items;

            local function _(p221) -- Line: 1475
                -- upvalues: u10 (copy)
                if p221 == "empty" then
                    return p221;
                end;

                if p221.tool ~= u10.itemInstance then
                    return p221;
                end;

                local v222 = {};

                for i, v in p221 do
                    v222[i] = v;
                end;

                v222.amount = u10.amount;

                return v222;
            end;

            local v223 = table.create(#items);

            for i, v in items do
                local _ = i - 1;

                if v ~= "empty" and v.tool == u10.itemInstance then
                    local v = {};

                    for i2, v4 in v do
                        v[i2] = v4;
                    end;

                    v.amount = u10.amount;
                end;

                v223[i] = v;
            end;

            v220.items = v223;
            v219.observedChest = v220;
            v218.observedInventory = v219;

            return v218;
        end;

        if u10.type == "ChestClear" then
            local v224 = {};

            for i, v in p9 do
                v224[i] = v;
            end;

            local v225 = {};

            for i, v in p9.observedInventory do
                v225[i] = v;
            end;

            local v226 = {};

            for i, v in p9.observedInventory.observedChest do
                v226[i] = v;
            end;

            v226.items = makeEmptyChest();
            v225.observedChest = v226;
            v224.observedInventory = v225;

            return v224;
        end;

        if u10.type ~= "InventorySelectHotbarItemGroup" then
            local type = u10.type;

            if type == "SetObservedPlayer" then
                local v227 = {};

                for i, v in p9 do
                    v227[i] = v;
                end;

                v227.observedPlayer = u10.observedPlayer;

                return v227;
            end;

            if type ~= "InventorySelectHotbarSlot" then
                if type ~= "IncrementTaxState" then
                    return p9;
                end;

                local v228 = {};

                for i, v in p9 do
                    v228[i] = v;
                end;

                v228.taxState = p9.taxState + 1;

                return v228;
            end;

            local item = p9.observedInventory.hotbar[u10.slot + 1].item;

            if ClientSyncEvents.NewHandItem:fire():isCancelled() then
                item = nil;
            end;

            local v229 = {};

            for i, v in p9 do
                v229[i] = v;
            end;

            local v230 = {};

            for i, v in p9.observedInventory do
                v230[i] = v;
            end;

            v230.hotbarSlot = u10.slot;
            local v231 = {};

            for i, v in p9.observedInventory.inventory do
                v231[i] = v;
            end;

            v231.hand = item;
            v230.inventory = v231;
            v229.observedInventory = v230;

            return v229;
        end;

        local v232 = false;
        local v233 = 0;
        local v234 = -1;
        local v235 = (1 / 0);

        while true do
            if true then
                if v232 then
                    v233 = v233 + 1;
                else
                    v232 = true;
                end;
            end;

            if v233 >= #p9.observedInventory.hotbar then
                v233 = v234;
                break;
            end;

            local v236 = p9.observedInventory.hotbar[v233 + 1];
            local v237;

            if v236.item then
                local v238 = getItemMeta(v236.item.itemType);

                if u10.itemGroup == "sword" and (v238.sword or v238.actsAsSwordGroup) then
                    break;
                end;

                if u10.itemGroup == "block" and (v238.block and v238.block.greedyMesh) then
                    local v239;

                    if v238.block.wool then
                        v239 = ItemType.WOOL_WHITE;
                    else
                        v239 = v236.item.itemType;
                    end;

                    local v240 = BedwarsShop.getShopItem(v239, nil);
                    v240 = v240;
                    local v241;

                    if v240 == nil then
                        v241 = v240;
                    else
                        v241 = v240.currency;
                    end;

                    if v241 == ItemType.IRON then
                        v237 = v240.price / v240.amount;

                        if v235 < v237 then
                            v237 = v235;
                        else
                            v234 = v233;
                        end;
                    else
                        v237 = v235;
                    end;
                else
                    v237 = v235;
                end;
            else
                v237 = v235;
            end;

            v235 = v237;
        end;

        local item = p9.observedInventory.hotbar[v233 + 1].item;

        if ClientSyncEvents.NewHandItem:fire():isCancelled() then
            item = nil;
        end;

        if v233 == -1 then
            return p9;
        end;

        local v242 = {};

        for i, v in p9 do
            v242[i] = v;
        end;

        local v243 = {};

        for i, v in p9.observedInventory do
            v243[i] = v;
        end;

        v243.hotbarSlot = v233;
        local v244 = {};

        for i, v in p9.observedInventory.inventory do
            v244[i] = v;
        end;

        v244.hand = item;
        v243.inventory = v244;
        v242.observedInventory = v243;

        return v242;
    end,

    InitialInventoryState = u4
};
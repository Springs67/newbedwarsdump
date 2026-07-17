-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local LockerReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "locker-reducer").LockerReducer;
local ItemSkinType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-types").ItemSkinType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ItemSkinSelector = RuntimeLib.import(script, script.Parent, "item-skin-selector").ItemSkinSelector;

return function(p3) -- Line: 11
    -- upvalues: u2 (copy), GameReducer (copy), LockerReducer (copy), ItemSkinType (copy), ItemType (copy), u1 (copy), StoreProvider (copy), ItemSkinSelector (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Game = GameReducer,
        Locker = LockerReducer
    }), {
        Locker = {
            itemSkins = {
                ItemSkinType.BALLOON_WOOD_SWORD,
                ItemSkinType.BALLOON_STONE_SWORD,
                ItemSkinType.BALLOON_IRON_SWORD,
                ItemSkinType.BALLOON_DIAMOND_SWORD,
                ItemSkinType.BALLOON_EMERALD_SWORD
            },
            selectedItemSkins = {
                [ItemType.WOOD_SWORD] = ItemSkinType.BALLOON_WOOD_SWORD,
                [ItemType.DIAMOND_SWORD] = ItemSkinType.BALLOON_DIAMOND_SWORD,
                [ItemType.WOOD_BOW] = ItemSkinType.LIFE_BOW_MUMMY,
                [ItemType.WOOD_SWORD] = ItemSkinType.BALLOON_WOOD_SWORD,
                [ItemType.WOOD_SWORD] = ItemSkinType.BALLOON_WOOD_SWORD
            }
        }
    });
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(ItemSkinSelector, {
            AppId = "ItemSkinSelector",
            BaseItemSkinType = ItemType.EMERALD_SWORD
        }) }), p3);

    return function() -- Line: 35
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;
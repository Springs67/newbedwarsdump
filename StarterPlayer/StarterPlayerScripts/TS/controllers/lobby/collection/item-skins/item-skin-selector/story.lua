local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "locker-reducer").LockerReducer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-types").ItemSkinType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u9 = v1.import(script, script.Parent, "item-skin-selector").ItemSkinSelector
return function(p10) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u6
        [4] = u7
        [5] = u8
        [6] = u2
        [7] = u3
        [8] = u9
    --]]
    local v11 = u4.Store.new
    local v12 = {
        ["Game"] = u5,
        ["Locker"] = u6
    }
    local v13 = u4.combineReducers(v12)
    local v14 = {}
    local v15 = {
        ["itemSkins"] = {
            u7.BALLOON_WOOD_SWORD,
            u7.BALLOON_STONE_SWORD,
            u7.BALLOON_IRON_SWORD,
            u7.BALLOON_DIAMOND_SWORD,
            u7.BALLOON_EMERALD_SWORD
        },
        ["selectedItemSkins"] = {
            [u8.WOOD_SWORD] = u7.BALLOON_WOOD_SWORD,
            [u8.DIAMOND_SWORD] = u7.BALLOON_DIAMOND_SWORD,
            [u8.WOOD_BOW] = u7.LIFE_BOW_MUMMY,
            [u8.WOOD_SWORD] = u7.BALLOON_WOOD_SWORD,
            [u8.WOOD_SWORD] = u7.BALLOON_WOOD_SWORD
        }
    }
    v14.Locker = v15
    local v16 = v11(v13, v14)
    local u17 = u2.mount(u2.createElement(u3, {
        ["store"] = v16
    }, { u2.createElement(u9, {
            ["AppId"] = "ItemSkinSelector",
            ["BaseItemSkinType"] = u8.EMERALD_SWORD
        }) }), p10)
    return function() --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u17
        --]]
        return u2.unmount(u17)
    end
end
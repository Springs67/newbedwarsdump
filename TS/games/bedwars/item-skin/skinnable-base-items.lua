local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u2 = {}
for _, v3 in {
    v1.WOOD_SWORD,
    v1.STONE_SWORD,
    v1.IRON_SWORD,
    v1.DIAMOND_SWORD,
    v1.EMERALD_SWORD,
    v1.WOOD_PICKAXE,
    v1.STONE_PICKAXE,
    v1.IRON_PICKAXE,
    v1.DIAMOND_PICKAXE,
    v1.WOOD_AXE,
    v1.STONE_AXE,
    v1.IRON_AXE,
    v1.DIAMOND_AXE,
    v1.WOOD_BOW,
    v1.WOOD_CROSSBOW,
    v1.HEADHUNTER
} do
    u2[v3] = true
end
return {
    ["isBaseSkinnableItem"] = function(p4) --[[ Name: isBaseSkinnableItem, Line 11 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        return u2[p4] ~= nil
    end
}
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v7 = {
    ["SwordsToExclude"] = {}
}
local u8 = {
    [v5.WOOD_SWORD] = v3.Assets.Misc.WoodShield,
    [v5.STONE_SWORD] = v3.Assets.Misc.StoneShield,
    [v5.IRON_SWORD] = v3.Assets.Misc.IronShield,
    [v5.DIAMOND_SWORD] = v3.Assets.Misc.DiamondShield,
    [v5.EMERALD_SWORD] = v3.Assets.Misc.EmeraldShieldKit
}
v7.ShieldMap = u8
v7.DamageBlocked = {
    [v5.WOOD_SWORD] = 8,
    [v5.STONE_SWORD] = 13,
    [v5.IRON_SWORD] = 20,
    [v5.DIAMOND_SWORD] = 30,
    [v5.EMERALD_SWORD] = (1 / 0)
}
v7.ShieldSounds = {
    ["WoodShield"] = { v6.WOOD_SHIELD_BREAK, v6.WOOD_SHIELD_REACTIVE },
    ["StoneShield"] = { v6.STONE_SHIELD_BREAK, v6.STONE_SHIELD_REACTIVE },
    ["IronShield"] = { v6.IRON_SHIELD_BREAK, v6.IRON_SHIELD_REACTIVE },
    ["DiamondShield"] = { v6.DIAMOND_SHIELD_BREAK, v6.DIAMOND_SHIELD_REACTIVE },
    ["EmeraldShield"] = { v6.EMERALD_SHIELD_BREAK, v6.EMERALD_SHIELD_REACTIVE }
}
v7.ShieldCooldown = 10
function v7.getEquivalentNormalSwordFromSpecialSword(p9) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u8
    --]]
    local v10 = u4(p9).sword
    if v10 ~= nil then
        v10 = v10.damage
    end
    if v10 == nil then
        return nil
    end
    local v11 = u2.keys(u8)
    local function v19(p12, p13) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        local v14 = u4(p12)
        local v15 = u4(p13)
        local v16 = v14.sword
        if v16 ~= nil then
            v16 = v16.damage
        end
        local v17 = v16 == nil and 0 or v16
        local v18 = v15.sword
        if v18 ~= nil then
            v18 = v18.damage
        end
        return (v18 == nil and 0 or v18) < v17
    end
    table.sort(v11, v19)
    for _, v20 in v11 do
        local v21 = u4(v20)
        if v21.sword ~= nil and v21.sword.damage <= v10 then
            return v20
        end
    end
    return v11[#v11 - 1 + 1]
end
return {
    ["SwordShieldKitBalance"] = v7
}
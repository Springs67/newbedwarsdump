local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v4 = {
    [v2.BARBARIAN] = true,
    [v2.DASHER] = true,
    [v2.FROSTY_HAMMER] = true,
    [v2.TINKER] = true,
    [v2.SUMMONER] = true,
    [v2.VOID_KNIGHT] = true,
    [v2.GUN_BLADE] = true,
    [v2.ICE_QUEEN] = true,
    [v2.EMBER] = true,
    [v2.LUMEN] = true,
    [v2.WIZARD] = true,
    [v2.ICE_MAGE] = true,
    [v2.MAGE] = true
}
local v5 = {}
local v6 = setmetatable({}, {
    ["__index"] = v5
})
v6.SWORD = "SWORD"
v5.SWORD = "SWORD"
v6.GREAT_HAMMER = "GREAT_HAMMER"
v5.GREAT_HAMMER = "GREAT_HAMMER"
v6.SCYTHE = "SCYTHE"
v5.SCYTHE = "SCYTHE"
v6.DAGGER = "DAGGER"
v5.DAGGER = "DAGGER"
v6.GAUNTLETS = "GAUNTLETS"
v5.GAUNTLETS = "GAUNTLETS"
local u7 = {
    [v6.SWORD] = {
        ["name"] = "Sword",
        ["description"] = "Ordinary, classic, traditional sword",
        ["image"] = "rbxassetid://6875480974"
    },
    [v6.GREAT_HAMMER] = {
        ["name"] = "Great Hammer",
        ["description"] = "Slower attack speed but more damage and knockback",
        ["image"] = "rbxassetid://13832631568"
    },
    [v6.SCYTHE] = {
        ["name"] = "Scythe",
        ["description"] = "Attacks all targets in front",
        ["image"] = v3.WOOD_SCYTHE
    },
    [v6.DAGGER] = {
        ["name"] = "Dagger",
        ["description"] = "Sharp and Small. Low damage but faster attack speed",
        ["image"] = v3.WOOD_DAGGER
    },
    [v6.GAUNTLETS] = {
        ["name"] = "Gauntlets",
        ["description"] = "Consecutive attacks deals more damage",
        ["image"] = "rbxassetid://14839095983"
    }
}
return {
    ["getWeaponMeta"] = function(p8) --[[ Name: getWeaponMeta, Line 65 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        return u7[p8]
    end,
    ["KitWithCustomWeapon"] = v4,
    ["WeaponType"] = v6,
    ["weapons"] = u7
}
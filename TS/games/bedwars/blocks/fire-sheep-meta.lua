local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.ONE = 0
v1[0] = "ONE"
v2.TWO = 1
v1[1] = "TWO"
v2.THREE = 2
v1[2] = "THREE"
v2.FOUR = 3
v1[3] = "FOUR"
v2.FIVE = 4
v1[4] = "FIVE"
v2.SIX = 5
v1[5] = "SIX"
v2.SEVEN = 6
v1[6] = "SEVEN"
v2.EIGHT = 7
v1[7] = "EIGHT"
v2.NINE = 8
v1[8] = "NINE"
v2.MAX = 9
v1[9] = "MAX"
local v3 = Color3.fromRGB(255, 98, 33)
local v4 = {
    ["HornsColor"] = Color3.fromRGB(99, 72, 255),
    ["LegsColor"] = Color3.fromRGB(157, 86, 232),
    ["LevelIndicatorColor"] = Color3.fromRGB(102, 74, 164),
    ["ParticleColor"] = ColorSequence.new(Color3.fromRGB(117, 48, 255), Color3.fromRGB(193, 92, 255))
}
local v5 = {
    ["blockHealth"] = 60,
    ["damagePerSecond"] = 3,
    ["attackDuration"] = 2,
    ["enterSearchRadius"] = 15,
    ["blastResistance"] = false
}
local u6 = {
    [v2.ONE] = v5,
    [v2.TWO] = {
        ["blockHealth"] = 10,
        ["damagePerSecond"] = 0,
        ["attackDuration"] = 0,
        ["enterSearchRadius"] = 0,
        ["blastResistance"] = false
    },
    [v2.THREE] = {
        ["blockHealth"] = 10,
        ["damagePerSecond"] = 1,
        ["attackDuration"] = 0,
        ["enterSearchRadius"] = 0,
        ["blastResistance"] = false
    },
    [v2.FOUR] = {
        ["blockHealth"] = 10,
        ["damagePerSecond"] = 1,
        ["attackDuration"] = 1,
        ["enterSearchRadius"] = 1.5,
        ["blastResistance"] = false
    },
    [v2.FIVE] = {
        ["blockHealth"] = 10,
        ["damagePerSecond"] = 1,
        ["attackDuration"] = 0,
        ["enterSearchRadius"] = 0,
        ["blastResistance"] = false
    },
    [v2.SIX] = {
        ["blockHealth"] = 10,
        ["damagePerSecond"] = 1,
        ["attackDuration"] = 1,
        ["enterSearchRadius"] = 1.5,
        ["blastResistance"] = false
    },
    [v2.SEVEN] = {
        ["blockHealth"] = 15,
        ["damagePerSecond"] = 1,
        ["attackDuration"] = 0,
        ["enterSearchRadius"] = 0,
        ["blastResistance"] = false
    },
    [v2.EIGHT] = {
        ["blockHealth"] = 15,
        ["damagePerSecond"] = 2,
        ["attackDuration"] = 1,
        ["enterSearchRadius"] = 1.5,
        ["blastResistance"] = false
    },
    [v2.NINE] = {
        ["blockHealth"] = 20,
        ["damagePerSecond"] = 3,
        ["attackDuration"] = 1,
        ["enterSearchRadius"] = 0,
        ["blastResistance"] = false
    },
    [v2.MAX] = {
        ["blockHealth"] = 50,
        ["damagePerSecond"] = 5,
        ["attackDuration"] = 3,
        ["enterSearchRadius"] = 3,
        ["blastResistance"] = true
    }
}
return {
    ["FireSheepLevel"] = v2,
    ["FireSheepLevelColor"] = v3,
    ["MaxedFireSheep"] = v4,
    ["FIRE_SHEEP_BASE_STATS"] = v5,
    ["FireSheepLevelMeta"] = u6,
    ["getSheepLevelMeta"] = function(p7) --[[ Line: 121 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        return u6[p7]
    end
}
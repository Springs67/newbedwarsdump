local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class").BedwarsClass
local u4 = {
    [v3.MISC] = {
        ["display"] = "Misc",
        ["description"] = "",
        ["imageId"] = ""
    },
    [v3.DEFENDER] = {
        ["display"] = "Defender",
        ["description"] = "Defend your bed!",
        ["imageId"] = v2.DEFENDER_KIT_ICON
    },
    [v3.ECONOMY] = {
        ["display"] = "Economy",
        ["description"] = "Get extra resources!",
        ["imageId"] = v2.ECONOMY_KIT_ICON
    },
    [v3.FIGHTER] = {
        ["display"] = "Fighter",
        ["description"] = "Brawl other players!",
        ["imageId"] = v2.FIGHTER_KIT_ICON
    },
    [v3.MOVEMENT] = {
        ["display"] = "Movement",
        ["description"] = "Reposition quickly!",
        ["imageId"] = v2.MOVEMENT_KIT_ICON
    },
    [v3.DESTROYER] = {
        ["display"] = "Destroyer",
        ["description"] = "Destroy enemy beds!",
        ["imageId"] = v2.DESTROYER_KIT_ICON
    },
    [v3.SUPPORT] = {
        ["display"] = "Support",
        ["description"] = "Empower your team!",
        ["imageId"] = v2.SUPPORT_KIT_ICON
    },
    [v3.TANK] = {
        ["display"] = "Tank",
        ["description"] = "Protect yourself from damage!",
        ["imageId"] = v2.TANK_KIT_ICON
    },
    [v3.RANGED] = {
        ["display"] = "Ranged",
        ["description"] = "Attack players with projectiles!",
        ["imageId"] = v2.RANGED_KIT_ICON
    }
}
return {
    ["getBedwarsClassMeta"] = function(p5) --[[ Name: getBedwarsClassMeta, Line 52 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        return u4[p5]
    end,
    ["BedwarsClassMeta"] = u4
}
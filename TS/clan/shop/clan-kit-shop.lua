local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
return {
    ["ClanKitShop"] = {
        ["maxStock"] = 3,
        ["reqClanLevel"] = 3,
        ["reqRank"] = v3.ADMIN,
        ["priceMultiplier"] = 7,
        ["kitPool"] = {
            v2.FARMER_CLETUS,
            v2.GRIM_REAPER,
            v2.BARBARIAN,
            v2.BAKER,
            v2.ARCHER,
            v2.ANGEL,
            v2.BIGMAN,
            v2.COWGIRL,
            v2.WIZARD,
            v2.SHIELDER,
            v2.BUILDER,
            v2.DASHER,
            v2.DAVEY,
            v2.MELODY,
            v2.SPIRIT_ASSASSIN,
            v2.CYBER,
            v2.MINER,
            v2.ICE_QUEEN,
            v2.AXOLOTL,
            v2.NECROMANCER,
            v2.HANNAH,
            v2.TALIYAH
        },
        ["getKitShopKitPrice"] = function(p5) --[[ Name: getKitShopKitPrice, Line 36 ]]
            --[[
            Upvalues:
                [1] = u4
            --]]
            return u4.calcClanMaxDailyCoins(p5) * 7
        end
    }
}
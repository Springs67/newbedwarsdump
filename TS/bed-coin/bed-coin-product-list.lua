local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimPackType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "devproduct").DevProduct
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local v7 = {}
local u8 = {
    {
        ["name"] = "Farmer Cletus Kit",
        ["cost"] = 10000,
        ["purchaseData"] = {
            ["productType"] = "Kit",
            ["kitProductId"] = v6.isProduction() and 18876495 or 18875964
        }
    }
}
local v9 = {
    ["name"] = "Barbarian",
    ["cost"] = 10000
}
local v10 = {
    ["productType"] = "Kit"
}
v6.isProduction()
local v11 = 19551065
v10.kitProductId = v11
v9.purchaseData = v10
u8[3] = v9
local v12 = {
    ["name"] = "Builder",
    ["cost"] = 10000
}
local v13 = {
    ["productType"] = "Kit"
}
v6.isProduction()
local v14 = 19088340
v13.kitProductId = v14
v12.purchaseData = v13
u8[4] = v12
u8[5] = {
    ["name"] = "Baker",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v6.isProduction() and 19086951 or 19088230
    }
}
local v15 = {
    ["name"] = "Archer",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v6.isProduction() and 19275795 or 19088230
    }
}
u8[6] = v15
local v16 = {
    ["name"] = "Infernal Shielder",
    ["cost"] = 10000
}
local v17 = {
    ["productType"] = "Kit"
}
v6.isProduction()
local v18 = 19546564
v17.kitProductId = v18
v16.purchaseData = v17
u8[7] = v16
local v19 = {
    ["name"] = "Melody",
    ["cost"] = 10000
}
local v20 = {
    ["productType"] = "Kit"
}
v6.isProduction()
local v21 = 19722364
v20.kitProductId = v21
v19.purchaseData = v20
u8[8] = v19
local v22 = {
    ["name"] = "Pirate Davey",
    ["cost"] = 10000
}
local v23 = {
    ["productType"] = "Kit"
}
v6.isProduction()
local v24 = 20030035
v23.kitProductId = v24
v22.purchaseData = v23
u8[9] = v22
local v25 = {
    ["name"] = "Eldertree",
    ["cost"] = 10000
}
local v26 = {
    ["productType"] = "Kit"
}
v6.isProduction()
local v27 = 20245233
v26.kitProductId = v27
v25.purchaseData = v26
u8[10] = v25
u8[11] = {
    ["name"] = "Lassy",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v6.isProduction() and 20645574 or 20245233
    }
}
u8[12] = {
    ["name"] = "Grim Reaper",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = 20872871
    }
}
u8[13] = {
    ["name"] = "Zeno (Wizard)",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = 21261740
    }
}
u8[14] = {
    ["name"] = "Vulcan",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = 21421966
    }
}
local v28 = {
    ["name"] = "Trinity",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v6.isProduction() and 1207029649 or 1206777428
    }
}
u8[15] = v28
u8[16] = {
    ["name"] = "Axolotl Amy",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = 24393543
    }
}
u8[17] = {
    ["name"] = "Vanessa",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = 24913310
    }
}
u8[18] = {
    ["name"] = "Freiya",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = 25647124
    }
}
u8[19] = {
    ["name"] = "Yuzi",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = 28594502
    }
}
u8[20] = {
    ["name"] = "Miner",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.MINER
    }
}
u8[21] = {
    ["name"] = "Cyber",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = 42490369
    }
}
u8[22] = {
    ["name"] = "Evelynn",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.EVELYNN
    }
}
u8[23] = {
    ["name"] = "Hannah",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = 83730490
    }
}
u8[24] = {
    ["name"] = "Crypt",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = 97149830
    }
}
u8[25] = {
    ["name"] = "Zenith",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = 104797973
    }
}
u8[26] = {
    ["name"] = "Adetunde",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = 111620008
    }
}
u8[27] = {
    ["name"] = "Lyla",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = 169772861
    }
}
u8[28] = {
    ["name"] = "Milo",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = 255781462
    }
}
u8[29] = {
    ["name"] = "Eldric",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = 641095710
    }
}
u8[30] = {
    ["name"] = "Lian",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.LIAN
    }
}
u8[31] = {
    ["name"] = "Triton",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.TRITON
    }
}
u8[32] = {
    ["name"] = "Marina",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.MARINA_KIT
    }
}
u8[33] = {
    ["name"] = "Nazar",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.NAZAR_KIT
    }
}
u8[34] = {
    ["name"] = "Wren",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.WREN_KIT
    }
}
u8[35] = {
    ["name"] = "Death Adder",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.SORCERER_KIT
    }
}
u8[36] = {
    ["name"] = "Silas",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.SILAS_KIT
    }
}
u8[37] = {
    ["name"] = "Kaida",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.SUMMONER_KIT
    }
}
u8[38] = {
    ["name"] = "Randomized Armor Trim",
    ["cost"] = 1500,
    ["purchaseData"] = {
        ["productType"] = "RandomArmorTrim",
        ["packType"] = v2.ALL_RANDOM
    }
}
u8[39] = {
    ["name"] = "Arachne",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.ARACHNE_KIT
    }
}
u8[40] = {
    ["name"] = "Bekzat",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.BEKZAT_KIT
    }
}
u8[41] = {
    ["name"] = "Agni",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.AGNI_KIT
    }
}
u8[42] = {
    ["name"] = "Nyoka",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.NYOKA_KIT
    }
}
u8[43] = {
    ["name"] = "Hephaestus",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.HEPHAESTUS_KIT
    }
}
u8[44] = {
    ["name"] = "Styx",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.STYX_KIT
    }
}
u8[45] = {
    ["name"] = "Grove",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.GROVE_KIT
    }
}
u8[46] = {
    ["name"] = "Void Knight",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.VOID_KNIGHT_KIT
    }
}
u8[47] = {
    ["name"] = "Critter",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.SPIRIT_CRITTER_KIT
    }
}
u8[48] = {
    ["name"] = "Skoll",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.SKOLL_KIT
    }
}
u8[49] = {
    ["name"] = "Trixie",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v5.TRIXIE_KIT
    }
}
u8[50] = {
    ["name"] = "Rent Kit (Normal) (3 Days)",
    ["cost"] = 1500,
    ["purchaseData"] = {
        ["productType"] = "RentKit",
        ["rentalPass"] = v3.KIT_RENTAL_NORMAL
    }
}
u8[51] = {
    ["name"] = "Rent Kit (Battlepass) (3 Days)",
    ["cost"] = 2000,
    ["purchaseData"] = {
        ["productType"] = "RentKit",
        ["rentalPass"] = v3.KIT_RENTAL_BATTLEPASS_7
    }
}
u8[52] = {
    ["name"] = "Rent Kit (Limited) (3 Days)",
    ["cost"] = 2500,
    ["purchaseData"] = {
        ["productType"] = "RentKit",
        ["rentalPass"] = v3.KIT_RENTAL_ALL_7
    }
}
u8[53] = {
    ["name"] = "Ramil",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v4.SANDBENDER_KIT
    }
}
u8[54] = {
    ["name"] = "Nahla",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v4.OASIS_KIT
    }
}
u8[55] = {
    ["name"] = "Martin",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v4.CACTUS_KIT
    }
}
u8[56] = {
    ["name"] = "Abaddon",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v4.ABADDON_KIT
    }
}
u8[57] = {
    ["name"] = "Zarrah",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v4.ZARRAH_KIT
    }
}
u8[58] = {
    ["name"] = "Kit Contract Premium Tiers Unlock",
    ["cost"] = 5000,
    ["purchaseData"] = {
        ["productType"] = "KitContract"
    }
}
u8[59] = {
    ["name"] = "Common Emote",
    ["cost"] = 1700,
    ["purchaseData"] = {
        ["productType"] = "DailyStoreItem"
    }
}
u8[60] = {
    ["name"] = "Common Lobby Gadget",
    ["cost"] = 2400,
    ["purchaseData"] = {
        ["productType"] = "DailyStoreItem"
    }
}
u8[61] = {
    ["name"] = "Common Animated Emote",
    ["cost"] = 3600,
    ["purchaseData"] = {
        ["productType"] = "DailyStoreItem"
    }
}
u8[62] = {
    ["name"] = "Common Bed Break Effect",
    ["cost"] = 4800,
    ["purchaseData"] = {
        ["productType"] = "DailyStoreItem"
    }
}
u8[63] = {
    ["name"] = "Common Kill Effect",
    ["cost"] = 4800,
    ["purchaseData"] = {
        ["productType"] = "DailyStoreItem"
    }
}
u8[64] = {
    ["name"] = "Daily Store Item Refresh",
    ["cost"] = 300,
    ["purchaseData"] = {
        ["productType"] = "DailyStoreItemRefresh"
    }
}
u8[65] = {
    ["name"] = "Common Bed Skin",
    ["cost"] = 6000,
    ["purchaseData"] = {
        ["productType"] = "DailyStoreItem"
    }
}
u8[66] = {
    ["name"] = "Marrow",
    ["cost"] = 10000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v4.SKELETON_KIT
    }
}
u8[67] = {
    ["name"] = "Randomized Beginner Armor Trim",
    ["cost"] = 1500,
    ["purchaseData"] = {
        ["productType"] = "RandomArmorTrim",
        ["packType"] = v2.BEGINNER
    }
}
u8[68] = {
    ["name"] = "Randomized Elemental Armor Trim",
    ["cost"] = 3500,
    ["purchaseData"] = {
        ["productType"] = "RandomArmorTrim",
        ["packType"] = v2.ELEMENTAL
    }
}
u8[69] = {
    ["name"] = "Randomized Spirit vs. Void Armor Trim",
    ["cost"] = 3500,
    ["purchaseData"] = {
        ["productType"] = "RandomArmorTrim",
        ["packType"] = v2.SPIRIT_VS_VOID
    }
}
u8[70] = {
    ["name"] = "Randomized Halloween Armor Trim",
    ["cost"] = 3500,
    ["purchaseData"] = {
        ["productType"] = "RandomArmorTrim",
        ["packType"] = v2.HALLOWEEN
    }
}
u8[71] = {
    ["name"] = "Zola",
    ["cost"] = 12000,
    ["purchaseData"] = {
        ["productType"] = "Kit",
        ["kitProductId"] = v4.SOUL_BROKER_KIT
    }
}
v7.products = u8
function v7.getProductInfo(p29) --[[ Line: 567 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return u8[p29]
end
return {
    ["BedCoinProductList"] = v7
}
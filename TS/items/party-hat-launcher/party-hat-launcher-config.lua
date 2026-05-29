local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local v4 = {}
local u5 = {
    ["PIRATE_HAT"] = v3.Assets.Misc.PirateHat,
    ["ANNIVERSARY_HAT_ONE"] = v3.Assets.Misc.ThirdAnniversary.ThirdAnniversaryHatOne,
    ["ANNIVERSARY_HAT_TWO"] = v3.Assets.Misc.ThirdAnniversary.ThirdAnniversaryHatTwo,
    ["ANNIVERSARY_HAT_THREE"] = v3.Assets.Misc.ThirdAnniversary.ThirdAnniversaryHatThree,
    ["GOLD_CROWN"] = v3.Assets.Misc.GoldCrownWearable,
    ["FROSTY_HAT"] = v3.Assets.Misc.FrostyHat,
    ["AERY_CROWN"] = v3.Assets.Misc.AeryCrown,
    ["MAGE_HAT"] = v3.Assets.Misc.MageHatWearable,
    ["LIFE_RING_HAT"] = v3.Assets.Misc.LifeRingHat,
    ["LASSY_HAT"] = v3.Assets.Misc.LassyHat,
    ["FARMER_HAT"] = v3.Assets.Misc.FarmerHat,
    ["SHOPKEEPER_HAT"] = v3.Assets.Misc.ShopkeeperHat,
    ["DOUG_HAT"] = v3.Assets.Misc.DougHat,
    ["MAILMAN_HAT"] = v3.Assets.Misc.MailManHat
}
function v4.getRandomPartyHat() --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
    --]]
    local v6 = u2.keys(u5)
    return u5[v6[math.random(0, #v6 - 1) + 1]]
end
return {
    ["PartyHatLauncherConfig"] = v4
}
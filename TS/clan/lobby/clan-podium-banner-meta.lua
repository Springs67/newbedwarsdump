local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "lobby", "clan-podium-banner-types").ClanPodiumBannerType
local u4 = {
    [v3.DEFAULT] = {
        ["title"] = "Goldcrest Banner (Default)",
        ["iconId"] = "rbxassetid://83142082897149",
        ["model"] = v2.Assets.Misc.ClanPodiumBanners.Goldcrest
    },
    [v3.ARCANE] = {
        ["title"] = "Arcane Banner",
        ["iconId"] = "rbxassetid://132535377313294",
        ["model"] = v2.Assets.Misc.ClanPodiumBanners.Arcane
    },
    [v3.BLOODFANG] = {
        ["title"] = "Bloodfang Banner",
        ["iconId"] = "rbxassetid://97313971746260",
        ["model"] = v2.Assets.Misc.ClanPodiumBanners.Bloodfang
    },
    [v3.VERDANTGUARD] = {
        ["title"] = "Verdantguard Banner",
        ["iconId"] = "rbxassetid://90925934189459",
        ["model"] = v2.Assets.Misc.ClanPodiumBanners.Verdantguard
    },
    [v3.ROYALCROWN] = {
        ["title"] = "Royalcrown Banner",
        ["iconId"] = "rbxassetid://94632790820868",
        ["model"] = v2.Assets.Misc.ClanPodiumBanners.Royalcrown
    }
}
return {
    ["getClanPodiumBannerMeta"] = function(p5) --[[ Name: getClanPodiumBannerMeta, Line 32 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        return u4[p5]
    end,
    ["ClanPodiumBannerMeta"] = u4
}
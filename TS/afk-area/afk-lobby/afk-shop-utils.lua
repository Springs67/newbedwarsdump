local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-item").AfkShopItem
local v2 = {
    ["name"] = "AFK Shop",
    ["navbarImage"] = "rbxassetid://16214027072",
    ["currencyIcon"] = "rbxassetid://16384952405",
    ["currencyName"] = "AFK Coins",
    ["npcConfig"] = {
        ["NpcName"] = "wizard",
        ["NpcAnimation"] = "rbxassetid://507770239",
        ["NpcSecondaryAnimation"] = "rbxassetid://2510196951"
    },
    ["shop"] = {
        ["name"] = "AFK Shop",
        ["items"] = {
            v1.PILLOW,
            v1.PILLOW_KILL_EFFECT,
            v1.KING_OF_AFK_TITLE,
            v1.PILLOW_SMASH_EMOTE,
            v1.BRB_SIGN,
            v1.PILLOW_BED_BREAK_EFFECT,
            v1.YAWN_EMOTE,
            v1.AFK_EMOTE,
            v1.BRB_EMOTE,
            v1.SLEEP_EMOTE,
            v1.MINI_COPTER,
            v1.MINI_POTION,
            v1.BIG_POTION
        }
    },
    ["missions"] = {
        {
            ["id"] = "afk_mission_1",
            ["name"] = ""
        }
    }
}
local v3 = {}
local v4 = setmetatable({}, {
    ["__index"] = v3
})
v4.LEGENDARY = "legendary"
v3.legendary = "LEGENDARY"
return {
    ["AfkShopUtils"] = v2,
    ["AfkShopItemTier"] = v4,
    ["getItemColorRarity"] = function(p5) --[[ Line: 32 ]]
        if p5 >= 99999 then
            return Color3.fromRGB(255, 59, 59)
        elseif p5 >= 50000 then
            return Color3.fromRGB(242, 255, 95)
        elseif p5 >= 10000 then
            return Color3.fromRGB(95, 169, 255)
        elseif p5 >= 5000 then
            return Color3.fromRGB(79, 255, 107)
        else
            return Color3.fromHex("#FFFFFF")
        end
    end
}
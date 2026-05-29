local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-categories").DamageCategory
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType
local u7 = {
    [v6.SNOWBALL] = {
        ["categories"] = { v5.PROJECTILE }
    },
    [v6.POISON] = {
        ["categories"] = { v5.NO_APPLY_ENCHANT, v5.REPEATING }
    },
    [v6.BURN] = {
        ["categories"] = { v5.NO_APPLY_ENCHANT, v5.REPEATING },
        ["killFeedIcon"] = v2.killfeed.fire
    },
    [v6.STATIC] = {
        ["categories"] = { v5.NO_APPLY_ENCHANT, v5.ELECTRIC_WITH_ZAPPED_3 }
    },
    [v6.WIND] = {
        ["categories"] = { v5.NO_APPLY_ENCHANT }
    },
    [v6.BLEED] = {
        ["categories"] = { v5.NO_APPLY_ENCHANT, v5.REPEATING }
    },
    [v6.POGO_STICK] = {
        ["killFeedIcon"] = "rbxassetid://100881763858968"
    },
    [v6.VOID] = {
        ["killFeedIcon"] = v2.killfeed.fall_damage
    },
    [v6.FALL] = {
        ["killFeedIcon"] = v2.killfeed.fall_damage
    },
    [v6.PROJECTILE] = {
        ["categories"] = { v5.PROJECTILE },
        ["killFeedIcon"] = v2.killfeed.bow
    },
    [v6.SWORD] = {
        ["killFeedIcon"] = v2.killfeed.sword
    },
    [v6.TNT] = {
        ["killFeedIcon"] = v2.killfeed.bomb
    },
    [v6.MINIGAME_DAMAGE] = {
        ["killFeedIcon"] = v2.killfeed.storm
    },
    [v6.SNOWBOARDING_MINIGAME_AVALANCHE] = {
        ["name"] = "Avalanche",
        ["killFeedIcon"] = v2.killfeed.storm
    },
    [v6.VOID_TITANS_BLESSING] = {
        ["categories"] = { v5.TRUE_DAMAGE, v5.REPEATING }
    },
    [v6.TESLA_TRAP] = {
        ["categories"] = { v5.ELECTRIC_WITH_ZAPPED_3 },
        ["killFeedIcon"] = v3(v4.TESLA_TRAP).image
    },
    [v6.ZOMBIE_DISCHARGE_LIGHTNING] = {
        ["categories"] = { v5.ELECTRIC_WITH_ZAPPED_3 }
    },
    [v6.JELLYFISH_ZAP] = {
        ["killFeedIcon"] = "rbxassetid://18129975091",
        ["categories"] = { v5.ELECTRIC_WITH_ZAPPED_3 }
    },
    [v6.GATHER_BOT_ZAP] = {
        ["categories"] = { v5.ELECTRIC_WITH_ZAPPED_3 }
    },
    [v6.WIZARD_LIGHTNING_STRIKE] = {
        ["categories"] = { v5.ELECTRIC_WITH_ZAPPED_3 }
    },
    [v6.SAND_TORNADO] = {
        ["killFeedIcon"] = v2.AIRBENDER_SANDSTORM_ABILITY_ICON
    },
    [v6.SOUL_LINK] = {
        ["killFeedIcon"] = v2.SOUL_LINK_KILL_FEED_ICON,
        ["categories"] = { v5.NO_APPLY_ENCHANT }
    }
}
return {
    ["DamageTypeMeta"] = u7,
    ["getDamageTypeMeta"] = function(p8) --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        return u7[p8]
    end
}
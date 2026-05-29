local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets")
local v4 = v3.getEmoteAsset
local v5 = v3.getEmoteAssetFromString
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type")
local v10 = v9.EmoteDisplayType
local v11 = v9.EmoteType
local v12 = {
    [v11.BED_BREAK] = {
        ["name"] = "Bed Break",
        ["image"] = "rbxassetid://7336098864",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.NONE] = {
        ["name"] = "None",
        ["image"] = "",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.LUNAR_TIGER_BUILDER] = {
        ["name"] = "Lunar Tiger Builder",
        ["image"] = "rbxassetid://8661722623",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.VULCAN_LANTERN] = {
        ["name"] = "Vulcan Lanterns",
        ["image"] = "rbxassetid://8665895935",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.RED_ENVELOPE] = {
        ["name"] = "Red Envelope",
        ["image"] = "rbxassetid://8665788222",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.LNY_2022] = {
        ["name"] = "Lunar New Year 2022",
        ["image"] = "rbxassetid://8665896822",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.PENGUIN_FALL] = {
        ["name"] = "Penguin Fall",
        ["image"] = "rbxassetid://8598813534",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.PENGUIN_DISCO] = {
        ["name"] = "Penguin Disco",
        ["image"] = "rbxassetid://8605003980",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.CLETUS_CARROT] = {
        ["name"] = "Cletus Carrot",
        ["image"] = "rbxassetid://7244029172",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.WIZARD_READING_YOU] = {
        ["name"] = "Wizard Reading You",
        ["image"] = "rbxassetid://7336095637",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.WINSTREAK_PLUS_ONE] = {
        ["name"] = "Winstreak +1",
        ["image"] = "rbxassetid://7336095844",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.VULCAN_LETS_GO] = {
        ["name"] = "Vulcan Let\'s Go!",
        ["image"] = "rbxassetid://7336096035",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.VULCAN_HEART] = {
        ["name"] = "Vulcan Love",
        ["image"] = "rbxassetid://7336096303",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.VULCAN_GG] = {
        ["name"] = "Vulcan GG",
        ["image"] = "rbxassetid://7336096512",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.SHIELDER_CLAP] = {
        ["name"] = "Shielder Clap",
        ["image"] = "rbxassetid://7336096676",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.PIRATE_BALLOONS] = {
        ["name"] = "Balloon Expert",
        ["image"] = "rbxassetid://7336096806",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.MELODY_TUNES] = {
        ["name"] = "Melody Tunes",
        ["image"] = "rbxassetid://7336096914",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.MELODY_DIAMOND] = {
        ["name"] = "Diamond Lover",
        ["image"] = "rbxassetid://7346354284",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.CRY_ABOUT_IT] = {
        ["name"] = "Cry About It",
        ["image"] = "rbxassetid://7336097326",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.LASSY_EMERALDS] = {
        ["name"] = "Emerald Collector",
        ["image"] = "rbxassetid://7336097554",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.LASSY_CAPTURE] = {
        ["name"] = "Roped",
        ["image"] = "rbxassetid://7336097697",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.GRIM_REAPER_LANTERN] = {
        ["name"] = "Grim Reaper Lantern",
        ["image"] = "rbxassetid://7336097765",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.EMERALD_CHEST] = {
        ["name"] = "Emerald Chest",
        ["image"] = "rbxassetid://7336097972",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.ELDER_TREE] = {
        ["name"] = "Forest Eldertree",
        ["image"] = "rbxassetid://7336098084",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.CUTE_GRIM_REAPER] = {
        ["name"] = "Adorable Grim Reaper",
        ["image"] = "rbxassetid://7336098199",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.CHUNKY_ELDER_TREE] = {
        ["name"] = "Chonky Eldertree",
        ["image"] = "rbxassetid://7336098364",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.BUILDER_SPARKLE] = {
        ["name"] = "Builder Sparkle",
        ["image"] = "rbxassetid://7336098452",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.BUILDER_HAMMER] = {
        ["name"] = "Builder Hammer",
        ["image"] = "rbxassetid://7336098606",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.BANANA_BARBARIAN] = {
        ["name"] = "Banana Barbarian",
        ["image"] = "rbxassetid://7336099010",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.ARCHER_CHEERS] = {
        ["name"] = "Cheers!",
        ["image"] = "rbxassetid://7336099175",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.BABY_DODO] = {
        ["name"] = "Baby Dodo",
        ["image"] = "rbxassetid://7804181940",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.BED_BREAKER] = {
        ["name"] = "Bed Breaker",
        ["image"] = "rbxassetid://7804181847",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.BED_KING] = {
        ["name"] = "Bed Camper",
        ["image"] = "rbxassetid://7804181673",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.BEE_CUTE] = {
        ["name"] = "Bee Cute",
        ["image"] = "rbxassetid://7804181490",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.BEEKEEPER_EMERALD] = {
        ["name"] = "Beemerald",
        ["image"] = "rbxassetid://7804181315",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.BOUNTY_HUNTER] = {
        ["name"] = "Bounty Hunter On The Move",
        ["image"] = "rbxassetid://7804181091",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.CONTROLLING_REAPER] = {
        ["name"] = "Controlling Reaper",
        ["image"] = "rbxassetid://7804180870",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.DEAD_BAKER] = {
        ["name"] = "Dead Baker",
        ["image"] = "rbxassetid://7804180714",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.HEADLESS_CLETUS] = {
        ["name"] = "Headless Cletus",
        ["image"] = "rbxassetid://7804180489",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.JADE_VAMPIRE] = {
        ["name"] = "Vampire Jade",
        ["image"] = "rbxassetid://7804180318",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.NO_BULLY] = {
        ["name"] = "No Bully",
        ["image"] = "rbxassetid://7804180194",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.RAVEN_FLOWER] = {
        ["name"] = "Raven\'s Flower",
        ["image"] = "rbxassetid://7804180067",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.RAVEN_KNIFE] = {
        ["name"] = "Knifed up Raven",
        ["image"] = "rbxassetid://7804179857",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.READY_UP] = {
        ["name"] = "Ready Up!",
        ["image"] = "rbxassetid://7804179628",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.REAPER_SMILE] = {
        ["name"] = "Reaper Smile",
        ["image"] = "rbxassetid://7804179416",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.SPOOKY] = {
        ["name"] = "Spooky",
        ["image"] = "rbxassetid://7804179196",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.SURRENDER] = {
        ["name"] = "Surrender",
        ["image"] = "rbxassetid://7804178936",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.VULCAN_ERROR] = {
        ["name"] = "Vulcan Error",
        ["image"] = "rbxassetid://7804178661",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.VULCAN_GRAVE] = {
        ["name"] = "Vulcan Grave",
        ["image"] = "rbxassetid://7804178441",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.WAITING_ON_IRON] = {
        ["name"] = "Waiting on Iron",
        ["image"] = "rbxassetid://7804178221",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.ZOMBIE_MELODY] = {
        ["name"] = "Zombie Melody",
        ["image"] = "rbxassetid://7804177994",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.ZOMBIE_BARBARIAN] = {
        ["name"] = "Zombie Barbarian",
        ["image"] = "rbxassetid://7813486576",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.HAPPY_GOMPY] = {
        ["name"] = "Happy Gompy",
        ["image"] = "rbxassetid://7941918004",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.FISHERMAN] = {
        ["name"] = "Fisherman",
        ["image"] = "rbxassetid://7941918308",
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.ANGRY_BUILDER] = {
        ["name"] = "Angry Builder",
        ["image"] = v4(v11.ANGRY_BUILDER),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.ARCHER] = {
        ["name"] = "Archer Angry",
        ["image"] = v4(v11.ARCHER),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.ARSON] = {
        ["name"] = "Arson Amy",
        ["image"] = v4(v11.ARSON),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.AXOLOTL_SLEEPING] = {
        ["name"] = "Axolotl Sleeping",
        ["image"] = v4(v11.AXOLOTL_SLEEPING),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.AXOLOTLS] = {
        ["name"] = "Axolotls",
        ["image"] = v4(v11.AXOLOTLS),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.BAKER_THUMBS_UP] = {
        ["name"] = "Baker Thumbs Up",
        ["image"] = v4(v11.BAKER_THUMBS_UP),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.BALLOONS] = {
        ["name"] = "Balloons",
        ["image"] = v4(v11.BALLOONS),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.BEE] = {
        ["name"] = "Been Chillin\'",
        ["image"] = v4(v11.BEE),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.BOO] = {
        ["name"] = "Boo",
        ["image"] = v4(v11.BOO),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.CHRISTMAS_ROCKET] = {
        ["name"] = "Christmas Rocket",
        ["image"] = v4(v11.CHRISTMAS_ROCKET),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.DUO] = {
        ["name"] = "Duo",
        ["image"] = v4(v11.DUO),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.EMERALD_ARMOR] = {
        ["name"] = "Emerald Armor",
        ["image"] = v4(v11.EMERALD_ARMOR),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.FREIYA] = {
        ["name"] = "Freiya Smile",
        ["image"] = v4(v11.FREIYA),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.FREIYA_2] = {
        ["name"] = "Freiya Hoodie",
        ["image"] = v4(v11.FREIYA_2),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.FREIYA_SNOWMAN] = {
        ["name"] = "Freiya Snowman",
        ["image"] = v4(v11.FREIYA_SNOWMAN),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.HEART] = {
        ["name"] = "Ghosty Love",
        ["image"] = v4(v11.HEART),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.LUCKY_GIFT] = {
        ["name"] = "Lucky Block Gift",
        ["image"] = v4(v11.LUCKY_GIFT),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.PYRO_COAL] = {
        ["name"] = "Pyro Coal",
        ["image"] = v4(v11.PYRO_COAL),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.RAVEN_SKETCH] = {
        ["name"] = "Raven Sketch",
        ["image"] = v4(v11.RAVEN_SKETCH),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.REAPER_GIFT] = {
        ["name"] = "Reaper Gift",
        ["image"] = v4(v11.REAPER_GIFT),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.SAD_GOMPY] = {
        ["name"] = "Sad Gompy",
        ["image"] = v4(v11.SAD_GOMPY),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.SELFIE] = {
        ["name"] = "Christmas Selfie",
        ["image"] = v4(v11.SELFIE),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.STOCKING] = {
        ["name"] = "Stocking",
        ["image"] = v4(v11.STOCKING),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.TEAMWORK] = {
        ["name"] = "Spirit Catcher Teamwork",
        ["image"] = v4(v11.TEAMWORK),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.WINSTREAK] = {
        ["name"] = "Winstreak",
        ["image"] = v4(v11.WINSTREAK),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.WORM_FARMER] = {
        ["name"] = "Worm Farmer Cletus",
        ["image"] = v4(v11.WORM_FARMER),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.ELDERTREE_GG] = {
        ["name"] = "Eldertree GG",
        ["image"] = v4(v11.ELDERTREE_GG),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.FREIYA_3] = {
        ["name"] = "Freiya Snowflake",
        ["image"] = v4(v11.FREIYA_3),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.CHRISTMAS_TREE] = {
        ["name"] = "Christmas Tree",
        ["image"] = v4(v11.CHRISTMAS_TREE),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    },
    [v11.CHRISTMAS_DODO] = {
        ["name"] = "Christmas Dodo",
        ["image"] = v4(v11.CHRISTMAS_DODO),
        ["emoteDisplayType"] = v10.IMAGE_DEFAULT
    }
}
local v13 = v11.ROCK_OUT
local v14 = {
    ["name"] = "Rock Out",
    ["joinable"] = true,
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.ROCK_OUT
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = "rbxassetid://1837546019",
            ["config"] = {
                ["looped"] = true
            }
        }
    }
}
v12[v13] = v14
local v15 = v11.PARTY_UP
local v16 = {
    ["name"] = "Party Up",
    ["joinable"] = true,
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.PARTY_UP
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = "rbxassetid://9040055917",
            ["config"] = {
                ["looped"] = true
            }
        }
    }
}
v12[v15] = v16
local v17 = v11.SIDE_TO_SIDE
local v18 = {
    ["name"] = "Side to Side",
    ["joinable"] = true,
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.SIDE_TO_SIDE
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = "rbxassetid://1846890625",
            ["config"] = {
                ["looped"] = true
            }
        }
    }
}
v12[v17] = v18
v12[v11.ACADEMY_AERY_GL] = {
    ["name"] = "Aery Good Luck",
    ["image"] = v4(v11.ACADEMY_AERY_GL),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ACADEMY_AERY_READ] = {
    ["name"] = "Aery Read",
    ["image"] = v4(v11.ACADEMY_AERY_READ),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.AERY_KILLER_INSTINCT] = {
    ["name"] = "Killer Instinct Aery",
    ["image"] = v4(v11.AERY_KILLER_INSTINCT),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.AERY_PRO] = {
    ["name"] = "Pro Aery",
    ["image"] = v4(v11.AERY_PRO),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.AERY_WINSTREAK] = {
    ["name"] = "Aery Winstreak",
    ["image"] = v4(v11.AERY_WINSTREAK),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.AMY_NO] = {
    ["name"] = "Amy No",
    ["image"] = v4(v11.AMY_NO),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ARCHER_THUMBS_DOWN] = {
    ["name"] = "Thumbs Down",
    ["image"] = v4(v11.ARCHER_THUMBS_DOWN),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BARBARIAN_ENRAGED] = {
    ["name"] = "Barbarian Rage",
    ["image"] = v4(v11.BARBARIAN_ENRAGED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BARBARIAN_WAVE] = {
    ["name"] = "Barbarian Wave",
    ["image"] = v4(v11.BARBARIAN_WAVE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BUILDER_SPEECHLESS] = {
    ["name"] = "Builder Speechless",
    ["image"] = v4(v11.BUILDER_SPEECHLESS),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.CLAN_INVITE] = {
    ["name"] = "Clan Invite",
    ["image"] = v4(v11.CLAN_INVITE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.DE_VANESSA_SPEECHLESS] = {
    ["name"] = "Vanessa Speechless",
    ["image"] = v4(v11.DE_VANESSA_SPEECHLESS),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.DONT_RUSH_ME_PLS] = {
    ["name"] = "Don\'t Rush Me Pls",
    ["image"] = v4(v11.DONT_RUSH_ME_PLS),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.DUCK_CELEBRATION] = {
    ["name"] = "Duck Celebration",
    ["image"] = v4(v11.DUCK_CELEBRATION),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ELDER_TREE_INJURED] = {
    ["name"] = "Injured",
    ["image"] = "rbxassetid://11695282912",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.FARMER_ANGRY] = {
    ["name"] = "Farmer Cletus Ouchies",
    ["image"] = v4(v11.FARMER_ANGRY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.FREIYA_SURPRISED] = {
    ["name"] = "Surprised Freiya",
    ["image"] = v4(v11.FREIYA_SURPRISED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.GRIM_REAPER_GG] = {
    ["name"] = "Grim Reaper GG",
    ["image"] = v4(v11.GRIM_REAPER_GG),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.GRIM_REAPER_STICKER] = {
    ["name"] = "Grim Reaper Sticker",
    ["image"] = v4(v11.GRIM_REAPER_STICKER),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.JADE_GG] = {
    ["name"] = "Jade GG",
    ["image"] = v4(v11.JADE_GG),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.JADE_HEART] = {
    ["name"] = "Jade Heart",
    ["image"] = v4(v11.JADE_HEART),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LASSY_CELEBRATION] = {
    ["name"] = "Celebration!",
    ["image"] = v4(v11.LASSY_CELEBRATION),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LASSY_GRAB] = {
    ["name"] = "Lassy Grab",
    ["image"] = v4(v11.LASSY_GRAB),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MINER_UWU] = {
    ["name"] = "Miner UWU",
    ["image"] = v4(v11.MINER_UWU),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MINER_LAUGH] = {
    ["name"] = "Miner HAHA!",
    ["image"] = v4(v11.MINER_LAUGH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SPACE_MINER_RAGE] = {
    ["name"] = "Miner Rage",
    ["image"] = v4(v11.SPACE_MINER_RAGE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SPIRIT_CATACHER_LOL] = {
    ["name"] = "LOL",
    ["image"] = v4(v11.SPIRIT_CATACHER_LOL),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SPIRIT_TEAMWORK] = {
    ["name"] = "Spirit Teamwork",
    ["image"] = v4(v11.SPIRIT_TEAMWORK),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TO_BATTLE] = {
    ["name"] = "To Battle!",
    ["image"] = v4(v11.TO_BATTLE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.VULCAN_LOADING] = {
    ["name"] = "Vulcan Loading...",
    ["image"] = v4(v11.VULCAN_LOADING),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.WARRIOR_UPDATE_DAY] = {
    ["name"] = "Update Hype",
    ["image"] = v4(v11.WARRIOR_UPDATE_DAY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.YUZI_HYPE] = {
    ["name"] = "Yuzi Hype",
    ["image"] = v4(v11.YUZI_HYPE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NICE] = {
    ["name"] = "Nyx Nice",
    ["image"] = v4(v11.NICE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SLAY] = {
    ["name"] = "Crocowolf Slay",
    ["image"] = v4(v11.SLAY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BOUNTY_MAD] = {
    ["name"] = "Bounty Hunter Mad",
    ["image"] = v4(v11.BOUNTY_MAD),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v19 = v11.NIGHTMARE_1
local v20 = {
    ["name"] = "Nightmare",
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.NIGHTMARE_LOOP
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = "rbxassetid://9188182911",
            ["config"] = {
                ["looped"] = true
            }
        }
    }
}
v12[v19] = v20
v12[v11.VICTORIOUS_BETA] = {
    ["name"] = "Victorious BETA",
    ["image"] = v4(v11.VICTORIOUS_BETA),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v21 = v11.EASTER_BUNNY
local v22 = {
    ["name"] = "Easter Bunny",
    ["animation"] = {
        ["looped"] = false,
        ["noAutoPlayAnimation"] = true,
        ["type"] = v2.EASTER_BUNNY_EMOTE_PLAYER
    }
}
v12[v21] = v22
local v23 = v11.BEACH_VACATION
local v24 = {
    ["name"] = "Beach Vacation",
    ["animation"] = {
        ["looped"] = true,
        ["hideItemInHand"] = true,
        ["type"] = v2.BEACH_VACATION
    }
}
v12[v23] = v24
local v25 = v11.WIGGLE
local v26 = {
    ["name"] = "Wiggle",
    ["joinable"] = true,
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.WIGGLE
    }
}
v12[v25] = v26
local v27 = v11.ROCK_PAPER_SCISSORS
local v28 = {
    ["name"] = "Rock Paper Scissors",
    ["animation"] = {
        ["looped"] = false,
        ["type"] = v2.ROCK_PAPER_SCISSORS
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = v8.EMOTE_OPEN
        }
    },
    ["randomIcons"] = { v6.HAND_FIST_ICON, v6.HAND_SCISSOR_ICON, v6.HAND_STOP_ICON }
}
v12[v27] = v28
local v29 = v11.COIN_TOSS
local v30 = {
    ["name"] = "Coin Toss",
    ["animation"] = {
        ["looped"] = false,
        ["hideItemInHand"] = true,
        ["type"] = v2.COIN_TOSS
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = v8.EMOTE_OPEN
        }
    },
    ["randomIcons"] = { v6.COIN_TOSS_SKULL, v6.COIN_TOSS_BONES }
}
v12[v29] = v30
v12[v11.BAKER_PIECE_OF_CAKE] = {
    ["name"] = "Piece of Cake",
    ["image"] = v4(v11.BAKER_PIECE_OF_CAKE)
}
v12[v11.BAKER_PROTECTION] = {
    ["name"] = "Item Protection",
    ["image"] = v4(v11.BAKER_PROTECTION)
}
v12[v11.BARB_U_SHALL_NOT_PASS] = {
    ["name"] = "U Shall Not Pass",
    ["image"] = v4(v11.BARB_U_SHALL_NOT_PASS)
}
v12[v11.BUILDER_HELP_PLS] = {
    ["name"] = "Builder Needs Help",
    ["image"] = v4(v11.BUILDER_HELP_PLS)
}
v12[v11.CLETUS_TROLL] = {
    ["name"] = "Cletus Troll",
    ["image"] = v4(v11.CLETUS_TROLL)
}
v12[v11.CYBER_DAB] = {
    ["name"] = "Cyber Dab",
    ["image"] = v4(v11.CYBER_DAB)
}
v12[v11.TIGER_WELL_PLAYED] = {
    ["name"] = "Well Played",
    ["image"] = v4(v11.TIGER_WELL_PLAYED)
}
v12[v11.CYBER_DEFENSE] = {
    ["name"] = "Vulcan Defense",
    ["image"] = v4(v11.CYBER_DEFENSE)
}
v12[v11.CYBER_MAD] = {
    ["name"] = "Cyber Mad",
    ["image"] = "rbxassetid://11695283128"
}
v12[v11.CYBER_OVERHEAT] = {
    ["name"] = "Vulcan Overheat",
    ["disabled"] = true,
    ["image"] = v4(v11.VULCAN_OVERHEAT)
}
v12[v11.VULCAN_OVERHEAT] = {
    ["name"] = "Vulcan Overheat",
    ["image"] = v4(v11.VULCAN_OVERHEAT)
}
v12[v11.DINO_HAI] = {
    ["name"] = "Dino Hai",
    ["image"] = v4(v11.DINO_HAI)
}
v12[v11.DINO_RAWR] = {
    ["name"] = "Dino Rawr",
    ["image"] = v4(v11.DINO_RAWR)
}
v12[v11.DINO_YIPEEE] = {
    ["name"] = "Dino Yipeee",
    ["image"] = v4(v11.DINO_YIPEEE)
}
v12[v11.FREIYA_BEG] = {
    ["name"] = "Freiya Hearts",
    ["disabled"] = true,
    ["image"] = v4(v11.FREIYA_HEARTS)
}
v12[v11.FREIYA_HEARTS] = {
    ["name"] = "Freiya Hearts",
    ["image"] = v4(v11.FREIYA_HEARTS)
}
v12[v11.LUMEN_PAIN] = {
    ["name"] = "Lumen Pain",
    ["image"] = v4(v11.LUMEN_PAIN)
}
v12[v11.MELODY_YOU_ROCK] = {
    ["name"] = "Melody You Rock",
    ["image"] = v4(v11.MELODY_YOU_ROCK)
}
v12[v11.METAL_DETECTOR] = {
    ["name"] = "Metal Detector",
    ["image"] = v4(v11.METAL_DETECTOR)
}
v12[v11.OH_MY_STARS] = {
    ["name"] = "Oh My Stars!",
    ["image"] = v4(v11.OH_MY_STARS)
}
v12[v11.RAINING_GEMS] = {
    ["name"] = "Raining Gems",
    ["image"] = v4(v11.RAINING_GEMS)
}
v12[v11.RAVEN_RIP] = {
    ["name"] = "Raven RIP",
    ["image"] = v4(v11.RAVEN_RIP)
}
v12[v11.REAPER_GOT_EM] = {
    ["name"] = "Reaper Got Em",
    ["image"] = v4(v11.REAPER_GOT_EM)
}
v12[v11.SMOKE_WAVE] = {
    ["name"] = "Smoke Wave",
    ["image"] = v4(v11.SMOKE_WAVE)
}
v12[v11.STAR_COLLECTOR_FUN] = {
    ["name"] = "Stella Fun",
    ["image"] = v4(v11.STAR_COLLECTOR_FUN)
}
v12[v11.TESLA_DANGER] = {
    ["name"] = "Tesla Danger Sign",
    ["image"] = v4(v11.TESLA_DANGER)
}
v12[v11.JADE_IM_THE_BEST] = {
    ["name"] = "Jade I\'m The Best",
    ["image"] = v4(v11.JADE_IM_THE_BEST)
}
v12[v11.LV50_DUO_WOMBO_COMBO] = {
    ["name"] = "Level 50 Wombo Combo",
    ["image"] = v4(v11.LV50_DUO_WOMBO_COMBO)
}
v12[v11.SPIRIT_DUO_EZ] = {
    ["name"] = "Spirit Duo EZ",
    ["image"] = v4(v11.SPIRIT_DUO_EZ)
}
v12[v11.PENGUIN_PUNCH] = {
    ["name"] = "Penguin Punch",
    ["image"] = "rbxassetid://10321183674"
}
v12[v11.PENGUIN_DEAL_WITH_IT] = {
    ["name"] = "Penguin Deal With It",
    ["image"] = "rbxassetid://11695283005"
}
v12[v11.PENGUIN_KING_TROPHY] = {
    ["name"] = "Penguin King Trophy",
    ["image"] = "rbxassetid://10321184147"
}
v12[v11.HANNAH_GHOST_MOMENT] = {
    ["name"] = "Hannah Ghost Moment",
    ["image"] = "rbxassetid://10736278063"
}
v12[v11.HANNAH_SORRY_NOT] = {
    ["name"] = "Hannah Sorry Not Sorry",
    ["image"] = "rbxassetid://10736277001"
}
v12[v11.SMOKE_AGAIN] = {
    ["name"] = "Smoke Again!",
    ["image"] = "rbxassetid://10736276378"
}
v12[v11.ZEPHYR_BEGONE] = {
    ["name"] = "Zephyr Begone",
    ["image"] = "rbxassetid://10753604126"
}
v12[v11.ZEPHYR_GOING_FAST] = {
    ["name"] = "Zephyr Gotta Go Fast!",
    ["image"] = "rbxassetid://10736275314"
}
local v31 = v11.SEARCHING_FAR_AWAY
local v32 = {
    ["name"] = "Searching Far Away",
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.SEARCHING_FAR_AWAY
    }
}
v12[v31] = v32
local v33 = v11.PIRATES_GOODBYE
local v34 = {
    ["name"] = "Pirate\'s Goodbye",
    ["animation"] = {
        ["looped"] = false,
        ["type"] = v2.PIRATES_GOODBYE
    }
}
v12[v33] = v34
v12[v11.HANNAH_GHOSTED] = {
    ["name"] = "Hannah Ghosted",
    ["image"] = "rbxassetid://10736277594"
}
v12[v11.HANNAH_FEAR] = {
    ["name"] = "Hannah Fear",
    ["image"] = "rbxassetid://10736279082"
}
v12[v11.HANNAH_FIRED_UP] = {
    ["name"] = "Hannah Fired Up",
    ["image"] = "rbxassetid://10759063729"
}
v12[v11.SMOKE_DUDE] = {
    ["name"] = "Smoke Dude...",
    ["image"] = "rbxassetid://10753603855"
}
v12[v11.GHOST_DAVEY] = {
    ["name"] = "Ghost Pirate Davey",
    ["image"] = "rbxassetid://10753604326"
}
v12[v11.ALCHEMIST_SAD] = {
    ["name"] = "Alchemist Sad",
    ["image"] = v4(v11.ALCHEMIST_SAD)
}
v12[v11.AMY_EASTER_NO_IRON] = {
    ["name"] = "Amy No Iron?",
    ["image"] = v4(v11.AMY_EASTER_NO_IRON)
}
v12[v11.BAKER_PROFIT] = {
    ["name"] = "Baker Profit",
    ["image"] = v4(v11.BAKER_PROFIT)
}
v12[v11.BEE_KEEPER_THANKS] = {
    ["name"] = "Beekeeper Thanks",
    ["image"] = v4(v11.BEE_KEEPER_THANKS)
}
v12[v11.BUILDER_LEAVE_DOOR] = {
    ["name"] = "Builder Door Is Over There",
    ["image"] = v4(v11.BUILDER_LEAVE_DOOR)
}
v12[v11.BUILDER_SHEESH] = {
    ["name"] = "Builder Sheesh",
    ["image"] = v4(v11.BUILDER_SHEESH)
}
v12[v11.COBALT_CHARGED] = {
    ["name"] = "Cobalt Charged",
    ["image"] = v4(v11.COBALT_CHARGED)
}
v12[v11.CROCOWOLF_YOU_CANT_RUN] = {
    ["name"] = "Crocowolf You Can\'t Run",
    ["image"] = v4(v11.CROCOWOLF_YOU_CANT_RUN)
}
v12[v11.FARMER_CRY] = {
    ["name"] = "Farmer Cletus Cry",
    ["image"] = v4(v11.FARMER_CRY)
}
v12[v11.AMY_SILENT] = {
    ["name"] = "Amy Are You Serious?",
    ["image"] = v4(v11.AMY_SILENT)
}
v12[v11.FARMER_NOT_BAD] = {
    ["name"] = "Farmer Cletus Not Bad",
    ["image"] = v4(v11.FARMER_NOT_BAD)
}
v12[v11.DOM_IM_DONE] = {
    ["name"] = "Dom I\'m Done!",
    ["image"] = v4(v11.DOM_IM_DONE)
}
v12[v11.MAGE_ELEMENTAL] = {
    ["name"] = "Whim Elemental",
    ["image"] = v4(v11.MAGE_ELEMENTAL)
}
v12[v11.FIRE_DRAGON_SIP] = {
    ["name"] = "Kaliyah Sip",
    ["image"] = "rbxassetid://11695282781"
}
v12[v11.FIRE_DRAGON_WHAT] = {
    ["name"] = "Kaliyah What",
    ["image"] = v4(v11.FIRE_DRAGON_WHAT)
}
v12[v11.FIRE_DRAGON_WIN_STREAK] = {
    ["name"] = "Kaliyah Win Streak",
    ["image"] = v4(v11.FIRE_DRAGON_WIN_STREAK)
}
v12[v11.FISHERMAN_GOLD] = {
    ["name"] = "Fisherman Go For Gold",
    ["image"] = v4(v11.FISHERMAN_GOLD)
}
v12[v11.FREIYA_POP_CAT] = {
    ["name"] = "Freiya Pop Cat",
    ["image"] = v4(v11.FREIYA_POP_CAT)
}
v12[v11.GHOST_CATCHER_IN_LOVE] = {
    ["name"] = "Spirit Catcher In Love",
    ["image"] = v4(v11.GHOST_CATCHER_IN_LOVE)
}
v12[v11.LUCIA_PATHETIC] = {
    ["name"] = "Luc\195\173a Pathetic",
    ["image"] = v4(v11.LUCIA_PATHETIC)
}
v12[v11.MARCO_VILLAGER] = {
    ["name"] = "Merchant Marco Villager",
    ["image"] = v4(v11.MARCO_VILLAGER)
}
v12[v11.MELODY_FACE_PALM] = {
    ["name"] = "Melody Face Palm",
    ["image"] = v4(v11.MELODY_FACE_PALM)
}
v12[v11.MELODY_PEACE_OUT] = {
    ["name"] = "Melody Peace Out",
    ["image"] = v4(v11.MELODY_PEACE_OUT)
}
v12[v11.METAL_DETECTOR_BORING] = {
    ["name"] = "Metal Detector Boring",
    ["image"] = v4(v11.METAL_DETECTOR_BORING)
}
v12[v11.PENGUIN_SLEEP] = {
    ["name"] = "Penguin Sleep",
    ["image"] = v4(v11.PENGUIN_SLEEP)
}
v12[v11.PINANTA_PARTY_TIME] = {
    ["name"] = "Pi\195\177ata Party Time",
    ["image"] = v4(v11.PINANTA_PARTY_TIME)
}
v12[v11.STELLA_HEART] = {
    ["name"] = "Stella Heart",
    ["image"] = v4(v11.STELLA_HEART)
}
v12[v11.VOID_DRAGON_ANGRY] = {
    ["name"] = "Xu\'rot Angry",
    ["image"] = v4(v11.VOID_DRAGON_ANGRY)
}
v12[v11.VOID_DRAGON_ART] = {
    ["name"] = "Xu\'rot Pose",
    ["image"] = v4(v11.VOID_DRAGON_ART)
}
v12[v11.YUZI_ANGRY] = {
    ["name"] = "Yuzi Angry",
    ["image"] = v4(v11.YUZI_ANGRY)
}
v12[v11.ZEPHYR_SMUG] = {
    ["name"] = "Zephyr Smug",
    ["image"] = v4(v11.ZEPHYR_SMUG)
}
local v35 = v11.BOOK_READ
local v36 = {
    ["name"] = "Research",
    ["animation"] = {
        ["hideItemInHand"] = true,
        ["type"] = v2.BOOK_READ,
        ["previewItems"] = { v7.MAGE_SPELLBOOK }
    }
}
v12[v35] = v36
local v37 = v11.KNIGHTS_BOW
local v38 = {
    ["name"] = "Knight\'s Bow",
    ["animation"] = {
        ["hideItemInHand"] = true,
        ["type"] = v2.KNIGHTS_BOW,
        ["previewItems"] = { v7.HEAVENLY_SWORD }
    }
}
v12[v37] = v38
local v39 = v11.ZEN_HOVER
local v40 = {
    ["name"] = "Tranquility",
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.ZEN_HOVER
    }
}
v12[v39] = v40
v12[v11.SKELETON_PARTY] = {
    ["name"] = "Skeleton Party",
    ["image"] = "rbxassetid://11338409457"
}
v12[v11.TRICK_OR_TREAT] = {
    ["name"] = "Trick or Treat!",
    ["image"] = "rbxassetid://11338410183"
}
v12[v11.GRIM_THRILLER] = {
    ["name"] = "Grim Reaper Thriller",
    ["image"] = "rbxassetid://11338409943"
}
v12[v11.NO_CANDY] = {
    ["name"] = "Yuzi No Candy",
    ["image"] = "rbxassetid://11344505436"
}
v12[v11.ZOMBIE_JADE] = {
    ["name"] = "Zombie Jade",
    ["image"] = "rbxassetid://11345558375"
}
v12[v11.NECROMANCER_SUMMON] = {
    ["name"] = "Crypt Summon",
    ["image"] = "rbxassetid://11366874409"
}
v12[v11.DV_500K] = {
    ["name"] = "DV 500k",
    ["image"] = "rbxassetid://11411046746"
}
v12[v11.XMAS_AERY] = {
    ["name"] = "Christmas Aery",
    ["image"] = "rbxassetid://11826384832"
}
v12[v11.XMAS_LASSY_CATCH] = {
    ["name"] = "Christmas Lassy Lasso",
    ["image"] = "rbxassetid://11826383290"
}
v12[v11.BARB_XMAS_LIGHTS] = {
    ["name"] = "Barb Christmas Lights",
    ["image"] = "rbxassetid://11826384355"
}
v12[v11.CHILLY] = {
    ["name"] = "Chilly",
    ["image"] = "rbxassetid://11826384043"
}
v12[v11.GINGERBREAD_COZY] = {
    ["name"] = "Gingerbread Man Cozy",
    ["image"] = "rbxassetid://11826383613"
}
v12[v11.BAKING_GINGERBREAD] = {
    ["name"] = "Baker Eats Gingerbread",
    ["image"] = "rbxassetid://11826384537"
}
v12[v11.MOUNTAIN_COOL] = {
    ["name"] = "Frost Cool",
    ["image"] = "rbxassetid://11841613999"
}
v12[v11.BRUH] = {
    ["name"] = "Frost Bruh",
    ["image"] = "rbxassetid://11841569213"
}
v12[v11.CHRISTMAS_ELDERTREE] = {
    ["name"] = "Christmas Eldertree 2022",
    ["image"] = "rbxassetid://11906917623"
}
v12[v11.SHEILA_NEW_YEARS] = {
    ["name"] = "Sheila New Year\'s 2023",
    ["image"] = "rbxassetid://11978287805"
}
v12[v11.SHEEP_HERDER_NEW_YEARS_23] = {
    ["name"] = "Sheep Herder New Year\'s 2023",
    ["image"] = "rbxassetid://12072851057"
}
v12[v11.SPIRIT_NEW_YEARS_23] = {
    ["name"] = "Spirit New Year\'s 2023",
    ["image"] = "rbxassetid://12072850612"
}
v12[v11.KALIYAH_NEW_YEARS_23] = {
    ["name"] = "Kaliyah New Year\'s 2023",
    ["image"] = "rbxassetid://12072850419"
}
v12[v11.AFK_TEAMMATE] = {
    ["name"] = "AFK Teammate",
    ["image"] = v4(v11.AFK_TEAMMATE)
}
v12[v11.BARB_ANGRY] = {
    ["name"] = "Barbarian Angry",
    ["image"] = v4(v11.BARB_ANGRY)
}
v12[v11.BARB_PIN] = {
    ["name"] = "Barbarian Pin",
    ["image"] = v4(v11.BARB_PIN)
}
v12[v11.BATHING_IN_MONEY] = {
    ["name"] = "Bathing in Money",
    ["image"] = v4(v11.BATHING_IN_MONEY)
}
v12[v11.BING_CHILLING] = {
    ["name"] = "Bing Chilling",
    ["image"] = v4(v11.BING_CHILLING)
}
v12[v11.BONGO_CAT_FREIYA] = {
    ["name"] = "Bongo Cat Freiya",
    ["image"] = v4(v11.BONGO_CAT_FREIYA)
}
v12[v11.BOUNTY_HUNTER_HUNT] = {
    ["name"] = "On the Hunt",
    ["image"] = v4(v11.BOUNTY_HUNTER_HUNT)
}
v12[v11.BUILDER_IDEA] = {
    ["name"] = "New Idea!",
    ["image"] = v4(v11.BUILDER_IDEA)
}
v12[v11.BURNING_THE_BED] = {
    ["name"] = "Burn the bed",
    ["image"] = v4(v11.BURNING_THE_BED)
}
v12[v11.MIC_UP] = {
    ["name"] = "Mic Up",
    ["image"] = v4(v11.MIC_UP)
}
v12[v11.GET_TRAPPED] = {
    ["name"] = "Get Trapped",
    ["image"] = v4(v11.GET_TRAPPED)
}
v12[v11.VULCAN_GET_REAL] = {
    ["name"] = "Vulcan Get Real",
    ["image"] = v4(v11.VULCAN_GET_REAL)
}
v12[v11.HATTER_GG] = {
    ["name"] = "Umbra GG",
    ["image"] = v4(v11.HATTER_GG)
}
v12[v11.HATTER_HEART] = {
    ["name"] = "Umbra Heart",
    ["image"] = v4(v11.HATTER_HEART)
}
v12[v11.HATTER_SHY] = {
    ["name"] = "Umbra Shy",
    ["image"] = v4(v11.HATTER_SHY)
}
v12[v11.JADE_BONKING] = {
    ["name"] = "Jade Bonking",
    ["image"] = v4(v11.JADE_BONKING)
}
v12[v11.JADE_SAD] = {
    ["name"] = "Jade Sad",
    ["image"] = v4(v11.JADE_SAD)
}
v12[v11.KALIYAH_ANGRY] = {
    ["name"] = "Kaliyah Angry",
    ["image"] = v4(v11.KALIYAH_ANGRY)
}
v12[v11.LANI_IDK] = {
    ["name"] = "IDK",
    ["image"] = v4(v11.LANI_IDK)
}
v12[v11.LANI_POINT] = {
    ["name"] = "Lani Point",
    ["image"] = v4(v11.LANI_POINT)
}
v12[v11.LASSY_SIDE_EYE] = {
    ["name"] = "Side Eye",
    ["image"] = v4(v11.LASSY_SIDE_EYE)
}
v12[v11.LUCIA_WHATS_POPPIN] = {
    ["name"] = "Whats Poppin",
    ["image"] = v4(v11.LUCIA_WHATS_POPPIN)
}
v12[v11.LUMEN_REVERSE_CARD] = {
    ["name"] = "Reverse Card",
    ["image"] = v4(v11.LUMEN_REVERSE_CARD)
}
v12[v11.MARCO_DIAMOND_SWORD] = {
    ["name"] = "Diamond Sword Discount",
    ["image"] = v4(v11.MARCO_DIAMOND_SWORD)
}
v12[v11.SHEEP_HERDER_LOVE] = {
    ["name"] = "Sheep Herder Love",
    ["image"] = v4(v11.SHEEP_HERDER_LOVE)
}
v12[v11.SHEILA_COZY] = {
    ["name"] = "Sheila Cozy",
    ["image"] = v4(v11.SHEILA_COZY)
}
v12[v11.SPIRIT_COUPLE] = {
    ["name"] = "Spirit Couple",
    ["image"] = v4(v11.SPIRIT_COUPLE)
}
v12[v11.SURPRISE_ATTACK] = {
    ["name"] = "Surprise Attack",
    ["image"] = v4(v11.SURPRISE_ATTACK)
}
v12[v11.TNT] = {
    ["name"] = "TNT",
    ["image"] = v4(v11.TNT)
}
v12[v11.VANESSA_DESERVE] = {
    ["name"] = "Deserved",
    ["image"] = v4(v11.VANESSA_DESERVE)
}
v12[v11.WHAT_DID_I_SEE] = {
    ["name"] = "What did I just see...",
    ["image"] = v4(v11.WHAT_DID_I_SEE)
}
v12[v11.ASSASSIN] = {
    ["name"] = "Assassin",
    ["image"] = v4(v11.ASSASSIN)
}
local v41 = v11.DISCO
local v42 = {
    ["name"] = "Disco Dance",
    ["joinable"] = true,
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.DISCO_DANCE
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = v8.DISCO_BEAT,
            ["config"] = {
                ["looped"] = true
            }
        }
    }
}
v12[v41] = v42
local v43 = v11.CHEERS_BOTTLE
local v44 = {
    ["name"] = "Cheers Bottle",
    ["animation"] = {
        ["hideItemInHand"] = true,
        ["type"] = v2.CHEERS_BOTTLE,
        ["previewItems"] = { v7.SPARKLING_APPLE_JUICE }
    }
}
v12[v43] = v44
local v45 = v11.SLOW_CLAP
local v46 = {
    ["name"] = "Slow Clap",
    ["animation"] = {
        ["looped"] = true,
        ["hideItemInHand"] = true,
        ["type"] = v2.SLOW_CLAP
    }
}
v12[v45] = v46
v12[v11.NIGHTMARE_SEASON_6] = {
    ["name"] = "Season 6 Nightmare",
    ["image"] = v4(v11.NIGHTMARE_SEASON_6),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.VICTORIOUS_CELEBRATION_SEASON_6] = {
    ["name"] = "Season 6 Victory",
    ["image"] = v4(v11.VICTORIOUS_CELEBRATION_SEASON_6),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NIGHTMARE_DAVEY_FLEX] = {
    ["name"] = "Season 7 NM Flex",
    ["image"] = "rbxassetid://13912906992",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NIGHTMARE_DAVEY_THINK] = {
    ["name"] = "Season 7 NM Think",
    ["image"] = "rbxassetid://13912906530",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NIGHTMARE_GRIM_REAPER] = {
    ["name"] = "Season 8 NM Grim Reaper",
    ["image"] = "rbxassetid://15515573868",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NIGHTMARE_LYLA] = {
    ["name"] = "Season 9 NM LYLA",
    ["image"] = v4(v11.NIGHTMARE_LYLA),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NIGHTMARE_ZENO] = {
    ["name"] = "Season 10 NM Zeno",
    ["image"] = v4(v11.NIGHTMARE_ZENO),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ALCHEMIST_EVIL] = {
    ["name"] = "Alchemist Evil",
    ["image"] = v4(v11.ALCHEMIST_EVIL),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ALL_GOOD] = {
    ["name"] = "All Good",
    ["image"] = v4(v11.ALL_GOOD),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BEEKEEPER_GIFT] = {
    ["name"] = "Beekeeper Gift",
    ["image"] = v4(v11.BEEKEEPER_GIFT),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.CONQUEROR_FIREBALL] = {
    ["name"] = "Conqueror Fireball",
    ["image"] = v4(v11.CONQUEROR_FIREBALL),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.YUZI_BRB] = {
    ["name"] = "Yuzi BRB",
    ["image"] = v4(v11.YUZI_BRB),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.HATS_OFF] = {
    ["name"] = "Hats Off",
    ["image"] = v4(v11.HATS_OFF),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.HMM_OK] = {
    ["name"] = "Hmm... ok",
    ["image"] = v4(v11.HMM_OK),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.KALIYAH_PUMPED] = {
    ["name"] = "Kaliyah Pumped Up",
    ["image"] = v4(v11.KALIYAH_PUMPED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.STAR_COLLECTOR_CHOCOLATE_BUNNY] = {
    ["name"] = "Easter Star Collector Choco Bunny",
    ["image"] = v4(v11.STAR_COLLECTOR_CHOCOLATE_BUNNY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.AMY_EASTER_MURDER] = {
    ["name"] = "Easter Amy Murderous",
    ["image"] = v4(v11.AMY_EASTER_MURDER),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TWO_YEAR_BAKER] = {
    ["name"] = "2 Year Anniversary Baker",
    ["image"] = "rbxassetid://13551192879",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TWO_YEAR_LUCIA] = {
    ["name"] = "2 Year Anniversary Lucia",
    ["image"] = "rbxassetid://13551193021",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TWO_YEAR_BARB] = {
    ["name"] = "2 Year Anniversary Barb",
    ["image"] = "rbxassetid://13557386479",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TWO_YEAR_STAR_COLLECTOR] = {
    ["name"] = "2 Year Anniversary Star Collector",
    ["image"] = "rbxassetid://13557393221",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TWO_YEAR_SPIRIT] = {
    ["name"] = "2 Year Anniversary Spirit",
    ["image"] = "rbxassetid://13562966709",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TWO_YEAR_BEE] = {
    ["name"] = "2 Year Anniversary Bee",
    ["image"] = "rbxassetid://13562983057",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v47 = v11.KAZOTSKY_KICK
local v48 = {
    ["name"] = "Kazotsky Kick",
    ["joinable"] = true,
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.KAZOTSKY_KICK
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = "rbxassetid://9044682364",
            ["config"] = {
                ["looped"] = true
            }
        }
    }
}
v12[v47] = v48
local v49 = v11.LUXURY_CHAIR
local v50 = {
    ["name"] = "Luxury Chair",
    ["animation"] = {
        ["hideItemInHand"] = true,
        ["type"] = v2.LUXURY_CHAIR
    }
}
v12[v49] = v50
local v51 = v11.FACE_PALM
local v52 = {
    ["name"] = "Face Palm",
    ["animation"] = {
        ["type"] = v2.FACE_PALM
    }
}
v12[v51] = v52
v12[v11.AERY_HMPH] = {
    ["name"] = "Aery Hmph",
    ["image"] = v4(v11.AERY_HMPH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.AMY_HELLO] = {
    ["name"] = "Amy Hello",
    ["image"] = v4(v11.AMY_HELLO),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BEE_KEEPER_STARE] = {
    ["name"] = "Bee Keeper Stare",
    ["image"] = v4(v11.BEE_KEEPER_STARE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BLACKHOLE] = {
    ["name"] = "Blackhole",
    ["image"] = v4(v11.BLACKHOLE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.CAITLYN_ROCK] = {
    ["name"] = "Caitlyn Rock",
    ["image"] = v4(v11.CAITLYN_ROCK),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.CAUGHT_YOU] = {
    ["name"] = "Caught You",
    ["image"] = v4(v11.CAUGHT_YOU),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.CLETUS_NERD] = {
    ["name"] = "Cletus Nerd",
    ["image"] = v4(v11.CLETUS_NERD),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.CLETUS_PLUSHIE] = {
    ["name"] = "Cletus Plushie",
    ["image"] = v4(v11.CLETUS_PLUSHIE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.CRYPT_SKULL] = {
    ["name"] = "Crypt Skull",
    ["image"] = v4(v11.CRYPT_SKULL),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.FLORA_ICON] = {
    ["name"] = "Flora Icon",
    ["image"] = v4(v11.FLORA_ICON),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.FLOWERS_FOR_YOU] = {
    ["name"] = "Flowers For You",
    ["image"] = v4(v11.FLOWERS_FOR_YOU),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.GHOST_CELEBRATE] = {
    ["name"] = "Ghost Celebrate",
    ["image"] = v4(v11.GHOST_CELEBRATE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.GHOST_READY] = {
    ["name"] = "Ghost Ready",
    ["image"] = v4(v11.GHOST_READY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.HANNAH_ANGRY] = {
    ["name"] = "Hannah Angry",
    ["image"] = v4(v11.HANNAH_ANGRY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.KILLER_AMY] = {
    ["name"] = "Killer Amy",
    ["image"] = v4(v11.KILLER_AMY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LUMEN_CONFUSED] = {
    ["name"] = "Lumen Confused",
    ["image"] = v4(v11.LUMEN_CONFUSED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MELODY_NOTED] = {
    ["name"] = "Melody Noted",
    ["image"] = v4(v11.MELODY_NOTED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SHEILA_SING] = {
    ["name"] = "Sheila Sing",
    ["image"] = v4(v11.SHEILA_SING),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MEAN_GIRLS] = {
    ["name"] = "Mean Girls",
    ["image"] = v4(v11.MEAN_GIRLS),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.STELLA_BORED] = {
    ["name"] = "Stella Bored",
    ["image"] = v4(v11.STELLA_BORED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.STELLA_IDOL] = {
    ["name"] = "Stella Idol",
    ["image"] = v4(v11.STELLA_IDOL),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.STELLA_OMG] = {
    ["name"] = "Stella OMG",
    ["image"] = v4(v11.STELLA_OMG),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TABLET_KIDS] = {
    ["name"] = "Tablet Kids",
    ["image"] = v4(v11.TABLET_KIDS),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.WASNT_ME] = {
    ["name"] = "Wasnt Me",
    ["image"] = v4(v11.WASNT_ME),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ZEPHYR_STRESSED] = {
    ["name"] = "Zephyr Stressed",
    ["image"] = v4(v11.ZEPHYR_STRESSED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ZEPHYR_WHAT] = {
    ["name"] = "Zephyr What",
    ["image"] = v4(v11.ZEPHYR_WHAT),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.KALIYAH_RAGE] = {
    ["name"] = "Kaliyah Rage",
    ["image"] = v4(v11.KALIYAH_RAGE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.PYRO_CELEBRATE] = {
    ["name"] = "PYRO Celebrate",
    ["image"] = v4(v11.PYRO_CELEBRATE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.CARD] = {
    ["name"] = "Fortuna",
    ["image"] = v4(v11.CARD),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.RAGEBLADE_SWORDS] = {
    ["name"] = "Barbarian Rageblade Swords",
    ["image"] = v4(v11.RAGEBLADE_SWORDS),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BARBARIAN_ON_FIRE] = {
    ["name"] = "Barbarian On Fire",
    ["image"] = v4(v11.BARBARIAN_ON_FIRE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v53 = v11.BARBARIAN_RAGEBLADE_MASTER
local v54 = {
    ["name"] = "Barbarian Rageblade Master",
    ["animation"] = {
        ["hideItemInHand"] = true,
        ["type"] = v2.BARBARIAN_RAGEBLADE_MASTER,
        ["previewItems"] = { v7.RAGEBLADE }
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = "rbxassetid://14566497487"
        }
    }
}
v12[v53] = v54
local v55 = v11.RAGE_BLADE
local v56 = {
    ["name"] = "Rage Blade",
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.SWORD_IDLE
    }
}
v12[v55] = v56
v12[v11.CORRUPTED_RAGE_BLADE] = {
    ["name"] = "Corrupted Rage Blade",
    ["image"] = v4(v11.CORRUPTED_RAGE_BLADE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.GOMPY_ROCK] = {
    ["name"] = "Gompy Rock",
    ["image"] = v4(v11.GOMPY_ROCK),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.HW_YUZI_LAUGH] = {
    ["name"] = "Doll Yuzi Laugh",
    ["image"] = v4(v11.HW_YUZI_LAUGH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.HW_YUZI_PIN] = {
    ["name"] = "Doll Yuzi Pin",
    ["image"] = v4(v11.HW_YUZI_PIN),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LUCIA_CANDY] = {
    ["name"] = "Lucia Trick or Treat",
    ["image"] = v4(v11.LUCIA_CANDY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.PUMPKIN_BOMB] = {
    ["name"] = "Pumpkin Bomb",
    ["image"] = v4(v11.PUMPKIN_BOMB),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TWOYEAR_PENGUIN_CAKE] = {
    ["name"] = "2 Year Anniversay Cake",
    ["image"] = v4(v11.TWOYEAR_PENGUIN_CAKE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.DIAMOND_GUARDIAN] = {
    ["name"] = "Epilogue: Diamond Guardian Wave",
    ["image"] = v4(v11.DIAMOND_GUARDIAN),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BEE_KEEPER_PEACE] = {
    ["name"] = "Epilogue: Bee Keeper Peace",
    ["image"] = v4(v11.BEE_KEEPER_PEACE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v57 = v11.POPCORN
local v58 = {
    ["name"] = "Eating Popcorn",
    ["animation"] = {
        ["hideItemInHand"] = true,
        ["type"] = v2.EATING_POPCORN,
        ["previewReplicatedStorageAssets"] = { "Misc/PopcornEmote/PopcornBucket" }
    }
}
v12[v57] = v58
local v59 = v11.CAMERA
local v60 = {
    ["name"] = "Caught in 4K",
    ["animation"] = {
        ["hideItemInHand"] = true,
        ["type"] = v2.CAUGHT_IN_4K,
        ["previewReplicatedStorageAssets"] = { "Misc/Camera" }
    }
}
v12[v59] = v60
local v61 = v11.STURDY
local v62 = {
    ["name"] = "Get Sturdy",
    ["soundsOnBegin"] = {
        {
            ["sound"] = "rbxassetid://9043942268",
            ["config"] = {
                ["rollOffMaxDistance"] = 50
            }
        }
    },
    ["animation"] = {
        ["hideItemInHand"] = true,
        ["type"] = v2.STURDY
    }
}
v12[v61] = v62
v12[v11.CAT_AUTUMN] = {
    ["name"] = "Cat Autumn",
    ["image"] = v4(v11.CAT_AUTUMN),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.CAT_CUTE] = {
    ["name"] = "Cat Cute",
    ["image"] = v4(v11.CAT_CUTE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.CAT_DEAL] = {
    ["name"] = "Cat Deal",
    ["image"] = v4(v11.CAT_DEAL),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.CAT_FRIEND] = {
    ["name"] = "Cat Friend",
    ["image"] = v4(v11.CAT_FRIEND),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.CAT_SWIPE] = {
    ["name"] = "Cat Swipe",
    ["image"] = v4(v11.CAT_SWIPE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.FREIYA_SALAD_MEME] = {
    ["name"] = "Freiya Salad Meme",
    ["image"] = v4(v11.FREIYA_SALAD_MEME),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.FREIYA_SUS] = {
    ["name"] = "Freiya Sus",
    ["image"] = v4(v11.FREIYA_SUS),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.GOMPY_SCARY] = {
    ["name"] = "Gompy Scary",
    ["image"] = v4(v11.GOMPY_SCARY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.HEAL_SLIME_SAD] = {
    ["name"] = "Heal Slime Sad",
    ["image"] = v4(v11.HEAL_SLIME_SAD),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.KICKER_ANGRY] = {
    ["name"] = "Kicker Angry",
    ["image"] = v4(v11.KICKER_ANGRY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LYLA_POPCORN] = {
    ["name"] = "Lyla Popcorn",
    ["image"] = v4(v11.LYLA_POPCORN),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MARCO_INSPECT] = {
    ["name"] = "Marco Inspect",
    ["image"] = v4(v11.MARCO_INSPECT),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MELODY_SURPRISED] = {
    ["name"] = "Melody Surprised",
    ["image"] = v4(v11.MELODY_SURPRISED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MILO_CRAZY] = {
    ["name"] = "Milo Crazy",
    ["image"] = v4(v11.MILO_CRAZY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MILO_SCARE] = {
    ["name"] = "Milo Scare",
    ["image"] = v4(v11.MILO_SCARE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MILO_SLEEP] = {
    ["name"] = "Milo Sleep",
    ["image"] = v4(v11.MILO_SLEEP),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MILO_SNACK] = {
    ["name"] = "Milo Snack",
    ["image"] = v4(v11.MILO_SNACK),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NOELLE_CONFUSED] = {
    ["name"] = "Noelle Confused",
    ["image"] = v4(v11.NOELLE_CONFUSED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NOELLE_SLIMES] = {
    ["name"] = "Noelle Slimes",
    ["image"] = v4(v11.NOELLE_SLIMES),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ROBO_SPARKLE] = {
    ["name"] = "Robo Sparkle",
    ["image"] = v4(v11.ROBO_SPARKLE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ROBO_WORK] = {
    ["name"] = "Robo Work",
    ["image"] = v4(v11.ROBO_WORK),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SMOKE_PEACE_OUT] = {
    ["name"] = "Smoke Peace Out",
    ["image"] = v4(v11.SMOKE_PEACE_OUT),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.STAR_COLLECTOR_DAZED] = {
    ["name"] = "Star Collector Dazed",
    ["image"] = v4(v11.STAR_COLLECTOR_DAZED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TALIYAH_SPARKLE] = {
    ["name"] = "Taliyah Sparkle",
    ["image"] = v4(v11.TALIYAH_SPARKLE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.UMBRA_VILLAIN] = {
    ["name"] = "Umbra Villain",
    ["image"] = v4(v11.UMBRA_VILLAIN),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.YUZI_BEE_SWARM] = {
    ["name"] = "Yuzi Bee Swarm",
    ["image"] = v4(v11.YUZI_BEE_SWARM),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.DODO_PLUMP] = {
    ["name"] = "Dodo Plump",
    ["image"] = v4(v11.DODO_PLUMP),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.METAL_DETECTOR_EGG] = {
    ["name"] = "Metal Detector Egg",
    ["image"] = v4(v11.METAL_DETECTOR_EGG),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.YAMINI_CAT_LOAF] = {
    ["name"] = "Yamini Cat Loaf",
    ["image"] = v4(v11.YAMINI_CAT_LOAF),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NEW_YEARS_2024] = {
    ["name"] = "New Years 2024",
    ["image"] = "rbxassetid://15773718088",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.GRINCH_MILO_2024] = {
    ["name"] = "Grinch Milo 2024",
    ["image"] = "rbxassetid://15774116077",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v63 = v11.SUMMON_SNOW
local v64 = {
    ["name"] = "Summon Snow",
    ["soundsOnBegin"] = {
        {
            ["sound"] = "rbxassetid://15643754843",
            ["config"] = {
                ["rollOffMaxDistance"] = 50
            }
        }
    },
    ["animation"] = {
        ["hideItemInHand"] = true,
        ["type"] = v2.SUMMON_SNOW
    }
}
v12[v63] = v64
v12[v11.BAKER_HOLIDAY_EAT] = {
    ["name"] = "Baker Holiday Eat",
    ["image"] = v4(v11.BAKER_HOLIDAY_EAT),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.COZY_MELODY_SMILE] = {
    ["name"] = "Cozy Melody Smile",
    ["image"] = v4(v11.COZY_MELODY_SMILE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.FROSTY_BALLER] = {
    ["name"] = "Frosty Baller",
    ["image"] = v4(v11.FROSTY_BALLER),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.GINGERBREAD_MAN_RAGE] = {
    ["name"] = "Gingerbread Man Rage",
    ["image"] = v4(v11.GINGERBREAD_MAN_RAGE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.KRAMPUS_EMBER] = {
    ["name"] = "Krampus Ember",
    ["image"] = v4(v11.KRAMPUS_EMBER),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.YETI_GIFT] = {
    ["name"] = "Yeti Gift",
    ["image"] = v4(v11.YETI_GIFT),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v65 = v11.SPIRIT_ASSASSIN_TOP_ASSASSIN
local v66 = {
    ["name"] = "Top Assassin",
    ["animation"] = {
        ["hideItemInHand"] = true,
        ["type"] = v2.SPIRIT_ASSASSIN_SPIN_EMOTE,
        ["previewItems"] = { v7.SPIRIT_DAGGER }
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = v8.TOP_ASSASSIN_EMOTE
        }
    },
    ["preview"] = {
        ["disabled"] = true
    }
}
v12[v65] = v66
v12[v11.SPIRIT_ASSASSIN_DAGGER] = {
    ["name"] = "Evelynn Dagger",
    ["image"] = v4(v11.SPIRIT_ASSASSIN_DAGGER),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SPIRIT_ASSASSIN_HEARTS] = {
    ["name"] = "Evelynn Hearts",
    ["image"] = v4(v11.SPIRIT_ASSASSIN_HEARTS),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v67 = v11.KIT_MASTERY_EMOTE
local v68 = {
    ["name"] = "Kit Mastery Emote",
    ["image"] = v4(v11.KIT_MASTERY_EMOTE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT,
    ["animation"] = {
        ["looped"] = false,
        ["type"] = v2.KIT_MASTERY_EMOTE
    }
}
v12[v67] = v68
v12[v11.YUZI_FIRECRACKERS] = {
    ["name"] = "Yuzi Firecrackers",
    ["image"] = v4(v11.YUZI_FIRECRACKERS),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.DRAGON_KIT_STARE] = {
    ["name"] = "Lian Stare",
    ["image"] = v4(v11.DRAGON_KIT_STARE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.DRAGON_KIT_BATTLE] = {
    ["name"] = "Lian Battle",
    ["image"] = v4(v11.DRAGON_KIT_BATTLE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LUNAR_DRAGON_ARCHER] = {
    ["name"] = "Lunar Dragon Archer",
    ["image"] = v4(v11.LUNAR_DRAGON_ARCHER),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LUNAR_XUROT_MEME] = {
    ["name"] = "Lunar Xu\'rot Meme",
    ["image"] = v4(v11.LUNAR_XUROT_MEME),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.DRAGON_KIT_DUEL] = {
    ["name"] = "Lian Duel",
    ["image"] = v4(v11.DRAGON_KIT_DUEL),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LUNAR_FREIYA_CAT] = {
    ["name"] = "Lunar Freiya Cat",
    ["image"] = v4(v11.LUNAR_FREIYA_CAT),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LUNAR_FREIYA_CELEBRATION] = {
    ["name"] = "Lunar Freiya Celebration",
    ["image"] = v4(v11.LUNAR_FREIYA_CELEBRATION),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v69 = v11.COIN_FOUNTAIN
local v70 = {
    ["name"] = "Coin Fountain",
    ["animation"] = {
        ["looped"] = false,
        ["noAutoPlayAnimation"] = true,
        ["type"] = v2.ENVELOPE_THROW
    }
}
v12[v69] = v70
local v71 = v11.MAP_CONTEST_WINNER
local v72 = {
    ["name"] = "Contest Winner Celebration",
    ["animation"] = {
        ["looped"] = false,
        ["noAutoPlayAnimation"] = true,
        ["type"] = v2.MAP_TROPHY_THROW
    }
}
v12[v71] = v72
v12[v11.EASTER_TALIYAH] = {
    ["name"] = "Easter Taliyah",
    ["image"] = v4(v11.EASTER_TALIYAH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.EASTER_DAVEY] = {
    ["name"] = "Easter Davey",
    ["image"] = v4(v11.EASTER_DAVEY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BUNNY_TALIYAH] = {
    ["name"] = "Bunny Taliyah",
    ["image"] = v4(v11.BUNNY_TALIYAH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v73 = v11.EGG_HUNT_DANCE_EMOTE
local v74 = {
    ["name"] = "Golden Goose Dance",
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.EGG_HUNT_PLAYER_DANCE
    }
}
v12[v73] = v74
v12[v11.CAT_GUN] = {
    ["name"] = "Cat Gun",
    ["image"] = v4(v11.CAT_GUN),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.AERY_SOB] = {
    ["name"] = "Aery Sob",
    ["image"] = v4(v11.AERY_SOB),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.AGNI_ANGRY] = {
    ["name"] = "Agni Angry",
    ["image"] = v4(v11.AGNI_ANGRY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BAKER_SAD] = {
    ["name"] = "Baker Sad",
    ["image"] = v4(v11.BAKER_SAD),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BARB_MENACING] = {
    ["name"] = "Barbarian Menacing",
    ["image"] = v4(v11.BARB_MENACING),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.CLETUS_AEUGH] = {
    ["name"] = "Cletus Aeugh",
    ["image"] = v4(v11.CLETUS_AEUGH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ELEKTRA_POWER_UP] = {
    ["name"] = "Elektra Power Up",
    ["image"] = v4(v11.ELEKTRA_POWER_UP),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.EVELYNN_ADORE] = {
    ["name"] = "Evelynn Adore",
    ["image"] = v4(v11.EVELYNN_ADORE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.FREIYA_NYAN_CAT] = {
    ["name"] = "Freiya Nyan Cat",
    ["image"] = v4(v11.FREIYA_NYAN_CAT),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.GOMPY_CAUGHT_IN_4K] = {
    ["name"] = "Gompy Caught in 4K",
    ["image"] = v4(v11.GOMPY_CAUGHT_IN_4K),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MILO_BUG_SPRAY] = {
    ["name"] = "Milo Bug Spray",
    ["image"] = v4(v11.MILO_BUG_SPRAY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MILO_GOD] = {
    ["name"] = "Milo God",
    ["image"] = v4(v11.MILO_GOD),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NOELLE_WELL_DONE] = {
    ["name"] = "Noelle Well Done",
    ["image"] = v4(v11.NOELLE_WELL_DONE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NYX_ANGY] = {
    ["name"] = "Nyx Angy",
    ["image"] = v4(v11.NYX_ANGY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NYX_BOBA] = {
    ["name"] = "Nyx Boba",
    ["image"] = v4(v11.NYX_BOBA),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SANDWICH_FARMER] = {
    ["name"] = "Sandwich Farmer",
    ["image"] = v4(v11.SANDWICH_FARMER),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.STYX_RELAX] = {
    ["name"] = "Styx Relax",
    ["image"] = v4(v11.STYX_RELAX),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.STYX_SAD] = {
    ["name"] = "Styx Sad",
    ["image"] = v4(v11.STYX_SAD),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TRINITY_EAT_POPCORN] = {
    ["name"] = "Trinity Eat Popcorn",
    ["image"] = v4(v11.TRINITY_EAT_POPCORN),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TRINITY_PUNCH] = {
    ["name"] = "Trinity Punch",
    ["image"] = v4(v11.TRINITY_PUNCH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TRINITY_THUMBS_UP] = {
    ["name"] = "Trinity Thumbs Up",
    ["image"] = v4(v11.TRINITY_THUMBS_UP),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TRINITY_TOILET] = {
    ["name"] = "Trinity Toilet",
    ["image"] = v4(v11.TRINITY_TOILET),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.VOID_TERRA_THUMBS_UP] = {
    ["name"] = "Void Terra Thumbs Up",
    ["image"] = v4(v11.VOID_TERRA_THUMBS_UP),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.YUZI_COPIUM] = {
    ["name"] = "Yuzi Copium",
    ["image"] = v4(v11.YUZI_COPIUM),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TINKER_AMAZING] = {
    ["name"] = "Hephaestus Amazing",
    ["image"] = v4(v11.TINKER_AMAZING),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v75 = v11.DROPPED_THIS_CROWN
local v76 = {
    ["name"] = "You Dropped This Crown",
    ["image"] = v4(v11.DROPPED_THIS_CROWN),
    ["animation"] = {
        ["type"] = v2.DROPPED_THIS_KING_LONG
    }
}
v12[v75] = v76
local v77 = v11.PUSH_UP_GLASSSES
local v78 = {
    ["name"] = "Push Up Glasses",
    ["image"] = v4(v11.PUSH_UP_GLASSSES),
    ["animation"] = {
        ["type"] = v2.PUSH_UP_GLASSES
    }
}
v12[v77] = v78
local v79 = v11.SILLY_LEGS_DANCE
local v80 = {
    ["name"] = "Silly Legs Dance",
    ["joinable"] = true,
    ["image"] = v4(v11.SILLY_LEGS_DANCE),
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.SILLY_LEGS_DANCE
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = v8.SILLY_LEGS_DANCE,
            ["config"] = {
                ["looped"] = true
            }
        }
    }
}
v12[v79] = v80
local v81 = v11.CONGA_LINE
local v82 = {
    ["name"] = "Conga Line",
    ["joinable"] = true,
    ["allowMovement"] = true,
    ["image"] = v4(v11.CONGA_LINE),
    ["animation"] = {
        ["looped"] = true,
        ["speed"] = 0.918,
        ["type"] = v2.CONGA_DANCE
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = "rbxassetid://17579855402",
            ["config"] = {
                ["looped"] = true
            }
        }
    }
}
v12[v81] = v82
v12[v11.PENGUIN_SNIPER] = {
    ["name"] = "Penguin Sniper",
    ["image"] = "rbxassetid://17587189020",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.THREE_YEAR_TALIYAH] = {
    ["name"] = "3 Year Anniversary Taliyah",
    ["image"] = v4(v11.THREE_YEAR_TALIYAH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.THREE_YEAR_BEKZAT] = {
    ["name"] = "3 Year Anniversary Bekzat",
    ["image"] = v4(v11.THREE_YEAR_BEKZAT),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.THREE_YEAR_BARBARIAN] = {
    ["name"] = "3 Year Anniversary Barbarian",
    ["image"] = v4(v11.THREE_YEAR_BARBARIAN),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.THREE_YEAR_LYLA] = {
    ["name"] = "Lyla Party Time",
    ["image"] = v4(v11.THREE_YEAR_LYLA),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.THREE_YEAR_CAKE_FACE] = {
    ["name"] = "Cake Face",
    ["image"] = v4(v11.THREE_YEAR_CAKE_FACE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.THREE_YEAR_BAKER] = {
    ["name"] = "Catch This",
    ["image"] = v4(v11.THREE_YEAR_BAKER),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v83 = v11.DEAD_TO_ME
local v84 = {
    ["name"] = "Dead to Me",
    ["animation"] = {
        ["hideItemInHand"] = true,
        ["type"] = v2.GRIM_REAPER_DEAD_TO_ME_EMOTE,
        ["previewItems"] = { v7.REAPER_SCYTHE }
    }
}
v12[v83] = v84
v12[v11.GRIM_REAPER_SCYTHE] = {
    ["name"] = "Grim Reaper Scythe",
    ["image"] = v4(v11.GRIM_REAPER_SCYTHE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.GRIM_REAPER_TAUNT] = {
    ["name"] = "Grim Reaper Taunt",
    ["image"] = v4(v11.GRIM_REAPER_TAUNT),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MARINA_EH] = {
    ["name"] = "Marina EH?",
    ["image"] = v4(v11.MARINA_EH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MARINA_FLOATING] = {
    ["name"] = "Marina Floating",
    ["image"] = v4(v11.MARINA_FLOATING),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.AMY_FLOATIE] = {
    ["name"] = "Amy Floatie",
    ["image"] = v4(v11.AMY_FLOATIE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SURFER_HOT] = {
    ["name"] = "Surfer Heat Wave",
    ["image"] = v4(v11.SURFER_HOT),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ICE_CREAM_TRIO] = {
    ["name"] = "Ice Cream Trio",
    ["image"] = v4(v11.ICE_CREAM_TRIO),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SURFER_RIZZ] = {
    ["name"] = "Surfer Rizz",
    ["image"] = v5("surfer_cool_guy"),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SURFER_COOL_GUY] = {
    ["name"] = "Surfer Rizz",
    ["image"] = v5("surfer_cool_guy"),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SURFER_SURFS_UP] = {
    ["name"] = "Surf\'s Up!",
    ["image"] = v4(v11.SURFER_SURFS_UP),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MILO_SANDCASTLE] = {
    ["name"] = "Milo Sandcastle",
    ["image"] = v4(v11.MILO_SANDCASTLE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.VULCAN_ASK] = {
    ["name"] = "Vulcan Ask",
    ["image"] = "rbxassetid://18138607332",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.VULCAN_BRAINFREEZE] = {
    ["name"] = "Vulcan Brainfreeze",
    ["image"] = "rbxassetid://18138606903",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MILO_SPLASH] = {
    ["name"] = "Milo Splash",
    ["image"] = "rbxassetid://18138608273",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.INFERNAL_SURFER_WINK] = {
    ["name"] = "Infernal Surfer Wink",
    ["image"] = "rbxassetid://18213086149",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SHEILA_VOLLEYBALL] = {
    ["name"] = "Sheila Volleyball",
    ["image"] = "rbxassetid://18138607888",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v85 = v11.CRAB_DANCE
local v86 = {
    ["name"] = "Crab Dance",
    ["joinable"] = true,
    ["image"] = v4(v11.CRAB_DANCE),
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.CRAB_DANCE_EMOTE,
        ["previewReplicatedStorageAssets"] = { "Misc/Summer2024/CrabClawLeft", "Misc/Summer2024/CrabClawRight" }
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = v8.CRAB_DANCE_EMOTE,
            ["config"] = {
                ["looped"] = true
            }
        }
    }
}
v12[v85] = v86
local v87 = v11.ICY_DELIGHT
local v88 = {
    ["name"] = "Icy Delight",
    ["animation"] = {
        ["hideItemInHand"] = true,
        ["type"] = v2.ICY_DELIGHT,
        ["previewReplicatedStorageAssets"] = { "Misc/IcyDelight" }
    }
}
v12[v87] = v88
v12[v11.AGNI_WARMING] = {
    ["name"] = "Agni Warming",
    ["image"] = v4(v11.AGNI_WARMING),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.FARMER_CLETUS_WATER_GUN] = {
    ["name"] = "Farmer Cletus Water Gun",
    ["image"] = v4(v11.FARMER_CLETUS_WATER_GUN),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v89 = v11.GRIDDY
local v90 = {
    ["name"] = "Griddy",
    ["joinable"] = true,
    ["allowMovement"] = true,
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.GRIDDY
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = v8.GRIDDY_EMOTE,
            ["config"] = {
                ["volumeMultiplier"] = 1.25,
                ["looped"] = true
            }
        }
    }
}
v12[v89] = v90
local v91 = v11.GOODNIGHT_DANCE
local v92 = {
    ["name"] = "Goodnight Dance",
    ["joinable"] = true,
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.GOODNIGHT_DANCE
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = v8.GOODNIGHT_DANCE_MUSIC,
            ["config"] = {
                ["looped"] = true
            }
        }
    }
}
v12[v91] = v92
local v93 = v11.FUNKY_DANCE
local v94 = {
    ["name"] = "Funky Dance",
    ["joinable"] = true,
    ["allowMovement"] = true,
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.FUNKY_DANCE
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = v8.FUNKY_DANCE_MUSIC,
            ["config"] = {
                ["looped"] = true
            }
        }
    }
}
v12[v93] = v94
v12[v11.AGNI_BOOM] = {
    ["name"] = "Agni Boom",
    ["image"] = v4(v11.AGNI_BOOM),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BUILDER_READY] = {
    ["name"] = "Builder Ready",
    ["image"] = v4(v11.BUILDER_READY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.DAVEY_WIN] = {
    ["name"] = "Davey Win",
    ["image"] = v4(v11.DAVEY_WIN),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.DRAGON_ROAR] = {
    ["name"] = "Dragon Roar",
    ["image"] = v4(v11.DRAGON_ROAR),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ELDERTREE_FURY] = {
    ["name"] = "Elder Tree Fury",
    ["image"] = v4(v11.ELDERTREE_FURY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.FRIENDSHIP_SLIMES] = {
    ["name"] = "Friendship Slimes",
    ["image"] = v4(v11.FRIENDSHIP_SLIMES),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LASSY_HEAL] = {
    ["name"] = "Lassy Heal",
    ["image"] = v4(v11.LASSY_HEAL),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MARINA_PANIC] = {
    ["name"] = "Marina Panic",
    ["image"] = v4(v11.MARINA_PANIC),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MONK_MEDITATION] = {
    ["name"] = "Monk Meditation",
    ["image"] = v4(v11.MONK_MEDITATION),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.RAVEN_HMM] = {
    ["name"] = "Raven Hmm",
    ["image"] = v4(v11.RAVEN_HMM),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.RAVEN_OK] = {
    ["name"] = "Raven Ok",
    ["image"] = v4(v11.RAVEN_OK),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SMOKE_RED_FLAG] = {
    ["name"] = "Smoke Red Flag",
    ["image"] = v4(v11.SMOKE_RED_FLAG),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SORCERER_AURA] = {
    ["name"] = "Sorcerer Aura",
    ["image"] = v4(v11.SORCERER_AURA),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SORCERER_LAUGH] = {
    ["name"] = "Sorcerer Laugh",
    ["image"] = v4(v11.SORCERER_LAUGH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SORCERER_OOPS] = {
    ["name"] = "Sorcerer Oops",
    ["image"] = v4(v11.SORCERER_OOPS),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SORCERER_RAGE] = {
    ["name"] = "Sorcerer Rage",
    ["image"] = v4(v11.SORCERER_RAGE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SORCERY_DUO] = {
    ["name"] = "Sorcery Duo",
    ["image"] = v4(v11.SORCERY_DUO),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SUMMONER_DRAGON_BUDDY] = {
    ["name"] = "Summoner Dragon Buddy",
    ["image"] = v4(v11.SUMMONER_DRAGON_BUDDY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SUMMONER_SUMMON] = {
    ["name"] = "Summoner Summon",
    ["image"] = v4(v11.SUMMONER_SUMMON),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TERRA_BUFF] = {
    ["name"] = "Terra Buff",
    ["image"] = v4(v11.TERRA_BUFF),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TRADER_DONATE] = {
    ["name"] = "Trader Donate",
    ["image"] = v4(v11.TRADER_DONATE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TRADER_HUH] = {
    ["name"] = "Trader Huh",
    ["image"] = v4(v11.TRADER_HUH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TRAPPER_PROUD] = {
    ["name"] = "Trapper Proud",
    ["image"] = v4(v11.TRAPPER_PROUD),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TRAPPER_WARNING] = {
    ["name"] = "Trapper Warning",
    ["image"] = v4(v11.TRAPPER_WARNING),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.YOURE_WANTED] = {
    ["name"] = "You\'re Wanted",
    ["image"] = v4(v11.YOURE_WANTED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v95 = v11.SWORD_TWIRL
local v96 = {
    ["name"] = "Assassin\'s Sword Twirl",
    ["animation"] = {
        ["hideItemInHand"] = true,
        ["type"] = v2.SWORD_TWIRL,
        ["previewItems"] = { v7.IRON_DAGGER }
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = v8.SWORD_TWIRL
        }
    }
}
v12[v95] = v96
v12[v11.ALCHEMIST_DIZZY] = {
    ["name"] = "Alchemist Dizzy",
    ["image"] = v4(v11.ALCHEMIST_DIZZY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BAKER_SERIOUSLY] = {
    ["name"] = "Baker Seriously?",
    ["image"] = v4(v11.BAKER_SERIOUSLY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.KALIYAH_FIRED_UP] = {
    ["name"] = "Kaliyah Fired Up",
    ["image"] = v4(v11.KALIYAH_FIRED_UP),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NOELLE_BUTTERFLY] = {
    ["name"] = "Noelle Mesmerized",
    ["image"] = v4(v11.NOELLE_BUTTERFLY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.REBELLION_LEADER_DODO] = {
    ["name"] = "Silas Charge!!",
    ["image"] = v4(v11.REBELLION_LEADER_DODO),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TRAPPER_POINT] = {
    ["name"] = "Trapper Point",
    ["image"] = v4(v11.TRAPPER_POINT),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ZEPHYR_YELLING] = {
    ["name"] = "Zephyr Yelling",
    ["image"] = v4(v11.ZEPHYR_YELLING),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v97 = v11.TOURNAMENT_WINNER
local v98 = {
    ["name"] = "Tournament Winner",
    ["limited"] = true,
    ["animation"] = {
        ["looped"] = false,
        ["type"] = v2.TOURNAMENT_WINNER
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = v8.TOURNAMENT_WINNER_EMOTE,
            ["config"] = {
                ["looped"] = false,
                ["volumeMultiplier"] = 0.7,
                ["rollOffMaxDistance"] = 50
            }
        }
    }
}
v12[v97] = v98
v12[v11.WITCH_NOM] = {
    ["name"] = "Witch Nom",
    ["image"] = v4(v11.WITCH_NOM),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.WRENS_NIGHTMARE] = {
    ["name"] = "Wren\'s Nightmare",
    ["image"] = v4(v11.WRENS_NIGHTMARE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.WITCHS_WRATH] = {
    ["name"] = "Witch\'s Wrath",
    ["image"] = v4(v11.WITCHS_WRATH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.WREN_LAUGH] = {
    ["name"] = "Wren Laugh",
    ["image"] = v4(v11.WREN_LAUGH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MUMMY] = {
    ["name"] = "Mummy",
    ["image"] = v4(v11.MUMMY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.CANDY_PLEASE] = {
    ["name"] = "Candy Please",
    ["image"] = v4(v11.CANDY_PLEASE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.WITCH_LAUGH] = {
    ["name"] = "Witch Laugh",
    ["image"] = v4(v11.WITCH_LAUGH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.WITHERED_ELDERTREE] = {
    ["name"] = "Withered Eldertree",
    ["image"] = "rbxassetid://124308586441975",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v99 = {
    ["name"] = "Blah Blah",
    ["spritesheet"] = {
        ["image"] = "rbxassetid://89687804362304",
        ["imageHeight"] = 256,
        ["imageWidth"] = 256,
        ["sprites"] = 2,
        ["rows"] = 2,
        ["columns"] = 2,
        ["config"] = {
            ["framesPerSecond"] = 5
        }
    }
}
v12[v11.BLAH_BLAH_ANIMATED] = v99
local v100 = v11.RABBIT_HAT_TRICK
local v101 = {
    ["name"] = "Rabbit Hat Trick",
    ["animation"] = {
        ["looped"] = false,
        ["hideItemInHand"] = true,
        ["type"] = v2.RABBIT_HAT_TRICK,
        ["previewReplicatedStorageAssets"] = {}
    }
}
v12[v100] = v101
local v102 = v11.TAKE_SELFIE
local v103 = {
    ["name"] = "Take a Selfie",
    ["animation"] = {
        ["looped"] = false,
        ["hideItemInHand"] = true,
        ["type"] = v2.TAKE_SELFIE,
        ["previewReplicatedStorageAssets"] = { "Misc/SelfiePhone" }
    }
}
v12[v102] = v103
local v104 = v11.DUCK_WALK
local v105 = {
    ["name"] = "Duck Walk",
    ["joinable"] = true,
    ["allowMovement"] = true,
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.DUCK_WALK_EMOTE
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = v8.DUCK_WALK_EMOTE,
            ["config"] = {
                ["looped"] = true
            }
        }
    }
}
v12[v104] = v105
local v106 = v11.VOID_MEDITATION
local v107 = {
    ["name"] = "Void Meditation",
    ["animation"] = {
        ["looped"] = false,
        ["noAutoPlayAnimation"] = true,
        ["type"] = v2.KNEEL_DOWN
    }
}
v12[v106] = v107
v12[v11.COGSWORTH_CHARMED] = {
    ["name"] = "Cogsworth Charmed",
    ["image"] = v4(v11.COGSWORTH_CHARMED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TRINITY_TWO_SIDES] = {
    ["name"] = "Trinity Two Sides",
    ["image"] = v4(v11.TRINITY_TWO_SIDES),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TERRA_INTIMIDATION] = {
    ["name"] = "Terra Intimidation",
    ["image"] = v4(v11.TERRA_INTIMIDATION),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.COGSWORTH_SORRY] = {
    ["name"] = "Cogsworth Sorry",
    ["image"] = v4(v11.COGSWORTH_SORRY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SPIRIT_CRITTER_WHATCHU_DOIN] = {
    ["name"] = "Spirit Critter Whatchu Doin",
    ["image"] = v4(v11.SPIRIT_CRITTER_WHATCHU_DOIN),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SPIRIT_GARDENER_TAKE_THEM_PLEASE] = {
    ["name"] = "Spirit Gardener Take Them Please",
    ["image"] = v4(v11.SPIRIT_GARDENER_TAKE_THEM_PLEASE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SPIRIT_GARDENER_FLOWER_BASKET] = {
    ["name"] = "Spirit Gardener Flower Basket",
    ["image"] = v4(v11.SPIRIT_GARDENER_FLOWER_BASKET),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SPIRIT_CRITTER_WOW] = {
    ["name"] = "Spirit Critter Wow",
    ["image"] = v4(v11.SPIRIT_CRITTER_WOW),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.WHISPER_SPEECH] = {
    ["name"] = "Whisper Speech",
    ["image"] = v4(v11.WHISPER_SPEECH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TALIYAH_HEART_HANDS] = {
    ["name"] = "Taliyah Heart Hands",
    ["image"] = v4(v11.TALIYAH_HEART_HANDS),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SPIRIT_CRITTER_PLEASE] = {
    ["name"] = "Spirit Critter Please",
    ["image"] = v4(v11.SPIRIT_CRITTER_PLEASE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.VOID_KNIGHT_SWORD] = {
    ["name"] = "Void Knight Sword",
    ["image"] = v4(v11.VOID_KNIGHT_SWORD),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SPIRIT_CATCHER_STARE] = {
    ["name"] = "Spirit Catcher Stare",
    ["image"] = v4(v11.SPIRIT_CATCHER_STARE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SPIRIT_CRITTER_STARE] = {
    ["name"] = "Spirit Critter Stare",
    ["image"] = v4(v11.SPIRIT_CRITTER_STARE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.KALIYAH_PUNCH] = {
    ["name"] = "Kaliyah Punch",
    ["image"] = v4(v11.KALIYAH_PUNCH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.IGNIS_BRIDGE_SUMMON] = {
    ["name"] = "Ignis Bridge Summon",
    ["image"] = v4(v11.IGNIS_BRIDGE_SUMMON),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.EVELYNN_I_FEEL_AMAZING] = {
    ["name"] = "Evelynn I Feel Amazing",
    ["image"] = v4(v11.EVELYNN_I_FEEL_AMAZING),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.METAL_DETECTOR_LETS_GO_LOOTING] = {
    ["name"] = "Metal Detector Let\'s Go Looting",
    ["image"] = v4(v11.METAL_DETECTOR_LETS_GO_LOOTING),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.FISHERMAN_ABSOLUTE_CINEMA] = {
    ["name"] = "Fisherman Absolute Cinema",
    ["image"] = v4(v11.FISHERMAN_ABSOLUTE_CINEMA),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.WHISPER_UNAMUSED] = {
    ["name"] = "Whisper Unamused",
    ["image"] = v4(v11.WHISPER_UNAMUSED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.EVELYNN_SHOCK] = {
    ["name"] = "Evelynn Shock",
    ["image"] = v4(v11.EVELYNN_SHOCK),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SPIRIT_GARDENER_SOB] = {
    ["name"] = "Spirit Gardener Sob",
    ["image"] = v4(v11.SPIRIT_GARDENER_SOB),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.VOID_SLIME_PAT] = {
    ["name"] = "Void Slime Pat",
    ["image"] = v4(v11.VOID_SLIME_PAT),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.GRIM_SKULL_EMOJI] = {
    ["name"] = "Grim Skull Emoji",
    ["image"] = "rbxassetid://86448520516149",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.GRIM_SKULL_HARVESTER] = {
    ["name"] = "Grim Skull Harvester",
    ["image"] = "rbxassetid://119460280609946",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v108 = {
    ["name"] = "Terra Ping",
    ["spritesheet"] = {
        ["image"] = "rbxassetid://117074147705068",
        ["imageHeight"] = 260,
        ["imageWidth"] = 260,
        ["sprites"] = 4,
        ["rows"] = 2,
        ["columns"] = 2,
        ["config"] = {
            ["framesPerSecond"] = 5
        }
    }
}
v12[v11.TERRA_PING] = v108
local v109 = {
    ["name"] = "Farmer Cletus Farm Spamming",
    ["spritesheet"] = {
        ["image"] = "rbxassetid://123192537133342",
        ["imageHeight"] = 130,
        ["imageWidth"] = 260,
        ["sprites"] = 2,
        ["rows"] = 1,
        ["columns"] = 2,
        ["config"] = {
            ["framesPerSecond"] = 5
        }
    }
}
v12[v11.FARMER_CLETUS_FARM_SPAMMING] = v109
local v110 = {
    ["name"] = "Spirit Catcher Phone Shock",
    ["spritesheet"] = {
        ["image"] = "rbxassetid://86455523629766",
        ["imageHeight"] = 130,
        ["imageWidth"] = 260,
        ["sprites"] = 2,
        ["rows"] = 1,
        ["columns"] = 2,
        ["config"] = {
            ["framesPerSecond"] = 5
        }
    }
}
v12[v11.SPIRIT_CATCHER_PHONE_SHOCK] = v110
local v111 = {
    ["name"] = "Evelynn Stressed",
    ["spritesheet"] = {
        ["image"] = "rbxassetid://95100559028713",
        ["imageHeight"] = 130,
        ["imageWidth"] = 260,
        ["sprites"] = 2,
        ["rows"] = 1,
        ["columns"] = 2,
        ["config"] = {
            ["framesPerSecond"] = 5
        }
    }
}
v12[v11.EVELYNN_STRESSED] = v111
local v112 = {
    ["name"] = "Kaida Domain Expansion",
    ["spritesheet"] = {
        ["image"] = "rbxassetid://138663159289987",
        ["imageHeight"] = 130,
        ["imageWidth"] = 260,
        ["sprites"] = 2,
        ["rows"] = 1,
        ["columns"] = 2,
        ["config"] = {
            ["framesPerSecond"] = 5
        }
    }
}
v12[v11.KAIDA_DOMAIN_EXPANSION] = v112
v12[v11.GINGERBREADS_NIGHTMARE] = {
    ["name"] = "Gingerbread\'s Nightmare",
    ["image"] = "rbxassetid://83108677149797",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BUILDER_NUTCRACKER_LETHAL] = {
    ["name"] = "Lethal Nutcracker Builder",
    ["image"] = "rbxassetid://112251533895365",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NEW_YEARS_2025] = {
    ["name"] = "New Years 2025 (Wren)",
    ["image"] = "rbxassetid://127102174330522",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ADETUNDE_NEW_YEARS_2025] = {
    ["name"] = "New Years 2025 (Adetunde)",
    ["image"] = "rbxassetid://101985521475154",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v113 = v11.MARSHMALLOW_ROAST
local v114 = {
    ["name"] = "Marshmallow Roast",
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.MARSHMALLOW_ROAST_LOOP
    }
}
v12[v113] = v114
local v115 = v11.ICE_SKATING
local v116 = {
    ["name"] = "Ice Skating",
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.SKATING_MEDIUIM
    }
}
v12[v115] = v116
v12[v11.NIGHTMARE_TRITON] = {
    ["name"] = "Nightmare Triton",
    ["image"] = "rbxassetid://88001020504078"
}
local v117 = v11.PAPER_LANTERN_RELEASE
local v118 = {
    ["name"] = "Paper Lantern Release",
    ["animation"] = {
        ["disableCleanupOnAnimationEnd"] = true,
        ["type"] = v2.SUMMON_SNOW
    }
}
v12[v117] = v118
v12[v11.BUILDER_LNY] = {
    ["name"] = "Builder LNY",
    ["image"] = v4(v11.BUILDER_LNY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BUILDER_RED_ENVELOPE] = {
    ["name"] = "Builder Red Envelope",
    ["image"] = v4(v11.BUILDER_RED_ENVELOPE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v119 = {
    ["name"] = "Lian Eat Dumpling",
    ["spritesheet"] = {
        ["image"] = "rbxassetid://77213013813225",
        ["imageHeight"] = 1024,
        ["imageWidth"] = 1024,
        ["sprites"] = 2,
        ["rows"] = 2,
        ["columns"] = 2,
        ["config"] = {
            ["framesPerSecond"] = 5
        }
    }
}
v12[v11.LIAN_DUMPLING_EAT] = v119
v12[v11.LIAN_LNY_CELEBRATE] = {
    ["name"] = "Lian LNY Celebrate",
    ["image"] = v4(v11.LIAN_LNY_CELEBRATE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LUNAR_HANNAH_FIREWORKS] = {
    ["name"] = "Lunar Hannah Fireworks",
    ["image"] = v4(v11.LUNAR_HANNAH_FIREWORKS),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.YUZI_LNY_LANTERNS] = {
    ["name"] = "Yuzi LNY Lanterns",
    ["image"] = v4(v11.YUZI_LNY_LANTERNS),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.YUZI_RED_ENVELOPE] = {
    ["name"] = "Yuzi Red Envelope",
    ["image"] = v4(v11.YUZI_RED_ENVELOPE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v120 = v11.YUZI_FLIP
local v121 = {
    ["name"] = "Yuzi Front Flip",
    ["animation"] = {
        ["noAutoPlayAnimation"] = true,
        ["hideItemInHand"] = true,
        ["type"] = v2.FRONT_FLIP,
        ["previewItems"] = { v7.EMERALD_DAO }
    }
}
v12[v120] = v121
v12[v11.YUZI_SNAKE_PET] = {
    ["name"] = "Yuzi Snake Pet",
    ["image"] = v4(v11.YUZI_SNAKE_PET),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.YUZI_LOVE_CHU] = {
    ["name"] = "Yuzi Love Chu",
    ["image"] = v4(v11.YUZI_LOVE_CHU),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TRIXIE_CLOWN] = {
    ["name"] = "Trixie Clown",
    ["image"] = "rbxassetid://93078248147210",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TRIXIE_PEEK] = {
    ["name"] = "Trixie Peek",
    ["image"] = "rbxassetid://87834490799261",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v122 = {
    ["name"] = "Brain Loading",
    ["spritesheet"] = {
        ["image"] = "rbxassetid://96330226680855",
        ["imageHeight"] = 1024,
        ["imageWidth"] = 1024,
        ["sprites"] = 2,
        ["rows"] = 2,
        ["columns"] = 2,
        ["config"] = {
            ["framesPerSecond"] = 5
        }
    }
}
v12[v11.BRAIN_LOADING] = v122
v12[v11.BUNNY_TALIYAH_TNT] = {
    ["name"] = "Bunny Taliyah TNT",
    ["image"] = "rbxassetid://110678775091676",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.GRUMPY_BARBUNNY] = {
    ["name"] = "Grumpy Barbunny",
    ["image"] = "rbxassetid://135622637251657",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v123 = v11.BUNNY_SIDE_TO_SIDE
local v124 = {
    ["name"] = "Bunny Side To Side",
    ["joinable"] = true,
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.BUNNY_SIDE_TO_SIDE
    }
}
v12[v123] = v124
local v125 = v11.THIRSTY
local v126 = {
    ["name"] = "Thirsty",
    ["animation"] = {
        ["hideItemInHand"] = true,
        ["type"] = v2.THIRSTY_EMOTE,
        ["previewItems"] = { v7.FLASK }
    }
}
v12[v125] = v126
v12[v11.BAKER_COOKING] = {
    ["name"] = "Baker Cooking",
    ["image"] = v4(v11.BAKER_COOKING),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BUILDER_RAGE] = {
    ["name"] = "Builder Rage",
    ["image"] = v4(v11.BUILDER_RAGE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.CLETUS_BURNED_CROPS] = {
    ["name"] = "Cletus Burned Crops",
    ["image"] = v4(v11.CLETUS_BURNED_CROPS),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.COBALT_LOW_BATTERY] = {
    ["name"] = "Cobalt Low Battery",
    ["image"] = v4(v11.COBALT_LOW_BATTERY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.IM_OKAY] = {
    ["name"] = "I\'m Okay",
    ["image"] = v4(v11.IM_OKAY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.KRYSTAL_BROKEN_HEART] = {
    ["name"] = "Krystal Broken Heart",
    ["image"] = v4(v11.KRYSTAL_BROKEN_HEART),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MELODY_BROKE] = {
    ["name"] = "Melody Broke",
    ["image"] = v4(v11.MELODY_BROKE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MERCHANT_MARCO_QUICK_SAND] = {
    ["name"] = "Merchant Marco Quick Sand",
    ["image"] = v4(v11.MERCHANT_MARCO_QUICK_SAND),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.OASIS_L] = {
    ["name"] = "Oasis L",
    ["image"] = v4(v11.OASIS_L),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.OASIS_RELAXED] = {
    ["name"] = "Oasis Relaxed",
    ["image"] = v4(v11.OASIS_RELAXED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.OASIS_WATER_SPLASH] = {
    ["name"] = "Oasis Water Splash",
    ["image"] = v4(v11.OASIS_WATER_SPLASH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SANDBENDER_PEACE] = {
    ["name"] = "Sandbender Peace",
    ["image"] = v4(v11.SANDBENDER_PEACE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SANDBENDER_SAD] = {
    ["name"] = "Sandbender Sad",
    ["image"] = v4(v11.SANDBENDER_SAD),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SKOLL_LET_ME_THINK] = {
    ["name"] = "Let Me Think",
    ["image"] = v4(v11.SKOLL_LET_ME_THINK),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SKOLL_WOLF_TREAT] = {
    ["name"] = "Skoll Wolf Treat",
    ["image"] = v4(v11.SKOLL_WOLF_TREAT),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.STELLA_NU_UH] = {
    ["name"] = "Stella NuUh",
    ["image"] = v4(v11.STELLA_NU_UH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TALIYAH_EAT] = {
    ["name"] = "Taliyah Eat",
    ["image"] = v4(v11.TALIYAH_EAT),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TALIYAH_MIZU5] = {
    ["name"] = "Taliyah Mizu5",
    ["image"] = v4(v11.TALIYAH_MIZU5),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TOO_MUCH_YAPPING] = {
    ["name"] = "Too Much Yapping",
    ["image"] = v4(v11.TOO_MUCH_YAPPING),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TRIXIE_HAHA] = {
    ["name"] = "Trixie Haha",
    ["image"] = v4(v11.TRIXIE_HAHA),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.YAMINI_POINT] = {
    ["name"] = "Yamini Point",
    ["image"] = v4(v11.YAMINI_POINT),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v127 = v11.WALK_LIKE_EGYPTIAN
local v128 = {
    ["name"] = "Walk Like A Hieroglpyh",
    ["joinable"] = true,
    ["allowMovement"] = true,
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.WALK_LIKE_EGYPTIAN
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = v8.WALK_LIKE_EGYPTIAN,
            ["config"] = {
                ["looped"] = true
            }
        }
    }
}
v12[v127] = v128
v12[v11.SHEEP_HERDER_BIRTHDAY] = {
    ["name"] = "Sheep Herder Birthday",
    ["image"] = "rbxassetid://82027756712262",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.STELLA_BIRTHDAY] = {
    ["name"] = "Star Collector Stella",
    ["image"] = "rbxassetid://127818280518855",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v129 = v11.RAIN_DANCE
local v130 = {
    ["name"] = "Rain Dance",
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.RAIN_DANCE
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = v8.RAIN_DANCE,
            ["config"] = {
                ["looped"] = true
            }
        }
    }
}
v12[v129] = v130
v12[v11.DODO_EVELYNN_ANNIVERSARY] = {
    ["name"] = "Dodo Evelynn Aniversarry",
    ["image"] = "rbxassetid://86634636242298",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LIFEGUARD_LASSY_WARNING] = {
    ["name"] = "Lifeguard Lassy Warning",
    ["image"] = v4(v11.LIFEGUARD_LASSY_WARNING),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MARTIN_HYDRATE] = {
    ["name"] = "Martin Stay Hydrated",
    ["image"] = v4(v11.MARTIN_HYDRATE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TIDAL_WREN_SHINY] = {
    ["name"] = "Tidal Wren Shiny!",
    ["image"] = v4(v11.TIDAL_WREN_SHINY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LIFEGUARD_LASSY_CHILLING] = {
    ["name"] = "Lifeguard Lassy Chilling",
    ["image"] = v4(v11.LIFEGUARD_LASSY_CHILLING),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.CRYPTWRECKED_SALUTE] = {
    ["name"] = "Crypt-Wrecked Salute",
    ["image"] = v4(v11.CRYPTWRECKED_SALUTE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TIDAL_WREN_CHEERS] = {
    ["name"] = "Tidal Wren Cheers",
    ["image"] = v4(v11.TIDAL_WREN_CHEERS),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SPIRIT_CATACHER_TARGET_SHOT] = {
    ["name"] = "Spirit Catcher Target Spotted",
    ["image"] = "rbxassetid://102316507976669",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SUMMER_INFERNAL_SHIELDER_CHEERS] = {
    ["name"] = "Summer Infernal Shielder Cheers",
    ["image"] = "rbxassetid://138420681777904",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ELDER_REEF] = {
    ["name"] = "Elder Reef",
    ["image"] = "rbxassetid://111267178256696",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.DESSERT_MARINA] = {
    ["name"] = "Dessert Marina Heart",
    ["image"] = "rbxassetid://97359622418074",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v131 = v11.BEACH_VOLLEY_BALL
local v132 = {
    ["name"] = "Beach Volley Ball",
    ["animation"] = {
        ["looped"] = true,
        ["hideItemInHand"] = true,
        ["type"] = v2.BEACH_VOLLEY_BALL_R15_CHARACTER,
        ["previewItems"] = { v7.BEACHBALL }
    }
}
v12[v131] = v132
local v133 = v11.PIRATE_TREASURE
local v134 = {
    ["name"] = "Pirate Treasure",
    ["animation"] = {
        ["hideItemInHand"] = false,
        ["noAutoPlayAnimation"] = true,
        ["type"] = v2.PIRATE_TREASURE_EMOTE_SITTING
    }
}
v12[v133] = v134
v12[v11.ZARRAH_SUMMER_RAD] = {
    ["name"] = "Summer Zarrah Rad",
    ["image"] = "rbxassetid://132657955823622",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.I_SEE_YOU] = {
    ["name"] = "I SEE YOU",
    ["image"] = v4(v11.I_SEE_YOU),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NALHA_PROWLER] = {
    ["name"] = "Nahla Prowler",
    ["image"] = v4(v11.NALHA_PROWLER),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v135 = v11.PILLOW_FIGHT
local v136 = {
    ["name"] = "Pillow Fight!",
    ["animation"] = {
        ["looped"] = false,
        ["hideItemInHand"] = true,
        ["type"] = v2.PILLOW_FIGHT,
        ["previewItems"] = { v7.PILLOW }
    }
}
v12[v135] = v136
local v137 = v11.YAWN
local v138 = {
    ["name"] = "Yawn",
    ["animation"] = {
        ["looped"] = false,
        ["hideItemInHand"] = false,
        ["type"] = v2.YAWN
    }
}
v12[v137] = v138
v12[v11.AFK] = {
    ["name"] = "AFK",
    ["image"] = "rbxassetid://122356771310461",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BRB] = {
    ["name"] = "BRB",
    ["image"] = "rbxassetid://129699399595884",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SLEEP] = {
    ["name"] = "Sleeping",
    ["image"] = "rbxassetid://97766277904110",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.RAMIL_ANGRY_KITTY] = {
    ["name"] = "Ramil Angry Kitty",
    ["image"] = v4(v11.RAMIL_ANGRY_KITTY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.RAMIL_SANDBENDER] = {
    ["name"] = "Ramil Sandbender",
    ["image"] = v4(v11.RAMIL_SANDBENDER),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MARINA_BLOW_BUBBLES] = {
    ["name"] = "Marina Blow Bubbles",
    ["image"] = v4(v11.MARINA_BLOW_BUBBLES),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MARINA_HAPPY] = {
    ["name"] = "Marina Happy",
    ["image"] = v4(v11.MARINA_HAPPY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.AERY_OUT_OF_BREATH] = {
    ["name"] = "Aery Out Of Breath",
    ["image"] = v4(v11.AERY_OUT_OF_BREATH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.AERY_THINKING] = {
    ["name"] = "Aery Thinking",
    ["image"] = v4(v11.AERY_THINKING),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LASSY_SHOCKED] = {
    ["name"] = "Lassy Shocked",
    ["image"] = v4(v11.LASSY_SHOCKED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LASSY_FAN] = {
    ["name"] = "Lassy Fan",
    ["image"] = v4(v11.LASSY_FAN),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.WHISPER_CHICKEN] = {
    ["name"] = "Whisper Chicken",
    ["image"] = v4(v11.WHISPER_CHICKEN),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.GOOD_WHISPER] = {
    ["name"] = "Good Whisper",
    ["image"] = v4(v11.GOOD_WHISPER),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BAKER_NOOO] = {
    ["name"] = "Baker Nooo",
    ["image"] = v4(v11.BAKER_NOOO),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BAKER_BAKING] = {
    ["name"] = "Baker Baking",
    ["image"] = v4(v11.BAKER_BAKING),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.KAIDA_LAUGH] = {
    ["name"] = "Kaida Laugh",
    ["image"] = v4(v11.KAIDA_LAUGH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.KAIDA_SERIOUS_SUMMON] = {
    ["name"] = "Kaida Serious Summon",
    ["image"] = v4(v11.KAIDA_SERIOUS_SUMMON),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MILO_HELLO] = {
    ["name"] = "Milo Hello",
    ["image"] = v4(v11.MILO_HELLO),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MILO_YIPPEE] = {
    ["name"] = "Milo Yippee",
    ["image"] = v4(v11.MILO_YIPPEE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ADETUNDE_COLD] = {
    ["name"] = "Adetunde Cold",
    ["image"] = v4(v11.ADETUNDE_COLD),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ADETUNDE_ANNOYED] = {
    ["name"] = "Adetunde Annoyed",
    ["image"] = v4(v11.ADETUNDE_ANNOYED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ELEKTRA_WRATH] = {
    ["name"] = "Elektra Wrath",
    ["image"] = v4(v11.ELEKTRA_WRATH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v139 = v11.ELEKTRA_TP
local v140 = {
    ["name"] = "Elektra TP",
    ["joinable"] = true,
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.ELEKTRA_TP
    }
}
v12[v139] = v140
local v141 = v11.SPIRIT_OWL
local v142 = {
    ["name"] = "Spirit Owl",
    ["animation"] = {
        ["type"] = v2.SPIRIT_OWL_EMOTE_CHARACTER
    }
}
v12[v141] = v142
local v143 = v11.INCARNATION_GRIM_REAPER
local v144 = {
    ["name"] = "Incarnation:The Envoy of Grim Reaper",
    ["allowMovement"] = false,
    ["animation"] = {
        ["noAutoPlayAnimation"] = true,
        ["disableCleanupOnAnimationEnd"] = true,
        ["type"] = v2.HEAVENLY_SWORD_SWING
    }
}
v12[v143] = v144
v12[v11.ALCHEMIST_YAP] = {
    ["name"] = "Alchemist Yap",
    ["image"] = v4(v11.ALCHEMIST_YAP),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ARACHNE_OHMY] = {
    ["name"] = "Arachne OhMy",
    ["image"] = v4(v11.ARACHNE_OHMY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ARCHER_GLARE] = {
    ["name"] = "Archer Glare",
    ["image"] = v4(v11.ARCHER_GLARE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BAKER_SLY] = {
    ["name"] = "Baker Sly",
    ["image"] = v4(v11.BAKER_SLY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BAKER_SUS_STEW] = {
    ["name"] = "Baker Sus Stew",
    ["image"] = v4(v11.BAKER_SUS_STEW),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BOT_SCARED] = {
    ["name"] = "Bot Scared",
    ["image"] = v4(v11.BOT_SCARED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BUILDER_BLEH] = {
    ["name"] = "Builder Bleh",
    ["image"] = v4(v11.BUILDER_BLEH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.CHICKEN_ATTACK] = {
    ["name"] = "Chicken Attack",
    ["image"] = v4(v11.CHICKEN_ATTACK),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.COGSWORTH_IGNORED] = {
    ["name"] = "Cogsworth Ignored",
    ["image"] = v4(v11.COGSWORTH_IGNORED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.CONQUEROR_SMIRK] = {
    ["name"] = "Conqueror Smirk",
    ["image"] = v4(v11.CONQUEROR_SMIRK),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.DRAGON_ANGRY] = {
    ["name"] = "Dragon Angry",
    ["image"] = v4(v11.DRAGON_ANGRY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.FARMER_CLEAN] = {
    ["name"] = "Farmer Clean",
    ["image"] = v4(v11.FARMER_CLEAN),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.FARMER_PUSHED] = {
    ["name"] = "Farmer Pushed",
    ["image"] = v4(v11.FARMER_PUSHED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.FARMER_SILENCED] = {
    ["name"] = "Farmer Silenced",
    ["image"] = v4(v11.FARMER_SILENCED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.FISHERMAN_DOZE] = {
    ["name"] = "Fisherman Doze",
    ["image"] = v4(v11.FISHERMAN_DOZE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.FISHERMAN_SMILE] = {
    ["name"] = "Fisherman Smile",
    ["image"] = v4(v11.FISHERMAN_SMILE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.FROSTY_SILLY] = {
    ["name"] = "Frosty Silly",
    ["image"] = v4(v11.FROSTY_SILLY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ISABEL_STUNNED] = {
    ["name"] = "Isabel Stunned",
    ["image"] = v4(v11.ISABEL_STUNNED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.JADE_LAUGH] = {
    ["name"] = "Jade Laugh",
    ["image"] = v4(v11.JADE_LAUGH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.KAIDA_GLARE] = {
    ["name"] = "Kaida Glare",
    ["image"] = v4(v11.KAIDA_GLARE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.KAIDA_MOCK] = {
    ["name"] = "Kaida Mock",
    ["image"] = v4(v11.KAIDA_MOCK),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LASSY_APPROVE] = {
    ["name"] = "Lassy Approve",
    ["image"] = v4(v11.LASSY_APPROVE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LASSY_CRY] = {
    ["name"] = "Lassy Cry",
    ["image"] = v4(v11.LASSY_CRY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LASSY_STOP] = {
    ["name"] = "Lassy Stop",
    ["image"] = v4(v11.LASSY_STOP),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LUCIA_THROW] = {
    ["name"] = "Lucia Sandal Throw",
    ["image"] = v4(v11.LUCIA_THROW),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LYLA_FLOWERS] = {
    ["name"] = "Lyla Flowers",
    ["image"] = v4(v11.LYLA_FLOWERS),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LYLA_LETTER_READ] = {
    ["name"] = "Lyla Letter Read",
    ["image"] = v4(v11.LYLA_LETTER_READ),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LYLA_SAD] = {
    ["name"] = "Lyla Sad",
    ["image"] = v4(v11.LYLA_SAD),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LYLA_SUS] = {
    ["name"] = "Lyla Sus",
    ["image"] = v4(v11.LYLA_SUS),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MARCEL_TIME] = {
    ["name"] = "Marcel Time",
    ["image"] = v4(v11.MARCEL_TIME),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MARINA_ANGRY] = {
    ["name"] = "Marina Angry",
    ["image"] = v4(v11.MARINA_ANGRY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MARINA_HUH] = {
    ["name"] = "Marina Huh",
    ["image"] = v4(v11.MARINA_HUH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MARINA_ICECREAM] = {
    ["name"] = "Marina Ice Cream",
    ["image"] = v4(v11.MARINA_ICECREAM),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MARINA_SURPRISED] = {
    ["name"] = "Marina Surprised",
    ["image"] = v4(v11.MARINA_SURPRISED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MARTIN_PLUSH] = {
    ["name"] = "Martin Plush",
    ["image"] = v4(v11.MARTIN_PLUSH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MELODY_CHEER] = {
    ["name"] = "Melody Cheer",
    ["image"] = v4(v11.MELODY_CHEER),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MELODY_STOP] = {
    ["name"] = "Melody Stop",
    ["image"] = v4(v11.MELODY_STOP),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MILO_ICE_CREAM] = {
    ["name"] = "Milo Ice Cream",
    ["image"] = v4(v11.MILO_ICE_CREAM),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MINER_SNORE] = {
    ["name"] = "Miner Snore",
    ["image"] = v4(v11.MINER_SNORE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NOELLE_DOLL] = {
    ["name"] = "Noelle Doll",
    ["image"] = v4(v11.NOELLE_DOLL),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NOELLE_SURRENDER] = {
    ["name"] = "Noelle Surrender",
    ["image"] = v4(v11.NOELLE_SURRENDER),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.PYRO_EXHAUSTED] = {
    ["name"] = "Pyro Exhausted",
    ["image"] = v4(v11.PYRO_EXHAUSTED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.RAMIL_PALM_OF_MY_HAND] = {
    ["name"] = "Ramil palm of my hand",
    ["image"] = v4(v11.RAMIL_PALM_OF_MY_HAND),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.RAVEN_PLAN] = {
    ["name"] = "Raven Plan",
    ["image"] = v4(v11.RAVEN_PLAN),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.RISE_UP] = {
    ["name"] = "Rise up",
    ["image"] = v4(v11.RISE_UP),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SILENCE] = {
    ["name"] = "Silence",
    ["image"] = v4(v11.SILENCE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SKELETON_OMG] = {
    ["name"] = "Skeleton OMG",
    ["image"] = v4(v11.SKELETON_OMG),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SMOKE_DISSAPOINTED] = {
    ["name"] = "Smoke Dissapointed",
    ["image"] = v4(v11.SMOKE_DISSAPOINTED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SMOKE_VANISH] = {
    ["name"] = "Smoke Vanish",
    ["image"] = v4(v11.SMOKE_VANISH),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.STELLA_STAR_FOR_YOU] = {
    ["name"] = "Stella star for you",
    ["image"] = v4(v11.STELLA_STAR_FOR_YOU),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TALIYAH_FLUSHED] = {
    ["name"] = "Taliyah Flushed",
    ["image"] = v4(v11.TALIYAH_FLUSHED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TALIYAH_RAINBOW] = {
    ["name"] = "Taliyah Rainbow",
    ["image"] = v4(v11.TALIYAH_RAINBOW),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TERRA_POWERUP] = {
    ["name"] = "Terra Powerup",
    ["image"] = v4(v11.TERRA_POWERUP),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TRIXIE_MOCK] = {
    ["name"] = "Trixie Mock",
    ["image"] = v4(v11.TRIXIE_MOCK),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.WHIM_READING] = {
    ["name"] = "Whim Reading",
    ["image"] = v4(v11.WHIM_READING),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.XUROT_DISSAPOINTED] = {
    ["name"] = "Xurot Dissapointed",
    ["image"] = v4(v11.XUROT_DISSAPOINTED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.YAMINI_SLY] = {
    ["name"] = "Yamini Sly",
    ["image"] = v4(v11.YAMINI_SLY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ZARRAH_LOVE] = {
    ["name"] = "Zarrah Love",
    ["image"] = v4(v11.ZARRAH_LOVE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v145 = v11.THRILLER
local v146 = {
    ["name"] = "Thriller",
    ["joinable"] = true,
    ["animation"] = {
        ["looped"] = true,
        ["type"] = v2.THRILLER
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = v8.THRILLER_DANCE_MUSIC,
            ["config"] = {
                ["looped"] = true
            }
        }
    }
}
v12[v145] = v146
local v147 = v11.HEADS_OFF
local v148 = {
    ["name"] = "Heads Off",
    ["animation"] = {
        ["looped"] = false,
        ["type"] = v2.HEADS_OFF
    }
}
v12[v147] = v148
v12[v11.GOMPY_SCARED] = {
    ["name"] = "Gompy Saw a Ghost",
    ["image"] = v4(v11.GOMPY_SCARED),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.ALCHEMIST_PUMPKIN_STEW] = {
    ["name"] = "Alchemist Pumpkin Stew",
    ["image"] = v4(v11.ALCHEMIST_PUMPKIN_STEW),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.WREN_TRICK_OR_TREAT] = {
    ["name"] = "Wren Trick or Treat",
    ["image"] = v4(v11.WREN_TRICK_OR_TREAT),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.KAIDA_WITCH_APPLE] = {
    ["name"] = "Kaida Golden Apple",
    ["image"] = v4(v11.KAIDA_WITCH_APPLE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.WREN_COFFIN] = {
    ["name"] = "Wren Coffin",
    ["image"] = v4(v11.WREN_COFFIN),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.COOKIE_TREE] = {
    ["name"] = "Cookie ElderTree",
    ["image"] = v4(v11.COOKIE_TREE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.FROSTY_FURY] = {
    ["name"] = "Frosty Fury",
    ["image"] = v4(v11.FROSTY_FURY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.GRINCH_MILO] = {
    ["name"] = "Grinch Milo",
    ["image"] = v4(v11.GRINCH_MILO),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.INJURED_GINGERBREAD] = {
    ["name"] = "Injured Gingerbread",
    ["image"] = v4(v11.INJURED_GINGERBREAD),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NUTCRACKER_BUILDER_PANIC] = {
    ["name"] = "Nutcracker Builder Panic",
    ["image"] = v4(v11.NUTCRACKER_BUILDER_PANIC),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.REINDEER_LASSY] = {
    ["name"] = "Reindeer Lassy Wrangle",
    ["image"] = v4(v11.REINDEER_LASSY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.WRENS_GIFT] = {
    ["name"] = "Wren\'s Christmas Gift",
    ["image"] = v4(v11.WRENS_GIFT),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MOAI_YETI] = {
    ["name"] = "Moai Yeti",
    ["image"] = v4(v11.MOAI_YETI),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NOGIFT_LASSY] = {
    ["name"] = "No Gift lassy",
    ["image"] = v4(v11.NOGIFT_LASSY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.HOLIDAY_SHEEPHERDER_BELL] = {
    ["name"] = "Holiday Sheepherder Bell",
    ["image"] = v4(v11.HOLIDAY_SHEEPHERDER_BELL),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.NEW_YEARS_2026] = {
    ["name"] = "New Years 2026",
    ["image"] = "rbxassetid://113272372792074",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.SOPHIA_BRO] = {
    ["name"] = "Bro...",
    ["image"] = v4(v11.SOPHIA_BRO),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.HAPPY_SOPHIA] = {
    ["name"] = "Happy Sophia",
    ["image"] = v4(v11.HAPPY_SOPHIA),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v149 = v11.CHRISTMAS_CAROL
local v150 = {
    ["name"] = "Christmas Carol",
    ["joinable"] = true,
    ["allowMovement"] = true,
    ["animation"] = {
        ["hideItemInHand"] = true,
        ["noAutoPlayAnimation"] = true,
        ["looped"] = true,
        ["type"] = v2.BOOK_OPEN
    },
    ["soundsOnBegin"] = {
        {
            ["sound"] = v8.CHRISMAS_CAROL,
            ["config"] = {
                ["looped"] = true
            }
        }
    }
}
v12[v149] = v150
v12[v11.BUILDER_CRY] = {
    ["name"] = "Builder Cry",
    ["image"] = v4(v11.BUILDER_CRY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.EVELYNN_DENIAL] = {
    ["name"] = "Evelynn Cry",
    ["image"] = v4(v11.EVELYNN_DENIAL),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.EVELYNN_HEARTBREAK] = {
    ["name"] = "Evelynn Heartbreak",
    ["image"] = v4(v11.EVELYNN_HEARTBREAK),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MELODY_FLOWERS_FOR_YOU] = {
    ["name"] = "Melody Flowers For You",
    ["image"] = v4(v11.MELODY_FLOWERS_FOR_YOU),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.LOVE_STRUCK_VANESSA] = {
    ["name"] = "Love Struck Vanessa",
    ["image"] = v4(v11.LOVE_STRUCK_VANESSA),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.VALENTINE_AERY_LOVE] = {
    ["name"] = "Valentine Aery Love",
    ["image"] = v4(v11.VALENTINE_AERY_LOVE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.VALENTINE_AERY_QUEEN] = {
    ["name"] = "Valentine Aery Queen",
    ["image"] = v4(v11.VALENTINE_AERY_QUEEN),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.MISCHIEF_VALENTINES_EVELYNN] = {
    ["name"] = "Mischief Valentines Evelynn",
    ["image"] = v4(v11.MISCHIEF_VALENTINES_EVELYNN),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v151 = v11.VOID_HUNTER_ABSORB
local v152 = {
    ["name"] = "Void Knight Devour",
    ["animation"] = {
        ["looped"] = false,
        ["hideItemInHand"] = true,
        ["disableCleanupOnAnimationEnd"] = true,
        ["type"] = v2.WINTER_BOSS_RAISE_AXE,
        ["previewItems"] = { v7.NOCTIUM_BLADE_4 }
    }
}
v12[v151] = v152
v12[v11.VOID_KNIGHT] = {
    ["name"] = "Void Knight",
    ["image"] = "rbxassetid://125551585536915",
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
local v153 = v11.ROTTEN_EGG
local v154 = {
    ["name"] = "Rotten Egg",
    ["animation"] = {
        ["looped"] = false,
        ["type"] = v2.ROTTEN_EGG_EMOTE
    }
}
v12[v153] = v154
v12[v11.EASTER_FREIYA_DANGER] = {
    ["name"] = "Easter Freiya Danger",
    ["image"] = v4(v11.EASTER_FREIYA_DANGER),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.EASTER_FREIYA_OMG] = {
    ["name"] = "Easter Freiya OMG",
    ["image"] = v4(v11.EASTER_FREIYA_OMG),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.EASTER_GRIM_LAUGHING] = {
    ["name"] = "Easter Grim Laughing",
    ["image"] = v4(v11.EASTER_GRIM_LAUGHING),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.EASTER_GRIM_QUIET] = {
    ["name"] = "Easter Grim Quiet",
    ["image"] = v4(v11.EASTER_GRIM_QUIET),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.EASTER_GROVE_AWE] = {
    ["name"] = "Easter Grove Awe",
    ["image"] = v4(v11.EASTER_GROVE_AWE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.EASTER_UMA_HAPPY] = {
    ["name"] = "Easter UMA Happy",
    ["image"] = v4(v11.EASTER_UMA_HAPPY),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.EASTER_UMA_LOVE] = {
    ["name"] = "Easter UMA Love",
    ["image"] = v4(v11.EASTER_UMA_LOVE),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.TALIYAH_MISCHIEVOUS] = {
    ["name"] = "Taliyah Mischievous",
    ["image"] = v4(v11.TALIYAH_MISCHIEVOUS),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
v12[v11.BUNNY_BARBARIAN_QUESTION] = {
    ["name"] = "Bunny Barb Question",
    ["image"] = v4(v11.BUNNY_BARBARIAN_QUESTION),
    ["emoteDisplayType"] = v10.IMAGE_DEFAULT
}
return {
    ["EmoteMeta"] = v12
}